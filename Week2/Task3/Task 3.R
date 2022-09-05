library(tidyverse)

library(ggplot2)

?iris
head(iris)

#Plot1
ggplot(iris) +
  geom_point(mapping = aes( x = Sepal.Length, y = Sepal.Width, color = Species, shape = Species))


#Plot2
ggplot(iris) +
  geom_point(mapping = aes(x = Petal.Length, y = Petal.Width, color = Species, shape = Species)) +
  facet_wrap(~ Species)



#Plot3
ggplot(iris) +
  geom_point(mapping = aes(x = Petal.Length, y = Petal.Width, color = Species, shape = Species)) +
  geom_smooth(method = lm, mapping = aes(x = Petal.Length, y = Petal.Width))

#Plot3
ggplot(iris, aes(x=Sepal.Length, fill = Species)) +
  geom_histogram(binwidth = .20, color = 'black')



#DRIVING QUESTION: Is there a visual correlation between petal length and petal width between different species?

# The visualtizations show how petal length change with petal width for the different species. 



              
              
             