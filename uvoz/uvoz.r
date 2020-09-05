# 2. faza: Uvoz podatkov



#1. tabela vsebuje procente neudeleževanja v kulturnih prireditvah
Neudelezevanje<- read_csv("podatki/ilc_scp04_1_Data.csv", col_names=TRUE, na=":" ,locale = locale(encoding="Windows-1250"))
names(Neudelezevanje)[10]<-"FnF"
Neudelezevanje$FnF <- NULL
Neudelezevanje$GEO <- NULL
Neudelezevanje$UNIT <- NULL
Neudelezevanje <-filter(Neudelezevanje,Neudelezevanje$FREQUENC =="Not in the last 12 months")
Neudelezevanje$FREQUENC<-NULL
Neudelezevanje$QUANTILE[Neudelezevanje$QUANTILE == "First quintile"] <- 1
Neudelezevanje$QUANTILE[Neudelezevanje$QUANTILE == "Second quintile"] <- 2
Neudelezevanje$QUANTILE[Neudelezevanje$QUANTILE == "Third quintile"] <- 3
Neudelezevanje$QUANTILE[Neudelezevanje$QUANTILE == "Fourth quintile"] <- 4
Neudelezevanje$QUANTILE[Neudelezevanje$QUANTILE == "Fifth quintile"] <- 5
Neudelezevanje$TIME[Neudelezevanje$TIME == 2006] <- "2006"
Neudelezevanje$TIME[Neudelezevanje$TIME == 2015] <- "2015"
Neudelezevanje$ACL00[Neudelezevanje$ACL00 == "Live performances (theatre, concerts, ballet)"] <- "Live performances"
Neudelezevanje$ACL00[Neudelezevanje$ACL00 == "Cultural activities (cinema, live performances or cultural sites)"] <- "Cultural activities"
Neudelezevanje$ACL00[Neudelezevanje$ACL00 == "Cultural sites (historical monuments, museums, art galleries or archaeological sites)"] <- "Cultural sites"
Neudelezevanje_6 <-filter(Neudelezevanje,Neudelezevanje$TIME =="2006")
Neudelezevanje_6$TIME <- NULL
Neudelezevanje_15 <-filter(Neudelezevanje,Neudelezevanje$TIME =="2015")
Neudelezevanje_15$TIME <- NULL

#2. tabela vsebuje razloge za neudeleževanje v klturnih prireditvah
Razlogi <- read_csv("podatki/podatki3.csv", col_names=TRUE, na=":" ,locale = locale(encoding="Windows-1250"))
names(Razlogi)[10]<-"FnF"
Razlogi$ACL00[Razlogi$ACL00 == "Live performances (theatre, concerts, ballet)"] <- "Live performances"
Razlogi$ACL00[Razlogi$ACL00 == "Cultural sites (historical monuments, museums, art galleries or archaeological sites)"] <- "Cultural sites"
Razlogi$ACL00[Razlogi$ACL00 == "Cultural activities (cinema, live performances or cultural sites)"] <- "Cultural activities"
Razlogi$FnF <- NULL 
Razlogi$TIME <- NULL
Razlogi$GEO <- NULL
Razlogi$UNIT <- NULL
Razlogi$Value1 <- Razlogi$Value
Razlogi$Value<-NULL
col_order <- c("ACL00","DEG_URB", "HHTYP", "QUANTILE","REASON","Value1")
Razlogi <- Razlogi[, col_order]

Slika <- merge(Neudelezevanje_15,Razlogi,by=c("ACL00","DEG_URB", "HHTYP", "QUANTILE")) 
Slika$Value.x<-NULL
Slika$Value.y<-NULL

Slika$QUANTILE[Slika$QUANTILE == "First quintile"] <- 1
Slika$QUANTILE[Slika$QUANTILE == "Second quintile"] <- 2
Slika$QUANTILE[Slika$QUANTILE == "Third quintile"] <- 3
Slika$QUANTILE[Slika$QUANTILE == "Fourth quintile"] <- 4
Slika$QUANTILE[Slika$QUANTILE == "Fifth quintile"] <- 5
names(Slika)[5]<-"NVALUE"
names(Slika)[7]<-"RVALUE"

Slika$TVALUE = Slika$NVALUE*Slika$RVALUE/100























# sl <- locale("sl", decimal_mark=",", grouping_mark=".")
# 
# # Funkcija, ki uvozi občine iz Wikipedije
# uvozi.obcine <- function() {
#   link <- "http://sl.wikipedia.org/wiki/Seznam_ob%C4%8Din_v_Sloveniji"
#   stran <- html_session(link) %>% read_html()
#   tabela <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%
#     .[[1]] %>% html_table(dec=",")
#   for (i in 1:ncol(tabela)) {
#     if (is.character(tabela[[i]])) {
#       Encoding(tabela[[i]]) <- "UTF-8"
#     }
#   }
#   colnames(tabela) <- c("obcina", "povrsina", "prebivalci", "gostota", "naselja",
#                         "ustanovitev", "pokrajina", "regija", "odcepitev")
#   tabela$obcina <- gsub("Slovenskih", "Slov.", tabela$obcina)
#   tabela$obcina[tabela$obcina == "Kanal ob Soči"] <- "Kanal"
#   tabela$obcina[tabela$obcina == "Loški potok"] <- "Loški Potok"
#   for (col in c("povrsina", "prebivalci", "gostota", "naselja", "ustanovitev")) {
#     if (is.character(tabela[[col]])) {
#       tabela[[col]] <- parse_number(tabela[[col]], na="-", locale=sl)
#     }
#   }
#   for (col in c("obcina", "pokrajina", "regija")) {
#     tabela[[col]] <- factor(tabela[[col]])
#   }
#   return(tabela)
# }
# 
# # Funkcija, ki uvozi podatke iz datoteke druzine.csv
# uvozi.druzine <- function(obcine) {
#   data <- read_csv2("podatki/druzine.csv", col_names=c("obcina", 1:4),
#                     locale=locale(encoding="CP1250"))
#   data$obcina <- data$obcina %>% strapplyc("^([^/]*)") %>% unlist() %>%
#     strapplyc("([^ ]+)") %>% sapply(paste, collapse=" ") %>% unlist()
#   data$obcina[data$obcina == "Sveti Jurij"] <- "Sveti Jurij ob Ščavnici"
#   data <- data %>% gather(`1`:`4`, key="velikost.druzine", value="stevilo.druzin")
#   data$velikost.druzine <- parse_number(data$velikost.druzine)
#   data$obcina <- parse_factor(data$obcina, levels=obcine)
#   return(data)
# }
# 
# # Zapišimo podatke v razpredelnico obcine
# obcine <- uvozi.obcine()
# 
# # Zapišimo podatke v razpredelnico druzine.
# druzine <- uvozi.druzine(levels(obcine$obcina))
# 
# # Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# # potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# # datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# # 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# # fazah.
