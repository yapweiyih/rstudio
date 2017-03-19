library(tidyr)
table1
class(table1)
tabledf <- as.data.frame(table1)
class(tabledf)
tabledf

# spread row into column
table1_s <- spread(table1,year,cases)
table1_s <- spread(tabledf,year,cases)
table1_s

#indicate each column to be replaced by what value in a list
table1_sr <- replace_na(table1_s,list('1999'=0,"2000"=0))


table1_g <- gather(table1,'1999','2000', key="newcol")


#split cell into rows
#separate
table3
table3_sr <- separate_rows(table3,rate,sep='/')
table3_sr

#split cell into column
table3_s <- separate(table3,rate,sep='/',into=c("one","two"), convert=TRUE)
table3_s
