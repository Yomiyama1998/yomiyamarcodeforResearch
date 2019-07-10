inf_1<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/"
inf_2<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528analyze/treat0hsummarise.csv"
inf_3<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528analyze/treat6hsummarise.csv"
inf_4<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528analyze/treat12hsummarise.csv"
inf_5<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528analyze/treat24hsummarise.csv"
inf_6<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528analyze/treat36hsummarise.csv"
inf_7<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528analyze/treat48hsummarise.csv"
inf_8<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528analyze/treat60hsummarise.csv"
inf_9<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528analyze/treat72hsummarise.csv"
inf_10<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528analyze/treat84hsummarise.csv"
inf_11<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528analyze/treat96hsummarise.csv"
out_f<-"/Users/yomiyama/Desktop/190528fluoresceanalysis/190528analyze/190528summarise.csv"

inffile<-c(inf_2,inf_3,inf_4,inf_5,inf_6,inf_7,inf_8,inf_9,inf_10,inf_11)
setwd(inf_1)
n<-length(inffile)
for (i in 1:n){
  assign(paste("x",i,sep=""),read.csv(inffile[i],header=T))
}
summarize<-rbind(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10)
write.csv(summarize,out_f)