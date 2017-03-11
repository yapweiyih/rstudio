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
