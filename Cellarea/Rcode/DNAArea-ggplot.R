inf_1<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528DNA-Area.csv"
out_1<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528DNA-Areamean.csv"
out_2<-"DNAmean.png"
out_3<-"DNA-Area.png"
  
library(readxl)
library(tidyverse)
library(dplyr)
library(ggplot2)

x<-read.csv(inf_1,header = T)
DNAmeanArea<-x$DNAmean/x$mean 
x1<-cbind(x,DNAmeanArea)

write.csv(x1,out_1)

ggplot()+theme_set(theme_classic(base_size = 12,
                                 base_family="Hiragino Mincho Pro W3"))

g1<-ggplot(x, aes(y=DNAmean, x=time)) 

#折れ線グラフを描き入れる
g1<-g1+stat_summary(aes(group=group), #種類ごとに
                    fun.y=mean,　#平均値を
                    geom="line",#線でつなげて
                    colour="black",#色は黒で
                    size=0.5)#先の太さは0.5mm


#エラーバーの追加
g1<-g1+stat_summary(aes(group=group),#種類ごとに
                    fun.data=mean_sdl,#mean_seで標準誤差、#mean_cl_normalで95%信頼区間(正規分布)
                    geom="errorbar",
                    size=0.5,#線の太さ
                    width=0.1)#ぴょんって横に出てるアイツの幅



#エラーバーの上から重ねて、点(マーク)を描き入れる
g1<-g1+stat_summary(aes(shape=group),#種類ごとに点の形を変えて
                    fun.y=mean,#種類ごとの平均値のところに
                    geom="point",#点で
                    colour="black",
                    size=4)
#形の指定
g1<-g1+scale_shape_manual(values=c(1,15,23))#点の形を１番◯、１５番■、２３番◇にマニュアル変更

ggsave(filename = out_2,plot=g1)


g2<-ggplot(x1, aes(y=DNAmeanArea, x=time)) 

#折れ線グラフを描き入れる
g2<-g2+stat_summary(aes(group=group), #種類ごとに
                    fun.y=mean,　#平均値を
                    geom="line",#線でつなげて
                    colour="black",#色は黒で
                    size=0.5)#先の太さは0.5mm


#エラーバーの追加
g2<-g2+stat_summary(aes(group=group),#種類ごとに
                    fun.data=mean_sdl,#mean_seで標準誤差、#mean_cl_normalで95%信頼区間(正規分布)
                    geom="errorbar",
                    size=0.5,#線の太さ
                    width=0.1)#ぴょんって横に出てるアイツの幅



#エラーバーの上から重ねて、点(マーク)を描き入れる
g2<-g2+stat_summary(aes(shape=group),#種類ごとに点の形を変えて
                    fun.y=mean,#種類ごとの平均値のところに
                    geom="point",#点で
                    colour="black",
                    size=4)
#形の指定
g2<-g2+scale_shape_manual(values=c(1,15,23))#点の形を１番◯、１５番■、２３番◇にマニュアル変更

ggsave(filename = out_3,plot=g2)

