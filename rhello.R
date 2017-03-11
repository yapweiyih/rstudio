packages <- c("jsonlite","dplyr","purrr")

purrr::walk(packages, library, character.only = TRUE, warn.conflicts = FALSE)

data <- fromJSON("train.json")
summary(data)
class(data)
head(data,1)
class(data[[3]])
data[[4]]
data[9]

library(ISLR)
Auto[,1-2]
length(Auto)
class(Auto)
summary(Auto)
dim(Auto)
