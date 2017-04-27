USArrests
states=row.names(USArrests)
states


apply(USArrests , 2, mean) #mean by col
apply(USArrests , 2, var) #mean by col


apply(USArrests , 1, mean) #mean by row

#principla component analysis
pr.out =prcomp(USArrests , scale =TRUE) #scale to sd = 1
pr.out
#1. sdev 2.rotation (PC loading) 3.center(mean) 4.scale(std dev) 5.x
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
