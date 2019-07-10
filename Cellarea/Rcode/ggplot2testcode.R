
###################################################################
#折れ線グラフ
###################################################################
#"グラフフォントサイズ12pt",”日本語表示HiraginoMinchoProW3”を初期設定する
#theme_classicが論文用の図に最も近いスタイルなので、これを基本とする
ggplot()+theme_set(theme_classic(base_size = 12,base_family="Hiragino Mincho Pro W3"))


#キャンバスを用意して、gに格納
#x軸は観測時期、y軸を花弁の長さ
g1<-ggplot(irisOdered, aes(y=花弁の長さ, x=観測時期)) 

#折れ線グラフを描き入れる
g1<-g1+stat_summary(aes(group=種類), #種類ごとに
                    fun.y=mean,　#平均値を
                    geom="line",#線でつなげて
                    colour="black",#色は黒で
                    size=0.5)#先の太さは0.5mm


#エラーバーの追加
g1<-g1+stat_summary(aes(group=種類),#種類ごとに
                    fun.data=mean_sdl,#mean_seで標準誤差、#mean_cl_normalで95%信頼区間(正規分布)
                    geom="errorbar",
                    size=0.5,#線の太さ
                    width=0.1)#ぴょんって横に出てるアイツの幅



#エラーバーの上から重ねて、点(マーク)を描き入れる
g1<-g1+stat_summary(aes(shape=種類),#種類ごとに点の形を変えて
                    fun.y=mean,#種類ごとの平均値のところに
                    geom="point",#点で
                    colour="black",
                    size=4)
#形の指定
g1<-g1+scale_shape_manual(values=c(1,15,23))#点の形を１番◯、１５番■、２３番◇にマニュアル変更

##グラフの表示範囲の指定。expand=c(0,0)でy軸がゼロから始まる。limitでy軸の下限と上限を指定
g1<-g1+scale_y_continuous(expand = c(0,0),limits = c(0,10))

#y軸の軸ラベル(軸タイトル)を変更(縦書きができないので、一文字ずつ\nで改行)
g1<-g1+ ylab("花\n弁\nの\n長\nさ")


#最終的なグラフの微調整をtheme()の中で行う
g1<-g1+theme(legend.position = c(1, 1), #レジェンド(横についてるやつ)を上詰め(1)、右詰め(1)にする￥
             legend.justification = c(1, 1),　#レジェンドをちょっと内側に
             legend.text = element_text(size=12), #レジェンドの内容の文字サイズを変更
             legend.title = element_text(size=14), #レジェンドのタイトルサイズを変更
             axis.title.x = element_text(size=14),　#x軸タイトルを上詰め(0)、黒色、サイズ１４で
             axis.title.y = element_text(vjust = 0.5,angle=0,size=14),#vjustで上下の位置調整、英語の場合はangle = 90で
             axis.text.x = element_text(size=12),#x軸の目盛りに対応した文字サイズを12で
             axis.text.y = element_text(size=12,colour="black"),
             axis.ticks.x = element_line(size = 0),#x軸の目盛り線をゼロにして消す
             axis.line = element_line(size = 0.5, #軸の線を0.5の太さで
                                      linetype = "solid", #線のタイプは実線
                                      lineend = "round")#軸の線の終わりは整数値で丸める
)

#描画
plot(g1)
