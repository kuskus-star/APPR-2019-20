# 3.faza: Vizualizacija podatkov
###################################################################################################################
tmap_mode("plot")
#################################################################################################################################
tmp_data1 <- filter(Slika,Slika$GEO == "Slovenia",Slika$ACL00 == "Kino")
raz1slo<-ggplot(tmp_data1,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()+ 
  labs(title = "Razlogi Neobiskovanja Kina", x = "Kvintil", y = "Delez Neudelezenih")

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

tmp_ned2 <- filter(Neudelezevanje,Neudelezevanje$GEO=="Slovenia",Neudelezevanje$ACL00 == "sportni dogodki")
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

tmp_ned4 <- filter(Neudelezevanje,Neudelezevanje$GEO=="Serbia",Neudelezevanje$ACL00 == "Nastopi v �ivo")
ned4<-ggplot(tmp_ned4,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned4





#######################################################################################################
tmp_data1 <- filter(Slika,Slika$GEO == "Serbia",Slika$ACL00 == "Kino")
raz1<-ggplot(tmp_data1,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

tmp_data2 <- filter(Slika,Slika$GEO == "Serbia",Slika$ACL00 == "Muzeji in galerije")
raz2<-ggplot(tmp_data2,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

tmp_data3 <- filter(Slika,Slika$GEO == "Serbia",Slika$ACL00 == "sportni dogodki")
raz3<-ggplot(tmp_data3,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

tmp_data4 <- filter(Slika,Slika$GEO == "Serbia",Slika$ACL00 == "Nastopi v živo")
raz4<-ggplot(tmp_data4,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()


raz1
raz2
raz3
raz4
#########################################)
data_spanija <- filter(Slika,Slika$GEO == "Spain",Slika$ACL00 == "Kino")
Graf_spanija<-ggplot(data_spanija,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
Graf_spanija

data_romunija <- filter(Slika,Slika$GEO == "Romania",Slika$ACL00 == "Kino")
Graf_romunija<-ggplot(data_romunija,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
Graf_romunija
##########################################################################

