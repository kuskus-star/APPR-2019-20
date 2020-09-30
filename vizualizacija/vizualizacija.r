# 3.faza: Vizualizacija podatkov
###################################################################################################################
tmap_mode("plot")
#################################################################################################################################
tmp_data1 <- filter(Slika,Slika$GEO == "Slovenia",Slika$ACL00 == "Kino")
raz1slo<-ggplot(tmp_data1,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()+ 
  labs(title = "Razlogi Neobiskovanja Kina", x = "Kvintil", y = "Delež Neudeleženih")


tmp_data_den<- filter(Slika,Slika$GEO == "Slovenia",Slika$ACL00 == "Kino",Slika$REASON == "Financial reasons")
den1slo <-ggplot(tmp_data_den,aes(x=QUANTILE,y = TVALUE)) + geom_col()
  
  
Nezanim1slo

tmp_data2 <- filter(Slika,Slika$GEO == "Slovenia",Slika$ACL00 == "Muzeji in galerije")
raz2slo<-ggplot(tmp_data2,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

tmp_data3 <- filter(Slika,Slika$GEO == "Slovenia",Slika$ACL00 == "Športni dogodki")
raz3slo<-ggplot(tmp_data3,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

tmp_data4 <- filter(Slika,Slika$GEO == "Slovenia",Slika$ACL00 == "Nastopi v živo")
raz4slo<-ggplot(tmp_data4,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

raz1slo
#pogledamo v kakšnih deležih se ljudje po kvantilih ne udelezujejo raznih kulturnih dogodkov opazimo ,
#da je razlika pri sportu najmanša opazimo tudi da pri sportu ce bi izkljucili financne razlge bi biu peti kvintil najbolj aktiven


######################################################################################################################
# oglejmo si samo meudelezevanje po panogah tokrat primerjamo z podatki o neudelezevanju 2006 2006 podatki nimajo razloga kot komponente
tmp_ned1 <- filter(Neudelezevanje,Neudelezevanje$GEO == "Slovenia",Neudelezevanje$ACL00 == "Kino")
ned1<-ggplot(tmp_ned1,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned1

tmp_ned2 <- filter(Neudelezevanje,Neudelezevanje$GEO=="Slovenia",Neudelezevanje$ACL00 == "Športni dogodki")
ned2<-ggplot(tmp_ned2,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned2

tmp_ned3 <- filter(Neudelezevanje,Neudelezevanje$GEO=="Slovenia",Neudelezevanje$ACL00 == "Muzeji in galerije")
ned3<-ggplot(tmp_ned3,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned3

tmp_ned4 <- filter(Neudelezevanje,Neudelezevanje$GEO=="Slovenia",Neudelezevanje$ACL00 == "Nastopi v živo")
ned4<-ggplot(tmp_ned4,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned4

#############################################################################################################################

tmp_ned1 <- filter(Neudelezevanje,Neudelezevanje$GEO == "Serbia",Neudelezevanje$ACL00 == "Kino")
ned1<-ggplot(tmp_ned1,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned1

tmp_ned2 <- filter(Neudelezevanje,Neudelezevanje$GEO=="Serbia",Neudelezevanje$ACL00 == "Športni dogodki")
ned2<-ggplot(tmp_ned2,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned2

tmp_ned3 <- filter(Neudelezevanje,Neudelezevanje$GEO=="Serbia",Neudelezevanje$ACL00 == "Muzeji in galerije")
ned3<-ggplot(tmp_ned3,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned3

tmp_ned4 <- filter(Neudelezevanje,Neudelezevanje$GEO=="Serbia",Neudelezevanje$ACL00 == "Nastopi v živo")
ned4<-ggplot(tmp_ned4,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned4





#######################################################################################################
tmp_data1 <- filter(Slika,Slika$GEO == "Serbia",Slika$ACL00 == "Kino")
raz1<-ggplot(tmp_data1,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

tmp_data2 <- filter(Slika,Slika$GEO == "Serbia",Slika$ACL00 == "Muzeji in galerije")
raz2<-ggplot(tmp_data2,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

tmp_data3 <- filter(Slika,Slika$GEO == "Serbia",Slika$ACL00 == "Športni dogodki")
raz3<-ggplot(tmp_data3,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

tmp_data4 <- filter(Slika,Slika$GEO == "Serbia",Slika$ACL00 == "Nastopi v živo")
raz4<-ggplot(tmp_data4,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()


raz1
raz2
raz3
raz4
#########################################)

tmp_data <- filter(Neudelezevanje_15,Neudelezevanje_15$ACL00 == "Muzeji in galerije")
tmp_data$QUANTILE[tmp_data$QUANTILE == 1] <- 10
tmp_data$QUANTILE[tmp_data$QUANTILE == 2] <- 30
tmp_data$QUANTILE[tmp_data$QUANTILE == 3] <- 50
tmp_data$QUANTILE[tmp_data$QUANTILE == 4] <- 70
tmp_data$QUANTILE[tmp_data$QUANTILE == 5] <- 90
tmp_data<-tmp_data[tmp_data$QUANTILE != "Total",]
jitter_hist<-ggplot(tmp_data,aes(x=QUANTILE,y = Value)) + geom_point()
jitter 

###############################################################################################################
tmp_data <- filter(Neudelezevanje_15,Neudelezevanje_15$ACL00 == "Športni dogodki")
tmp_data$QUANTILE[tmp_data$QUANTILE == 1] <- 10
tmp_data$QUANTILE[tmp_data$QUANTILE == 2] <- 30
tmp_data$QUANTILE[tmp_data$QUANTILE == 3] <- 50
tmp_data$QUANTILE[tmp_data$QUANTILE == 4] <- 70
tmp_data$QUANTILE[tmp_data$QUANTILE == 5] <- 90
tmp_data<-tmp_data[tmp_data$QUANTILE != "Total",]
jitter_sport <-ggplot(tmp_data,aes(x=QUANTILE,y = Value)) + geom_point()
jitter 
##########################################################################

