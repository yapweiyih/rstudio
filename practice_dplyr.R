library(dplyr)
data()
mtcars

dim(mtcars)
head(mtcars)
summarise(mtcars,mean(disp),mean(mpg),mean(hp))
summarise_all(mtcars, c('mean','min'))
summarise_at(mtcars,c('disp','hp'),c('mean','min'))

#piping
#'avg' is column names
mtcars %>% group_by(cyl) %>% summarise(avg=mean(mpg))

#count
count(mtcars,cyl)


#filter by column
head(select(Auto, mpg:displacement))

#filter by row
head(filter(Auto, cylinders < 6 ))
