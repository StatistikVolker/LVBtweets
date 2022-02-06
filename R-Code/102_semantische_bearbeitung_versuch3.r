# 102_semantische_bearbeitung_versuch3.r

#Beispiel für einen schlankeren Code 
# vgl. https://stackoverflow.com/questions/58883580/extract-words-from-text-using-dplyr-and-stringr

#--------------------------------------------------------------------------------------------------------

# Versuch 2:
# Skript zerlegt die neusten twets Semantisch zur einfacheren händischen Nachbearbetu8ng in EXCEL.


# Vorabdefinitionen -------------------------------------------------------

# Datum der zubearbeitenden LVB tweets Datei
datum <- "2021-11-01"
#datum <- "2022-01-23"
# 



# Pakete und Datei der tweets laden ------------------------------------------------------------
# notwendige Pakete
#library(purrr)
#library(stringr)
#library(tidyr)
#library(dplyr)
library(tidyverse) # Datenmanipulationspaket
#library(stringr) # Paket zur einfachen Behandlung von Strings in R
library(xlsx) # zum Absopeichern als EXCEL zur händischen Nacharbeitung


# Funktion zur Kategorisierung der Stoerungen aus Datensätzen von verschiedenen Tagen
# Diese Datensätze können dann zusammengespielt werden und Dopplungen identifiziert werden
mkr.stoerungen <- function(datum){
  
  #datum <- "2021-11-01"
  load(paste0("Rohtweets/",datum,"_LVBtweets.Rdata"))
  
  
  data <- lvb  %>%
    arrange(created_at) %>%
    mutate(TEXT = toupper(text)) 
  
  ## Tweets statt stext
  #Text = c("A little bird told me about the dog", "A pig in a poke", "As busy as a bee")
  #data = as.data.frame(Text)
  
  # Hier unsere Suchworte
  keywordstoer <- c("^@",
    "PKW IM GLEIS", "PKW. IM GLEIS", "FALSCHPARKER", "RÜCKSTAU", "LKW","HOHESN VERKEHRSAUFKOMME","HOHEN VERKEHRSAUFKOMMEN",
    "HAVARIE", "UNFALL","VERKEHRSUNAFALL", "UMLEITUNG", "STRECKENBLOCKIERUNG ", "SPERRUNG","WITTERUNG",
    "NOTARZTEINSATZ","RETTUNGSEINSATZ", "FEUERWEHREINSATZ", "POLIZEIEINSATZ",
    "DEMONSTRATION", "CHRISTOPHER STREET DAY", "DEMO","AUFZUGES",
    "VERKÜRZT", "SEV", "SCHIENENERSATZVERKEHR", "NICHT MÖGLICH","VERSPÄTUNG","AUSFALL", "FAHRPLANUNREGELMÄßIGKEITEN", "NOTBETRIEB",
    "DEFEKTEN SCHRANKENANLAGE","HAUSEINSTURZ","BAUARBEITEN",
    "LEITUNGSSCHADEN", "STÖRUNG", "FAHRZEUGSCHADEN", "BETRIEBLICHEN GRÜNDEN", "BETRIEBLICHE GRÜNDE","LEITUNGSARBEITEN","REINIGUNGSARBEITEN","FAHRBAHNVERUNREINIGUNG", 
    "UPDATE", "AB SOFORT", "FÄHRT WIEDER", "WIEDER BEFAHRBAR", "NORMAL", "WIEDER IM EINSATZ","GEHEND NACH FAHRPLAN",
    "PLANMÄßIG", "NORMALER LINIENFÜHRUNG","WIEDER NACH FAHRPLAN", "BEENDET")
  keywords <- paste0(keywordstoer, 
                     collapse = "|")
  
  test <- data %>%  # Data - die Tweets
    select(TEXT) %>%
    mutate(Words = str_extract_all(TEXT, keywords)) %>%# werden nach den Suchworten durchforstes
    replace_na(list(Words = "SONSTIGES")) %>%
    mutate(Words = map(Words, ~ as.list(unique(.x)) %>% set_names(str_c('col', seq_along(.))))
           ) %>% # Die Spalten werden benannt colx mit x von 1 bis n
    unnest_wider(Words) # umformatierung eines List Element in einen Daten.frame
  
  
  
  #table(test$col1)
  #levels(testl$Art)
  
  testl <- test %>% 
    filter(col1 != "@") %>% # retweets aus
    pivot_longer(-TEXT,names_to = "Spalte",values_to = "Art") %>% # In eine Spalte
    filter(!is.na(Art)) %>% # Einträge ohne Wert raus
    mutate(value = 1,
           Art = as.factor(Art),
           Art = factor(Art,levels = c(keywordstoer,"SONSTIGES"))) %>% # Zähler einfügen
    select(-Spalte) %>% # Spalte wird noicht mehr gebrqaucht
    distinct() %>% # Doppelte Spalten raus
    complete(Art = Art) %>% # stelle sicher, dass wirklich alle Kategorien eine Spalte bekommen
    pivot_wider(names_from = "Art",values_from = "value", values_fill = 0)
  
  
  return(testl)
}


#LVB Tweets von verschiedenen Tagen
test1 <- mkr.stoerungen("2021-11-01") # tweets vom 2021-11-01
test2 <- mkr.stoerungen("2022-01-23") # tweets vom 2022-01-23
test3 <- mkr.stoerungen("2022-02-03") # tweets vom 2022-01-23

# ZUsammensoiel
lvbstoerung <- bind_rows(test1,test2,test3) %>%
  distinct() %>% # doppelte raus!
  mutate(idx_answertweet =  `^@`,
         idx_mivstoerung = as.numeric((`PKW IM GLEIS`+`PKW. IM GLEIS`+`FALSCHPARKER`+`RÜCKSTAU`+`LKW`+`HOHESN VERKEHRSAUFKOMME`+`HOHEN VERKEHRSAUFKOMMEN`) > 0),
         idx_unfall      = as.numeric((`HAVARIE`+`UNFALL`+`VERKEHRSUNAFALL`+`UMLEITUNG`+`STRECKENBLOCKIERUNG `+`SPERRUNG`+`WITTERUNG`) > 0),
         idx_blaulicht   = as.numeric((`NOTARZTEINSATZ`+`RETTUNGSEINSATZ`+`FEUERWEHREINSATZ`+`POLIZEIEINSATZ`) > 0),
         idx_demo        = as.numeric((`DEMONSTRATION`+`CHRISTOPHER STREET DAY`+`DEMO`+`AUFZUGES`) > 0),
         idx_fahrplan    = as.numeric((`VERKÜRZT`+`SEV`+`SCHIENENERSATZVERKEHR`+`NICHT MÖGLICH`+`FAHRPLANUNREGELMÄßIGKEITEN`+`NOTBETRIEB`) > 0),
         idx_baustelle   = as.numeric((`DEFEKTEN SCHRANKENANLAGE`+`HAUSEINSTURZ`+`BAUARBEITEN`) > 0),
         idx_lvbintern   = as.numeric((`VERSPÄTUNG`+`AUSFALL`+`LEITUNGSSCHADEN`+`STÖRUNG`+`FAHRZEUGSCHADEN`+
                                       `BETRIEBLICHEN GRÜNDEN`+`BETRIEBLICHE GRÜNDE`+`LEITUNGSARBEITEN`+
                                         `REINIGUNGSARBEITEN`+`FAHRBAHNVERUNREINIGUNG`) > 0),
         idx_beendet     = as.numeric((`AB SOFORT`+`FÄHRT WIEDER`+`WIEDER BEFAHRBAR`+`NORMAL`+`WIEDER IM EINSATZ`+`GEHEND NACH FAHRPLAN`+`PLANMÄßIG`+
                                         `NORMALER LINIENFÜHRUNG`+`WIEDER NACH FAHRPLAN`+`BEENDET`) > 0),
         idx_sonstiges   = as.numeric((`UPDATE`+`SONSTIGES`) > 0)) %>%
  select(TEXT,starts_with("idx_")) 
         #`PKW IM GLEIS`,`PKW. IM GLEIS`,`FALSCHPARKER`,`RÜCKSTAU`,`LKW`,`HOHESN VERKEHRSAUFKOMME`,`HOHEN VERKEHRSAUFKOMMEN`,
         #everything())

OurTools::Table(lvbstoerung$idx_mivstoerung,lvbstoerung$idx_beendet)

# Kontrollen
names(lvbstoerung)
#lange Daten um der Kategorienzu Tabelieren
lvbstörungl <- lvbstoerung %>% pivot_longer(cols = -TEXT,names_to = "Art",values_to = "Nennung") %>%
  filter(Nennung== 1)
table(lvbstörungl$Art)

# Alle bisher nicht kategorisierten Twwets
sonstige <- lvbstoerung %>% filter(SONSTIGES == 1)


#GIT Commit message
#Neu angelegt, schnellere Programmierung zur Identifikation der Störungen aus den tweets
#
#Außerdem zusammenspiel aller bisher heruntergeladener tweets und prüfung auf dopplungen



# Beispiel der Ausgabe
# A tibble: 3 x 3
#  Text                                col1  col2 
#  <fct>                               <chr> <chr>
#1 A little bird told me about the dog bird  dog  
#2 A pig in a poke                     pig   <NA> 
#3 As busy as a bee                    bee   <NA> 

# was noch fehlt:
# Indexvariablen daraus machen.
