# Consumer Complaints - Sentiment Analysis 

## Introduction
This project employs sentiment analysis on consumer complaints to extract insights into different companies and their products. Throughout this analysis, I've focused on three key areas, addressing the following questions:
1. Range of Sentiments for Student Loan
2. Aggregate Sentiment Score of Top 10 Companies with Highest Positive and Negative Scores
3. Negative Words Used by Consumers for Chase Credit Card

## Directory 
The columns that were used are: 
- Product
- Company
- Consumer Complaint Narrative

## Data Cleaning 

### Student Loans Complaints Sentiment 
<p> Student loan complaint sentiment analysis reveals the prevailing emotions expressed by consumers. This analysis was done using the NRC sentiment analysis. Data was cleaned using filters and a pivot table to filter out inconsistencies. The table shows the range of emotions 
 of consumers who had to deal with student loan setbacks.</p>
<img src="Images/Student Loan Complaints Sentiments.png" height = 250*1.5, width = 400*1.5>

### Companies with Highest Sentiment Score
<p> This analysis provides an overview of the sentiment scores associated with various companies, highlighting those with the highest positive sentiment scores. This analysis identifies companies that receive predominantly positive feedback or sentiments across different reviews. 
The data for this analysis was prepared by making a pivot table and inner joining the "afinn" sentiments and aggregating them per company. </p>
<img src="Images/Positive Sentiment Score.png" height = 250*1.5, width = 400*1.5>

### Companies with the Lowest Sentiment Score
<p> This sentiment analysis provides insights into companies with the lowest sentiment scores, indicating areas where customer satisfaction may be lacking or where negative perceptions are prevalent. The analysis was done by aggregating the negative sentiment
score through the afinn sentiments. Data was tidied using a pivot table for inner join and then filtering for the top 10 companies for the lowest scores</p>
<img src="Images/Negative Sentiment Score.png" height = 250*1.5, width = 400*1.5>

### Negative words used for Chase Credit card
<p> This analysis identifies negative sentiments associated with Chase credit cards. It analyzes customer reviews or descriptions and counts occurrences of negative words using the "Bing" sentiment, offering insights into areas of problem. Data was tidied using filters and a pivot table to prepare for
 analysis. </p>
<img src="Images/Word Cloud.png" height = 250*1.5, width = 400*1.5>

