library(jsonlite)
library(ISLR)
purrr::walk(packages, library, character.only = TRUE, warn.conflicts = FALSE)


sigma <- fromJSON("train.json")
summary(sigma)


# unlist every variable except `photos` and `features` and convert to tibble
vars <- setdiff(names(sigma), c("photos", "features"))
data <- map_at(sigma, vars, unlist)
datatbl <- map_at(sigma, vars, unlist) %>% tibble::as_tibble(.)
sigmadf <- data.frame(datatbl)

#sampling
sigmadfm <- sigmadf

# add calculated column features_count
sigmadfm$features_count <- unlist(map(sigmadfm$features,length))
sigmadfm$photos_count <- unlist(map(sigmadfm$photos,length))
sigmadfm$created_year <- unlist(as.factor(format(as.Date(sigmadfm$created),format="%Y")))
sigmadfm$interest_level_fac <- unlist(factor(sigmadfm$interest_level))

#todo
#description


# check target and attributes
names(sigmadfm)
summary(sigmadfm)
cor(sigmadfm)


#remove unwanted attributes
sigmadff <- sigmadfm[-c(3,4,5,6,7,9,11,12,14,15,19)]
names(sigmadff)
dim(sigmadff)

#modeling
model <- glm(interest_level_fac ~bathrooms+bedrooms+price+
               features_count+photos_count, data=sigmadfm, 
             family = binomial)
summary(model)


model <- glm(interest_level_fac ~bathrooms+bedrooms+price+
               features_count+photos_count, data=sigmadfm, 
             family = binomial)

