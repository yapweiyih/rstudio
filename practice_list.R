#list
id <- 1:15
age <- c(12,3,5)
x <- data.frame(id,age)

mylist <- list(71,"word", c(1:5),x)
names(mylist) <- c("favNum", "favWord","favVector", "favData")

mylist
class(mylist[[1]])
class(mylist[3])
class(mylist[["favData"]])
class(mylist["favData"])
mylist[["favData"]]
mylist["favData"]

length(mylist)


#extract row from list based on condition
x
x[(id>3 & age > 5),]

#error
class(x[[1,]])

#vector
class(x[[1]])
class(x$id)
class(x[,1])
class(x[['id']])

#df
class(x['id'])
class(x[1])
x[1:4,]

length(unique(id))
length(unique(c(1,1,2,3)))
sort(c(5,1,2,3))
sort(unlist(list(1,4,2,4)))
