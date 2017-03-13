library(dplyr)
data("Auto")

names(Auto)
class(Auto)
str(Auto)

#filter by column
head(select(Auto, mpg:displacement))

#filter by row
head(filter(Auto, cylinders < 6 ))
