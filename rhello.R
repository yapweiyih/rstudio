packages <- c("jsonlite","dplyr","purrr")

purrr::walk(packages, library, character.only = TRUE, warn.conflicts = FALSE)

data <- fromJSON("train.json")
summary(data)
