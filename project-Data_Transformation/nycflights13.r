# Install packages
install.packages(c("dplyr", "tidyr", "tidyverse","tibbletime"))

# Install libraries
library("dplyr")
library("tidyr")
library("tidyverse")
library("tibbletime")

# Install nycflights13 dataset
install.packages("nycflights13")
library("nycflights13")

# Exploring flights table
glimpse(flights)

# Q1: Find the date, month, carrier, origin, destination of longest air_time flight ever
flights %>%
  select(date = day, month, carrier, origin, destination = dest, air_time, distance) %>%
  arrange(desc(air_time)) %>%
  left_join(airlines, by = "carrier") %>%
  head(1)
# Ans. The longest air time is 695 minutes occurred in March, 17th, United Airlines,
# from Newark Liberty International Airport to Honolulu Airport, distance = 4963 km.

# Q2: Find the longest arrival time delay at "FLL"
flights %>%
  filter(grepl("^FLL", dest)) %>%
  arrange(desc(arr_delay)) %>%
  select(day, month, sched_arr_time, arr_time, arr_delay) %>%
  head(1)
# Ans. Delay time is 405 minutes.

# Q3: Find the most delayed departure time airline in April. Which airline 
 flights %>%
   filter(month == 4) %>%
   arrange(desc(dep_delay)) %>%
   select(day, month, sched_dep_time, dep_time, dep_delay, origin, dest, carrier) %>%
   left_join(airlines, by = "carrier") %>%
   head(10)
# Ans. That airline is Delta Air Lines, From JFK, NYC to Tampa (TPA), Florida with 960 minutes waiting for on-boarding.

# Q4: What is the most popular destination on christmas eve?
flights %>%
  filter(month == 12, day == 24) %>%
  select(day, month, origin, dest) %>%
  group_by(dest) %>%
  summarize(n = n()) %>%
  arrange(desc(n)) %>%
  head(10)
# Ans. LAX (Los Angeles)

# Q5: Which airline had the lowest and the highest number of flight from NYC?
flights %>%
  group_by(carrier) %>%
  summarize(n = n()) %>%
  left_join(airlines, by = "carrier") %>%
  arrange(n)
# Ans. The lowest number of flight was SkyWest Airlines Inc. which was 32 flights.
# The highest number of flight was United Air Lines Inc. which was 58,665 flights.

# Q6: How many flights that the SkyWest Airlines Inc. had each month?
flights %>%
  filter(carrier == "OO") %>%
  group_by(month) %>%
  summarize(number_Skywest = n())

# Q7: What was top 10 popular destination of UA (United Air Lines)?
flights %>%
  filter(carrier == "UA") %>%
  group_by(dest) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(10)
