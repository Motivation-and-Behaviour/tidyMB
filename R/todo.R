#' extract_comments
#'
#' Reads in a file and pulls out text between comments (<!--{text}-->)
#' @param path path to file to read
#' @export

extract_comments <- function(path) {
  lines <- readLines(path)
  comments <- stringr::str_extract_all(lines, "<!--.*-->")
  comments <- comments[sapply(comments, length) > 0]
  lapply(comments, function(x)
    trimws(substring(x, 5, nchar(x) - 3)))
}

