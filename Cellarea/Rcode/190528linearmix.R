inf_1<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528DNA-Areamean.csv"
out_f<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528DNA-Areameanoutcom.csv"

param1<-72          #time
param2<-DNAmeanArea #従属変数
param3<-group

library(lme4)
library(lmerTest)
x<-read.csv(inf_1,header = T)
DNAMean<-x$DNAmean
Area<-x$mean
Group<-x$group
time<-x$time
m<-lmer(DNAMean ~ Group+time+Area+(Group|time)+time*Area)
summary(m)
AIC(m)