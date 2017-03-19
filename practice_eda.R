library(jsonlite)
library(ggplot2)
purrr::walk(packages, library, character.only = TRUE, warn.conflicts = FALSE)


rawinput <- fromJSON("train.json")
class(rawinput) #list
str(rawinput[1:5])
names(rawinput)
write_(rawinput, test.txt)
View(rawinput)

# bathrooms
str(rawinput[[1]])
rawinput[[1]][1:10]
summary(unlist(rawinput[[1]]))
table(unlist(rawinput[[1]]))
boxplot(unlist(rawinput[[1]]))
summarize(rawinput,bathrooms)
##ignore bathrooms>4 outlier, principle is to have at least 100 sampleslf;dcd11g .


# bedrooms
str(rawinput[[2]])
rawinput[[2]][1:10]
summary(unlist(rawinput[[2]]))
table(unlist(rawinput[[2]]))
boxplot(unlist(rawinput[[2]]))
##ignore bathrooms>5 outlier

# unlist every variable except `photos` and `features` and convert to tibble
vars <- setdiff(names(sigma), c("photos", "features"))
data <- map_at(sigma, vars, unlist)
datatbl <- map_at(sigma, vars, unlist) %>% tibble::as_tibble(.)
View(datatbl) #view tibbles
is_tibble(datatbl)
sigmadf <- data.frame(datatbl)
View(sigmadf)
names(sigmadf)

# Manage id
# check if there are certain famous manager


# List id (unique id)
# check there is no duplicate


# features
# number of features 