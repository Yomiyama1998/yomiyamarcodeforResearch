inf_1<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528summarise.csv"
out_f

library(lme4)
library(lmerTest)
x<-read.csv(inf_1,header = T)
Mean<-x$mean
Group<-x$group
time<-x$time
m<-lmer(Mean ~ Group+time+(Group|time))
summary(m)
AIC(m)
