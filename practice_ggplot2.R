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



ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)


?ggplot(data = mpg) +
  geom_line(mapping = aes(x = displ, y = hwy), colour = 'blue') +
  geom_line(mapping = aes(x = displ, y = cty), colour = 'green')

#graph with legend, title, caption
ggplot(data = mpg) +
  geom_point(mapping = aes(x = cyl, y = displ, colour = cyl)) +
  labs(x = 'cylinder', y = 'displ', colour = 'Legend')

ggplot(data = mpg) +
  geom_bar(mapping = aes(x = cyl, colour = cyl)) +
  labs(x = 'cylinder', y = 'counts', colour = 'cylinder',
       title = 'Title', subtitle = 'subtitle',
       caption = 'Accurate as of 14 apr')
            
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = hwy))            
        
#EXERCISE
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = drv)) + 
  geom_point() + 
  geom_smooth( mapping = aes(linetype = drv), se = FALSE, colour = 'blue')
  
# position = fill, dodge, identify, stack
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")



ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_count()


#coordinate system
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()

