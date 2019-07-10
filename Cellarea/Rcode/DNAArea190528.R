inf_1<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190525VirusDNA.csv"
inf_2<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528summarise.csv"
out_f<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528DNA-Area.csv"


library(readxl)
library(tidyverse)
library(dplyr)
library(ggplot2)

x<-read.csv(inf_1,header=T)
y<-read.csv(inf_2,heade=T)
x<-na.omit(x)
comp<-25/((200/220)*0.2)*20
VirusDNAcomp<-x$VirusDNA*comp
x<-cbind(x,VirusDNAcomp)

#24h

#WT
WT1<- x %>% filter(group=="WT") %>%filter(number=="n1")%>%filter(time==24)  %>%summarize(DNAmean=mean(VirusDNAcomp))
WT2<- x %>% filter(group=="WT") %>%filter(number=="n2")%>% filter(time==24) %>%summarize(DNAmean=mean(VirusDNAcomp))
WT3<- x %>% filter(group=="WT") %>%filter(number=="n3")%>% filter(time==24)%>%summarize(DNAmean=mean(VirusDNAcomp))
WT24h<-rbind(WT1,WT2,WT3)

#KD
KD1<- x %>% filter(group=="KD") %>%filter(number=="n1")%>% filter(time==24) %>% summarize(DNAmean=mean(VirusDNAcomp))
KD2<- x %>% filter(group=="KD") %>%filter(number=="n2")%>% filter(time==24) %>% summarize(DNAmean=mean(VirusDNAcomp))
KD3<- x %>% filter(group=="KD") %>%filter(number=="n3")%>% filter(time==24) %>% summarize(DNAmean=mean(VirusDNAcomp))
KD24h<-rbind(KD1,KD2,KD3)

#Delta
Delta1<- x %>% filter(group=="Delta") %>%filter(number=="n1")%>% filter(time==24) %>% summarize(DNAmean=mean(VirusDNAcomp))
Delta2<- x %>% filter(group=="Delta") %>%filter(number=="n2")%>% filter(time==24) %>% summarize(DNAmean=mean(VirusDNAcomp))
Delta3<- x %>% filter(group=="Delta") %>%filter(number=="n3")%>% filter(time==24) %>% summarize(DNAmean=mean(VirusDNAcomp))
Delta24h<-rbind(Delta1,Delta2,Delta3)

G24h<-rbind(WT24h,KD24h,Delta24h)

#48h

#WT
WT1<- x %>% filter(group=="WT") %>%filter(number=="n1")%>%filter(time==48)  %>%summarize(DNAmean=mean(VirusDNAcomp))
WT2<- x %>% filter(group=="WT") %>%filter(number=="n2")%>% filter(time==48) %>%summarize(DNAmean=mean(VirusDNAcomp))
WT3<- x %>% filter(group=="WT") %>%filter(number=="n3")%>% filter(time==48)%>%summarize(DNAmean=mean(VirusDNAcomp))
WT48h<-rbind(WT1,WT2,WT3)

#KD
KD1<- x %>% filter(group=="KD") %>%filter(number=="n1")%>% filter(time==48) %>% summarize(DNAmean=mean(VirusDNAcomp))
KD2<- x %>% filter(group=="KD") %>%filter(number=="n2")%>% filter(time==48) %>% summarize(DNAmean=mean(VirusDNAcomp))
KD3<- x %>% filter(group=="KD") %>%filter(number=="n3")%>% filter(time==48) %>% summarize(DNAmean=mean(VirusDNAcomp))
KD48h<-rbind(KD1,KD2,KD3)

#Delta
Delta1<- x %>% filter(group=="Delta") %>%filter(number=="n1")%>% filter(time==48) %>% summarize(DNAmean=mean(VirusDNAcomp))
Delta2<- x %>% filter(group=="Delta") %>%filter(number=="n2")%>% filter(time==48) %>% summarize(DNAmean=mean(VirusDNAcomp))
Delta3<- x %>% filter(group=="Delta") %>%filter(number=="n3")%>% filter(time==48) %>% summarize(DNAmean=mean(VirusDNAcomp))
Delta48h<-rbind(Delta1,Delta2,Delta3)

G48h<-rbind(WT48h,KD48h,Delta48h)

#72h

#WT
WT1<- x %>% filter(group=="WT") %>%filter(number=="n1")%>%filter(time==72)  %>%summarize(DNAmean=mean(VirusDNAcomp))
WT2<- x %>% filter(group=="WT") %>%filter(number=="n2")%>% filter(time==72) %>%summarize(DNAmean=mean(VirusDNAcomp))
WT3<- x %>% filter(group=="WT") %>%filter(number=="n3")%>% filter(time==72)%>%summarize(DNAmean=mean(VirusDNAcomp))
WT72h<-rbind(WT1,WT2,WT3)

#KD
KD1<- x %>% filter(group=="KD") %>%filter(number=="n1")%>% filter(time==72) %>% summarize(DNAmean=mean(VirusDNAcomp))
KD2<- x %>% filter(group=="KD") %>%filter(number=="n2")%>% filter(time==72) %>% summarize(DNAmean=mean(VirusDNAcomp))
KD3<- x %>% filter(group=="KD") %>%filter(number=="n3")%>% filter(time==72) %>% summarize(DNAmean=mean(VirusDNAcomp))
KD72h<-rbind(KD1,KD2,KD3)

#Delta
Delta1<- x %>% filter(group=="Delta") %>%filter(number=="n1")%>% filter(time==72) %>% summarize(DNAmean=mean(VirusDNAcomp))
Delta2<- x %>% filter(group=="Delta") %>%filter(number=="n2")%>% filter(time==72) %>% summarize(DNAmean=mean(VirusDNAcomp))
Delta3<- x %>% filter(group=="Delta") %>%filter(number=="n3")%>% filter(time==72) %>% summarize(DNAmean=mean(VirusDNAcomp))
Delta72h<-rbind(Delta1,Delta2,Delta3)

G72h<-rbind(WT72h,KD72h,Delta72h)

#96h

#WT
WT1<- x %>% filter(group=="WT") %>%filter(number=="n1")%>%filter(time==96)  %>%summarize(DNAmean=mean(VirusDNAcomp))
WT2<- x %>% filter(group=="WT") %>%filter(number=="n2")%>% filter(time==96) %>%summarize(DNAmean=mean(VirusDNAcomp))
WT3<- x %>% filter(group=="WT") %>%filter(number=="n3")%>% filter(time==96)%>%summarize(DNAmean=mean(VirusDNAcomp))
WT96h<-rbind(WT1,WT2,WT3)

#KD
KD1<- x %>% filter(group=="KD") %>%filter(number=="n1")%>% filter(time==96) %>% summarize(DNAmean=mean(VirusDNAcomp))
KD2<- x %>% filter(group=="KD") %>%filter(number=="n2")%>% filter(time==96) %>% summarize(DNAmean=mean(VirusDNAcomp))
KD3<- x %>% filter(group=="KD") %>%filter(number=="n3")%>% filter(time==96) %>% summarize(DNAmean=mean(VirusDNAcomp))
KD96h<-rbind(KD1,KD2,KD3)

#Delta
Delta1<- x %>% filter(group=="Delta") %>%filter(number=="n1")%>% filter(time==96) %>% summarize(DNAmean=mean(VirusDNAcomp))
Delta2<- x %>% filter(group=="Delta") %>%filter(number=="n2")%>% filter(time==96) %>% summarize(DNAmean=mean(VirusDNAcomp))
Delta3<- x %>% filter(group=="Delta") %>%filter(number=="n3")%>% filter(time==96) %>% summarize(DNAmean=mean(VirusDNAcomp))
Delta96h<-rbind(Delta1,Delta2,Delta3)

G96h<-rbind(WT96h,KD96h,Delta96h)

G<-rbind(G24h,G48h,G72h,G96h)
y1<- y %>% filter(time==24|time==48|time==72|time==96)
DNAArea<-cbind(y1,G)
write.csv(DNAArea,out_f)