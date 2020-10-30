# 4. faza: Analiza podatkov
#Clusters
#na hitro preverimo optimalno količino skupin 
#imamo 2-3 grupe

# zemljevid za 3 grupe

tmp_data<-filter(Neudelezevanje_15,Neudelezevanje_15$QUANTILE=="Celotna populacija",Neudelezevanje_15$ACL00=="Športni dogodki")
tmp_data$ACL00= NULL
tmp_data$QUANTILE=NULL
k<-list()
for (i in 1:6){
  k[[i]]<-kmeans(tmp_data$Value,i)
}
betweenss_totss<-list()
for (i in 1:6){
  betweenss_totss[i]<-k[[i]]$betweenss/k[[i]]$totss
}


km3=kmeans(tmp_data$Value,3)
km2=kmeans(tmp_data$Value,2) 

zemljevid_sport <- tm_shape(merge(svet, tmp_data, by.x = "NAME", by.y = "GEO"),bbox = bb(c(-11,33,36,68))) + 
  tm_fill(col = "Value", contrast = 1, palette = "YlOrRd", title = "Neudelezevanje šport", breaks = c(15,56 ,71.8,97),colorNA = "Grey", textNA = "Manjkajoči podatki") +
  tm_layout(legend.outside = TRUE)
zemljevid_sport 

Neudelezevanje_Sport <-filter(Neudelezevanje_15,Neudelezevanje_15$ACL00=="Športni dogodki") 
NMn <-filter(Slika,ACL00=="Muzeji in galerije",QUANTILE =="Celotna populacija",REASON=="No interest") 
NMn <-merge.data.frame(NMn,GDP,by="GEO")
NMn<-NMn[order(NMn$BDP),]
###########################
NMF <-filter(Slika,ACL00=="Muzeji in galerije",QUANTILE =="Celotna populacija",REASON=="Financial reasons") 
NMF <-merge.data.frame(NMF,GDP,by="GEO")
NMF <-NMF[order(NMF$BDP),]
#poskusil bi razvrstiti u grupe povseh kvintilih


km=kmeans(Neudelezevanje_Sport$Value,2)
k<-list()
for (i in 1:6){
  k[[i]]<-kmeans(Neudelezevanje_Sport$Value,i)
}
betweenss_totss<-list()
for (i in 1:6){
  betweenss_totss[i]<-k[[i]]$betweenss/k[[i]]$totss
}


#3 skupine so ptimalne  
Neudelezevanje_Sport$cluster <- kmeans(Neudelezevanje_Sport$Value,3)$cluster
#dobimo meji 56 in 71.8 vstavim ju v shiny sliko

k<-list()
for (i in 1:6){
  k[[i]]<-kmeans(Neudelezevanje_15$Value,i)
}
betweenss_totss<-list()
for (i in 1:6){
  betweenss_totss[i]<-k[[i]]$betweenss/k[[i]]$totss
}
#imamo torej 2-3 skupine
Neudelezevanje_15$cluster_2  <- kmeans(Neudelezevanje_15$Value,2)$cluster
# prelomnica je 58
Neudelezevanje_15$cluster_2  <- NULL

Neudelezevanje_15$cluster_3  <- kmeans(Neudelezevanje_15$Value,3)$cluster
#prelomnici sta 46 in 
Neudelezevanje_15$cluster_3 <-NULL

m1n<-lm(NMn$TVALUE ~ NMn$BDP)
m2n<-lm(TVALUE ~ poly(BDP,2),data=NMn)
#m1n razloži večino šuma , je pa pomembno in zanimivo opaziti da m2 predvidi povečanje zanimanja z dovolj niskim BDPjem
razmerje_ned<-ggplot(data=NMn,aes(x=BDP,y=TVALUE))+geom_point()+
  geom_line(aes(x=BDP,y=predict(m1n)),col="red")+ ylab("%") +
  ggtitle("Nezanimanje")
razmerje_ned





NMF$BDP2 <- NMF$BDP^2
NMF$BDP3 <- NMF$BDP2^3

m1<-lm(NMF$TVALUE ~ NMF$BDP)
m2<-lm(TVALUE ~ poly(BDP,2),data=NMF)
#m2 še vedno opčutno poveča kavaliteto modela torej bomo tu izrisali kvadratično
m3<-lm(NMF$TVALUE ~ NMF$BDP + NMF$BDP2 +NMF$BDP3)
razmerje_fin<-ggplot(data=NMF,aes(x=BDP,y=TVALUE))+geom_point()+
geom_line(aes(x=BDP,y=predict(m2)),col="red")+ ylab("%") +
  ggtitle("Finančna nedostopnost")
razmerje_fin


