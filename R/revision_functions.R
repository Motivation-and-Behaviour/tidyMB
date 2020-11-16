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
#' @param ... additional arguments for agrep
#' @export

get_pdf_pagenumber = function(string, path, ...){
  ext <- tolower(tools::file_ext(path))
  if(!ext %in% c("pdf")){
    stop("Extracting page numbers only works for pdf documents")
  }

  doc <- textreadr::read_pdf(path) %>% dplyr::group_by(page_id) %>%
    dplyr::summarise(text = paste(text, collapse = " "), .groups = "drop")

  pnum <- agrep(string, doc$text, ...)
  if(length(pnum) > 0) return(pnum)

  l <- lapply(1:length(doc$page_id), function(p){ # look at combinations of pages if no match
    data.frame(
    page_id = glue::glue("{p}-{p + 1}"),
    text = paste(c(doc$text[p], doc$text[p + 1]), collapse = " ")
    )
  })

  doc <- do.call(rbind, l)
  pnum <- agrep(string, doc$text, max.distance = max.distance)
  pnum <- doc$page_id[pnum]
  if(length(pnum) == 0 ) stop("Couldn't find match")
  pnum

}

