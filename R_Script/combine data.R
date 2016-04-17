install.packages("data.table")
library(data.table)
install.packages("bit64")
library(bit64)

setwd("/Users/lucy/Desktop/12/")
temp<- list.files(pattern="*.csv")
energyset <- do.call(rbind, lapply(temp, fread))
write.csv(energyset,"/Users/lucy/Desktop/energyset.csv")


