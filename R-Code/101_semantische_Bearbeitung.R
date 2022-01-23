# 101_semantische_Bearbeitung

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



# Identifikation der betroffenen Linien -----------------------------------

lvb2 <- lvb %>%
  # nur informative Spalten
  select(status_id,datetime = created_at,text,source,
         letters = display_text_width,
         likes = favorite_count,
         retweets = retweet_count,
         URL = urls_t.co) %>%
  mutate(TEXT = toupper(text)) %>% # tweets werden in GROSSBUCHSTABEN umgewandelt, zu einfacheren samtischen Analyse
  # Indexveariablen für betroffene Linien
  mutate(TRAM = as.numeric(if_else(str_detect(text, 'TRAM'),1,0)),
         BUS = as.numeric(if_else(str_detect(text, 'BUS'),1,0)),
         TRAM01 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 1|, 1|UND 1'),1,0)), # ACHTUNG klassifiziert Linie 10 und 11 falsch als Linie 1
         TRAM02 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 2|, 2|UND 2'),1,0)),
         TRAM03 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 3|, 3|UND 3'),1,0)), # ACHTUNG klassifiziert Baustellenlinien (30-39) falsch als Linie 3
         TRAM04 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 4|, 4|UND 4'),1,0)),
         TRAM07 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 7|, 7|UND 7'),1,0)),
         TRAM08 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 8|, 8|UND 8'),1,0)),
         TRAM09 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 9|, 9|UND 9'),1,0)),
         TRAM10 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 10|, 10|UND 10'),1,0)),
         TRAM11 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 11|, 11|UND 11'),1,0)),
         TRAM12 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 12|, 12|UND 12'),1,0)),
         TRAM14 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 14|, 14|UND 14'),1,0)),
         TRAM15 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 15|, 15|UND 15'),1,0)),
         TRAM16 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 16|, 16|UND 16'),1,0)),
         TRAM31 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 31|, 31|UND 31'),1,0)),
         TRAM32 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 32|, 32|UND 32'),1,0)),
         TRAM33 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 33|, 33|UND 33'),1,0)),
         TRAM34 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 34|, 34|UND 34'),1,0)),
         TRAM35 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 35|, 35|UND 35'),1,0)),
         TRAM36 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 36|, 36|UND 36'),1,0)),
         TRAM37 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 37|, 37|UND 37'),1,0)),
         TRAM38 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 38|, 38|UND 38'),1,0)),
         TRAM39 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 39|, 39|UND 39'),1,0)),
         TRAM51 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 51|, 51|UND 51'),1,0)),
         TRAM52 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 52|, 52|UND 52'),1,0)),
         TRAM53 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 53|, 53|UND 53'),1,0)),
         TRAM54 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 54|, 54|UND 54'),1,0)),
         TRAM55 = as.numeric(if_else(TRAM == 1 & str_detect(text, 'TRAM 55|, 55|UND 55'),1,0)),
         BUS60 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 60|, 60|UND 60'),1,0)),
         BUS61 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 61|, 61|UND 61'),1,0)),
         BUS62 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 62|, 62|UND 62'),1,0)),
         BUS63 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 63|, 63|UND 63'),1,0)),
         BUS64 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 64|, 64|UND 64'),1,0)),
         BUS65 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 65|, 65|UND 65'),1,0)),
         BUS66 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 66|, 66|UND 66'),1,0)),
         BUS67 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 67|, 67|UND 67'),1,0)),
         BUS68 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 68|, 68|UND 68'),1,0)),
         BUS69 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 69|, 69|UND 69'),1,0)),
         BUS70 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 70|, 70|UND 70'),1,0)),
         BUS71 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 71|, 71|UND 71'),1,0)),
         BUS72 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 72|, 72|UND 72'),1,0)),
         BUS73 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 73|, 73|UND 73'),1,0)),
         BUS74 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 74|, 74|UND 74'),1,0)),
         BUS75 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 75|, 75|UND 75'),1,0)),
         BUS76 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 76|, 76|UND 76'),1,0)),
         BUS77 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 77|, 77|UND 77'),1,0)),
         BUS78 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 78|, 78|UND 78'),1,0)),
         BUS79 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 79|, 79|UND 79'),1,0)),
         BUS80 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 80|, 80|UND 80'),1,0)),
         BUS81 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 81|, 81|UND 81'),1,0)),
         BUS82 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 82|, 82|UND 82'),1,0)),
         BUS83 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 83|, 83|UND 83'),1,0)),
         BUS84 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 84|, 84|UND 84'),1,0)),
         BUS85 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 85|, 85|UND 85'),1,0)),
         BUS86 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 86|, 86|UND 86'),1,0)),
         BUS87 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 87|, 87|UND 87'),1,0)),
         BUS88 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 88|, 88|UND 88'),1,0)),
         BUS89 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 89|, 89|UND 89'),1,0)),
         BUS90 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 90|, 90|UND 90'),1,0)),
         BUS91 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 91|, 91|UND 91'),1,0)),
         BUS92 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 92|, 92|UND 92'),1,0)),
         BUS93 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 93|, 93|UND 93'),1,0)),
         BUS94 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 94|, 94|UND 94'),1,0)),
         BUS95 = as.numeric(if_else(BUS == 1 & str_detect(text, 'BUS 95|, 95|UND 95'),1,0))
  ) #%>% #  mutate(SEV =)

# abspeichern als Rdata - um weitere semantische einzubauen
save(lvb2,file = paste0("tweets_bearbeitet/",datum,"_LVBtweets.Rdata"))

xlsx::write.xlsx2(lvb2, paste0("tweets_bearbeitet/",datum,"_LVBtweets.xlsx"), sheetName = "tweets",
                  col.names = TRUE, row.names = TRUE, append = FALSE)


class(lvb2$datetime)#,lvb2$source)
table(lvb2$source)
table(lvb2$TRAM,lvb2$TRAM02)


lvb3 <- lvb2 %>% filter(source == "HAFAS Information Manager") %>%
  filter(BUS == 1 & TRAM == 1)



