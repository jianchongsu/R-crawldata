
library(XML)
library(drc)
for(i in 1:12)
{
  id.i=i
  fid.i=paste(id.i,".html",sep="")
  #当要抓B组数据的时候，要在两处a改成b
  u.name="http://sports.yahoo.com/olympics/basketball/mens-preliminary-round-group-a-bkm400a"
  if(i<10)
    url.i=paste(u.name,0,fid.i,sep="")
  else
    url.i=paste(u.name,fid.i,sep="")

  bas.i=readHTMLTable(readLines(url.i),header=F)
  #baso=readHTMLTable(readLines(urlo),header=F)
  
  bas_qua.i=bas.i$`Match Linescore`
  colnames(bas_qua.i)=c("coutry","q1","q2","q3","q4","TOT")
  country.i=bas_qua.i[,1]
  country.i
  bas_h.i=bas.i$`Player Stats`
  bas_h.i=cbind(country.i[1],bas_h.i)
  colnames(bas_h.i)=c("country","PLAYER","POSITION","MIN","FG","3PT",
                    "FT","OFF","REB","AST","TO","STL","BS","PF",  "PTS")
  
  bas_g.i=bas.i[5]$`Player Stats`
  bas_g.i=cbind(country.i[2],bas_g.i)
  colnames(bas_g.i)=c("country","PLAYER","POSITION","MIN","FG","3PT",
                    "FT","OFF","REB","AST","TO","STL","BS","PF",  "PTS")
  
  #
  bas_arg_ltu.i=rbind(bas_h.i,bas_g.i)
  teamname=paste("bas",country.i[1],country.i[2],sep="_")
  
  
  #保存的路径，也要将A组给成B组
  filename=paste("F:/苏建冲出品/数据集/奥运奖牌数据/2012奥运篮球数据/A组/",teamname,".txt",sep="")
  write.table(bas_arg_ltu.i,filename)
  
  team.i=bas.i$`Team Stats`
  colnames(team.i)=c("COUNTRY","FG","3PT","FT","OFF","REB","AST","TO","STL","BS","TF","PTS")
  teamname2=paste("team",country.i[1],country.i[2],sep="_")
  filename2=paste("F:/苏建冲出品/数据集/奥运奖牌数据/2012奥运篮球数据/A组/",teamname2,".txt",sep="")
  write.table(team.i,filename2)
  
  
}

