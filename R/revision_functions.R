#' read_manuscript
#'
#' @param address string url or file location of knited html
#' @param id the id from a html tag
#'
#' @importFrom glue glue
#' @importFrom rvest html_nodes html_text
#' @importFrom xml2 read_html
#' @importFrom stringr str_trim
#' @importFrom magrittr "%>%"
#'
#' @return
#' @export
#'
#' @examples
read_manuscript <- function(address,id){
  # Test for missing or non-character id
  if(missing(id)|!is.character(id)) stop("Please specify an id string")
  # Read in data and parse
  tmp = xml2::read_html(address) %>%
    rvest::html_nodes(xpath = glue::glue('//*[@id="{id}"]') )
  # Test if id is unique
  if(length(tmp)>1) warning("ID is not unique")
  # Extract
  tmp = tmp %>%
    rvest::html_text() %>%
    stringr::str_trim()
  return(tmp)
}


#' span_id_addin
#'
#' @importFrom rstudioapi getSourceEditorContext primary_selection insertText
#' @importFrom glue glue
#'
#' @return
#' @export
#'
#' @examples
span_id_addin <- function() {
  context <- rstudioapi::getSourceEditorContext()
  selection <- rstudioapi::primary_selection(context)
  rstudioapi::insertText(glue::glue('<span id = "id">{selection$text}</span>'))
}


#' span_remove_addin
#'
#' @importFrom rstudioapi getSourceEditorContext primary_selection insertText
#' @importFrom stringr str_replace
#'
#' @return
#' @export
#'
#' @examples
#'
span_remove_addin <- function() {
  context = rstudioapi::getSourceEditorContext()
  selection = rstudioapi::primary_selection(context)
  text = stringr::str_replace(selection$text,"<\\s*span[^>]*>(.*?)<\\s*/\\s*span>","\\1")
  rstudioapi::insertText(text)
}

#' evaluate_inline
#'
#' Evaluates embedded rchunks within a string of text
#' @examples
#' evaluate_inline("1+1 = `r 1+1`")
#' @export

evaluate_inline <- function(string){
  glue::glue(string, .open = "`r", .close = "`")
}

#' get_page_number
#'
#' Finds page number from pdf based on text matching
#' @param string text to match
#' @param path file to search
#' @param max.distance argument passed to agrep
#' @export

get_pdf_pagenumber = function(string, path, max.distance = .15){
  string <- gsub("\\[.*\\@.*]","",string) # remove references
  string <- gsub("\\*|\\#", "", string) # remove rmarkdown formatting
  string <- gsub("[0-9]","", string) # remove numbers

  ext <- tolower(tools::file_ext(path))
  if(!ext %in% c("pdf")){
    stop("Extracting page numbers only works for pdf documents")
  }

  doc <- textreadr::read_pdf(path)
  running_head = gsub("running head: ", "" , tolower(doc$text[1]))
  running_head = trimws(gsub("[0-9]","",running_head))

  doc$text <- trimws(stringr::str_remove_all(doc$text, "[[:digit:]]")) # remove all numbers

  doc <- doc %>% dplyr::group_by(page_id) %>%
    dplyr::summarise(text = paste(text, collapse = " "), .groups = "drop")


  pnum <- agrep(string, doc$text, ignore.case = TRUE, max.distance = max.distance)
  if(length(pnum) > 0) return(paste(pnum, collapse = ", "))

  l <- lapply(1:length(doc$page_id), function(p){ # look at combinations of pages if no match

    pages = sapply(c(doc$text[p], doc$text[p + 1]), function(x){
      gsub(glue::glue("^{running_head}") , "", tolower(unlist(x)))
    })
    pages <- trimws(pages)

    data.frame(
    page_id = glue::glue("{p}-{p + 1}"),
    text = trimws(paste(pages, collapse = " "))
    )
  })

  doc <- do.call(rbind, l)
  pnum <- agrep(string, doc$text, ignore.case = TRUE, max.distance = max.distance)
  pnum <- doc$page_id[pnum]
  if(length(pnum) == 0 ) stop("Couldn't find match")
  pnum

}

#' header_to_bold
#'
#' Converts headers to bold
#' @param string a string
#' @return string

header_to_bold = function(string){

  while(grepl("#{1,}.*\\r",string)){

    target <- unlist(stringr::str_match(string, "#{1,}.*\\r"))[1]
    replacement <- gsub("#{1,}","**", target)
    replacement <- gsub("\\r","**\\\r", replacement)
    replacement <- gsub("\\*\\*\\s","**", replacement)

    string <- gsub(target, replacement, string)
  }

  string

}


#' get_revision
#'
#' Extract and format revision
#' @param id the id from a html tag
#' @param path the path to an rmarkdown manuscript
#' @param evaluate bool. Should inline rchunks be executed?
#' @param quote is the output chunk quoted?
#' @param pg_number bool. Should pagenumbers be included?
#' @param pdf_path path to pdf output for page number matching
#' @export

get_revision = function(id, path, evaluate = TRUE, quote = TRUE, pg_number = FALSE, pdf_path = NULL){
  string <- read_manuscript(path, id)

  if(evaluate){
    string <- evaluate_inline(string)
  }

  if(pg_number){
    if(is.null(pdf_path)){
      pdf_path = gsub(glue::glue("{tools::file_ext(path)}$"), "pdf", path)
    }
    pnum = get_pdf_pagenumber(string, pdf_path)
    string = paste0(string,"\n\n\\begin{flushright}Pg. ", pnum, "\\end{flushright}")
  }

  string <- header_to_bold(string)

  if(quote){
    string <- gsub("\\n","\\\n>",string)
  }


  string
}
