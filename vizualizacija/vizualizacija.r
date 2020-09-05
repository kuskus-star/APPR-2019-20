# 3.faza: Vizualizacija podatkov
###################################################################################################################
tmp_data1 <- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cinema")
raz1<-ggplot(tmp_data1,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

tmp_data2 <- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cultural sites ")
raz2<-ggplot(tmp_data2,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

tmp_data3 <- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Sports events")
raz3<-ggplot(tmp_data3,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()

tmp_data4 <- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Live performances ")
raz4<-ggplot(tmp_data4,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()


raz1
raz2
raz3
raz4
#pogledamo v kakšnih deležih se ljudje po kvantilih ne udelezujejo raznih kulturnih dogodkov opazimo ,
#da je razlika pri sportu najmanša opazimo tudi da pri sportu ce bi izkljucili financne razlge bi biu peti kvintil najbolj aktiven


######################################################################################################################
# oglejmo si samo meudelezevanje po panogah tokrat primerjamo z podatki o neudelezevanju 2006 2006 podatki nimajo razloga kot komponente
tmp_ned1 <- filter(Neudelezevanje,Neudelezevanje$HHTYP == "Total",DEG_URB== "Total",Neudelezevanje$ACL00 == "Cinema")
ned1<-ggplot(tmp_ned1,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned1

tmp_ned2 <- filter(Neudelezevanje,Neudelezevanje$HHTYP == "Total",DEG_URB== "Total",Neudelezevanje$ACL00 == "Sports events")
ned2<-ggplot(tmp_ned2,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned2

tmp_ned3 <- filter(Neudelezevanje,Neudelezevanje$HHTYP == "Total",DEG_URB== "Total",Neudelezevanje$ACL00 == "Cultural sites ")
ned3<-ggplot(tmp_ned3,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned3

tmp_ned4 <- filter(Neudelezevanje,Neudelezevanje$HHTYP == "Total",DEG_URB== "Total",Neudelezevanje$ACL00 == "Live performances ")
ned4<-ggplot(tmp_ned4,aes(x=QUANTILE,y = Value,fill=TIME)) + geom_col(position="dodge")
ned4

#########################################################################################################################
tmp_ned1 <- filter(Neudelezevanje,Neudelezevanje$HHTYP == "Total",DEG_URB== "Total",QUANTILE=="Total")
ned1<-ggplot(tmp_ned1,aes(x=ACL00,y = Value,fill=TIME)) + geom_col(position="dodge")
ned1


##################tukej hočm dt deg urb breez totala##############
tmp_ned1 <- filter(Neudelezevanje,Neudelezevanje$HHTYP == "Total",QUANTILE=="Total")
tmp_ned1<-tmp_ned1[tmp_ned1$DEG_URB != "Total",]
ned1<-ggplot(tmp_ned1,aes(x=ACL00,y = Value,fill=DEG_URB)) + geom_col(position="dodge")
ned1

tmp_ned1 <- filter(Neudelezevanje,Neudelezevanje$HHTYP == "Total",QUANTILE=="Total",ACL00=="Cinema")
ned1<-ggplot(tmp_ned1,aes(x=DEG_URB,y = Value,fill=TIME)) + geom_col(position="dodge")
ned1

tmp_ned1 <- filter(Neudelezevanje,Neudelezevanje$HHTYP == "Total",QUANTILE=="Total",ACL00=="Live performances")
ned1<-ggplot(tmp_ned1,aes(x=DEG_URB,y = Value,fill=TIME)) + geom_col(position="dodge")
ned1

tmp_ned1 <- filter(Neudelezevanje,Neudelezevanje$HHTYP == "Total",QUANTILE=="Total",ACL00=="Sports events")
ned1<-ggplot(tmp_ned1,aes(x=DEG_URB,y = Value,fill=TIME)) + geom_col(position="dodge")
ned1



####################################################################################################################

