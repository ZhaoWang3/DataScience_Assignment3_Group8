data1<-read.csv("~/Desktop/COB-BPL.HARVARD.ST.2014.csv")

#select the kWh value
subset1<-subset(data1,Units=="kWh")
#calculate the sum of kWh
temp<-subset1[,5:292]
kWh<-apply(temp,1,sum)
#add total kWh as a now column  
energydata<-data.frame(subset1,kWh)

#import the temperature date
datatem<-read.csv("~/Desktop/temperature.csv")
#Add temperature data into dataset
tem<-datatem[,2:4]
energydata<-data.frame(energydata,tem)
energydata<-energydata[,-c(4:292)]

#select the power factor value
subset2<-subset(data1,Units=="Power Factor")
#calculate the mean of power factor
temp<-subset2[,5:292]
power_factor<-apply(temp,1,mean)
#add mean of power factor as a now column  
energydata<-data.frame(energydata,power_factor)

#select the KVARH value
subset3<-subset(data1,Units=="kVARh")
#calculate the sum of kwh
temp<-subset3[,5:292]
kVARh<-apply(temp,1,sum)
#add sum of kVARh as a now column  
energydata<-data.frame(energydata,kVARh)

#clear 0 and NA row
energydata[energydata == 0] = NA
energydata<-na.omit(energydata)

write.csv(energydata,"/Users/lucy/Desktop/COB-BPL.HARVARD.ST.2014.csv")
