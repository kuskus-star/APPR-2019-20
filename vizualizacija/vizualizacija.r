# 3.faza: Vizualizacija podatkov
###################################################################################################################
tmap_mode("plot")
#########################################################################
tmap_mode("view")
#################################################################################################################################
tmp_data1 <- filter(Slika,Slika$GEO == "Slovenia",Slika$ACL00 == "Cinema")
raz1<-ggplot(tmp_data1,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

tmp_data2 <- filter(Slika,Slika$GEO == "Slovenia",Slika$ACL00 == "Cultural sites")
raz2<-ggplot(tmp_data2,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

tmp_data3 <- filter(Slika,Slika$GEO == "Slovenia",Slika$ACL00 == "Sports events")
raz3<-ggplot(tmp_data3,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

tmp_data4 <- filter(Slika,Slika$GEO == "Slovenia",Slika$ACL00 == "Live performances")
raz4<-ggplot(tmp_data4,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()


raz1
raz2
raz3
raz4
#pogledamo v kakšnih deležih se ljudje po kvantilih ne udelezujejo raznih kulturnih dogodkov opazimo ,
#da je razlika pri sportu najmanša opazimo tudi da pri sportu ce bi izkljucili financne razlge bi biu peti kvintil najbolj aktiven


######################################################################################################################
# oglejmo si samo meudelezevanje po panogah tokrat primerjamo z podatki o neudelezevanju 2006 2006 podatki nimajo razloga kot komponente
tmp_ned1 <- filter(Neudelezevanje,Neudelezevanje$GEO == "Slovenia",Neudelezevanje$ACL00 == "Cinema")
ned1<-ggplot(tmp_ned1,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned1

tmp_ned2 <- filter(Neudelezevanje,Neudelezevanje$GEO=="Slovenia",Neudelezevanje$ACL00 == "Sports events")
ned2<-ggplot(tmp_ned2,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned2

tmp_ned3 <- filter(Neudelezevanje,Neudelezevanje$GEO=="Slovenia",Neudelezevanje$ACL00 == "Cultural sites")
ned3<-ggplot(tmp_ned3,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned3

tmp_ned4 <- filter(Neudelezevanje,Neudelezevanje$GEO=="Slovenia",Neudelezevanje$ACL00 == "Live performances")
ned4<-ggplot(tmp_ned4,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned4

#############################################################################################################################

tmp_ned1 <- filter(Neudelezevanje,Neudelezevanje$GEO == "Serbia",Neudelezevanje$ACL00 == "Cinema")
ned1<-ggplot(tmp_ned1,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned1

tmp_ned2 <- filter(Neudelezevanje,Neudelezevanje$GEO=="Serbia",Neudelezevanje$ACL00 == "Sports events")
ned2<-ggplot(tmp_ned2,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned2

tmp_ned3 <- filter(Neudelezevanje,Neudelezevanje$GEO=="Serbia",Neudelezevanje$ACL00 == "Cultural sites")
ned3<-ggplot(tmp_ned3,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned3

tmp_ned4 <- filter(Neudelezevanje,Neudelezevanje$GEO=="Serbia",Neudelezevanje$ACL00 == "Live performances")
ned4<-ggplot(tmp_ned4,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned4





#######################################################################################################
tmp_data1 <- filter(Slika,Slika$GEO == "Serbia",Slika$ACL00 == "Cinema")
raz1<-ggplot(tmp_data1,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

tmp_data2 <- filter(Slika,Slika$GEO == "Serbia",Slika$ACL00 == "Cultural sites")
raz2<-ggplot(tmp_data2,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

tmp_data3 <- filter(Slika,Slika$GEO == "Serbia",Slika$ACL00 == "Sports events")
raz3<-ggplot(tmp_data3,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

tmp_data4 <- filter(Slika,Slika$GEO == "Serbia",Slika$ACL00 == "Live performances")
raz4<-ggplot(tmp_data4,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()


raz1
raz2
raz3
raz4
#########################################)

tmp_data <- filter(Neudelezevanje_15,Neudelezevanje_15$GEO=="Slovenia",Neudelezevanje_15$ACL00 == "Cultural sites")
tmp_data$QUANTILE[tmp_data$QUANTILE == 1] <- 10
tmp_data$QUANTILE[tmp_data$QUANTILE == 2] <- 30
tmp_data$QUANTILE[tmp_data$QUANTILE == 3] <- 50
tmp_data$QUANTILE[tmp_data$QUANTILE == 4] <- 70
tmp_data$QUANTILE[tmp_data$QUANTILE == 5] <- 90
tmp_data<-tmp_data[tmp_data$QUANTILE != "Total",]
jitter <-ggplot(tmp_data,aes(x=QUANTILE,y = Value)) + geom_point()
jitter 

##########################################################################
#Zemljevidi
tmp_data<-filter(Neudelezevanje_15,Neudelezevanje_15$QUANTILE=="Total",Neudelezevanje_15$ACL00=="Sports events")
tmp_data$ACL00= NULL
tmp_data$QUANTILE=NULL
zemljevid_sport <- tm_shape(merge(svet, tmp_data,dupl, by.x = "NAME", by.y = "GEO")) + 
  tm_fill(col = "Value", contrast = 1, palette = "YlOrRd", breaks = c(30,40,50,60,70,80,90), title = "Neudelezeanje", textNA = "Manjkajoči podatki") +
  tm_layout(legend.outside = TRUE)
zemljevid_sport

tmp_data<-filter(Neudelezevanje_15,Neudelezevanje_15$QUANTILE=="Total",Neudelezevanje_15$ACL00=="Live performances")
tmp_data$ACL00= NULL
tmp_data$QUANTILE=NULL
zemljevid_balet <- tm_shape(merge(svet, tmp_data,dupl, by.x = "NAME", by.y = "GEO")) + 
  tm_fill(col = "Value", contrast = 1, palette = "YlOrRd", breaks = c(30,40,50,60,70,80,90), title = "Neudelezeanje", textNA = "Manjkajoči podatki") +
  tm_layout(legend.outside = TRUE)
zemljevid_balet

tmp_data<-filter(Neudelezevanje_15,Neudelezevanje_15$QUANTILE=="5",Neudelezevanje_15$ACL00=="Live performances")
tmp_data$ACL00= NULL
tmp_data$QUANTILE=NULL
zemljevid_balet <- tm_shape(merge(svet, tmp_data,dupl, by.x = "NAME", by.y = "GEO")) + 
  tm_fill(col = "Value", contrast = 1, palette = "YlOrRd", breaks = c(20,30,40,50,60,70,80,90,100), title = "Neudelezeanje", textNA = "Manjkajoči podatki") +
  tm_layout(legend.outside = TRUE)
zemljevid_balet

tmp_data<-filter(Neudelezevanje_15,Neudelezevanje_15$QUANTILE=="1",Neudelezevanje_15$ACL00=="Live performances")
tmp_data$ACL00= NULL
tmp_data$QUANTILE=NULL
zemljevid_balet <- tm_shape(merge(svet, tmp_data,dupl, by.x = "NAME", by.y = "GEO")) + 
  tm_fill(col = "Value", contrast = 1, palette = "YlOrRd", breaks = c(30,40,50,60,70,80,90), title = "Neudelezeanje", textNA = "Manjkajoči podatki") +
  tm_layout(legend.outside = TRUE)
zemljevid_balet
