library(jsonlite)
library(ISLR)
library(MASS)
purrr::walk(packages, library, character.only = TRUE, warn.conflicts = FALSE)


sigma <- fromJSON("train.json")
summary(sigma)
class(sigma)
length(sigma)


# unlist every variable except `photos` and `features` and convert to tibble
vars <- setdiff(names(sigma), c("photos", "features"))
data <- map_at(sigma, vars, unlist)
datatbl <- map_at(sigma, vars, unlist) %>% tibble::as_tibble(.)
sigmadf <- data.frame(datatbl)
names(sigmadf)

#sampling
sigmadfm <- sigmadf
train_index <- 1:10
sigma_train = sigmadfm[train_index,]
sigma_test = sigmadfm[-train_index,]
dim(sigma_train)
dim(sigma_test)

# add calculated column features_count
sigmadfm$features_count <- unlist(map(sigmadfm$features,length))
sigmadfm$photos_count <- unlist(map(sigmadfm$photos,length))
sigmadfm$created_year <- unlist(as.factor(format(as.Date(sigmadfm$created),format="%Y")))
sigmadfm$interest_level_fac <- unlist(factor(sigmadfm$interest_level))


# check target and attributes
names(sigmadfm)
summary(sigmadfm)
cor(sigmadfm)


#sampling

train_index <- 1:10
sigma_train = sigmadfm[train_index,]
sigma_test = sigmadfm[-train_index,]
dim(sigma_train)
dim(sigma_test)
names(sigma_train)


#todo
#description




#remove unwanted attributes
sigmadff <- sigmadfm[-c(3,4,5,6,7,9,11,12,14,15)]
names(sigmadff)
dim(sigmadff)

#modeling
model <- glm(interest_level_fac ~bathrooms+bedrooms+price+
               features_count+photos_count, data=sigma_train, 
             family = binomial)
summary(model)


lda.fit <- lda(interest_level_fac ~bathrooms+bedrooms+price+
               features_count+photos_count, data=sigma_train)
lda.fit
plot(lda.fit)


lda.pred <- predict(lda.fit,newdata=sigma_test)
result <- table(lda.pred$class,sigma_test$interest_level)
result
result[2,2]
error_rate = (result[1,1]+result[2,2]+result[3,3])/sum(result)
error_rate

