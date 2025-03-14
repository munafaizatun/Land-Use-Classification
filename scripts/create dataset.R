library(sp)
library(sf)
library(rgdal)
library(raster)
library(maptools)

#load data
setwd('')
getwd()
dataFolder<-""

#multi band
# read band 8 
b8<-raster(paste0(dataFolder,".//B8.tif"))
# read band 11 
b11<-raster(paste0(dataFolder,".//B11.tif"))
plot(b8)
plot(b11)

#RASTER STACK
s<-stack(b8,b11)
plot(s)

#RASTER DATA -> POINT
SPDF <- rasterToPoints(s)
df<-as.data.frame(SPDF)
head(df) #x,y, ndbi every top 6 pixels
dim(df) 
View(SPDF)

write.csv(SPDF, file = 'datasetnew.csv', row.names = TRUE )
