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
<<<<<<< HEAD
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
=======
tmp_ned1 <- filter(Neudelezevanje,Neudelezevanje$HHTYP == "Total",QUANTILE=="Total",DEG_URB =="Cities",DEG_URB"Rural areas")
ned1<-ggplot(tmp_ned1,aes(x=ACL00,y = Value,fill=DEG_URB)) + geom_col(position="dodge")
ned1



####################################################################################################################



tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",Slika$DEG_URB== "Total",Slika$ACL00 == "Cinema",Slika$QUANTILE == "Total") 
raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
pie = raz_circ + coord_polar("y", start=0)
pie

tmp_data_circ1<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cinema",QUANTILE == "1") 
raz_circ1 <-ggplot(tmp_data_circ1,aes(x=QUANTILE,y = RVALUE,fill = REASON,)) + geom_col()
pie1 = raz_circ1 + coord_polar("y", start=0)
pie1

tmp_data_circ2<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cinema",QUANTILE == "2") 
raz_circ2 <-ggplot(tmp_data_circ2,aes(x=QUANTILE,y = RVALUE,fill = REASON,)) + geom_col()
pie2 = raz_circ2 + coord_polar("y", start=0)
pie2

tmp_data_circ3<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cinema",QUANTILE == "3") 
raz_circ3 <-ggplot(tmp_data_circ3,aes(x=QUANTILE,y = RVALUE,fill = REASON,)) + geom_col()
pie3 = raz_circ3 + coord_polar("y", start=0)
pie3

tmp_data_circ4<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cinema",QUANTILE == "4") 
raz_circ4 <-ggplot(tmp_data_circ4,aes(x=QUANTILE,y = RVALUE,fill = REASON,)) + geom_col()
pie4 = raz_circ4 + coord_polar("y", start=0)
pie4

tmp_data_circ5<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cinema",QUANTILE == "5") 
raz_circ5 <-ggplot(tmp_data_circ5,aes(x=QUANTILE,y = RVALUE,fill = REASON,)) + geom_col()
pie5= raz_circ5 + coord_polar("y", start=0)
pie5
###################################################################################################################
###################################################################################################################
tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cultural sites (historical monuments, museums, art galleries or archaeological sites)",QUANTILE == "Total") 
raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
pie = raz_circ + coord_polar("y", start=0)
pie

tmp_data_circ1<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cultural sites (historical monuments, museums, art galleries or archaeological sites)",QUANTILE == "1") 
raz_circ1 <-ggplot(tmp_data_circ1,aes(x=QUANTILE,y = RVALUE,fill = REASON,)) + geom_col()
pie1 = raz_circ1 + coord_polar("y", start=0)
pie1

tmp_data_circ2<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cultural sites (historical monuments, museums, art galleries or archaeological sites)",QUANTILE == "2") 
raz_circ2 <-ggplot(tmp_data_circ2,aes(x=QUANTILE,y = RVALUE,fill = REASON,)) + geom_col()
pie2 = raz_circ2 + coord_polar("y", start=0)
pie2

tmp_data_circ3<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cultural sites (historical monuments, museums, art galleries or archaeological sites)",QUANTILE == "3") 
raz_circ3 <-ggplot(tmp_data_circ3,aes(x=QUANTILE,y = RVALUE,fill = REASON,)) + geom_col()
pie3 = raz_circ3 + coord_polar("y", start=0)
pie3

tmp_data_circ4<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cultural sites (historical monuments, museums, art galleries or archaeological sites)",QUANTILE == "4") 
raz_circ4 <-ggplot(tmp_data_circ4,aes(x=QUANTILE,y = RVALUE,fill = REASON,)) + geom_col()
pie4 = raz_circ4 + coord_polar("y", start=0)
pie4

tmp_data_circ5<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cultural sites (historical monuments, museums, art galleries or archaeological sites)",QUANTILE == "5") 
raz_circ5 <-ggplot(tmp_data_circ5,aes(x=QUANTILE,y = RVALUE,fill = REASON,)) + geom_col()
pie5= raz_circ5 + coord_polar("y", start=0)
pie5
###################################################################################################################
###################################################################################################################
###################################################################################################################

tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Sports events",QUANTILE == "Total") 
raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
pie = raz_circ + coord_polar("y", start=0)
pie

tmp_data_circ1<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Sports events",QUANTILE == "1") 
raz_circ1 <-ggplot(tmp_data_circ1,aes(x=QUANTILE,y = RVALUE,fill = REASON,)) + geom_col()
pie1 = raz_circ1 + coord_polar("y", start=0)
pie1

tmp_data_circ2<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Sports events",QUANTILE == "2") 
raz_circ2 <-ggplot(tmp_data_circ2,aes(x=QUANTILE,y = RVALUE,fill = REASON,)) + geom_col()
pie2 = raz_circ2 + coord_polar("y", start=0)
pie2

tmp_data_circ3<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Sports events",QUANTILE == "3") 
raz_circ3 <-ggplot(tmp_data_circ3,aes(x=QUANTILE,y = RVALUE,fill = REASON,)) + geom_col()
pie3 = raz_circ3 + coord_polar("y", start=0)
pie3

tmp_data_circ4<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Sports events",QUANTILE == "4") 
raz_circ4 <-ggplot(tmp_data_circ4,aes(x=QUANTILE,y = RVALUE,fill = REASON,)) + geom_col()
pie4 = raz_circ4 + coord_polar("y", start=0)
pie4

tmp_data_circ5<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Sports events",QUANTILE == "5") 
raz_circ5 <-ggplot(tmp_data_circ5,aes(x=QUANTILE,y = RVALUE,fill = REASON,)) + geom_col()
pie5= raz_circ5 + coord_polar("y", start=0)
pie5
 

##################################################################################################


tmp_data_dens<- filter(Slika,Slika$HHTYP == "Total",DEG_URB != "Total",QUANTILE!= "Total",Slika$ACL00 == "Cinema") 
raz_dens<-ggplot(tmp_data_dens,aes(x=QUANTILE,y = DEG_URB,fill=TVALUE)) + geom_tile()
raz_dens

tmp_data_dens<- filter(Slika,Slika$HHTYP != "Total",DEG_URB == "Total",QUANTILE!= "Total",Slika$ACL00 == "Cinema") 
raz_dens<-ggplot(tmp_data_dens,aes(x=QUANTILE,y = HHTYP,fill=TVALUE)) + geom_tile()
raz_dens

tmp_data_dens<- filter(Slika,Slika$HHTYP != "Total",DEG_URB != "Total",QUANTILE== "Total",Slika$ACL00 == "Cinema") 
raz_dens<-ggplot(tmp_data_dens,aes(x=HHTYP,y = DEG_URB,fill=TVALUE)) + geom_tile()

pairs(Slika)


##################################################################################################
tmp_data_circ<- filter(Slika,Slika$HHTYP == "Households with dependent children",DEG_URB== "Total",Slika$ACL00 == "Sports events",QUANTILE == "Total") 
raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
pie = raz_circ + coord_polar("y", start=0)
pie


tmp_data_circ<- filter(Slika,Slika$HHTYP == "Households without dependent children",DEG_URB== "Total",Slika$ACL00 == "Sports events",QUANTILE == "Total") 
raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
pie = raz_circ + coord_polar("y", start=0)
pie


##===========================================================================================================
tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cinema",QUANTILE == "Total")
raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
pie1 = raz_circ + coord_polar("y", start=0)
pie1

tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Cities",Slika$ACL00 == "Cinema",QUANTILE == "Total") 
raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
pie3 = raz_circ + coord_polar("y", start=0)
pie3


tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Towns and suburbs",Slika$ACL00 == "Cinema",QUANTILE == "Total")
raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
pie0 = raz_circ + coord_polar("y", start=0)
pie0

tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Rural areas",Slika$ACL00 == "Cinema",QUANTILE == "Total") 
raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
pie2 = raz_circ + coord_polar("y", start=0)
pie2


#########################################)
tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cultural sites (historical monuments, museums, art galleries or archaeological sites)",QUANTILE == "Total")
raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
pie1 = raz_circ + coord_polar("y", start=0)
pie1

tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Rural areas",Slika$ACL00 == "Cultural sites (historical monuments, museums, art galleries or archaeological sites)",QUANTILE == "Total") 
raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
pie2 = raz_circ + coord_polar("y", start=0)
pie2

tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Towns and suburbs",Slika$ACL00 == "Cultural sites (historical monuments, museums, art galleries or archaeological sites)",QUANTILE == "Total")
raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
pie0 = raz_circ + coord_polar("y", start=0)
pie0

tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Cities",Slika$ACL00 == "Cultural sites (historical monuments, museums, art galleries or archaeological sites)",QUANTILE == "Total")
raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
pie3 = raz_circ + coord_polar("y", start=0)
pie3
#########################################)
tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Towns and suburbs",Slika$ACL00 == "Sports events",QUANTILE == "Total") raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()pie0 = raz_circ + coord_polar("y", start=0)pie0
tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Sports events",QUANTILE == "Total") raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()pie1 = raz_circ + coord_polar("y", start=0)pie1
tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Rural areas",Slika$ACL00 == "Sports events",QUANTILE == "Total") raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()pie2 = raz_circ + coord_polar("y", start=0)pie2
tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Cities",Slika$ACL00 == "Sports events",QUANTILE == "Total") raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()pie3 = raz_circ + coord_polar("y", start=0)pie3
#########################################)
tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Towns and suburbs",Slika$ACL00 == "Live performances (theatre, concerts, ballet)",QUANTILE == "Total") raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()pie0 = raz_circ + coord_polar("y", start=0)pie0
tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Live performances (theatre, concerts, ballet)",QUANTILE == "Total") raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()pie1 = raz_circ + coord_polar("y", start=0)pie1
tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Rural areas",Slika$ACL00 == "Live performances (theatre, concerts, ballet)",QUANTILE == "Total") raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()pie2 = raz_circ + coord_polar("y", start=0)pie2
tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Cities",Slika$ACL00 == "Live performances (theatre, concerts, ballet)",QUANTILE == "Total") raz_circ <-ggplot(tmp_data_circ,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()pie3 = raz_circ + coord_polar("y", start=0)pie3
#########################################)





>>>>>>> 2ff672199c36333ed29be0ccefa1e44ccdfc4957

