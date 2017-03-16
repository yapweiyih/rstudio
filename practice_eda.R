library(jsonlite)
library(ISLR)
library(MASS)
library(ggplot2)
purrr::walk(packages, library, character.only = TRUE, warn.conflicts = FALSE)


rawinput <- fromJSON("train.json")
class(rawinput) #list
str(rawinput[1:5])
names(rawinput)


# bedrooms
str(rawinput[[1]])
summary(rawinput[[1]])
summary(unlist(rawinput[[1]]))
table(unlist(rawinput[[1]]))
hist(unlist(rawinput[[1]]))
rawinput[[1]].range

# unlist every variable except `photos` and `features` and convert to tibble
vars <- setdiff(names(sigma), c("photos", "features"))
data <- map_at(sigma, vars, unlist)
datatbl <- map_at(sigma, vars, unlist) %>% tibble::as_tibble(.)
sigmadf <- data.frame(datatbl)
names(sigmadf)

# Manage id
# check if there are certain famous manager


# List id (unique id)
# check there is no duplicate


# features
# number of features 