inf_1<-"/Users/yomiyama/Desktop/190709analysis/190529cellarea/170709cellarea.csv"
out_f1<-"/Users/yomiyama/Desktop/190709analysis/190529cellarea/170709cellarea.png"

library(readxl)
library(tidyverse)
library(dplyr)
library(ggplot2)

x<-read.csv(inf_1,header=T)

x1<-x %>% filter(group=="WT") 

#########################

ggplot()+theme_set(theme_classic(base_size = 12,
                                 base_family="Hiragino Mincho Pro W3"))
g1<-ggplot(x1, aes(y=mean, x=time)) 

#折れ線グラフを描き入れる
g1<-g1+stat_summary(aes(group=condition), #種類ごとに
                    fun.y=mean,　#平均値を
                    geom="line",#線でつなげて
                    colour="black",#色は黒で
                    size=0.5)#先の太さは0.5mm)


#エラーバーの上から重ねて、点(マーク)を描き入れる
g1<-g1+stat_summary(aes(shape=condition),#種類ごとに点の形を変えて
                    fun.y=mean,#種類ごとの平均値のところに
                    geom="point",#点で
                    colour="black",
                    size=4)
#形の指定
g1<-g1+scale_shape_manual(values=c(1,23))#点の形を１番◯、１５番■、２３番◇にマニュアル変更

#エラーバーの追加
g1<-g1+stat_summary(aes(group=condition),#種類ごとに
                    fun.data=mean_sdl,#mean_seで標準誤差、#mean_cl_normalで95%信頼区間(正規分布)
                    geom="errorbar",
                    size=0.5,#線の太さ
                    width=0.1)#ぴょんって横に出てるアイツの幅

g1<-g1 + theme(plot.subtitle = element_text(vjust = 1), 
               plot.caption = element_text(vjust = 1), 
               axis.title = element_text(size = 30), 
               axis.text = element_text(size = 30, colour = "black"), 
               axis.text.x = element_text(size = 30), 
               axis.text.y = element_text(size = 30), 
               plot.title = element_text(size = 40, 
                                         face = "bold", hjust = 0.5), legend.text = element_text(size = 20), 
               legend.title = element_text(size = 20)) +labs(title = "Cell area at each time", x = "Time(hr)", 
                                                             y = expression(paste("Mean of Cell area (pixel"^"2",")")), 
                                                             shape = "Condition")

#########################################################################


x2<-x %>% filter(group=="KD") 

#########################

ggplot()+theme_set(theme_classic(base_size = 12,
                                 base_family="Hiragino Mincho Pro W3"))
g2<-ggplot(x2, aes(y=mean, x=time)) 

#折れ線グラフを描き入れる
g2<-g2+stat_summary(aes(group=condition), #種類ごとに
                    fun.y=mean,　#平均値を
                    geom="line",#線でつなげて
                    colour="black",#色は黒で
                    size=0.5)#先の太さは0.5mm)


#エラーバーの上から重ねて、点(マーク)を描き入れる
g2<-g2+stat_summary(aes(shape=condition),#種類ごとに点の形を変えて
                    fun.y=mean,#種類ごとの平均値のところに
                    geom="point",#点で
                    colour="black",
                    size=4)
#形の指定
g2<-g2+scale_shape_manual(values=c(1,23))#点の形を１番◯、１５番■、２３番◇にマニュアル変更

#エラーバーの追加
g2<-g2+stat_summary(aes(group=condition),#種類ごとに
                    fun.data=mean_sdl,#mean_seで標準誤差、#mean_cl_normalで95%信頼区間(正規分布)
                    geom="errorbar",
                    size=0.5,#線の太さ
                    width=0.1)#ぴょんって横に出てるアイツの幅

g2<-g2 + theme(plot.subtitle = element_text(vjust = 1), 
               plot.caption = element_text(vjust = 1), 
               axis.title = element_text(size = 30), 
               axis.text = element_text(size = 30, colour = "black"), 
               axis.text.x = element_text(size = 30), 
               axis.text.y = element_text(size = 30), 
               plot.title = element_text(size = 40, 
                                         face = "bold", hjust = 0.5), legend.text = element_text(size = 20), 
               legend.title = element_text(size = 20)) +labs(title = "Cell area at each time", x = "Time(hr)", 
                                                             y = expression(paste("Mean of Cell area (pixel"^"2",")")), 
                                                            shape = "Condition")

##########################################

x3<-x %>% filter(group=="Delta") 

#########################

ggplot()+theme_set(theme_classic(base_size = 12,
                                 base_family="Hiragino Mincho Pro W3"))
g3<-ggplot(x3, aes(y=mean, x=time)) 

#折れ線グラフを描き入れる
g3<-g3+stat_summary(aes(group=condition), #種類ごとに
                    fun.y=mean,　#平均値を
                    geom="line",#線でつなげて
                    colour="black",#色は黒で
                    size=0.5)#先の太さは0.5mm)


#エラーバーの上から重ねて、点(マーク)を描き入れる
g3<-g3+stat_summary(aes(shape=condition),#種類ごとに点の形を変えて
                    fun.y=mean,#種類ごとの平均値のところに
                    geom="point",#点で
                    colour="black",
                    size=4)
#形の指定
g3<-g3+scale_shape_manual(values=c(1,23))#点の形を１番◯、１５番■、２３番◇にマニュアル変更

#エラーバーの追加
g3<-g3+stat_summary(aes(group=condition),#種類ごとに
                    fun.data=mean_se,#mean_seで標準誤差、#mean_cl_normalで95%信頼区間(正規分布)
                    geom="errorbar",
                    size=0.5,#線の太さ
                    width=0.1)#ぴょんって横に出てるアイツの幅

g3<-g3 + theme(plot.subtitle = element_text(vjust = 1), 
               plot.caption = element_text(vjust = 1), 
               axis.title = element_text(size = 30), 
               axis.text = element_text(size = 30, colour = "black"), 
               axis.text.x = element_text(size = 30), 
               axis.text.y = element_text(size = 30), 
               plot.title = element_text(size = 40, 
                                         face = "bold", hjust = 0.5), legend.text = element_text(size = 20), 
               legend.title = element_text(size = 20)) +labs(title = "Cell area at each time", x = "Time(hr)", 
                                                             y = expression(paste("Mean of Cell area (pixel"^"2",")")), 
                                                             shape = "Condition")

############################################################################################

x4<-x %>% filter(condition=="Treat") 

#########################

ggplot()+theme_set(theme_classic(base_size = 12,
                                 base_family="Hiragino Mincho Pro W3"))
g4<-ggplot(x4, aes(y=mean, x=time)) 

#折れ線グラフを描き入れる
g4<-g4+stat_summary(aes(group=group), #種類ごとに
                    fun.y=mean,　#平均値を
                    geom="line",#線でつなげて
                    colour="black",#色は黒で
                    size=0.5)#先の太さは0.5mm)


#エラーバーの上から重ねて、点(マーク)を描き入れる
g4<-g4+stat_summary(aes(shape=group),#種類ごとに点の形を変えて
                    fun.y=mean,#種類ごとの平均値のところに
                    geom="point",#点で
                    colour="black",
                    size=4)
#形の指定
g4<-g4+scale_shape_manual(values=c(1,15,23))#点の形を１番◯、１５番■、２３番◇にマニュアル変更

#エラーバーの追加
g4<-g4+stat_summary(aes(group=group),#種類ごとに
                    fun.data=mean_se,#mean_seで標準誤差、#mean_cl_normalで95%信頼区間(正規分布)
                    geom="errorbar",
                    size=0.5,#線の太さ
                    width=0.1)#ぴょんって横に出てるアイツの幅

g4<-g4 + theme(plot.subtitle = element_text(vjust = 1), 
               plot.caption = element_text(vjust = 1), 
               axis.title = element_text(size = 30), 
               axis.text = element_text(size = 30, colour = "black"), 
               axis.text.x = element_text(size = 30), 
               axis.text.y = element_text(size = 30), 
               plot.title = element_text(size = 40, 
                                         face = "bold", hjust = 0.5), legend.text = element_text(size = 20), 
               legend.title = element_text(size = 20)) +labs(title = "Cell area at each time", x = "Time(hr)", 
                                                             y = expression(paste("Mean of Cell area (pixel"^"2",")")), 
                                                             shape = "group")


##################################################################

x5<-x %>% filter(condition=="Non") 

#########################

ggplot()+theme_set(theme_classic(base_size = 12,
                                 base_family="Hiragino Mincho Pro W3"))
g5<-ggplot(x5, aes(y=mean, x=time)) 

#折れ線グラフを描き入れる
g5<-g5+stat_summary(aes(group=group), #種類ごとに
                    fun.y=mean,　#平均値を
                    geom="line",#線でつなげて
                    colour="black",#色は黒で
                    size=0.5)#先の太さは0.5mm)


#エラーバーの上から重ねて、点(マーク)を描き入れる
g5<-g5+stat_summary(aes(shape=group),#種類ごとに点の形を変えて
                    fun.y=mean,#種類ごとの平均値のところに
                    geom="point",#点で
                    colour="black",
                    size=4)
#形の指定
g5<-g5+scale_shape_manual(values=c(1,15,23))#点の形を１番◯、１５番■、２３番◇にマニュアル変更

#エラーバーの追加
g5<-g5+stat_summary(aes(group=group),#種類ごとに
                    fun.data=mean_sdl,#mean_seで標準誤差、#mean_cl_normalで95%信頼区間(正規分布)
                    geom="errorbar",
                    size=0.5,#線の太さ
                    width=0.1)#ぴょんって横に出てるアイツの幅

g5<-g5 + theme(plot.subtitle = element_text(vjust = 1), 
               plot.caption = element_text(vjust = 1), 
               axis.title = element_text(size = 30), 
               axis.text = element_text(size = 30, colour = "black"), 
               axis.text.x = element_text(size = 30), 
               axis.text.y = element_text(size = 30), 
               plot.title = element_text(size = 40, 
                                         face = "bold", hjust = 0.5), legend.text = element_text(size = 20), 
               legend.title = element_text(size = 20)) +labs(title = "Cell area at each time", x = "Time(hr)", 
                                                             y = expression(paste("Mean of Cell area (pixel"^"2",")")), 
                                                             shape = "group")
