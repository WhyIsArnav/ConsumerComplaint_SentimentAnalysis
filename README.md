# Consumer Complaints - Sentiment Analysis 

## Introduction
This project employs sentiment analysis on consumer complaints to extract insights into different companies and their products. Throughout this analysis, I've focused on three key areas, addressing the following questions:
1. Range of Sentiments for Student Loan
2. Aggregate Sentiment Score of Top 10 Companies with Highest Positive and Negative Scores
3. Negative Words Used by Consumers for Chase Credit Card

<div align = "center">
<img src ="Images/Intro Picture.png" width = "450")>
</div>

## Directory 📖
The columns that were used are: 
- Product
- Company
- Consumer Complaint Narrative

## Data Cleaning 🧹
1. Filter
   - Filtering database for null values in the Consumer Complaint Narrative column
   ```
   df <- complaints %>%
   filter(Consumer.complaint.narrative !="")
   ```
   - Filter database according to companies and products
   ```
   chase <- df %>% #filter Chase
   filter(Company == "JPMorgan Chase & Co.")
   
   std_loan <- df %>% #Filter student loans only 
   filter(Product == "Student loan")
   ```
2. Pivot Tables
   - Use the Pivot table to tidy data and get it ready for analysis
   ```
   std_loan_pivot <- std_loan %>% #tidy data
   group_by(Consumer.complaint.narrative) %>%
   summarize()

   tidy_std_loan <- std_loan_pivot %>% #tidy data ready for analysis 
   ungroup() %>%
   unnest_tokens(word, Consumer.complaint.narrative)
   ```
   ```
   chase_cc_pivot <- chase_cc %>% #tidying data 
   group_by(Consumer.complaint.narrative) %>%
   summarize()

   tidy_chase_cc <- chase_cc_pivot %>% #tidy data for analysis 
   ungroup() %>%
   unnest_tokens(word, Consumer.complaint.narrative)
   ```

## Data analysis 

### Range of Sentiments for Student Loan 
<p> Student loan sentiment analysis reveals the prevailing emotions expressed by consumers. This analysis was done using the NRC sentiment analysis. Data was cleaned using filters and a pivot table to filter out inconsistencies. The table shows the range of emotions 
 of consumers who had to deal with student loan setbacks.</p>
<img src="Images/Student Loan Complaints Sentiments.png" height = 250*1.5, width = 400*1.5>

### Aggregate Sentiment Score of Top 10 Companies with Highest Positive Score
<p> This analysis provides an overview of the sentiment scores associated with various companies, highlighting those with the highest positive scores. This analysis identifies companies that receive predominantly positive feedback or sentiments across different reviews. 
The data for this analysis was prepared by making a pivot table and inner joining the "afinn" sentiments and aggregating them per company. </p>
<img src="Images/Positive Sentiment Score.png" height = 250*1.5, width = 400*1.5>

### Aggregate Sentiment Score of Top 10 Companies with Highest Negative Score
<p> This sentiment analysis provides insights into companies with the highest negative sentiment scores, indicating areas where customer satisfaction may be lacking or where negative perceptions are prevalent. The analysis was done by aggregating the negative sentiment
score through the "afinn" sentiments. Data was tidied using a pivot table for inner join and then filtering for the top 10 companies for the highest negative scores</p>
<img src="Images/Negative Sentiment Score.png" height = 250*1.5, width = 400*1.5>

### Negative Words Used by Consumers for Chase Credit Card
<p> This analysis identifies the top 100 negative words associated with Chase credit cards. It analyzes customer reviews or descriptions and counts occurrences of negative words using the "Bing" sentiment, offering insights into areas of problem. Data was tidied using filters and a pivot table to prepare for
 analysis. </p>
<img src="Images/Word Cloud.png" height = 250*1.5, width = 400*1.5>

## Conclusion 
In conclusion, I found that negative emotion was most prevalent in student loan complaints, while consumers feeling surprised was the least. This could indicate there is a general feeling that dealing with student loans can be tedious work. 

Companies like Equifax, Bank of America, Wells Fargo, and Chase had the highest aggregate negative score. It is also true that these companies had the highest number of complaints too. Companies like Freedom Morgage and Great Lakes had the best aggregate sentiment scores. 

Lastly, we see that words such as "dispute", "debt", "fraud", "denial", "issue", "complaint", "error", and "problem" are most used when consumers complain about Chase Credit Card 



