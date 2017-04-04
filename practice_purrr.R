library(purrr)

summary(mtcars)
str(mtcars)
class(mtcars$mpg)

mtcars %>%
  split(.$cyl)
temp <- mtcars %>%
        split(.$cyl) #r base package
temp <- mtcars %>% group_by(cyl) #??
class(temp$cyl)

class(temp$`4`)
class(rawinputtb)
temp[1:2]

mtcars %>%
  split(.$cyl) %>%
  map(~ lm(mpg ~ wt, data = .)) %>% #~ sign is for anonymous function
  map(summary) %>% #input to map must be a list
  map_dbl("r.squared")

mtcars %>% 
  filter(cyl == 4) %>%
  map(~ lm(mpg ~ wt, data = .))

temp <- mtcars %>% 
  filter(cyl %in% c('4','6')) %>%
  lm(mpg ~ wt, data = .)
temp
class(temp)

#map take in list
map(mtcars$mpg,summary)

mtcars %>%
  split(.$cyl) %>%
  map(~ lm(mpg ~ wt, data = .)) %>%
  map(summary) %>%
  map_dbl("r.squared")
