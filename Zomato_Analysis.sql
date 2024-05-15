Create database zomato;
use zomato;

# Upload the Zomato_Analysis dataset
desc zomato_analysis;
select * from zomato_analysis;

# displaying unique restaurantnames - CASE1
select distinct count(restaurantname) as Unique_restaurants from zomato_analysis; 

# Info about restaurant established date using date functions - CASE2
select restaurantid, restaurantname, 
date_format(datekey_opening, "%d-%m-%Y") as Established_Date 
from zomato_analysis
order by established_date;

# displaying unique cities - CASE3
select distinct count(city) as Unique_city from zomato_analysis;

# to show unique restaraunts with average rating - CASE4
select distinct restaurantname, avg(rating) as Average_rating 
from zomato_analysis 
group by restaurantname 
order by restaurantname;

# displaying no.of restaurants in each country - CASE5
select distinct country, count(restaurantname) as restaurant_count
from zomato_analysis
group by country
order by country;

# checking out the online delivery status - CASE6
select distinct(restaurantname), 
case
when has_online_delivery = "yes" then "availiable"
else "unavailiable"
end as online_delivery
from zomato_analysis;

# displaying table booking status - CASE7
select distinct(restaurantname),
case
when has_table_booking = "yes" then "acceptable"
else "not_acceptable"
end as Table_booking
from zomato_analysis;

# Average votes distribution across countries - CASE8
select distinct country, 
round(avg(votes), 2) as Average_vote_distribution
from zomato_analysis
group by country
order by country;

# Rating satisfaction - CASE9
select restaurantname,
case
when rating >= 4.5 && rating < 5.0 then "Excellent"
when rating >= 3.5 && rating < 4.5 then "Good"
when rating >= 2.5 && rating < 3.5 then "Average"
when rating >= 1.5 && rating < 2.5 then "Below_Average"
when rating < 1.5 then "Bad"
else "Nill" 
end as Satisfaction_Rating
from zomato_analysis;

# displaying average spending cost of 2 persons per order in cities - CASE10
select city,
round(avg(average_cost_for_two), 2) as Avg_spending_cost
from zomato_analysis
group by city
order by city;

# Satisfaction rating using conditions - CASE11
select restaurantname, city, 
case
when rating >= 4.5 && rating < 5.0 then "Excellent"
when rating >= 3.5 && rating < 4.5 then "Good"
when rating >= 2.5 && rating < 3.5 then "Average"
when rating >= 1.5 && rating < 2.5 then "Below_Average"
when rating < 1.5 then "Bad"
else "Nill" 
end as Satisfaction_Rating
from zomato_analysis
where country = "UAE"
order by city;

# Displaying year of establishment for restaurant using extract function - CASE12
select restaurantid, restaurantname, 
extract(year from datekey_opening) as Established_Year
from zomato_analysis;

# Info on age of the restaurant with respect to current date - CASE13
select restaurantid, restaurantname,
floor(datediff(current_date , datekey_opening)/365) as Age_of_Establishment
from zomato_analysis
limit 10;

