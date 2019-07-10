inf_1<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/treat24h"
setwd(inf_1)
files <- list.files()
#「.csv」拡張子を持つファイルをリストアップ
tab <- lapply(list.files(pattern=".csv"), read.csv)
wt<- grep("wt", files)
n<-length(wt)
for (i in 1:n){
  k<-wt[i]
  assign(paste("WT",i,sep=""),data.frame(tab[k]))
  # 
  # データ処理
  #
}
kd<- grep("KD", files)
n<-length(kd)
for (i in 1:n){
  k<-kd[i]
  assign(paste("KD",i,sep=""),data.frame(tab[k]))
  # 
  # データ処理
  #
}
delta<- grep("Delta", files)
n<-length(delta)
for (i in 1:n){
  k<-delta[i]
  assign(paste("Delta",i,sep=""),data.frame(tab[k]))
  # 
  # データ処理
  #
}


