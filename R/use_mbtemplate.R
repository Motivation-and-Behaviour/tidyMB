#' @title Call and open the M&B template
#' @description Use the ttemplate Rmd for your paper
#' @param name name of your paper (YYYY_DESCRIPTION_MS.Rmd)
#' @param open should the file be opened after being created
#' @param ... arguments to be passed to \link[usethis]{use_template}
#' @importFrom usethis use_template
#' @examples
#' \donttest{
#' if(interactive()){
#'   use_mbtemplate(name = "2020_iPLAY_MS.Rmd")
#' }
#' }
#'
#' @export
use_mbtemplate <-
  function(name = NULL,
           open = interactive(),
           ...) {

    if(is.null(name)){
      name <- paste0(format("%Y_%m_%d"),"_MB_MS.Rmd")
    }

    use_template("manuscript_template.Rmd",
                 save_as=name,
                 package = "themeMB", ..., open = open)
  }
