#Clean Environment
rm(list = ls())

#Load libraries
library(dplyr)
library(ggplot2)

#Data Visualization dataset IRIS

# Part I : DPLYR 

# Part I - I: filter ()

#Select iris data of species "virginica"
iris %>% 
  filter(Species=="virginica")


#Select iris data of species "virginica" and sepal length greater than 6.
iris %>% 
  filter(Species=="virginica",Sepal.Length > 6) 

# Part I - II: arrange()
#Sort in ascending order of sepal length
iris %>% 
  arrange(Sepal.Length) 


#Sort in descending order of sepal length
iris %>% 
  arrange(desc(Sepal.Length)) 

#Uses Filter and Arrange
#Filter for species "virginica"then arrange in descending order of sepal length
iris %>% 
  filter(Species=="virginica") %>% 
  arrange(desc(Sepal.Length)) 



#Part I - III : mutate()
#Change Sepal.Length to be in millimeters
iris %>% 
  mutate(Sepal.Length=Sepal.Length*10) 


#Create a new column called SLMm
iris %>% 
  mutate(SLMm=Sepal.Length*10) 


#Combine filter, mutate, arrange
iris %>%
  filter(Species=="virginica")%>%
  mutate(SLMm=Sepal.Length*10)%>%
  arrange(desc(SLMm))


#Part I- IV: summarize()
#Summarize to find the median sepal length
iris %>% 
  summarize(medianSL= median(Sepal.Length)) 


#Filter for virginica then summarize the median sepal length
iris %>% 
  filter(Species=="virginica") %>% 
  summarize(medianSL=median(Sepal.Length))


#summarize multiple times
iris %>%
  filter(Species=="virginica") %>%
  summarize(medianSL=median(Sepal.Length),
            maxSL= max(Sepal.Length)) 



# Part I - V: group_by()
#Find median and max sepal length of each species
iris %>% 
  group_by(Species) %>% 
  summarize(medianSL=median(Sepal.Length), 
            maxSL=max(Sepal.Length))


#Find median and max petal length of each species with sepal length > 6
iris %>% 
  filter(Sepal.Length>6) %>% 
  group_by(Species) %>% 
  summarize(medianPL=median(Petal.Length), 
            maxPL=max(Petal.Length))




#Part II : GGPLOT2
# Part II - I: Scatter Plot
# Compare petal width and length
iris_small <- iris %>%
  filter(Sepal.Length > 5)

ggplot(iris_small, aes(x=Petal.Length, y=Petal.Width)) +  geom_point()

#Color Feature
ggplot(iris_small, aes(x=Petal.Length, y=Petal.Width, color=Species)) + geom_point()

#Size Feature 
ggplot(iris_small, aes(x=Petal.Length,y=Petal.Width,color=Species, size=Sepal.Length)) + geom_point()

#Faceting
ggplot(iris_small, aes(x=Petal.Length,y=Petal.Width)) + geom_point() + facet_wrap(~Species)



#Part II- II: Bar Plot
by_species <- iris %>%
  filter(Sepal.Length>6) %>%
  group_by(Species) %>%
  summarize(medianPL=median(Petal.Length))

ggplot(by_species, aes(x=Species,y=medianPL)) + geom_col() 



# Part II - III: Histogram
ggplot(iris_small, aes(x=Petal.Length))+ geom_histogram()


ggplot(iris_small, aes(x=Species,y=Sepal.Width))+ geom_boxplot()

