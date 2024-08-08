# PREPARATION

# Installing the packages
install.packages("tidyverse")
install.packages("janitor")
install.packages("lubridate")
install.packages("hydroTSM")
install.packages("scales")
install.packages("dplyr")
install.packages("ggplot2")

# Loading the packages
library(tidyverse)
library(janitor)
library(lubridate)
library(hydroTSM)
library(scales)
library(dplyr)
library(ggplot2)

# Import data, 12 data frames 1 for each month of 2023
Jan2023 <- read_csv("CapstoneProject/2023_01.csv")
Feb2023 <- read_csv("/CapstoneProject/2023_02.csv")
March2023 <- read_csv("/CapstoneProject/2023_03.csv")
April2023 <- read_csv("/CapstoneProject/2023_04.csv")
May2023 <- read_csv("/CapstoneProject/2023_05.csv")
June2023 <- read_csv("/CapstoneProject/2023_06.csv")
July2023 <- read_csv("/CapstoneProject/2023_07.csv")
Aug2023 <- read_csv("/CapstoneProject/2023_08.csv")
Sep2023 <- read_csv("/CapstoneProject/2023_09.csv")
Oct2023 <- read_csv("/CapstoneProject/2023_10.csv")
Nov2023 <- read_csv("/CapstoneProject/2023_11.csv")
Dec2023 <- read_csv("/CapstoneProject/2023_12.csv")

# Marge the 12 data frames into 1 data frame
merged_data <- bind_rows(Jan2023, Feb2023, March2023, April2023, May2023, 
                         June2023, July2023, Aug2023, Sep2023, Oct2023, Nov2023, Dec2023)

rows_before_cleaning <- nrow(merged_data)

# Remove individual data frames to clean up environment
remove(Jan2023, Feb2023, March2023, April2023, May2023, June2023, July2023, 
       Aug2023, Sep2023, Oct2023, Nov2023, Dec2023)


# PROCESS

# Remove NA rows and cols
merged_data <- janitor::remove_empty(merged_data, which = c("cols"))
merged_data <- janitor::remove_empty(merged_data, which = c("rows"))

# Remove duplicate rows 
merged_data <- distinct(merged_data)

# Exclude rows with parsing issues
cleaned_data <- merged_data %>%
  filter(
    suppressWarnings(!is.na(parse_date_time(started_at, orders = c("ymd_HMS", "mdy_HMS")))),
    suppressWarnings(!is.na(parse_date_time(ended_at, orders = c("ymd_HMS", "mdy_HMS"))))
  )

# Data cleaning and transformation
cleaned_combined_data <- cleaned_data %>%
  mutate(
    started_at = parse_date_time(started_at, orders = c("ymd_HMS", "mdy_HMS")),
    ended_at = parse_date_time(ended_at, orders = c("ymd_HMS", "mdy_HMS")),
    ride_length = as.numeric(difftime(ended_at, started_at, units = "mins")),
    day_of_week = case_when(
      wday(started_at) == 1 ~ 'SUN',
      wday(started_at) == 2 ~ 'MON',
      wday(started_at) == 3 ~ 'TUES',
      wday(started_at) == 4 ~ 'WED',
      wday(started_at) == 5 ~ 'THURS',
      wday(started_at) == 6 ~ 'FRI',
      wday(started_at) == 7 ~ 'SAT'
    ),
    month = case_when(
      month(started_at) == 1 ~ 'JAN',
      month(started_at) == 2 ~ 'FEB',
      month(started_at) == 3 ~ 'MAR',
      month(started_at) == 4 ~ 'APR',
      month(started_at) == 5 ~ 'MAY',
      month(started_at) == 6 ~ 'JUN',
      month(started_at) == 7 ~ 'JUL',
      month(started_at) == 8 ~ 'AUG',
      month(started_at) == 9 ~ 'SEP',
      month(started_at) == 10 ~ 'OCT',
      month(started_at) == 11 ~ 'NOV',
      month(started_at) == 12 ~ 'DEC'
    )
  ) %>%
  filter(
    !is.na(start_station_name),
    !is.na(end_station_name),
    !is.na(end_lat),
    !is.na(end_lng),
    ride_length > 1,
    ride_length < 1440
  )

# Check the number of rows in the cleaned data
rows_after_cleaning <- nrow(cleaned_combined_data)


# DATA ANALYSIS

# bike types used by riders 
# Count of trips by member type and bike type
bike_types_used <- cleaned_combined_data %>%
  group_by(member_casual, rideable_type) %>%
  summarise(total_trips = n()) %>%
  arrange(member_casual, total_trips)

# Number of trips per month
# Count of trips per month by member type
trips_per_month <- cleaned_combined_data %>%
  group_by(month, member_casual) %>%
  summarise(total_trips = n()) %>%
  arrange(member_casual, month)

# Number of trips per day of the week
# Count of trips per day of the week by member type
trips_per_day_of_week <- cleaned_combined_data %>%
  group_by(day_of_week, member_casual) %>%
  summarise(total_trips = n()) %>%
  arrange(member_casual, day_of_week)

# Number of trips per hour
# Extract hour from started_at and count trips per hour by member type
trips_per_hour <- cleaned_combined_data %>%
  mutate(hour_of_day = hour(started_at)) %>%
  group_by(hour_of_day, member_casual) %>%
  summarise(total_trips = n()) %>%
  arrange(member_casual, hour_of_day)

# Average ride length per month by member type
avg_ride_length_per_month <- cleaned_combined_data %>%
  group_by(month, member_casual) %>%
  summarise(avg_ride_duration = mean(ride_length)) %>%
  arrange(member_casual, month)

# Average ride length per day of the week by member type
avg_ride_length_per_day_of_week <- cleaned_combined_data %>%
  group_by(day_of_week, member_casual) %>%
  summarise(avg_ride_duration = mean(ride_length)) %>%
  arrange(member_casual, day_of_week)

# Average ride length per hour by member type
avg_ride_length_per_hour <- cleaned_combined_data %>%
  mutate(hour_of_day = hour(started_at)) %>%
  group_by(hour_of_day, member_casual) %>%
  summarise(avg_ride_duration = mean(ride_length)) %>%
  arrange(member_casual, hour_of_day)

# Starting station locations and trip counts by member type
start_station_locations <- cleaned_combined_data %>%
  group_by(start_station_name, member_casual) %>%
  summarise(
    start_lat = mean(start_lat, na.rm = TRUE),
    start_lng = mean(start_lng, na.rm = TRUE),
    total_trips = n()
  )

# Ending station locations and trip counts by member type
end_station_locations <- cleaned_combined_data %>%
  group_by(end_station_name, member_casual) %>%
  summarise(
    end_lat = mean(end_lat, na.rm = TRUE),
    end_lng = mean(end_lng, na.rm = TRUE),
    total_trips = n()
  )

# Export data frames to CSV for Tableau
write.csv(bike_types_used, "bike_types_used.csv", row.names = FALSE)
write.csv(trips_per_month, "trips_per_month.csv", row.names = FALSE)
write.csv(trips_per_day_of_week, "trips_per_day_of_week.csv", row.names = FALSE)
write.csv(trips_per_hour, "trips_per_hour.csv", row.names = FALSE)
write.csv(avg_ride_length_per_month, "avg_ride_length_per_month.csv", row.names = FALSE)
write.csv(avg_ride_length_per_day_of_week, "avg_ride_length_per_day_of_week.csv", row.names = FALSE)
write.csv(avg_ride_length_per_hour, "avg_ride_length_per_hour.csv", row.names = FALSE)
write.csv(start_station_locations, "start_station_locations.csv", row.names = FALSE)
write.csv(end_station_locations, "end_station_locations.csv", row.names = FALSE)
