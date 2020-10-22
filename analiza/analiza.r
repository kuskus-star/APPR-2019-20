# 4. faza: Analiza podatkov
#Clusters


data(World)
world<-world[world$world]
#na hitro preverimo optimalno količino skupin 
#imamo 2-3 grupe
k<-list()
for (i in 1:6){
  k[[i]]<-kmeans(tmp_data$Value,i)
}
betweenss_totss<-list()
for (i in 1:6){
  betweenss_totss[i]<-k[[i]]$betweenss/k[[i]]$totss
}
plot(1:6,betweenss_totss,type="b",xlab="K")

km=kmeans(tmp_data$Value,3)
km$cluster

km=kmeans(tmp_data$Value,2)
km$cluster
# zemljevid za 3 grupe
Neudelezevanje_Sport <-filter(Neudelezevanje_15,Neudelezevanje_15$ACL00=="Športni dogodki") 
tmp_data<-filter(Neudelezevanje_15,Neudelezevanje_15$QUANTILE=="Total",Neudelezevanje_15$ACL00=="Športni dogodki")
tmp_data$ACL00= NULL
tmp_data$QUANTILE=NULL
tmp_data$cluster<- km$cluster
zemljevid_sport <- tm_shape(merge(svet, tmp_data, by.x = "NAME", by.y = "GEO"),bbox = bb(c(-11,33,36,68))) + 
  tm_fill(col = "cluster", contrast = 1, palette = "YlOrRd", title = "Neudelezevanje",colorNA = "Grey", textNA = "Manjkajoči podatki") +
  tm_layout(legend.outside = TRUE)
zemljevid_sport 

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
plot(1:6,betweenss_totss,type="b",xlab="K")

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
plot(1:6,betweenss_totss,type="b",xlab="K")
#imamo torej 2-3 skupine
Neudelezevanje_15$cluster_2  <- kmeans(Neudelezevanje_15$Value,2)$cluster
# prelomnica je 58
Neudelezevanje_15$cluster_2  <- NULL

Neudelezevanje_15$cluster_3  <- kmeans(Neudelezevanje_15$Value,3)$cluster
#prelomnici sta 46 in 
Neudelezevanje_15$cluster_3 <-NULL

tmp_data <- filter(Slika,Slika$REASON=="None in the neighbourhood",Slika$ACL00=="Kino",Slika$QUANTILE != "Celotna populacija")
boxplot(tmp_data$TVALUE ~ tmp_data$QUANTILE,dataset = tmp_data,col = "orange")

tmp_data <- filter(Slika,Slika$REASON=="Financial reasons",Slika$ACL00=="Športni dogodki",Slika$QUANTILE != "Celotna populacija")
boxplot(tmp_data$TVALUE ~ tmp_data$QUANTILE,dataset = tmp_data,col = "blue")

tmp_data <- filter(Slika,Slika$REASON=="None in the neighbourhood",Slika$ACL00=="Športni dogodki",Slika$QUANTILE != "Celotna populacija")
boxplot(tmp_data$TVALUE ~ tmp_data$QUANTILE,dataset = tmp_data,col = "pink")