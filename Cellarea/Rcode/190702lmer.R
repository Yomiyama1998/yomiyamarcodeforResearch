inf_1<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528analyze/190528summarise.csv"
inf_2<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190525VirusDNA.csv"

library(readxl)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(lmerTest)
library(lme4)
library(car)


y1<-read.csv(inf_1,header=T)
y2<-read.csv(inf_2,header=T)
y2<-na.omit(y2)
Area<-y1 %>% dplyr::filter(time=="24"|time=="48"|time=="72"|time=="96")
DNA<-y2 %>% dplyr::select(VirusDNA)

y3<-data.frame(cbind(Area,DNA))

model12<- lmer(mean~group+VirusDNA+(1|time),data=y3)
model13<-lmer(mean~group+time+VirusDNA+(1|X),data=y3)

model14<-lmer(mean~group+VirusDNA+(1+VirusDNA|time),data=y3)
Anova