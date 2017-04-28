library(corrplot)

USArrests
states=row.names(USArrests)
states

dimnames(USArrests)
mycor = cor(USArrests[,1:4])
corrplot(mycor)

apply(USArrests , 2, mean) #mean by col
apply(USArrests , 2, var) #mean by col


apply(USArrests , 1, mean) #mean by row

#principla component analysis
pr.out =prcomp(USArrests , scale =TRUE) #scale to sd = 1
pr.out
#1. sdev 2.rotation (PC loading) 3.center(mean) 4.scale(std dev) 
#5.x (score)
pr.out$center
pr.out$scale
pr.out$rotation[,1]
pr.out$x

#PC loading is normalized to 1
test <- pr.out$rotation[,1]
sum(test^2)

#plot pincipla coponent score
biplot(pr.out, scale=0)

#how much var is explained by each PC
pr.var = pr.out$sdev^2
pve = pr.var/sum(pr.var)
pve

plot(pve , xlab=" Principal Component", 
     ylab="Proportion of Variance Explained ", 
     ylim=c(0,1) ,type='b')

plot(cumsum(pve) , xlab=" Principal Component", 
     ylab="Proportion of Variance Explained ", 
     ylim=c(0,1) ,type='b')

summary(pr.out)

##################################
# Lab
library (ISLR)
class(NCI60$data)
str(NCI60$data)
nci.labs=NCI60$labs
nci.data=NCI60$data

head(nci.data)

pr.out =prcomp (nci.data , scale=TRUE)

Cols=function(vec )
{
  cols=rainbow (length (unique (vec )))
  return (cols[as.numeric (as.factor (vec))])
}

par(mfrow =c(1,2))
plot(pr.out$x[,1:2], col =Cols(nci.labs), pch =19,
       xlab ="Z1",ylab="Z2")
plot(pr.out$x[,c(1,3) ], col =Cols(nci.labs), pch =19,
       xlab ="Z1",ylab="Z3")



plot(pr.out)
