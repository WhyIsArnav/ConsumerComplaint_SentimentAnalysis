library(tidytext)
library(dplyr)
library(stringr)
library(tidyr)
library(ggplot2)
library(wordcloud)

setwd('~/Documents/DATA332/Projects/Consumer Complaints')
#unzip("archive.zip", exdir = "Consumer Complaints")
complaints <- read.csv('Consumer_Complaints.csv')

get_sentiments('afinn')
get_sentiments('bing')
get_sentiments('nrc')

df <- complaints %>%
  filter(Consumer.complaint.narrative !="")

highest_complaints <- df %>% 
  group_by(Company) %>% 
  summarise(count=n()) %>%
  arrange(desc(count)) %>% 
  top_n(10) %>%
  inner_join(df, by = "Company")

top10 <- highest_complaints %>%
  group_by(Company, Consumer.complaint.narrative) %>% 
  summarize()

tidy_top10 <- top10 %>%
  ungroup() %>%
  unnest_tokens(word, Consumer.complaint.narrative)

nrc_anger_counts <- tidy_top10 %>%
  inner_join(get_sentiments("nrc") %>% filter(sentiment == "anger")) %>%
  count(word, sort = TRUE) %>%
  top_n(10)

# Create ggplot
ggplot(nrc_anger_counts, aes(word, n)) +
  geom_col(fill = "blue") +
  labs(x = "Word", y = "Count", title = "Count of Words with NRC Sentiment: Anger") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


top10_complaint_sentiment <- tidy_top10 %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment) %>%
  pivot_wider(names_from = sentiment, values_from = n, values_fill = 0) %>% 
  mutate(sentiment = positive - negative)

ggplot(top10_complaint_sentiment, aes(word, sentiment, fill = word)) +
  geom_col(show.legend = FALSE) +
  labs(x = "Word", y = "Sentiment Score", title = "Sentiment Analysis of Top 10 Complaint Words") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 

ggplot(top10_complaint_sentiment, aes(word, sentiment, fill = word())) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~word, ncol = 2, scales = "free_x")

#top10 <- df %>% 
  #filter(Company == "Equifax", "Experian", "ransUnion Intermediate Holdings, Inc.",
         #"Bank of America", "Wells Fargo & Company", "Citibank", "JPMorgan Chase & Co.", 
         #"Capital One", "Ocwen", "Synchrony Financial")

chase <- highest_complaints %>% 
  filter(Company == "JPMorgan Chase & Co.")

chase_pivot <- chase %>%
  group_by(Company, Consumer.complaint.narrative) %>% 
  summarize()

chase_tidy <- chase_pivot %>%
  ungroup() %>%
  unnest_tokens(word, Consumer.complaint.narrative)



################################################################################
sentiments <- df %>%
  unnest_tokens(word, Consumer.complaint.narrative) %>%
  inner_join(get_sentiments("afinn")) %>%
  group_by(Company) %>%
  summarise(sentiment_score = sum(value))

sentiments_top <- sentiments %>%
  arrange(desc(sentiment_score)) %>%
  head(10)

ggplot(sentiments_top, aes(x = reorder(Company, sentiment_score), y = sentiment_score)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  coord_flip() +
  labs(title = "Sentiment Analysis of Top 10 Companies",
       x = "Company",
       y = "Sentiment Score") +
  theme_minimal()

sentiments_bottom <- sentiments %>%
  arrange(desc(sentiment_score)) %>%
  tail(10)

ggplot(sentiments_bottom, aes(x = reorder(Company, sentiment_score), y = sentiment_score)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  coord_flip() +
  labs(title = "Sentiment Analysis of Top 10 Companies",
       x = "Company",
       y = "Sentiment Score") +
  theme_minimal()

################################################################################
text_data <- df$Consumer.complaint.narrative
word_freq <- table(unlist(strsplit(tolower(text_data), "\\s+")))
wordcloud(words = names(word_freq), freq = word_freq, min.freq = 5, random.order = FALSE,
          colors = brewer.pal(8, "Dark2"), scale=c(3,0.5))


tidy_books %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 100))


















  
  

  







