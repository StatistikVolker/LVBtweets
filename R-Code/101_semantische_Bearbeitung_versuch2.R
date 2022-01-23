# 101_semantische_Bearbeitung_versuch2
#--------------------------------------------------------------------------------------------------------

# Versuch 2:
# Skript zerlegt die neusten twets Semantisch zur einfacheren händischen Nachbearbetu8ng in EXCEL.


# Vorabdefinitionen -------------------------------------------------------

# Datum der zubearbeitenden LVB tweets Datei
#datum <- "2021-11-01"
datum <- "2022-01-23"
# 



# Pakete und Datei der tweets laden ------------------------------------------------------------
library(tidyverse) # Datenmanipulationspaket
library(stringr) # Paket zur einfachen Behandlung von Strings in R
library(xlsx) # zum Absopeichern als EXCEL zur händischen Nacharbeitung
load(paste0("Rohtweets/",datum,"_LVBtweets.Rdata"))



lvb3 <- lvb  %>%
  arrange(created_at) %>%
  mutate(TEXT = toupper(text)) %>% # tweets werden in GROSSBUCHSTABEN umgewandelt, zu einfacheren samtischen Analyse
  mutate(TRAM = as.numeric(if_else(str_detect(TEXT, 'TRAM'),1,0)),
         BUS = as.numeric(if_else(str_detect(TEXT, 'BUS'),1,0)),
         rowid = row_number()) %>%
  select(rowid,status_id,datetime = created_at,
         tweet = TEXT,source,
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
         numbers = str_trim(numbers,"left")) %>%
  # Kategorisierung der Störungen
  mutate(numbers2 = str_split(numbers,";", simplify = TRUE)[,1],
         UPDATE = as.numeric(if_else(str_detect(tweet, 'UPDATE'),1,0)),
         PLANTWEET = as.numeric(if_else(str_detect(tweet, 'PLANMÄßIG|BEENDET'),1,0)),
         ANSWERTWEET = as.numeric(str_detect(numbers2, "@")),
         UNREGELMAESSIGKEITEN = as.numeric(if_else(str_detect(tweet, 'FAHRPLANUNREGELMÄßIGKEITEN'),1,0))
         ) %>%
  select(-tweet2) #%>%
  #filter(UPDATE == 0 & PLANTWEET == 0 & ANSWERTWEET == 0) %>%
  #filter(numbers2 == "")

# abspeichern als Rdata - um weitere semantische einzubauen
save(lvb3,file = paste0("tweets_bearbeitet/",datum,"_LVBtweets_V002.Rdata"))

xlsx::write.xlsx2(lvb3, paste0("tweets_bearbeitet/",datum,"_LVBtweetsv002.xlsx"), sheetName = "tweets",
                  col.names = TRUE, row.names = TRUE, append = FALSE)



# Checks

table(lvb3$numbers2,lvb3$UNREGELMAESSIGKEITEN)

lvb3$numbers2[lvb3$source== "HAFAS Information Manager"]
lvb3$tweet[str_detect(lvb3$numbers2, ":")]

#numbers = str_split(lvb3$numbers,";", simplify = TRUE)[,1]
