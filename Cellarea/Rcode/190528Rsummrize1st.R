inf_1<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/treat96h.csv"
inf_2<-96
out_f<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/treat96hsummarise.csv"


library(readxl)
library(tidyverse)
library(dplyr)
library(ggplot2)
x<-read.csv(inf_1,header=T)
# WT
WT1<- x %>% filter(group=="WT") %>%filter(number=="n1")%>% summarize(median=median(Area),mean=mean(Area))
WT2<- x %>% filter(group=="WT") %>%filter(number=="n2")%>% summarize(median=median(Area),mean=mean(Area))
WT3<- x %>% filter(group=="WT") %>%filter(number=="n3")%>% summarize(median=median(Area),mean=mean(Area))
WT<-rbind(WT1,WT2,WT3)

#KD

KD1<- x %>% filter(group=="KD") %>%filter(number=="n1")%>% summarize(median=median(Area),mean=mean(Area))
KD2<- x %>% filter(group=="KD") %>%filter(number=="n2")%>% summarize(median=median(Area),mean=mean(Area))
KD3<- x %>% filter(group=="KD") %>%filter(number=="n3")%>% summarize(median=median(Area),mean=mean(Area))
KD<-rbind(KD1,KD2,KD3)

#Delta

Delta1<- x %>% filter(group=="Delta") %>%filter(number=="n1")%>% summarize(median=median(Area),mean=mean(Area))
Delta2<- x %>% filter(group=="Delta") %>%filter(number=="n2")%>% summarize(median=median(Area),mean=mean(Area))
Delta3<- x %>% filter(group=="Delta") %>%filter(number=="n3")%>% summarize(median=median(Area),mean=mean(Area))
Delta<-rbind(Delta1,Delta2,Delta3)

summarize<-rbind(WT,KD,Delta)
n<-nrow(summarize)
group<-rep(c("WT","KD","Delta"),each=3)
time<-rep(inf_2,n)
summarise<-cbind(summarize,group,time)
write.csv(summarise,file=out_f)
