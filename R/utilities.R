
#' open_notion
#'
#' @importFrom utils browseURL
#'
#' @return
#' @export
#'
#' @examples
open_notion <- function() {
  browseURL("https://www.notion.so/IPPE-Collaborative-Workflow-b7c2e7a025af446ab89aa1ad8dff0cca")
}

mnb <- theme_fivethirtyeight() %+replace%
  theme(legend.position = "none",
        text = element_text(family = "Times"),
        axis.title.x = element_text(),
        axis.title.y = element_text(),
        panel.background = element_blank(),
        plot.background = element_blank(),
        strip.background = element_blank(),
        legend.background = element_blank())
