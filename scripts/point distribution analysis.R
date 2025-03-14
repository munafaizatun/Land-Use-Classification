rm(list=ls()) # Deleting all datasets and variables
graphics.off() # Close all charts

# Package
library(raster)
library(rgdal)
library(spatstat)

# Import Data
#city = readOGR(dsn = ".", layer ="batas desa")
city = readOGR("batas desa.shp")
city
coord.city<-city@polygons[[1]]@Polygons[[1]]@coords
window<-owin(poly=data.frame(x=rev(coord.city[,1]),
                             y=rev(coord.city[,2])))
plot(window)

#bangunan = readOGR(dsn = ".", layer ="non-vegetasi")
bangunan <- readOGR("non-vegetasi.shp")

# Delete duplicate points
bangunan2 <- remove.duplicates(bangunan)
bangunan2 <- bangunan2[bangunan,]
bangunan2.ppp<-ppp(x=bangunan2@coords[,1],y=bangunan2@coords[,2],
                   window=window)

# analysis
#quad <- quadratcount(bangunan2.ppp) #default
#plot(quad, col="red")
#plot(bangunan2.ppp, add=T, pch=20, cex = 0.5)
#quadrat.test(bangunan2.ppp,alt="cluster")

quad <- quadratcount(bangunan2.ppp, nx=5, ny=5)
plot(quad, col="red")
plot(bangunan2.ppp, add=T, pch=20, cex = 0.5)

# Calculation
mu <- mean(quad);mu
sigma <- sd(quad)^2;sigma
VMR <- sigma/mu;VMR

#quadrat.test(quad)
# table chi values
#Q <- data.frame(quadratcount(bangunan2.ppp, nx = 3, ny = 3)) #for example, if you want to divide it into a 6x6 grid
# put the results into a data frame
#m <- nrow(Q)
#alpha <- 0.05
#df <- m
#critical_value <- qchisq(1 - alpha, df-1);critical_value

# m more than 30
# table chi values
Q<-data.frame(quadratcount(bangunan2.ppp, nx = 20, ny = 20))
# put the results into a data frame
m <- nrow(Q)
z_hit <- sqrt(m-1/2)*(VMR-1);z_hit

# There are several possibilities for the calculation results, 
# a. VMR = 0 which indicates that the configuration of points in space is uniform or perfectly regular. 
# b. VMR = 1 indicates that the configuration of points in space is random 
# c. VMR <1, namely the variance value is smaller than the average, the configuration of points in space is more towards a regular form. 
# d. VMR > 1, the configuration of points in space is more towards a cluster than random 
# If α = 5%, Chi Square Calculation > Chi Square Table then H_0 is rejected with the conclusion of a cluster. 

# Hypothesis 
# a. Z count > 1.96 then the configuration of points is uniform/regular 
# b. Z count < -1.96 then the configuration of points is a cluster

