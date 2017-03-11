library(rjson)
rm(mydata)

#all json value must be string
mydata <- fromJSON(file="salary.json")
mydata
class(mydata)

mydata2 <- fromJSON(file="salary2.json")
mydata2
mydf <- data.frame(mydata2)
mydf
