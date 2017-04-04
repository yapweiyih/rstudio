library(ISLR)
library(tree)

attach(Carseats)
High=ifelse(Sales<=8,"No","Yes")
High

Carseats <- data.frame(Carseats,High)
Carseats


tree.carseats=tree(High~.-Sales, Carseats)
summary(tree.carseats)
plot(tree.carseats)
text(tree.carseats,pretty=0)
tree.carseats


#E.g.
set.seed(2)
train=sample(1:nrow(Carseats),200)
Carseats.test = Carseats[-train,]
High.test = High[-train]
tree.carseats=tree(High~.-Sales,Carseats,subset=train)
tree.pred=predict(tree.carseats, Carseats.test,type="class")
tree.pred

table(tree.pred,High.test)


# CV tree
set.seed(3)
cv.carseats = cv.tree(tree.carseats, FUN=prune.misclass)
names(cv.carseats)
cv.carseats
#dev correspond to cross validation error rate in this instance

par(mfrow=c(1,2))
plot(cv.carseats$size,cv.carseats$dev, type = "b")
plot(cv.carseats$k,cv.carseats$dev, type = "b")

prune.carseats=prune.misclass(tree.carseats,best=9)
plot(prune.carseats)
text(prune.carseats,pretty=0)
tree.pred2=predict(prune.carseats,Carseats.test,type="class")
table(tree.pred2,High.test
      )


