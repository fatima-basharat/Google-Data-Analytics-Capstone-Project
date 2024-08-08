# Google-Data-Analytics-Capstone-Project: Cyclistic Case Study
Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)
## Introduction
In this case study, I will perform many real-world tasks of a junior data analyst at a fictional company, Cyclistic. In order to answer the key business questions, I will follow the steps of the data analysis process: [Ask](https://github.com/fatima-basharat/Google-Data-Analytics-Capstone-Project/blob/main/README.md#ask), [Prepare](https://github.com/fatima-basharat/Google-Data-Analytics-Capstone-Project/blob/main/README.md#prepare), [Process](https://github.com/fatima-basharat/Google-Data-Analytics-Capstone-Project/blob/main/README.md#process), [Analyze](https://github.com/fatima-basharat/Google-Data-Analytics-Capstone-Project/blob/main/README.md#analyze-and-share), [Share](https://github.com/fatima-basharat/Google-Data-Analytics-Capstone-Project/blob/main/README.md#analyze-and-share), and [Act](https://github.com/fatima-basharat/Google-Data-Analytics-Capstone-Project/blob/main/README.md#act).
### Quick links:
Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) [accessed on 08/06/24]  

Data Visualizations: [Tableau](https://public.tableau.com/views/CyclisticProject_17230548837230/Dashboard2?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)  
## Background
### Cyclistic
A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.   
  
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.  
  
Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno (the director of marketing and my manager) believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.  

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.  

### Scenario
I am assuming to be a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve our recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## Ask
## Business Task
Devise marketing strategies to convert casual riders to members.
### Analysis Questions
Three questions will guide the future marketing program:  
1. How do annual members and casual riders use Cyclistic bikes differently?  
2. Why would casual riders buy Cyclistic annual memberships?  
3. How can Cyclistic use digital media to influence casual riders to become members?  

Moreno has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?
## Prepare
### Data Source
I will use Cyclistic’s historical trip data to analyze and identify trends from Jan 2023 to Dec 2023 which can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement).  
  
This is public data that can be used to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit from using riders’ personally identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.
### Data Preparation

In this project I used R to combine the various datasets into one dataset and clean it.
Reason:  
A worksheet can only have 1,048,576 rows in Microsoft Excel because of its inability to manage large amounts of data. Because the Cyclistic dataset has more than 5.6 million rows, it is essential to use a programming language like R that supports huge volumes of data.

![image](https://github.com/user-attachments/assets/481c1a5f-ddbb-40f9-b519-ea3e6d00b46b)

Here is a screenshoot of my data preparation. To begin, I imported the 12 csv files (1 for each month) into 12 data frames. Then I merged the 12 data frames into 1 for the whole year. After I removed the individual 12 month data frames to clear up space in the environment (RAM management). 

## Process
The third phase is data processing, which involves identifying and eliminating inaccuracies, errors, and inconsistencies in the data to ensure it does not impact the resolution of our business problem.

### Data Cleaning
[R Source Code]()

![image](https://github.com/user-attachments/assets/250cf593-96e0-41aa-8a55-7c4366a5f81c)

![image](https://github.com/user-attachments/assets/ac4dc59c-17f9-4091-9136-bbd8f7d30183)


During this phase,
1. All the rows having missing values are deleted.
2. Removed duplicate rows 
3. Created 3 more columns for my analysis, ride_length for duration of the trip, day_of_week and month are added.  
4. Trips with duration less than a minute and longer than a day are excluded.
5. Total 1,476,477 rows are removed in this step.


Before cleaning 5 719 877 rows | After cleaning 4 243 400 rows


## Analyze and Share
The fourth phase is data analysis, which involves deriving insights from the cleaned data to address our business problem. This phase was conducted using R for data manipulation and Tableau for visualization.

[R Source Code]()  
Data Visualization: [Tableau](https://public.tableau.com/views/CyclisticProject_17230548837230/Dashboard2?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)  
The data is stored appropriately and is now prepared for analysis. I queried multiple relevant tables for the analysis and visualized them in Tableau.  
The analysis question is: How do annual members and casual riders use Cyclistic bikes differently?  

First of all, member and casual riders are compared by the type of bikes they are using.  

![image](https://github.com/user-attachments/assets/d8b048fb-30df-49bb-bc90-5b96c0a162fb)

  
The members make 64.5% of the total while remaining 35.5% constitutes casual riders. Each bike type chart shows percentage from the total. Most used bike is classic bike followed by the electric bike. Docked bikes are used the least by only casual riders. 
  
Next the number of trips distributed by the months, days of the week and hours of the day are examined.  
  
![image](https://github.com/user-attachments/assets/b19e84b2-60dc-43f8-b1c4-c378d2fa6509)
  
__Months:__ Regarding monthly trips, both casual riders and members show similar patterns, with higher trip volumes in the spring and summer and fewer trips during the winter. The difference between casual riders and members narrows most noticeably in July during the summer.   
__Days of Week:__ When comparing the days of the week, casual riders tend to take more trips on weekends, whereas members show a decline in trips over the weekend compared to the other days.  
__Hours of the Day:__ Members exhibit two peaks in their number of trips throughout the day: one in the early morning between 6 am and 8 am, and another in the evening from 4 pm to 8 pm. In contrast, the number of trips for casual riders steadily increases throughout the day until evening, after which it declines.  
  
Based on these observations, it seems that members primarily use bikes for commuting to and from work on weekdays, whereas casual riders use bikes more throughout the day, particularly on weekends, for leisure activities. Both groups show the highest activity during the summer and spring seasons.  
  
Ride duration of the trips are compared to find the differences in the behavior of casual and member riders.  
  
![image](https://github.com/user-attachments/assets/4f900bdf-9527-41d8-9131-41e85165b974)  
  
Casual riders generally have longer rides compared to members. Unlike members, whose average ride length remains steady throughout the year, week, and day, casual riders' ride durations fluctuate. They tend to ride farther during the spring and summer, on weekends, and between 10 am and 2 pm, though their rides are shorter between 5 am and 8 am.
  
These observations suggest that while casual riders cycle less often than members, they tend to take longer rides—about twice as long. Their extended rides on weekends, during daytime hours outside of typical commuting times, and in the warmer months, indicate they may be riding more for leisure than for commuting.    
    
  
Summary:
  
|Casual|Member|
|------|------|
|Tend to use bikes throughout the day, especially on weekends during summer and spring for recreational purposes.|Prefer biking on weekdays during commuting hours (8 am and 5 pm) in summer and spring.|
|Take longer rides, approximately twice as long, but ride less frequently.|Ride more frequently but for shorter durations, roughly half the length of casual riders' trips.|
|Tend to take longer trips and ride more often on weekends, particularly in the late morning to early afternoon.|Prefer shorter, more frequent rides during weekday commuting hours, typically in the early morning and late afternoon.|  
  
## Act
Based on the observed differences between casual and member riders, targeted marketing strategies can be developed to encourage casual riders to become members.  
Recommendations:  
1. Seasonal Marketing Campaigns: Launch marketing campaigns in spring and summer at popular tourist and recreational locations frequented by casual riders.
2. Tailored Membership Options: Consider offering seasonal or weekend-only memberships, aligning with the times when casual riders are most active (weekends and during spring and summer).
3. Incentives for Longer Rides: Since casual riders generally use their bikes for longer periods, providing discounts or incentives for extended ride durations could attract casual riders and encourage members to increase their ride times.

