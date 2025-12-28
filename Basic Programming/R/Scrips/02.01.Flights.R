#Data Visualization dataset NYCFLIGHTS13

#Clean Environment
rm(list = ls())

# Lod libraries
library(nycflights13)
library(tidyverse)

#Filter example: we can select all flights on January 1st with
filter(flights, month == 1, day == 1)
filter(flights, month == 11 | month == 12)

nov_dec <- filter(flights, month %in% c(11, 12))

#if you wanted to find flights that weren't delayed (on arrival or departure) by 
#more than two hours, you could use:
filter(flights, arr_delay <= 120, dep_delay <= 120)

arrange(flights, year, month, day)
arrange(flights, desc(dep_delay))

flights %>%
  filter(month == 1, day == 1) %>%
  arrange(desc(dep_delay))

# Select columns by name
select(flights, year, month, day)

summarise(flights, delay = mean(dep_delay, na.rm = TRUE))

by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))


delays <- flights %>% 
  group_by(dest) %>% 
  summarise(count = n(),dist = mean(distance, na.rm = TRUE),
            delay = mean(arr_delay, na.rm = TRUE)) %>% 
  filter(count > 20, dest != "HNL")

ggplot(data = delays, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/4) +
  geom_smooth(se = FALSE)

