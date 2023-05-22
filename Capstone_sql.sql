create schema capstone;  #created a schema
use capstone;            #used the schema
select * from bankdata;

-- 1. Write an SQL query to identify the age group which is taking more loan and then calculate the sum of all of the balances of it?

select sum(balance) , count(loan) , age_cat from 
bankdata
where loan = "yes"
group by age_cat
order by count(loan) desc;
-- first i selected data where loan has taken then grouped the data by age categories
-- used sum to add the balance of each group and count to count the number of loans taken in each age group


-- 2. Write an SQL query to calculate for each record if a loan has been taken less than 100,
-- then  calculate the fine of 15% of the current balance and create a temp table
-- and then add the amount for each month from that temp table?

create temporary table temp
select (balance*0.15) as Fine_amount , month from bankdata
where loan = "yes" and duration<100;
-- used where clause to get the data whoc as taken loan lessthan 100
-- calculated their fine amount and created a temp table

select sum(fine_amount) as total_fine , month from temp
group by month;
-- from thet temp table , used group by function to group them as month and added the fine amount of each month using sum

-- 3.Write an SQL query to calculate each age group along with each department's highest balance record? 

select  max(balance), age_cat ,job from bankdata
group by job, age_cat
order by max(balance) desc;  
-- grouped it by job then age group
-- used max to find the maximum balance of each job and age group


-- 4. Write an SQL query to find the secondary highest education, where duration is more than 150.
-- The query should contain only married people, and then calculate the interest amount? (Formula interest => balance*15%). 

select education,(sum(balance)*0.15) as interest  from bankdata
where education = "secondary" and marital = "married" and duration > 150;
-- used where cluase to select secondary edu, married people and duration 150+
-- summed the balance of secondary edu and multiplied it by 0.15 to get the interest amount

-- 5. Write an SQL query to find which profession has taken more loan along with age?


select count(loan) as number_of_loan , age_cat, job from bankdata
where loan = "yes"
group by job , age_cat
order by number_of_loan desc
limit 1;
-- first i used where to select only those who has taken loan then  i grouped data by job and age_cat
-- used count of loan to get the no. of loan taken by each job and age cat and used order by and limit to get the highest 


-- 6.Write an SQL query to calculate each month's total balance and then calculate in which month the highest amount of transaction was performed?

select sum(balance) as Total_balance , month from bankdata
group by month
order by Total_balance desc
limit 1;

-- first i  grouped data by month
-- used sum to calculate total balance of each month then used order by and limit to get the highest 
