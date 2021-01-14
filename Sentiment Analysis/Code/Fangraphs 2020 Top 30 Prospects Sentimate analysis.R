
library(dplyr)


## Rbind Scrape 
MLB_top_30_by_team<- rbind(ARI,ATL,BAL,BOS,CHW,CIN,CLE,COL,DET,HOU,KC,LAA,MIA,MIL,MIN,NYM,NYY,PHI,PIT,SDP,SEA,SFG,STL,TB,TEX,TOR,WAS,CHC,OAK,LAD)


## Turn Role into numeric grades
MLB_top_30_by_team<-MLB_top_30_by_team %>% mutate(Future_Role= case_when(FV=="80"~ 8, FV=="70"~ 7,FV=="65" ~ 6.5 , FV=="60" ~ 6,  FV=="55" ~ 5.5, FV=="50" ~ 5, FV=="45+" ~ 4.5, FV=="45" ~ 4.5, FV=="40+" ~ 4, FV=="40" ~ 4, FV=="35+" ~ 3.5))

TOP_Prospcets<- select(MLB_top_30_by_team,c(1:6,9,8))

install.packages('sentimentr')
library(sentimentr)

TOP_Prospcets$Report<- as.character(TOP_Prospcets$Report)

TOP_Prospcets<- TOP_Prospcets %>% mutate(obs = 1:nrow(TOP_Prospcets))

## sentiment_by 
sentiment_scores_paragraph<-sentiment_by(TOP_Prospcets$Report)

# Join 
TOP_Prospcets_sentiment_by<- TOP_Prospcets %>% inner_join(sentiment_scores_paragraph,by= c("obs"="element_id"))

## see if sentimate analysis has any correlation to Future Role 
ggplot( TOP_Prospcets_sentiment_by, aes(x=Future_Role,y=ave_sentiment)) + geom_point()

## No real relationship between Future Role and sentiment score. 


