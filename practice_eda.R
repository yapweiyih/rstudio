library(jsonlite)
library(ggplot2)
setwd("C:/Users/Yap Wei Yih/Documents/rtest")
purrr::walk(packages, library, character.only = TRUE, warn.conflicts = FALSE)
rawinput <- fromJSON("train.json")
rawinputdf <- data.frame(rawinput)

#get subset of data source
names(rawinput)
length(rawinput[[1]][1:10])
lat <- unlist(rawinput[[8]][1:10])
long = unlist(rawinput[[10]][1:10])
a <- c(1,2,3,4)
b <- c("a","b","c","d")
testdf <- data.frame(names(lat),lat,long)
str(testdf)
dim(testdf)
testdf


class(rawinput) #list
class(rawinput$bathrooms[1:5])
rawinput$bathrooms[1:5]
summary(rawinput)
str(rawinput[1:5])
names(rawinput)
write_json(rawinput, writeb.json)
View(rawinput)

# bathrooms
str(rawinput[[1]])
rawinput[[1]][1:10]
summary(unlist(rawinput[[1]]))
table(unlist(rawinput[[1]]))
boxplot(unlist(rawinput[[1]]))
summarize(rawinput,bathrooms)
##ignore bathrooms>4 outlier, principle is to have at least 100 sampleslf


# bedrooms
str(rawinput[[2]])
rawinput[[2]][1:10]
summary(unlist(rawinput[[2]]))
table(unlist(rawinput[[2]]))
boxplot(unlist(rawinput[[2]]))
##ignore bathrooms>5 outlier


#building id
length(rawinput[[3]])
length(unique(rawinput[[3]]))
class(unique(rawinput[3]))

#building id need not be unique, multiple agents can post the same building

#listing id
length(rawinput[[9]])
length(unique(rawinput[[9]]))
#all listing id must be uniques

#created
sort(unlist(rawinput[[4]]))
max(unlist(rawinput[[4]]))
min(unlist(rawinput[[4]]))
# only 3 months worth of data 2014: apr, may, jun


#lng/lat
# There are 14 points which should be removed

#description
rawinput[[5]][[2]]
rawinput[[5]][2]
rawinput[[5]]
nchar(rawinput[[5]][[2]]) #count number of character

lapply(rawinput[5],length)


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