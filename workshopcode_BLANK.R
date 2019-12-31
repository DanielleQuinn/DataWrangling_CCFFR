# ---- Load packages ----
library(dplyr)
library(tidyr)
library(lubridate)
# Note: If an error is produced saying there is no such package
# it means you need to install the package using install.packages()

# ---- Import 1999 - 2015 Data ----
# 1. Check your working directory


# 2. List files in your working directory


# 3. Import the data


# ---- What is the {tidyverse}? ----
# The {tidyverse} is a collection of packages that share an
# underlying design philosophy, grammar, and data structures and
# work with "tidy data", which follows specific rules and best practices

# {dplyr}: data manipulation #
# {ggplot2}: visualizing data #
# {lubridate}: working with dates and times #
# {tidyr}: tidying data
# {broom}: tidying output from models
# {stringr}: working with strings
# {forcats}: working with factors
# {purrr}: functional programming
# {rvset}: web scraping

# https://www.tidyverse.org/packages/

# ---- Subsetting Data with {dplyr} ----
# dplyr::select() : selects columns from a data frame and outputs as a data frame

# Goal: Output the column called year


## Can you explain why the output is different for each of these?
data$year
select(data, year)

# Goal: Output the columns called site and common_name


# Goal: Convert the data frame to a tibble for easier viewing


# Goal: Output the columns called site and common_name


# dplyr::filter() : filters rows from a data frame

# Example: Output the rows where year is less than or equal to 2000


# Goal: Output the rows that correspond to data from site D


# Goal: Output the rows that correspond to data from pools in site D


## What is the output from the following line of code?
filter(data_tb,
       year %in% c(1999, 2001),
       month > 6,
       site == "A",
       common_name == "Creek Chub")

## What is the output from the following line of code?
filter(data_tb,
       between(year, 1999, 2001),
       month > 1,
       month < 4,
       site != "A",
       common_name == "Creek Chub")

# ---- Pipes ----
# Information is put into a pipe %>%
# It comes out the other end and is used as the first argument
# for the function on the other side

# Goal: Find the square root of 81


# Goal: Output the rows that correspond to data from site A



# Pipes are valuable when we want to perform multiple steps

# Goal: Find the square root of the absolute value of -16
# Nested functions


# Pipes


# Goal: Considering only data collected in 2000
# ouput the columns called year, habitat, and common_name


## Can you explain why this gives the same output?
data_tb %>%
  select(year, habitat, common_name) %>%
  filter(year == 2000)

## What would happen if you tried to run this?
data_tb %>%
  select(habitat, common_name) %>%
  filter(year == 2000)

## Choose any species.
# Output the common_name and count columns associated with that species.


## Output the year, month, and site columns from instances where at least two
## individuals of that species were captured in a pool.


# ---- Summarising Data with {dplyr} ----
# dplyr::summarise() : returns a single value based on the instructions you give it

# Goal: Find the maximum count


# dplyr::group_by() : splits your data into groups based on the variables you specify

# Goal: Group by site


# Goal: Use group_by() and summarise() together to find the average
# number of fish caught at each site


# This can be stored as a data frame


# The column names can be specified in summarise


# Goal: What is the average and sd of counts in each habitat type?


# Goal: What is the average and sd of counts in each habitat type, by year?


# Goal: What was the average number of Creek Chub captured at each site?


# dplyr::count() : counts occurences of a variable

# Goal: How many records at each site?


# dplyr::n() : counts occurences in each group using summarise()

# Goal: How many records at each site by habitat type?


## When might you use count() vs summarise(n())?



# dplyr::n_distinct() : count unique values in each group using summarise()

# Goal: In how many unique years was each site sampled?


## Goal: How many total specimens were captured at each site?


## Goal: How many unique species were captured at each site?



# ---- Manipulating Data with {dplyr} ----
# dplyr::mutate() : create a new column

# Goal: Create a column called area, containing simulated sampling areas
# generated using rnorm()




# To make this change permanent, overwrite the data frame


# dplyr::mutate() : create a new column based on another column

# Example: Create a column called density


# Goal: Create a column called "present", that contains TRUE if a
# species was captured and FALSE if a species was not captured



# Goal: Create a column called "present_v2" that contains "yes" if a 
# species was captured and "no" if a species was not captured



## Goal: Create a column called "records" that contains "new" if the 
# record was collected after 2010 and "old" if it was collected in 2009 or earlier


# ---- Capstone Exercise ----
## Create a summary table called "table1" that contains the
# total, mean, maximum, and minimum number of Central Stonerollers
# captured by year, site, and habitat


# ---- What is "tidy data"? ----
# These functons work because we're dealing with "tidy" data

# 1. Each row is an observation
# 2. Each column is a variable
# 3. Each cell contains a maximum of one piece of information

# If the data are not in this format, you'll need to reshape it!

# ---- Import 2016 Data ----
# Import the data


# Explore the data - what needs to be fixed?

# ---- Reshaping Data with {tidyr} ----
# tidyr::gather() : convert from wide to long format

# Goal: Convert data2016 from wide to long
# where the various columns representing fish counts
# at different sites become a single column for site and
# a single column for count


# tidyr::drop_na() : drop all rows that contain any NAs

# Goal: Drop rows that contain NA in the count column


# ---- Joining Data with {tidyr} ----
# Data are joined by matching corresponding records from 
# two data frames and merging that information into a 
# single data frame.

# tidyr::left_join(x, y) : return all rows from x and
# all columns from y

# Goal: Join information about scientific name to 
# data2016_long

# 1. Import reference table


# 2. Join data2016_long and species_names


# ---- Binding Data with {dplyr} ----
# Data can be bound by rows (stacked data frames) or
# by columns (adjacent data frames)

# dplyr::bind_rows : bind multiple data frames by row


# What does this warning message mean?


# Goal: Convert site to a factor


# ---- Dealing with Dates and Times with {lubridate} ----
# lubridate::ymd() : takes a string representing year-month-day and converts it to a date


# Goal: Combine year, month, and day into a format that can be 
# converted to a date
