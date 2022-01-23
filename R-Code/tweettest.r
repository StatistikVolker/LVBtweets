# read_tweets.r


# load packages -----------------------------------------------------------

library(rtweet)
library(tidyverse)
library(stringr)



# Setup API to twitter ----------------------------------------------------

# whatever name you assigned to your created app
appname <- "autotram"

## api key (example below is not a real key)
key <- "5ZwwHySjtcpYza41ZBhsmSZq4"

## api secret (example below is not a real key)
secret <- "cRq0JljG9i62O3IFcopE9NOWrgbbg2Ra2hs2DKwT8ZHnZUhv89"

access_token <- "1211733566406582272-Z6RfVgAJWS6NGM9jqFGmNoknfW05zs"

access_secret <- "skabqWpQkM8u4AftE5iqDAyywA46XRX9hQjef0WAEyONE"

# create token named "twitter_token"
twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret,
  access_token = access_token,
  access_secret = access_secret)



# LVB direkt Meldungen ----------------------------------------------------

lvb <- get_timeline("LVB_direkt", n = 30000)

#xlsx::write.xlsx2(lvb, "C:/Arbeitsordner privat/Rad/LVB Tweets/LVB.xlsx", sheetName = "tweets",
#            col.names = TRUE, row.names = TRUE, append = FALSE)

names(lvb)

lvb2 <- lvb %>%
  select(status_id,datetime = created_at,text,source,
         letters = display_text_width,
         likes = favorite_count,
         retweets = retweet_count,
         URL = urls_t.co) %>%
  mutate(TRAM = as.numeric(if_else(str_detect(text, 'TRAM|Tram'),1,0)),
         BUS = as.numeric(if_else(str_detect(text, 'BUS|Bus'),1,0)),
         TRAM01 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 1|Tram 1|, 1|und 1'),1,0)),
         TRAM02 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 2|Tram 2|, 2|und 2'),1,0)),
         TRAM03 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 3|Tram 3|, 3|und 3'),1,0)),
         TRAM04 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 4|Tram 4|, 4|und 4'),1,0)),
         TRAM07 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 7|Tram 7|, 7|und 7'),1,0)),
         TRAM08 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 8|Tram 8|, 8|und 8'),1,0)),
         TRAM09 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 9|Tram 9|, 9|und 9'),1,0)),
         TRAM10 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 10|Tram 10|, 10|und 10'),1,0)),
         TRAM11 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 11|Tram 11|, 11|und 11'),1,0)),
         TRAM12 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 12|Tram 12|, 12|und 12'),1,0)),
         TRAM14 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 14|Tram 14|, 14|und 14'),1,0)),
         TRAM15 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 15|Tram 15|, 15|und 15'),1,0)),
         TRAM16 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 16|Tram 16|, 16|und 16'),1,0)),
         TRAM31 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 31|Tram 31|, 31|und 31'),1,0)),
         TRAM32 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 32|Tram 32|, 32|und 32'),1,0)),
         TRAM33 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 33|Tram 33|, 33|und 33'),1,0)),
         TRAM34 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 34|Tram 34|, 34|und 34'),1,0)),
         TRAM35 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 35|Tram 35|, 35|und 35'),1,0)),
         TRAM36 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 36|Tram 36|, 36|und 36'),1,0)),
         TRAM37 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 37|Tram 37|, 37|und 37'),1,0)),
         TRAM38 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 38|Tram 38|, 38|und 38'),1,0)),
         TRAM39 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 39|Tram 39|, 39|und 39'),1,0)),
         TRAM51 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 51|Tram 51|, 51|und 51'),1,0)),
         TRAM52 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 52|Tram 52|, 52|und 52'),1,0)),
         TRAM53 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 53|Tram 53|, 53|und 53'),1,0)),
         TRAM54 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 54|Tram 54|, 54|und 54'),1,0)),
         TRAM55 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 55|Tram 55|, 55|und 55'),1,0)),
         BUS60 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 60|Bus 60|, 60|und 60'),1,0)),
         BUS61 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 61|Bus 61|, 61|und 61'),1,0)),
         BUS62 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 62|Bus 62|, 62|und 62'),1,0)),
         BUS63 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 63|Bus 63|, 63|und 63'),1,0)),
         BUS64 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 64|Bus 64|, 64|und 64'),1,0)),
         BUS65 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 65|Bus 65|, 65|und 65'),1,0)),
         BUS66 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 66|Bus 66|, 66|und 66'),1,0)),
         BUS67 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 67|Bus 67|, 67|und 67'),1,0)),
         BUS68 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 68|Bus 68|, 68|und 68'),1,0)),
         BUS69 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 69|Bus 69|, 69|und 69'),1,0)),
         BUS70 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 70|Bus 70|, 70|und 70'),1,0)),
         BUS71 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 71|Bus 71|, 71|und 71'),1,0)),
         BUS72 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 72|Bus 72|, 72|und 72'),1,0)),
         BUS73 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 73|Bus 73|, 73|und 73'),1,0)),
         BUS74 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 74|Bus 74|, 74|und 74'),1,0)),
         BUS75 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 75|Bus 75|, 75|und 75'),1,0)),
         BUS76 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 76|Bus 76|, 76|und 76'),1,0)),
         BUS77 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 77|Bus 77|, 77|und 77'),1,0)),
         BUS78 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 78|Bus 78|, 78|und 78'),1,0)),
         BUS79 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 79|Bus 79|, 79|und 79'),1,0)),
         BUS80 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 80|Bus 80|, 80|und 80'),1,0)),
         BUS81 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 81|Bus 81|, 81|und 81'),1,0)),
         BUS82 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 82|Bus 82|, 82|und 82'),1,0)),
         BUS83 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 83|Bus 83|, 83|und 83'),1,0)),
         BUS84 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 84|Bus 84|, 84|und 84'),1,0)),
         BUS85 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 85|Bus 85|, 85|und 85'),1,0)),
         BUS86 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 86|Bus 86|, 86|und 86'),1,0)),
         BUS87 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 87|Bus 87|, 87|und 87'),1,0)),
         BUS88 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 88|Bus 88|, 88|und 88'),1,0)),
         BUS89 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 89|Bus 89|, 89|und 89'),1,0)),
         BUS90 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 90|Bus 90|, 90|und 90'),1,0)),
         BUS91 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 91|Bus 91|, 91|und 91'),1,0)),
         BUS92 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 92|Bus 92|, 92|und 92'),1,0)),
         BUS93 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 93|Bus 93|, 93|und 93'),1,0)),
         BUS94 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 94|Bus 94|, 94|und 94'),1,0)),
         BUS95 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 95|Bus 95|, 95|und 95'),1,0))
         ) #%>%
#  mutate(SEV =)

#%>% filter(LINIE02 == 1)
         
xlsx::write.xlsx2(lvb2, "C:/Arbeitsordner privat/Rad/LVB Tweets/LVB2.xlsx", sheetName = "tweets",
                  col.names = TRUE, row.names = TRUE, append = FALSE)

  
class(lvb2$datetime)#,lvb2$source)
table(lvb2$source)
table(lvb2$TRAM,lvb2$LINIE02)

  
lvb3 <- lvb2 %>% filter(source == "HAFAS Information Manager") %>%
  filter(BUS == 1 & TRAM == 1)
  
  
rt <- search_tweets(
  "#irgendwasstoert", n = 180, include_rts = FALSE
)

AccessToken


# Versuch 2:
#--------------------------------------------------------------------------------------------------------

lvb2 <- lvb  %>%
  arrange(created_at) %>%
  mutate(TRAM = as.numeric(if_else(str_detect(text, 'TRAM|Tram'),1,0)),
         BUS = as.numeric(if_else(str_detect(text, 'BUS|Bus'),1,0)),
         rowid = row_number()) %>%
  select(rowid,status_id,datetime = created_at,
         tweet = text,source,
         letters = display_text_width,
         likes = favorite_count,
         retweets = retweet_count,
         URL = urls_t.co,
         TRAM,BUS) %>%
  mutate(tweet2 = str_replace_all(tweet,"https://t.co/OvCfg0q5lG", ""),
         numbers = str_replace_all(tweet2,"[:letter:]", ""),
         numbers = str_replace_all(numbers,"[\\.]", ""),
         numbers = str_replace_all(numbers,"[\\(\\)]", ""),
         numbers = str_replace_all(numbers,"   ", ";"),
         numbers = str_trim(numbers,"left"))


lvb3 <- lvb2 %>% 
  mutate(numbers2 = str_split(lvb2$numbers,";", simplify = TRUE)[,1],
         UPDATE = as.numeric(if_else(str_detect(tweet, 'UPDATE|Update|update'),1,0)),
         PLANTWEET = as.numeric(if_else(str_detect(tweet, 'planmäßig|beendet'),1,0)),
         ANSWERTWEET = as.numeric(str_detect(numbers2, "@")),
         UNREGELMAESSIGKEITEN = as.numeric(if_else(str_detect(tweet, 'Fahrplanunregelmäßigkeiten'),1,0)),
         ) %>%
  select(-tweet2) %>%
  filter(UPDATE == 0 & PLANTWEET == 0 & ANSWERTWEET == 0) %>%
  filter(numbers2 == "")


table(lvb3$numbers2,lvb3$UNREGELMAESSIGKEITEN)



lvb2$numbers2[lvb2$source== "HAFAS Information Manager"]
lvb2$tweet[str_detect(lvb2$numbers2, ":")]

numbers = str_split(lvb2$numbers,";", simplify = TRUE)[,1]
lvb2$URL[1]
