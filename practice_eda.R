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
summary(rawinputdf)
str(rawinputdf)
names(rawinputdf)
summary(rawinputtb)
class(rawinputtb$bathrooms)
class(rawinputdf$bathrooms)
class(rawinputtb$photos)
class(rawinputdf$photos)
rawinputdf %>% select(listing_id,bathrooms) %>% 
  filter(listing_id<=7112314 & bathrooms < 1)
rawinputdf[1:5,]
rawinputtb[1:5,]



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

m1 <- leaflet() %>% addTiles() %>% 
  addMarkers(lat=rawinputtb$latitude,lng=rawinputtb$longitude,
             popup = as.character(rawinputtb$listing_id),
             clusterOptions = markerClusterOptions()) %>%
  addCircles(lng=-73.9821, lat=40.7575, weight = 1,
             radius = 30000)
m1



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
length(rawinputtb[[3]])
length(unique(rawinputtb[[3]]))
#building id need not be unique, multiple agents can post the same building


#listing id
length(rawinputtb[[9]])
length(unique(rawinputtb[[9]]))
#all listing id verified to be uniques


#created
sort(unlist(rawinputtb[[4]]))
max(unlist(rawinputtb[[4]]))
min(unlist(rawinputtb[[4]]))
# only 3 months worth of data 2014: apr, may, jun


#description
nchar(rawinputtb[[5]])
rawinputtb$description_len <- unlist(map(rawinputtb[[5]],nchar))
rawinputtb$description_len
names(rawinputtb)
temp <- rawinputtb %>% filter(description_len < 1500)
summary(temp$description_len)
boxplot(temp$description_len)
rawinputtb$description_len


# Manage id
# check if there are certain famous manager


# features
# number of features 
features_len <- c()
class(rawinputtb$features)
class(rawinputtb["features"])
class(rawinputtb[["features"]])

length(rawinputtb$features)

for(i in 1:length(rawinputtb$features)){
  features_len <- append(features_len,length(rawinputtb$features[[i]]))
  
}

rawinputtb$features_count <- features_len
boxplot(rawinputtb$features_count)
str(rawinputtb$features_count)

# photos
# number of photo 
str(rawinputtb$photos)

length(rawinputtb$photos)
length(rawinputtb$photos[[1]])
   
photos_count <- c()    
for(i in 1:length(rawinputtb$photos)){
  photos_count <- append(photos_count,length(rawinputtb$photos[[i]]))
  
}
length(photos_count)
rawinputtb$photos_count <- photos_count



#interest_level
#change to factor

rawinputtb$interest_level <- factor(rawinputtb$interest_level, 
                                    c("low","medium","high"))

str(rawinputtb$interest_level)

# interest by features count
hist(rawinputtb %>% filter(interest_level == "high") 
     %>% select(features_count) 
     %>% unlist, main = "High interest level", breaks=seq(0,70,by=1))

hist(rawinputtb %>% filter(interest_level == "medium") 
     %>% select(features_count) 
     %>% unlist, main = "Medium interest level", breaks=seq(0,70,by=1))

hist(rawinputtb %>% filter(interest_level == "low") 
     %>% select(features_count) 
     %>% unlist, main = "Low interest level", breaks=seq(0,70,by=1))


# interest by photo count
hist(rawinputtb %>% filter(interest_level == "high") 
     %>% select(photos_count) 
     %>% unlist, main = "High interest level", breaks=seq(0,70,by=1))

hist(rawinputtb %>% filter(interest_level == "medium") 
     %>% select(photos_count) 
     %>% unlist, main = "Medium interest level", breaks=seq(0,70,by=1))

hist(rawinputtb %>% filter(interest_level == "low") 
     %>% select(photos_count) 
     %>% unlist, main = "Low interest level", breaks=seq(0,70,by=1))


#################333
# Testing ground
library(data.table)
temp <- data.table(listing_id = rep(unlist(rawinputtb$listing_id), 
                                    lapply(rawinputtb$features,length)),
                                  features=unlist(rawinputtb$features))
temp



