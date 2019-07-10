inf_1<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528analyze/190528summarise.csv"
inf_2<-24
out_1<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190701analyze/190701statistics.txt"


library(readxl)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(lmerTest)
library(lme4)



x<-read.csv(inf_1,header=T)

s1<-aov(mean~group*time,data=x)

summary(s1)

s2<-aov(mean~group*time+Error(X),data=x)
summary(s2)

model1<-glm(mean~group,data=x)
summary(model1)
model2<-glm(mean~group+time,data = x)
summary(model2)

model3<-lmer(mean~group+(1|time),data=x)
anova(model3)
summary(model3)
AIC(model3)



model4 <- lmer(mean~group*time+(1|X),data=x)
anova(model4)
summary(model4)
AIC(model4)

model5<-lmer(mean~group+time+group*time+(1|X),data=x)
anova(model5)
summary(model5)
AIC(model5)

model6<-lmer(mean~group+(1|time)+(1|X),data=x)
model7<-lmer(mean~group+(1|X),data=x)
model8<-lmer(mean~group+(1+group|time),data=x)
model9<-lmer(mean~time+(1|group),data=x)
model10<-lmer(mean~time+(1+time|group),data=x)
model11 <- lmer(mean~group*time+(1|X),data=x,REML=0)


anova(model3,model4,model5,model6,model7,model8,model9,model10,model11)

summary(model3)
step(model3)

t<-c(24,36,48,60)
n<-length(t)
out<-c()
for (i in 1:n) {
  x2<-x %>% dplyr::filter(time==t[i])
  #Bonfferoni検定
  inter1<-pairwise.t.test(x2$mean, x2$group, p.adj = "bonf")
  out<-append(out,inter1)
}
out
