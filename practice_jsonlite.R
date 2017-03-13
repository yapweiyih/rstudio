library(jsonlite)
library(ISLR)
purrr::walk(packages, library, character.only = TRUE, warn.conflicts = FALSE)

myauto <- toJSON(Auto, pretty=TRUE)
myauto
class(myauto)

mydata <- fromJSON("lite.json")
mydata
class(mydata)

sigma <- fromJSON("train.json")
summary(sigma)


# unlist every variable except `photos` and `features` and convert to tibble
vars <- setdiff(names(sigma), c("photos", "features"))
data <- map_at(sigma, vars, unlist)
datatbl <- map_at(sigma, vars, unlist) %>% tibble::as_tibble(.)
sigmadf <- data.frame(datatbl)

# Show difference
sigma$bathrooms
data$bathrooms
datatbl$bathrooms

class(sigma$bathrooms)
class(data$bathrooms)
class(datatbl$bathrooms)