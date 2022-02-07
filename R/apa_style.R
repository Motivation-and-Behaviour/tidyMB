#' apa_style
#'
#' An opinionated style to apply to tables that is APA 7th compliant.
#'
#' @param tab gt_tbl A gt table to apply style to.
#' @param font string A string with an installed font.
#' @param title string A title  (e.g., Table 1).
#' @param subtitle  string A subtitle (e.g., Descriptives).
#'
#' @importFrom magrittr "%>%"
#' @import gt
#'
#' @details
#' - For fonts beyond those installed in base R use
#' [extrafont package]
#' (https://cran.r-project.org/web/packages/extrafont/README.html)
#' - Titles should be enumerated e.g. Table 1
#' - Subtitles should be brief and in sentence case
#'
#' @return gt_tbl
#'
#' @export
#'
#' @keywords style
#'
#' @examples
#' \dontrun{
#' gt(iris) %>% apa_style()
#' }
apa_style <- function(tab, font = "times",
                      title = "Table 1",
                      subtitle = "Table Title") {
  # tests
  if (!"gt_tbl" %in% class(tab)) {
    stop("data is not of class gt_tbl")
  }
  # required package for example to run
  tab %>%
    gt::opt_table_lines(extent = "none") %>%
    gt::tab_options(
      heading.border.bottom.width = 2,
      heading.border.bottom.color = "black",
      heading.border.bottom.style = "solid",
      table.border.top.color = "white",
      table_body.hlines.color = "white",
      table_body.border.top.color = "black",
      table_body.border.top.style = "solid",
      table_body.border.top.width = 1,
      heading.title.font.size = 12,
      table.font.size = 12,
      heading.subtitle.font.size = 12,
      table_body.border.bottom.color = "black",
      table_body.border.bottom.width = 1,
      table_body.border.bottom.style = "solid",
      column_labels.border.bottom.color = "black",
      column_labels.border.bottom.style = "solid",
      column_labels.border.bottom.width = 1
    ) %>%
    gt::opt_table_font(font = font) %>%
    gt::tab_header(
      title = title,
      subtitle = md(subtitle)
    ) %>%
    opt_align_table_header(align = "left")
}