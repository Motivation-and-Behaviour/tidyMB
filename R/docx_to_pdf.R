#' docx_to_pdf
#'
#' Convert docx to PDF
#' @param path input path
#' @param out output path
#' @details requires a docto installation to work

docx_to_pdf <- function(path, out) {
  check_docto_installed()
  cmd <- sprintf('docto -f "%s" -O "%s" -T wdFormatPDF', path, out)
  system(cmd)
}


#' Check `docto` is installed
#'
#' @return Nothing. Prints error message if not installed.
#'
#' @keywords internal
check_docto_installed <- function() {
  path <- Sys.which("docto")
  if (nchar(path) == 0) {
    stop(paste0(
      "'docto' is needed to convert docx to pdf,",
      "but an installation couldn't be found on your system.",
      "\n\nhttps://github.com/tobya/DocTo"
    ))
  }
}