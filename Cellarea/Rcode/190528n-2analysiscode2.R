inf_1<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/treat36h"
out_f<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/treat36h.csv"
setwd(inf_1)

files <- list.files()
#「.csv」拡張子を持つファイルをリストアップ
tab <- lapply(list.files(pattern=".csv"), read.csv)

##############
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

#WT
WT1a<-rbind(WT1,WT2)
a1<-nrow(WT1a)
group<-rep("WT",a1)
number<-rep("n1",a1)
WT1b<-cbind(WT1a,group,number)
WT2a<-rbind(WT3,WT4)
a2<-nrow(WT2a)
group<-rep("WT",a2)
number<-rep("n2",a2)
WT2b<-cbind(WT2a,group,number)
WT3a<-rbind(WT5,WT6)
a3<-nrow(WT3a)
group<-rep("WT",a3)
number<-rep("n3",a3)
WT3b<-cbind(WT3a,group,number)
WTh<-rbind(WT1b,WT2b,WT3b)

#KD
KD1a<-rbind(KD1,KD2)
a1<-nrow(KD1a)
group<-rep("KD",a1)
number<-rep("n1",a1)
KD1b<-cbind(KD1a,group,number)
KD2a<-rbind(KD3,KD4)
a2<-nrow(KD2a)
group<-rep("KD",a2)
number<-rep("n2",a2)
KD2b<-cbind(KD2a,group,number)
KD3a<-rbind(KD5,KD6)
a3<-nrow(KD3a)
group<-rep("KD",a3)
number<-rep("n3",a3)
KD3b<-cbind(KD3a,group,number)
KDh<-rbind(KD1b,KD2b,KD3b)

#Delta##

Delta1a<-rbind(Delta1,Delta2)
a1<-nrow(Delta1a)
group<-rep("Delta",a1)
number<-rep("n1",a1)
Delta1b<-cbind(Delta1a,group,number)
Delta2a<-rbind(Delta3,Delta4)
a2<-nrow(Delta2a)
group<-rep("Delta",a2)
number<-rep("n2",a2)
Delta2b<-cbind(Delta2a,group,number)
Delta3a<-rbind(Delta5,Delta6)
a3<-nrow(Delta3a)
group<-rep("Delta",a3)
number<-rep("n3",a3)
Delta3b<-cbind(Delta3a,group,number)
Deltah<-rbind(Delta1b,Delta2b,Delta3b)

treath<-rbind(WTh,KDh,Deltah)


################################





write.csv(treath,file=out_f)