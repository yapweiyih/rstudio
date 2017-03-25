library(jsonlite)
library(dplyr)
library(ggplot2)
library(purrr)
packages <- c("jsonlite","dplyr","purrr")
setwd("C:/Users/Yap Wei Yih/Documents/rtest")
purrr::walk(packages, library, character.only = TRUE, warn.conflicts = FALSE)
rawinput <- fromJSON("train.json")


#first step is always to create a valid dataframe
vars <- setdiff(names(rawinput), c("photos","features"))
rawinputtb <- map_at(rawinput, vars, unlist) %>% tibble::as_tibble(.)

#convert back to data.frame
rawinputdf <- as.data.frame(rawinputtb)
length(rawinputdf$bathrooms)

#reference
class(rawinput) #list
class(rawinput$bathrooms[1:5])
rawinput$bathrooms[1:5]
summary(rawinput)
str(rawinput[1:5])
names(rawinput)
write_json(rawinput, writeb.json)
View(rawinput)




#get subset of data source
# remove error latitude
#lng/lat
# There are 14 points which should be removed
#exclude outlier or dirty data in sea
#39798,78568,72896, 104822, 16405, 18267,
# dirty data where lat/lng = 0 for id = 70841
rawinputtb <- rawinputtb %>% filter(latitude != 0)

#remove outlier
# user leaflet to identify outlier and get the listing id
rawinputtb <- rawinputtb %>% filter(!listing_id %in% c(7035661,7174857,6981117,6881361,7202226,7229074,6836479,7114598,
  7221153,6957694,7146153,7143730,6946575,7075183,6974621,7059785,
  6834490,7169135,7209113, 6906214,7079426))


# bathrooms
str(rawinputtb[[1]])
rawinputtb[[1]][1:10]
summary(rawinputtb[[1]])
table(rawinputtb[[1]])
boxplot(unlist(rawinputtb[[1]]))
summarize(rawinputtb[[1]],bathrooms)
##ignore bathrooms>4 outlier, principle is to have at least 100 sampleslf
rawinputtb <- rawinputtb %>% filter(bathrooms<=4)
                                      

# bedrooms
str(rawinputtb[[2]])
rawinputtb[[2]][1:10]
summary(unlist(rawinputtb[[2]]))
table(unlist(rawinputtb[[2]]))
boxplot(unlist(rawinput[[2]]))
##ignore bathrooms>5 outlier
rawinputtb <- rawinputtb %>% filter(bedrooms<=5)



#building id
length(rawinput[[3]])
length(unique(rawinput[[3]]))
class(unique(rawinput[3]))

#building id need not be unique, multiple agents can post the same building

#listing id
length(rawinputtb[[9]])
length(unique(rawinputtb[[9]]))
#all listing id verified to be uniques


#created
sort(unlist(rawinput[[4]]))
max(unlist(rawinput[[4]]))
min(unlist(rawinput[[4]]))
# only 3 months worth of data 2014: apr, may, jun



]


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