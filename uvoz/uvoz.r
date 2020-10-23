# 2. faza: Uvoz podatkov.



#1. tabela vsebuje procente neudelezevanja v kulturnih prireditvah.
Neudelezevanje<- read_csv("podatki/ilc_scp04_1_Data.csv", col_names=TRUE, na=":" ,locale = locale(encoding="Windows-1250"))
Neudelezevanje$GEO<-standardize.countrynames(Neudelezevanje$GEO,suggest = "auto", print.changes = TRUE)
names(Neudelezevanje)[10]<-"FnF"
Neudelezevanje <- na.omit(Neudelezevanje)
Neudelezevanje$FnF <- NULL
Neudelezevanje$UNIT <- NULL
Neudelezevanje$DEG_URB<-NULL
Neudelezevanje$HHTYP<-NULL
Neudelezevanje$FREQUENC<-NULL
Neudelezevanje$QUANTILE[Neudelezevanje$QUANTILE == "First quintile"] <- "1."
Neudelezevanje$QUANTILE[Neudelezevanje$QUANTILE == "Second quintile"] <- "2."
Neudelezevanje$QUANTILE[Neudelezevanje$QUANTILE == "Third quintile"] <- "3."
Neudelezevanje$QUANTILE[Neudelezevanje$QUANTILE == "Fourth quintile"] <- "4."
Neudelezevanje$QUANTILE[Neudelezevanje$QUANTILE == "Fifth quintile"] <- "5."
Neudelezevanje$QUANTILE[Neudelezevanje$QUANTILE == "Total"] <- "Celotna populacija"
Neudelezevanje$TIME[Neudelezevanje$TIME == 2006] <- "2006"
Neudelezevanje$TIME[Neudelezevanje$TIME == 2015] <- "2015"
Neudelezevanje$ACL00[Neudelezevanje$ACL00 == "Live performances (theatre, concerts, ballet)"] <- "Nastopi v zivo"
Neudelezevanje$ACL00[Neudelezevanje$ACL00 == "Cultural activities (cinema, live performances or cultural sites)"] <- "Kulturne Aktivnosti"
Neudelezevanje$ACL00[Neudelezevanje$ACL00 == "Cultural sites (historical monuments, museums, art galleries or archaeological sites)"] <- "Muzeji in galerije"
Neudelezevanje$ACL00[Neudelezevanje$ACL00 == "Live performances (theatre, concerts, ballet)"] <- "Nastopi v zivo"
Neudelezevanje$ACL00[Neudelezevanje$ACL00 == "Cinema"] <- "Kino"
Neudelezevanje$ACL00[Neudelezevanje$ACL00 == "Sports events"] <- "Sportni dogodki"
Neudelezevanje_6 <-filter(Neudelezevanje,Neudelezevanje$TIME =="2006")
Neudelezevanje_6$TIME <- NULL
Neudelezevanje_15 <-filter(Neudelezevanje,Neudelezevanje$TIME =="2015")
Neudelezevanje_15$TIME <- NULL

#2. tabela vsebuje razloge za neudelezevanje v klturnih prireditvah
Razlogi <- read_csv("podatki/ilc_scp06_1_Data.csv", col_names=TRUE, na=":" ,locale = locale(encoding="Windows-1250"))
Razlogi$GEO <- standardize.countrynames(Razlogi$GEO,suggest = "auto", print.changes = TRUE)
a
names(Razlogi)[10]<-"FnF"
Razlogi$ACL00[Razlogi$ACL00 == "Live performances (theatre, concerts, ballet)"] <- "Nastopi v zivo"
Razlogi$ACL00[Razlogi$ACL00 == "Cultural activities (cinema, live performances or cultural sites)"] <- "Kulturne Aktivnosti"
Razlogi$ACL00[Razlogi$ACL00 == "Cultural sites (historical monuments, museums, art galleries or archaeological sites)"] <- "Muzeji in galerije"
Razlogi$ACL00[Razlogi$ACL00 == "Cinema"] <- "Kino"
Razlogi$ACL00[Razlogi$ACL00 == "Sports events"] <- "Sportni dogodki"
Razlogi$FnF <- NULL 
Razlogi$TIME <- NULL
Razlogi$HHTYP <- NULL
Razlogi$DEG_URB <- NULL
Razlogi$UNIT <- NULL
Razlogi$QUANTILE[Razlogi$QUANTILE == "First quintile"] <- "1."
Razlogi$QUANTILE[Razlogi$QUANTILE == "Second quintile"] <- "2."
Razlogi$QUANTILE[Razlogi$QUANTILE == "Third quintile"] <- "3."
Razlogi$QUANTILE[Razlogi$QUANTILE == "Fourth quintile"] <- "4."
Razlogi$QUANTILE[Razlogi$QUANTILE == "Fifth quintile"] <- "5."
Razlogi$QUANTILE[Razlogi$QUANTILE == "Total"] <- "Celotna populacija"
Razlogi$Value1 <- Razlogi$Value
Razlogi$Value<-NULL
col_order <- c("GEO","ACL00", "QUANTILE","Value1","REASON")
Razlogi <- Razlogi[, col_order]

Slika <- merge(Neudelezevanje_15,Razlogi,by=c("GEO","ACL00", "QUANTILE")) 


names(Slika)[4]<-"NVALUE"
names(Slika)[5]<-"RVALUE"

Slika$TVALUE = Slika$NVALUE*Slika$RVALUE/100






svet <- uvozi.zemljevid(
  "http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/cultural/ne_50m_admin_0_countries.zip",
  "ne_50m_admin_0_countries", encoding="UTF-8")
svet$NAME <- standardize.countrynames(svet$NAME, suggest = "auto", print.changes = TRUE)

Neudelezevanjee_15_0<-filter(Neudelezevanje,Neudelezevanje$QUANTILE=="Total")
Neudelezevanjee_15_0$Value<-"N/A"





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
#   tabela$obcina[tabela$obcina == "Loski potok"] <- "Loski Potok"
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
#   data$obcina[data$obcina == "Sveti Jurij"] <- "Sveti Jurij ob Sčavnici"
#   data <- data %>% gather(`1`:`4`, key="velikost.druzine", value="stevilo.druzin")
#   data$velikost.druzine <- parse_number(data$velikost.druzine)
#   data$obcina <- parse_factor(data$obcina, levels=obcine)
#   return(data)
# }
# 
# # Zapisimo podatke v razpredelnico obcine
# obcine <- uvozi.obcine()
# 
# # Zapisimo podatke v razpredelnico druzine.
# druzine <- uvozi.druzine(levels(obcine$obcina))
# 
# # Če bi imeli več funkcij za uvoz in nekaterih npr. se ne bi
# # potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# # datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# # 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# # fazah.



















