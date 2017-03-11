unlist2 <- list(X = list('x1','x2'), Y = list('y1','y2'))
unlist1 <- list(a = c('a','b','c'), b = c(1:2), c = unlist2)
unlist1

myunlist1 <- unlist(unlist1)
myunlist1


train = fromJSON("train_lite.json")
train_v <- unlist(train)
class(train)
class(train_v)
names(train)
names(train_v)
train_v[1]
