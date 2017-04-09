# Kaggle competition
# All claim severity

###################
# Methodology
# 1. study the data
#   check for outlier or dirty data -> remove
#   check that there large number of predictors -> not suitable for KNN. non-parametric approaches often perform poorly when p is large
#

###################
# Code
library(data.table)
library(gridExtra)
library(corrplot)
library(GGally)
library(ggplot2)
library(e1071)
system("ls")
setwd("/Users/weiyih/Google Drive/My Learning/Kaggle/AllClaimSeverity")
#train_data_org <- read.csv("train.csv")
#train_data <- as.data.table(train_data_org) # This is much powerful than data.frame
train_data<-fread("train.csv")
test_data<-fread("test.csv")
train_data <- train_data[, loss:=log(loss)]; 
test_data <- test_data[, loss:=NA]; 
train_test <- rbindlist(list(train_data,test_data),use.names = T)

dt_train <- train_data
system('ls -l')

# List down the predictors
names(train_data)
summary(train_data)
str(train_data)
# THere are 14 quantitives, 116 quality
head(str(train_data))
tail(str(train_data))

#118-131
cor(train_data[,118:131])
cat_var <- names(train_data)[which(sapply(train_data, is.character))]
num_var <- names(train_data)[which(sapply(train_data, is.numeric))]
num_var <- setdiff(num_var, c("id", "loss"))

dt_train_cat <- train_data[,.SD, .SDcols = cat_var]
dt_train_num <- train_data[,.SD,.SDcols = num_var]


#Missing values
colSums(sapply(train_data, is.na)) #Sum by every column

# Check for duplicated rows.
cat("The number of duplicated rows are", nrow(train_data) - nrow(unique(train_data))) 

#####################
# Helper function
plotBox <- function(data_in, i, lab) 
  {
  data <- data.frame(x=data_in[[i]], y=lab)
  p <- ggplot(data=data, aes(x=x, y=y)) +
    geom_boxplot()+ xlab(colnames(data_in)[i]) + theme_light() + 
    ylab("log(loss)") + 
    theme(axis.text.x = element_text(angle = 90, hjust =1))
  return (p)
}

doPlots <- function(data_in, fun, ii, lab, ncol=3) {
  pp <- list()
  for (i in ii) {
    p <- fun(data_in=data_in, i=i, lab=lab)
    pp <- c(pp, list(p))
  }
  do.call("grid.arrange", c(pp, ncol=ncol))
}

plotScatter <- function(data_in, i, lab){
  data <- data.frame(x=data_in[[i]], y = lab)
  p <- ggplot(data= data, aes(x = x, y=y)) + geom_point(size=1, alpha=0.3)+ geom_smooth(method = lm) +
    xlab(paste0(colnames(data_in)[i], '\n', 'R-Squared: ', round(cor(data_in[[i]], lab, use = 'complete.obs'), 2)))+
    ylab("log(loss)") + theme_light()
  return(suppressWarnings(p))
} 

plotDen <- function(data_in, i, lab){
  data <- data.frame(x=data_in[[i]], y=lab)
  p <- ggplot(data= data) + geom_density(aes(x = x), size = 1,alpha = 1.0) +
    xlab(paste0((colnames(data_in)[i]), '\n', 'Skewness: ',round(skewness(data_in[[i]], na.rm = TRUE), 2))) +
    theme_light() 
  return(p)
}

#####################

# Observation shows that 
# 1: profile A has higher claim compared to B
# cat1 to cat 72: profile A has higher claim
# outlier cat 25, 26, 31, 
doPlots(dt_train_cat, fun = plotBox, ii =1:12, lab=dt_train$loss, ncol = 3)
doPlots(dt_train_cat, fun = plotBox, ii =13:24, lab=dt_train$loss, ncol = 3)
doPlots(dt_train_cat, fun = plotBox, ii =25:36, lab=dt_train$loss, ncol = 3)
doPlots(dt_train_cat, fun = plotBox, ii =37:48, lab=dt_train$loss, ncol = 3)
doPlots(dt_train_cat, fun = plotBox, ii =49:60, lab=dt_train$loss, ncol = 3)
doPlots(dt_train_cat, fun = plotBox, ii =61:72, lab=dt_train$loss, ncol = 3)
doPlots(dt_train_cat, fun = plotBox, ii =73:84, lab=dt_train$loss, ncol = 3)
doPlots(dt_train_cat, fun = plotBox, ii =85:96, lab=dt_train$loss, ncol = 3)
doPlots(dt_train_cat, fun = plotBox, ii =97:108, lab=dt_train$loss, ncol = 3)
doPlots(dt_train_cat, fun = plotBox, ii =109:110, lab=dt_train$loss, ncol = 1)
doPlots(dt_train_cat, fun = plotBox, ii =111:112, lab=dt_train$loss, ncol = 1)
doPlots(dt_train_cat, fun = plotBox, ii =113:114, lab=dt_train$loss, ncol = 1)
doPlots(dt_train_cat, fun = plotBox, ii =115:115, lab=dt_train$loss, ncol = 1)
doPlots(dt_train_cat, fun = plotBox, ii =116:116, lab=dt_train$loss, ncol = 1)

#326 levels
str(train_data$cat116)


ggplot(train_data, aes_string(x = "cont1", y = "loss"))+ geom_point(alpha=0.5)


plot4plots <- function(df, x_char){ 
  layout(matrix(c(1,2,3,4), 2, 2, byrow = TRUE))
  count_df <- df[,.(count=.N), by=.(get=get(x_char))]
  n_unique <- length(unique(df[[x_char]]))
  hist(df[[x_char]], n_unique/2, main=x_char)
  plot(count_df[order(get)][,.(diff_order=seq_along(diff(get)),diff_value=diff(get))], main=paste0("diff(sort(unique(", x_char, "))")) #paste0 means concatenate str
  acf(count_df[order(get)][["count"]], oma=c(1,1,1,1), main="") 
  pacf(count_df[order(get)][["count"]], oma=c(1,1,1,1), main="")
} 
plot4plots(train_test,"cont1")

subset = train_data[1:100]
count_df <- subset[,.(count=.N), by=.(get=get("cont1"))]
count_df <- subset[,.(count=.N), by=get("cont1")]
n_unique <- length(unique(subset[["cont1"]]))
hist(subset[["cont1"]], n_unique/2, main="test")
hist(subset[["cont1"]],2)

count_df[order(get)][,.(diff_order=seq_along(diff(get)),diff_value=diff(get))]
     
