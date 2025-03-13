rm(list=ls()) # Menghapus semua dataset dan variabel
graphics.off() # Menutup semua grafik

# 1. Package ---
library(raster)
library(rgdal)
library(spatstat)

# 2. Import Data ----
#city = readOGR(dsn = ".", layer ="batas desa")
city = readOGR("D://KULIAH/SKRIPSI/BISMILLAH/fix/QGIS/KONFIGURASI/batas desa.shp")
city
coord.city<-city@polygons[[1]]@Polygons[[1]]@coords
window<-owin(poly=data.frame(x=rev(coord.city[,1]),
                             y=rev(coord.city[,2])))
plot(window)
#bangunan = readOGR(dsn = ".", layer ="non-vegetasi")
bangunan <- readOGR("D://KULIAH/SKRIPSI/BISMILLAH/fix/QGIS/KONFIGURASI/non-vegetasi.shp")

# 3. Menghapus titik yang ganda 
bangunan2 <- remove.duplicates(bangunan)
bangunan2 <- bangunan2[bangunan,]
bangunan2.ppp<-ppp(x=bangunan2@coords[,1],y=bangunan2@coords[,2],
                   window=window)

# 4. Analisis
#quad<-quadratcount(bangunan2.ppp)#default
#plot(quad, col="red")
#plot(bangunan2.ppp, add=T, pch=20, cex = 0.5)
#quadrat.test(bangunan2.ppp,alt="cluster")
quad<-quadratcount(bangunan2.ppp, nx=5, ny=5)
plot(quad, col="red")
plot(bangunan2.ppp, add=T, pch=20, cex = 0.5)

# 5. Perhitungan ----
mu<-mean(quad);mu
sigma<-sd(quad)^2;sigma
VMR<-sigma/mu;VMR

#quadrat.test(quad)
# nilai chi tabel
#Q<-data.frame(quadratcount(bangunan2.ppp, nx = 3, ny = 3)) #(misal mau dibagi grid 6x6)
#put the results into a data frame
#m<-nrow(Q)
#alpha<-0.05
#df<-m
#critical_value <- qchisq(1 - alpha, df-1);critical_value

#m lebih dari 30
# nilai chi tabel
Q<-data.frame(quadratcount(bangunan2.ppp, nx = 20, ny = 20))
#put the results into a data frame
m<-nrow(Q)
z_hit<-sqrt(m-1/2)*(VMR-1);z_hit

# Hasil perhtiungan ada beberapa kemungkinan, 
# a. VMR	= 0 yang menandakan konfigurasi titik dalam ruang adalah uniform atau perfect reguler.
# b. VMR	= 1 menunjukan konfigurasi titik dalam ruang adalah acak (random)
# c. VMR<1 yakni nilai ragam lebih kecil daripada rata-rata konfigurasi titik dalam ruang lebih mengarah ke bentuk reguler.
# d. VMR > 1 konfirgurasi titik dalam ruang lebih kearah cluster dibandingkan acak
# Bila α=5%,  Chi Square Hitung > Chi Square Tabel maka H_0 ditolak dengan kesimpulan kluster.

# Hipotesis
# a.	Z hitung > 1.96 maka konfigurasi titik adalah uniform/regular 
# b.	Z hitung < -1.96 maka konfigurasi titik adalah cluster

