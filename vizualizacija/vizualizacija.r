# 3.faza: Vizualizacija podatkov

tmp_data1 <- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cinema")
tmp_data2 <- filter(Slika,Slika$QUANTILE == "Total",DEG_URB== "Total",Slika$ACL00 == "Cinema")
tmp_data3 <- filter(Slika,Slika$QUANTILE == "Total",HHTYP== "Total",Slika$ACL00 == "Cinema")
tmp_data3$DEG_URB<- factor(tmp_data3$DEG_URB,levels = c("Cities","Towns and suburbs","Rural areas","Total"))

tmp_data1s <- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cinema")
tmp_data2s <- filter(Slika,Slika$QUANTILE == "Total",DEG_URB== "Total",Slika$ACL00 == "Cinema")
tmp_data3s <- filter(Slika,Slika$QUANTILE == "Total",HHTYP== "Total",Slika$ACL00 == "Cinema")
tmp_data3s$DEG_URB<- factor(tmp_data3$DEG_URB,levels = c("Cities","Towns and suburbs","Rural areas","Total"))


raz1<-ggplot(tmp_data1,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
neud1<- ggplot(tmp_data1,aes(x=QUANTILE,y = NVALUE/4)) +geom_col()
raz2<-ggplot(tmp_data2,aes(x=HHTYP,y = TVALUE,fill = REASON,)) + geom_col()
neud2<-ggplot(tmp_data2,aes(x=HHTYP,y = NVALUE/4)) +geom_col()
raz3<-ggplot(tmp_data3,aes(x=DEG_URB,y = TVALUE,fill = REASON,)) + geom_col()
neud3 <- ggplot(tmp_data3,aes(x=DEG_URB,y = NVALUE/4)) +geom_col()

raz1
raz2
raz3

neud1
neud2
neud3

######################################################################################################################

tmp_data_circ<- filter(Slika,Slika$HHTYP == "Total",DEG_URB== "Total",Slika$ACL00 == "Cinema",QUANTILE == "Total") 
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






