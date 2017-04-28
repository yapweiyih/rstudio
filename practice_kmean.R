set.seed(2)
x=matrix (rnorm (50*2) , ncol =2)
x
x[1:25 ,1]=x[1:25 ,1]+3
x[1:25 ,2]=x[1:25 ,2] -4
names(x)
colnames(x) <- c('x','y')

plot(x)

km.out <- kmeans(x,2,nstart=20)
km.out$cluster
km.out$withinss
km.out$iter

dfx<- as.data.frame(x)
dfx
ggplot(dfx, aes(x,y)) + 
  geom_point()


plot(x, col =(km.out$cluster) , 
main="K-Means Clustering Results with K=2", 
xlab ="", ylab="", pch =20, cex =2)
