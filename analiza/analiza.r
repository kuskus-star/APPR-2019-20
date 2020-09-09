# 4. faza: Analiza podatkov
#Clusters


data(World)
world<-world[world$world]
#na hitro preverimo optimalno količino skupin 
#imamo 2-3 grupe
tmap_mode("view")
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
Neudelezevanje_Sport <-filter(Neudelezevanje_15,Neudelezevanje_15$ACL00=="Sports events") 


# zemljevid


tmap_options (bg.color = "#63def3")
tmp_data<-filter(Neudelezevanje_15,Neudelezevanje_15$QUANTILE=="Total",Neudelezevanje_15$ACL00=="Sports events",bbox = bbox_new)
tmp_data$ACL00= NULL
tmp_data$QUANTILE=NULL
tmp_data$cluster<- km$cluster
zemljevid_sport <- tm_shape(merge(svet, tmp_data, by.x = "NAME", by.y = "GEO",)) + 
  tm_fill(col = "cluster", contrast = 1, palette = "YlOrRd", title = "Neudelezeanje",colorNA = "Grey", textNA = "Manjkajoči podatki") +
  tm_layout(legend.outside = TRUE)
zemljevid_sport 
