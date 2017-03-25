id <- (1:5)
age <- c(1,2,3,4,5)
name <- c("jimmy","danny","joy","dam","cool")
mydf <- data.frame(id,age,name)

nrow(mydf)
ncol(mydf)
dim(mydf)

#give me the 2nd col name
names(mydf)[2]
head(mydf,2)
summary(mydf)

mydf
mydf[3,3]
class(mydf[1]) #data frame
mydf[1]
#same concept as list, when we use single bracket, it always return the existing data type


class(mydf[[1]]) #vector
mydf[[1]]
class(mydf$id) #vector
mydf$id


#single bracket always return data frame
class(mydf[2,]) #df
mydf[2,]
class(mydf[,2]) #vector
mydf[,2]

#subset
class(mydf[c(1,3),c("age","name")])
mydf[c(1,3),c("age","name")]

str(testdf)
testdf[1:10,]
testdf["id" == 4]


#sorting
sort(mydf[1])
sort(mydf[[1]])
sort(mydf$id)
