inf_1<-"/Users/yomiyama/Desktop/190709analysis/190529cellarea/170709cellarea.csv"
inf_2<-"/Users/yomiyama/Desktop/190709analysis/190702cellarea/170711cellarea.csv"
out_f<-"/Users/yomiyama/Desktop/190709analysis/190702cellarea/170711cellareaindependent.csv"

x<-c(inf_1,inf_2)
leng<-length(x)

for (i in 1:leng){
  
inf<-read.csv(x[i],header=TRUE)

th<-c("0","6","12","24","36","48","60","72","84","96")
tn<-length(th)

for (j in 1:tn) {
  
g<-inf %>% filter(time==th[j])

condition2<-c("Non","Treat")
time2<-th[j]


g1<-g %>% filter(condition =="Non") %>% group_by(group) %>% 
  summarise(median = mean(median, na.rm = TRUE),mean = mean(mean, na.rm = TRUE)) 
g2<-g %>% filter(condition =="Treat") %>% group_by(group) %>% 
  summarise(median = mean(median, na.rm = TRUE),mean = mean(mean, na.rm = TRUE)) 
g3<-rbind(g1,g2)

gn<-length(g3)

condition<-rep(condition2,each=gn)
time <-rep(time2,each=gn)
g4<-cbind(g3,condition,time)
 assign(paste("time",th[j],sep=""),g4)
}
g5<-rbind(time0,time6,time12,time24,time36,time48,time60,time72,time84,time96)

assign(paste("n",i,sep=""),g5)
}

g6<-rbind(n1,n2)

n1length<-nrow(n1)
n2length<-nrow(n2)

kaisu<- rep(c("1","2"),times=c(n1length,n2length))

g7<-cbind(g6,kaisu)

write.csv(g7,file=out_f)

