library(dplyr)
data()
mtcars[1:2,]

class(mtcars)
dim(mtcars)
head(mtcars)
summarise(mtcars,mean(disp),mean(mpg),mean(hp))
summarise_all(mtcars, c('mean','min'))
summarise_at(mtcars,c('disp','hp'),c('mean','min'))

#piping
#'avg' is column names
mtcars %>% group_by(cyl) %>% summarise(avg=mean(mpg))
mtcars %>% summarise(avg=mean(mpg))
temp <- mtcars %>% group_by(cyl)
temp

#count
count(mtcars,cyl)


#filter by column
head(select(Auto, mpg:displacement))

#filter by row
head(filter(Auto, cylinders < 6 ))


id <- (1:5)
age <- c(1,2,3,4,5)
name <- c("jimmy","danny","joy","dam","cool")
mydf <- data.frame(id,age,name)
mydf

#filter by column value
mydf %>% filter(age > 3)


rawinputtb %>% filter(rawinputtb$listing_id== 7040024) %>%
  select(longitude, latitude)


# apply function to every item in list and return vector
cat_var <- names(train_data)[which(sapply(train_data, is.character))]
num_var <- names(train_data)[which(sapply(train_data, is.numeric))]

#correlation
cor(train_data[,118:131])


library(nycflights13)

# cleaner using pipe
is.nan(flights$dep_time)
flights %>% filter(!is.na(dep_delay)) %>%
  group_by(day,hour) %>%
  summarise(delay = mean(dep_delay), n = n()) %>% #n() is built in count function
  filter(delay > 30)

# compared to not using pipe
hourly_delay <- filter(
  summarise(
    group_by(
      filter(
        flights,
        !is.na(dep_delay)
      ),
      date, hour
    ),
    delay = mean(dep_delay),
    n = n()
  ),
  n >10
)

flights
select(flights, starts_with("dep",))
