
#' open_notion
#'
#' Open the M&B Workflow Notion page in the browser.
#'
#' @importFrom utils browseURL
#'
#' @return Nothing
#' @export

open_notion <- function() {
  browseURL("https://www.notion.so/IPPE-Collaborative-Workflow-b7c2e7a025af446ab89aa1ad8dff0cca") # nolint
}

#' theme_mb
#' Loads an object for customising plots to an MnB theme
#' @return A ggplot2 theme object
#' @export
#'
#' @importFrom ggthemes theme_fivethirtyeight
#' @importFrom ggplot2 "%+replace%" element_blank element_text theme
#' @examples
#' \dontrun{
#' original <- iris %>%
#'   ggplot(aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
#'   geom_smooth(method = "lm", se = F) +
#'   geom_jitter()
#' mnb_version <- original + theme_mnb()
#' }
theme_mb <- function() {
  theme_mb <- ggthemes::theme_fivethirtyeight() %+replace%
    ggplot2::theme(
      legend.position = "none",
      text = ggplot2::element_text(family = "Times"),
      axis.title.x = ggplot2::element_text(hjust = 1, vjust = 1),
      axis.title.y = ggplot2::element_text(vjust = 1, angle = 90, hjust = 1),
      panel.background = ggplot2::element_blank(),
      plot.background = ggplot2::element_blank(),
      strip.background = ggplot2::element_blank(),
      legend.background = ggplot2::element_blank()
    )
  return(theme_mb)
}