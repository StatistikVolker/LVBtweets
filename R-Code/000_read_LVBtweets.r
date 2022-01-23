# 000_read_LVBtweets.r

# Skript zum Laden der LVB tweets. Rohtweets werden mit Zeitstempel heruntergeladen und gespeichert

# load packages -----------------------------------------------------------

library(rtweet) # Paket zum laden von tweets 

source("R-Code/010_ create_twitter_token.r")
# LVB direkt Meldungen ----------------------------------------------------
lvb <- get_timeline("LVB_direkt", n = 30000) # lade die bis zu 30.000 LVB tweets

save(lvb,file = paste0("Rohtweets/",Sys.Date(),"_LVBtweets.Rdata"))
names(lvb)

# Evtl. abspeichern als Excel Datei:
# xlsx::write.xlsx2(lvb,  paste0("Rohtweets/",Sys.Date(),"_LVBtweets.xlsx"), sheetName = "LVBtweets",
#                   col.names = TRUE, row.names = TRUE, append = FALSE)
