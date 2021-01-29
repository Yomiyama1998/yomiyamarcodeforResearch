inf<-"/Users/yomiyama/Desktop/190709analysis/190702cellarea/"
out_f1<-"/Users/yomiyama/Desktop/190709analysis/190702cellarea/170711cellarea-0sort.csv"
minimum<-0
l<-1148.0279/250


library(readxl)
library(tidyverse)
library(dplyr)
library(ggplot2)

x<-c("0","6","12","24","36","48","60","72","84","96")
len<-length(x)

for (j in 1:len) {
  inf_1<-paste(inf,x[j],"hgroup.csv",sep="")
 
######################################################### 

y<-read.csv(inf_1,header=T)

a<-l^2

Area2<-y$Area/a


y<-cbind(y,Area2)

#########################################################


y1<- y %>% filter(condition=="non") %>% filter(Area2>=minimum)

# WT
WT1<- y1 %>% filter(group=="WT") %>% filter(number=="n1") %>% summarize(median=median(Area2),mean=mean(Area2))
WT2<- y1 %>% filter(group=="WT") %>% filter(number=="n2") %>% summarize(median=median(Area2),mean=mean(Area2))
WT3<- y1 %>% filter(group=="WT") %>% filter(number=="n3") %>% summarize(median=median(Area2),mean=mean(Area2))
WT<-rbind(WT1,WT2,WT3)

#KD

KD1<- y1 %>% filter(group=="KD") %>%filter(number=="n1")%>% summarize(median=median(Area2),mean=mean(Area2))
KD2<- y1 %>% filter(group=="KD") %>%filter(number=="n2")%>% summarize(median=median(Area2),mean=mean(Area2))
KD3<- y1 %>% filter(group=="KD") %>%filter(number=="n3")%>% summarize(median=median(Area2),mean=mean(Area2))
KD<-rbind(KD1,KD2,KD3)

#Delta

Delta1<- y1 %>% filter(group=="Delta") %>%filter(number=="n1")%>%  summarize(median=median(Area2),mean=mean(Area2))
Delta2<- y1 %>% filter(group=="Delta") %>%filter(number=="n2")%>%  summarize(median=median(Area2),mean=mean(Area2))
Delta3<- y1 %>% filter(group=="Delta") %>%filter(number=="n3")%>%  summarize(median=median(Area2),mean=mean(Area2))
Delta<-rbind(Delta1,Delta2,Delta3)

summ1<-rbind(WT,KD,Delta)
group<-rep(c("WT","KD","Delta"),each=3)
condition <- rep("Non",9)
Non<-cbind(group,condition,summ1)

###################################################

#########################################################


y2<- y %>% filter(condition=="treat") %>% filter(Area2>=minimum)

# WT
WT1<- y2 %>% filter(group=="WT") %>% filter(number=="n1")%>% summarize(median=median(Area2),mean=mean(Area2))
WT2<- y2 %>% filter(group=="WT") %>% filter(number=="n2")%>% summarize(median=median(Area2),mean=mean(Area2))
WT3<- y2 %>% filter(group=="WT") %>% filter(number=="n3")%>% summarize(median=median(Area2),mean=mean(Area2))
WT<-rbind(WT1,WT2,WT3)

#KD

KD1<- y2 %>% filter(group=="KD") %>%filter(number=="n1")%>% summarize(median=median(Area2),mean=mean(Area2))
KD2<- y2 %>% filter(group=="KD") %>%filter(number=="n2")%>% summarize(median=median(Area2),mean=mean(Area2))
KD3<- y2 %>% filter(group=="KD") %>%filter(number=="n3")%>% summarize(median=median(Area2),mean=mean(Area2))
KD<-rbind(KD1,KD2,KD3)

#Delta

Delta1<- y2 %>% filter(group=="Delta") %>%filter(number=="n1") %>% summarize(median=median(Area2),mean=mean(Area2))
Delta2<- y2 %>% filter(group=="Delta") %>%filter(number=="n2") %>% summarize(median=median(Area2),mean=mean(Area2))
Delta3<- y2 %>% filter(group=="Delta") %>%filter(number=="n3") %>% summarize(median=median(Area2),mean=mean(Area2))
Delta<-rbind(Delta1,Delta2,Delta3)

summ2<-rbind(WT,KD,Delta)
group<-rep(c("WT","KD","Delta"),each=3)
condition <- rep("Treat",9)
Treat<-cbind(group,condition,summ2)
###################################################


summ3<-rbind(Non,Treat)
n<-nrow(summ3)
time<-rep(x[j],n)
summ4<-cbind(summ3,time)

assign(paste("Cellarea",x[j],sep=""),summ4)

########################################################################

}


out1<-rbind(Cellarea0,Cellarea6,Cellarea12,Cellarea24,Cellarea36,Cellarea48,Cellarea60,Cellarea72,Cellarea84,Cellarea96)

write.csv(out1,file=out_f1)