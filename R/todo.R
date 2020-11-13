#' extract_comments
#'
#' Reads in a file and pulls out text between comments (\<!--{text}--\>)
#' @param path path to file to read
#' @export

extract_comments <- function(path) {
  if(!grepl("md$",basename(path), ignore.case = TRUE)) stop("can only be used on rmd, or md files")
  lines <- readLines(path)
  comments <- stringr::str_extract_all(lines, "<!--.*-->")
  comments <- comments[sapply(comments, length) > 0]
  lapply(comments, function(x)
    trimws(substring(x, 5, nchar(x) - 3)))
}

#regmatches(string, regexpr("\\|.*TODO\\|", string))

#' create_todo
#'
#' Creates a todo list
#' @param rmd path to rmarkdown file to extract html comments from
#' @param path output path. If null (default) the todo list is printed to console
#' @details Reads all html comments from a rmarkdown file. Those with |TODO| will be extracted and sorted by assignment. Use @{name} e.g. '@james' to assign a task to someone.
#' @examples
#' library(tidyMB)
#' filepath <- system.file("tests/test_doc.rmd", package = "tidyMB")
#' create_todo(filepath)
#' @export

create_todo <- function(rmd = NULL, path = NULL){
  if(is.null(rmd)) rmd = rstudioapi::getActiveDocumentContext()$path
  comments <- extract_comments(rmd)
  todos <- unlist(comments[grepl("\\|TODO\\|", unlist(comments), ignore.case = TRUE)])
  # extract completions
  is_complete <- grepl("\\|X.*TODO.*\\|",todos, ignore.case = T)
  # extract assignments
  assigned <- stringr::str_extract_all(todos, "\\@\\w{1,}")
  assigned[sapply(assigned, function(x) length(x) == 0)] = "Unassigned"
  assigned = gsub("\\@","",unlist(assigned))
  assigned <- stringr::str_to_sentence(tolower(assigned))
  # clean up todo text
  todo_text <- gsub("\\|.*TODO.*\\|", "", todos)
  todo_text <- gsub("\\@\\w{1,}", "", todo_text)
  todo_df <- data.frame(assigned, is_complete, comment = trimws(todo_text))
  todo_df$is_complete <- ifelse(todo_df$is_complete, "X", " ")
  pattern = " - [{is_complete}] {comment}"

  assignees <- unique(todo_df$assigned)

  tasks <- lapply(assignees, function(a) {
    info <- todo_df[todo_df$assigned == a, ]
    person = paste("###", a)
    tasks <- paste(glue::glue_data(info, pattern), collapse = "\n")

    paste0(person, "\n\n", tasks)
  })

  out_text <- paste(tasks, collapse = "\n\n")

  if(!is.null(path)){
    message("todo saved to: ", path)
    return(write(out_text, path))
  }
  cat(out_text)

}
