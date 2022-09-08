
#Load Packagaes
library(tidyverse)

#read in the data & create a tibble.
iris_data <- iris 
tibble(iris_data)


#arrange the iris data by Sepal.Length & display first 10 rows
arrange_Sepal.Length <- arrange(iris_data, Sepal.Length)
head(arrange_Sepal.Length, 10)


#Select Species and Petal.Width 
testdat <- select(iris_data, Species, Petal.Width)
testdat

#Create a new table called species_mean that has the mean for each variable for each Species.
species_mean <- group_by(iris_data, Species)
species_mean <- summarize(species_mean, v1 = mean(Sepal.Length), v2 = mean(Sepal.Width), 
                          v3 = mean(Petal.Length),
                          v4 = mean(Petal.Width))
species_mean


#Create iris_min with only the observations with at least 3 for Sepal.Width and not 2.5 for Petal.Width.
iris_min <- filter(iris_data, Sepal.Width >= 3, Petal.Width != 2.5)
iris_min


#Create iris_size
iris_size <- iris_data %>%
  mutate(Sepal.Size = 
           case_when(
             Sepal.Length < 5 ~ "small",
             Sepal.Length >= 5 & Sepal.Length < 6.5 ~ "medium",
             Sepal.Length >= 6.5 ~ "large"))
head(iris_size)   


#Creating iris_rank
iris_rank <- arrange(iris_data, desc(Petal.Length))
mutate(iris_rank, rank=min_rank(Petal.Length))


#Use summarize_all()
?summarize_all
means_sd_species <- iris_data %>%
  group_by(Species) %>%
  summarize_all(list(Mean=mean, Std_dev = sd))
means_sd_species



#Novel Questions
#Q1: How has the housing market changed in the past 30 years?
#Q2: Is youth football decresing in participation?
#Q3: Which U.S. state would be ideal to HQ a business?

#Feedback from 5-10 people
#My first two questions recived positive feedback. Whether it was becuase of
#sole intrerest or applicable use, it was commonly said that I should pursue those 
#first two questions. Feedback said that my first question was pretty broad in regards
#to application for that question. I know i personally wouldn't be starting a business anytime soon.

#Professional Feedback
#My first question would be very intsresting to pursue being that I will eventually be 
#in the market to buy a house. It is good to educated myself on a topic that requires a heavily
#weighted decision.
