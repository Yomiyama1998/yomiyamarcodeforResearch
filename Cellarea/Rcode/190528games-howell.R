inf_1<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528DNA-Areamean.csv"
out_f<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528DNA-Areameanoutcom.csv"

param1<-72          #time
param2<- DNAmeanArea #従属変数
param3<- group


library(readxl)
library(tidyverse)
library(dplyr)
library(ggplot2)

x<-read.csv(file = inf_1,header=T)
x1<- x %>% filter(time==param1)
str(x1)
attach(x1)
by(param2,param3,summary)
summary(aov(param2~param3))
bartlett.test(param2~param3)
source("http://aoki2.si.gunma-u.ac.jp/R/src/tukey.R", encoding="euc-jp")
tukey(param2,param3, method="G")
write.csv(tukey(param2,param3, method="G"), file=out_f)
