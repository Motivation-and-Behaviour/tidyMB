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


