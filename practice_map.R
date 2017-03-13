id <- 1:15
age <- c(12,3,5)

result <- lapply(id,summary)
class(result)
class(result[[1]])
result
resultl <- unlist(result)
class(resultl)
resultl[1]


result1 <- sapply(id,summary)
result1
class(result1)
class(result1[[1]])
dim(result1)
result1[2,3]
names(result1)
attributes(result1)
