# The easiest way to get ggplot2 is to install the whole tidyverse:
install.packages("tidyverse")

# Alternatively, install just ggplot2:
install.packages("ggplot2")

library(ggplot2)

mpg$trans

summary(mpg)
str(mpg)

ggplot(mpg, aes(displ, hwy, colour = class)) + 
  geom_point()

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

unique(mpg$year)
# aes funciton
#x
# y
# alpha
# colour
# fill
# shape
# size
# stroke

#categorical
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = model, y = trans, colour = class))

#numerical
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = year, y = cyl, stroke = hwy))

#facet wrap
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ displ, nrow = 3)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ class)


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ class)


# Geonm
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

# use multiple geom
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(colour = 'red') + 
  geom_smooth(colour = 'orange')









