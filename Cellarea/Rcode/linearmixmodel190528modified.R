inf_1<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528DNA-Areamean.csv"
out_f

library(lme4)
library(lmerTest)
x<-read.csv(inf_1,header = T)
DNAmean<-x$DNAmean
Time<-x$time
Area<-x$mean
Group<-x$group
m<- lmer(DNAmean ~ mean+ time + (1|group),
         data=x,)
summary(m)
AIC(m)
