#list
id <- 1:15
age <- c(12,3,5)
x <- data.frame(id,age)

mylist <- list(71,"word", c(1:5),x)
names(mylist) <- c("favNum", "favWord","favVector", "favData")

class(mylist[[1]])
class(mylist[3])
class(mylist[["favData"]])
class(mylist["favData"])
mylist[["favData"]]
mylist["favData"]

length(mylist)


#create data table from list
head(rawinput$features,5)
class(head(rawinput$features,5))
unlist(head(rawinput$features,5))

data.frame(col1 = rep('features',23), col2 = unlist(head(rawinput$features,5)))
data.table(col1 = rep('features',23), col2 = unlist(head(rawinput$features,5)))


#####################################
# building data table/frame using list

library(data.table)
rawinput$listing_id
class(rawinput$bathrooms)
unlist(rawinput$listing_id)
t1_feats <- data.table(listing_id=rep(unlist(rawinput$listing_id), 
                                      lapply(rawinput$features, length)), 
                       features=unlist(rawinput$features))
t1_feats
#get the count of each feature list
lapply(head(rawinput$features, 5),length)

# rep 1x1, 2x2, 3,3
data.table(listing_id = rep(c(1,2,3), c(1,2,3)),
           features=unlist(list('1a','2a','2b','3a','3b','3c')))

length(list(1,2,3))
lapply(c(list(4,5,6)),length)
rep(c(1,2,3), lapply(c('a','b','c'), length))


vars <- setdiff(names(rawinput), c("photos", "features"))
#for ths to work, must ensure all col have same lengths, hence
#remove photos and featuress
t1<- map_at(rawinput, vars, unlist) %>% as.data.table(.)


####################33
# Filtering
list1 <- list(1,2,3,4)
lista <- list(2,3)
lista[lista %in% list1]

dt1 <- data.table(list1)

#create new col, both are the same below
dt[,a := 1]
dt[,":="(b = 0)]
dt
