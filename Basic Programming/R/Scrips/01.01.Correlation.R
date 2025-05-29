#Correlation Script

#Clean Environment
rm(list = ls())

#Load libraries
library(ggplot2)

#Load data
data(mtcars)

#Analysis
cor(mtcars$hp, mtcars$mpg)
cor.test(mtcars$hp, mtcars$mpg, method = "pearson")
hist(mtcars$hp) 
hist(mtcars$mpg)
cor.test(mtcars$hp, mtcars$mpg, method = "spearman")

cor.test(mtcars$hp, mtcars$mpg, method = "kendall")

qplot(x = hp, y = mpg, data = mtcars) +
  geom_smooth(method = "lm", se = FALSE) +
  ggtitle("Figure 4: Strong Negative Association")

pairs(mtcars[c("mpg", "hp", "cyl", "disp", "carb")], main = "mtcars Pairs Matrix", pch=21)
