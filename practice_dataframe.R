id <- (1:5)
age <- c(1,2,3,4,5)
name <- c("jimmy","danny","joy","dam","cool")
x <- data.frame(id,age,name)

nrow(x)
ncol(x)
dim(x)

#give me the 2nd col name
names(x)[2]
head(x,2)
summary(x)
