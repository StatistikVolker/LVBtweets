# 102_semantische_bearbeitung_versuch3.r

#Beispiel für einen schlankeren Code 
# vgl. https://stackoverflow.com/questions/58883580/extract-words-from-text-using-dplyr-and-stringr

# notwendige Pakete
library(purrr)
library(stringr)
library(tidyr)
library(dplyr)


# Tweets statt stext
Text = c("A little bird told me about the dog", "A pig in a poke", "As busy as a bee")
data = as.data.frame(Text)

# Hier unsere Suchworte
keywords <- paste0(c("bird", "dog", "pig","wolf","cat", "bee", "turtle"), collapse = "|")

data %>%  # Data - die Tweets
  mutate(Words = str_extract_all(Text, keywords), # werden nach den Suchworten durchforstest
         Words = map(Words, ~ as.list(unique(.x)) %>% # und in Spalten geschrieben nach Reihenfolge ihres Auftretens im Tweet
  set_names(str_c('col', seq_along(.))))) %>% # Die Spalten werden benannt colx mit x von 1 bis n
  unnest_wider(Words) # umformatierung eines List Element in einen Daten.frame

# Beispiel der Ausgabe
# A tibble: 3 x 3
#  Text                                col1  col2 
#  <fct>                               <chr> <chr>
#1 A little bird told me about the dog bird  dog  
#2 A pig in a poke                     pig   <NA> 
#3 As busy as a bee                    bee   <NA> 

# was noch fehlt:
# Indexvariablen daraus machen.
