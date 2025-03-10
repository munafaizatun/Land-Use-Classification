rm(list=ls()) # Menghapus semua dataset dan variabel
graphics.off() # Menutup semua grafik

library(ggplot2)
a<-read.csv("2022 train.csv")
b<-read.csv("2022 test.csv")
c<-read.csv("2023 train.csv")
d<-read.csv("2023 test.csv")

names(a)[names(a) == "Iterasi"] <- "Repetition"
names(b)[names(b) == "Iterasi"] <- "Repetition"
names(c)[names(c) == "Iterasi"] <- "Repetition"
names(d)[names(d) == "Iterasi"] <- "Repetition"

##buffering
#ggplot(a, aes(x = Repetition, y = Accuracy, color = Method))+
  #geom_line()+ 
  #scale_color_manual(values = c("red", "blue", "green"))+
  #labs(title = "Training Data Accuracy",
       #x = "Repetition",
       #y = "Accuracy")

#atau
#ggplot(data, aes(x = Jarak, y = Persentase, group = Obyek, color = Obyek))+
  #geom_line() + 
  #scale_color_manual(values = c("red", "blue", "green")) +
  #labs(x = "Jarak (Km)",
       #y = "Persentase")
dev.list()
##TRAIN 2022
aa = ggplot(a, aes(x=Repetition, y=Accuracy, group=Method, color=Method)) +
  geom_line(linewidth = 1) +
  labs(x = "Repetition", y = "Accuracy") + 
  theme(
    legend.position = "none",
    axis.title.x = element_text(size = 15),  # Ukuran label sumbu x
    axis.title.y = element_text(size = 15),  # Ukuran label sumbu y
    axis.text.x = element_text(size = 12),   # Ukuran angka pada sumbu x
    axis.text.y = element_text(size = 12)    # Ukuran angka pada sumbu y
  )

png("/cloud/project/Akurasi 2022 train.png", width = 6 * 300, height = 4 * 300, res = 300)  # 6x4 inci @ 300 DPI
print(aa)
dev.off()

bb = ggplot(a, aes(x=Repetition, y=Sensitivity, group=Method, color=Method))+
  geom_line(linewidth = 1) +
  labs(x = "Repetition", y = "Sensitivity") + 
  theme(
    legend.position = "none",
    axis.title.x = element_text(size = 15),  # Ukuran teks sumbu x
    axis.title.y = element_text(size = 15),   # Ukuran teks sumbu y
    axis.text.x = element_text(size = 12),   # Ukuran angka pada sumbu x
    axis.text.y = element_text(size = 12)    # Ukuran angka pada sumbu y
    );

png("/cloud/project/Sensitivitas 2022 train.png", width = 6 * 300, height = 4 * 300, res = 300)  # 6x4 inci @ 300 DPI
print(bb)
dev.off()

cc = ggplot(a, aes(x=Repetition, y=Specificity, group=Method, color=Method))+
  geom_line(linewidth = 1) +
  labs(x = "Repetition", y = "Specificity") + 
  theme(
    legend.position = "none",
    axis.title.x = element_text(size = 15),  # Ukuran teks sumbu x
    axis.title.y = element_text(size = 15),   # Ukuran teks sumbu y
    axis.text.x = element_text(size = 12),   # Ukuran angka pada sumbu x
    axis.text.y = element_text(size = 12)    # Ukuran angka pada sumbu y
  );

png("/cloud/project/Spesifisitas 2022 train.png", width = 6 * 300, height = 4 * 300, res = 300)  # 6x4 inci @ 300 DPI
print(cc)
dev.off()

dd = ggplot(a, aes(x=Repetition, y=AUC, group=Method, color=Method))+
  geom_line(linewidth = 1) +
  labs(x = "Repetition", y = "AUC") + 
  theme(
    legend.position = "none",
    axis.title.x = element_text(size = 15),  # Ukuran teks sumbu x
    axis.title.y = element_text(size = 15),   # Ukuran teks sumbu y
    axis.text.x = element_text(size = 12),   # Ukuran angka pada sumbu x
    axis.text.y = element_text(size = 12)    # Ukuran angka pada sumbu y
  );

png("/cloud/project/AUC 2022 train.png", width = 6 * 300, height = 4 * 300, res = 300)  # 6x4 inci @ 300 DPI
print(dd)
dev.off()

##TEST 2022
ee = ggplot(b, aes(x=Repetition, y=Accuracy, group=Method, color=Method))+
  geom_line(linewidth = 1) +
  labs(x = "Repetition", y = "Accuracy") + 
  theme(
    legend.position = "none",
    axis.title.x = element_text(size = 15),  # Ukuran teks sumbu x
    axis.title.y = element_text(size = 15),   # Ukuran teks sumbu y
    axis.text.x = element_text(size = 12),   # Ukuran angka pada sumbu x
    axis.text.y = element_text(size = 12)    # Ukuran angka pada sumbu y   # Ukuran teks sumbu y
  );

png("/cloud/project/Akurasi 2022 test.png", width = 6 * 300, height = 4 * 300, res = 300)  # 6x4 inci @ 300 DPI
print(ee)
dev.off()

ff = ggplot(b, aes(x=Repetition, y=Sensitivity, group=Method, color=Method))+
  geom_line(linewidth = 1) +
  labs(x = "Repetition", y = "Sensitivity") + 
  theme(
    legend.position = "none",
    axis.title.x = element_text(size = 15),  # Ukuran teks sumbu x
    axis.title.y = element_text(size = 15),   # Ukuran teks sumbu y
    axis.text.x = element_text(size = 12),   # Ukuran angka pada sumbu x
    axis.text.y = element_text(size = 12)    # Ukuran angka pada sumbu y   # Ukuran teks sumbu y
  );

png("/cloud/project/Sensitivitas 2022 test.png", width = 6 * 300, height = 4 * 300, res = 300)  # 6x4 inci @ 300 DPI
print(ff)
dev.off()

gg = ggplot(b, aes(x=Repetition, y=Specificity, group=Method, color=Method))+
  geom_line(linewidth = 1) +
  labs(x = "Repetition", y = "Specificity") + 
  theme(
    legend.position = "none",
    axis.title.x = element_text(size = 15),  # Ukuran teks sumbu x
    axis.title.y = element_text(size = 15),   # Ukuran teks sumbu y
    axis.text.x = element_text(size = 12),   # Ukuran angka pada sumbu x
    axis.text.y = element_text(size = 12)    # Ukuran angka pada sumbu y   # Ukuran teks sumbu y
  );

png("/cloud/project/Spesifisitas 2022 test.png", width = 6 * 300, height = 4 * 300, res = 300)  # 6x4 inci @ 300 DPI
print(gg)
dev.off()

hh = ggplot(b, aes(x=Repetition, y=AUC, group=Method, color=Method))+
  geom_line(linewidth = 1) +
  labs(x = "Repetition", y = "AUC") + 
  theme(
    legend.position = "none",
    axis.title.x = element_text(size = 15),  # Ukuran teks sumbu x
    axis.title.y = element_text(size = 15),   # Ukuran teks sumbu y
    axis.text.x = element_text(size = 12),   # Ukuran angka pada sumbu x
    axis.text.y = element_text(size = 12)    # Ukuran angka pada sumbu y   # Ukuran teks sumbu y
  );

png("/cloud/project/AUC 2022 test.png", width = 6 * 300, height = 4 * 300, res = 300)  # 6x4 inci @ 300 DPI
print(hh)
dev.off()

library(ggpubr)

thn22 = ggarrange(aa, bb, cc, dd, ee, ff, gg, hh,
                  ncol = 3, nrow = 3);thn22

##TRAIN 2023
ii = ggplot(c, aes(x=Repetition, y=Accuracy, group=Method, color=Method))+
  geom_line(linewidth = 1) +
  labs(x = "Repetition", y = "Accuracy") + 
  theme(
    legend.position = "none",
    axis.title.x = element_text(size = 15),  # Ukuran teks sumbu x
    axis.title.y = element_text(size = 15),   # Ukuran teks sumbu y
    axis.text.x = element_text(size = 12),   # Ukuran angka pada sumbu x
    axis.text.y = element_text(size = 12)    # Ukuran angka pada sumbu y   # Ukuran teks sumbu y
  );

png("/cloud/project/Akurasi 2023 train.png", width = 6 * 300, height = 4 * 300, res = 300)  # 6x4 inci @ 300 DPI
print(ii)
dev.off()

jj = ggplot(c, aes(x=Repetition, y=Sensitivity, group=Method, color=Method))+
  geom_line(linewidth = 1) +
  labs(x = "Repetition", y = "Sensitivity") + 
  theme(
    legend.position = "none",
    axis.title.x = element_text(size = 15),  # Ukuran teks sumbu x
    axis.title.y = element_text(size = 15),   # Ukuran teks sumbu y
    axis.text.x = element_text(size = 12),   # Ukuran angka pada sumbu x
    axis.text.y = element_text(size = 12)    # Ukuran angka pada sumbu y   # Ukuran teks sumbu y
  );

png("/cloud/project/Sensitivitas 2023 train.png", width = 6 * 300, height = 4 * 300, res = 300)  # 6x4 inci @ 300 DPI
print(jj)
dev.off()

kk = ggplot(c, aes(x=Repetition, y=Specificity, group=Method, color=Method))+
  geom_line(linewidth = 1) +
  labs(x = "Repetition", y = "Specificity") + 
  theme(
    legend.position = "none",
    axis.title.x = element_text(size = 15),  # Ukuran teks sumbu x
    axis.title.y = element_text(size = 15),   # Ukuran teks sumbu y
    axis.text.x = element_text(size = 12),   # Ukuran angka pada sumbu x
    axis.text.y = element_text(size = 12)    # Ukuran angka pada sumbu y   # Ukuran teks sumbu y
  );

png("/cloud/project/Spesifisitas 2023 train.png", width = 6 * 300, height = 4 * 300, res = 300)  # 6x4 inci @ 300 DPI
print(kk)
dev.off()

ll = ggplot(c, aes(x=Repetition, y=AUC, group=Method, color=Method))+
  geom_line(linewidth = 1) +
  labs(x = "Repetition", y = "AUC") + 
  theme(
    legend.position = "none",
    axis.title.x = element_text(size = 15),  # Ukuran teks sumbu x
    axis.title.y = element_text(size = 15),   # Ukuran teks sumbu y
    axis.text.x = element_text(size = 12),   # Ukuran angka pada sumbu x
    axis.text.y = element_text(size = 12)    # Ukuran angka pada sumbu y   # Ukuran teks sumbu y
  );

png("/cloud/project/AUC 2023 train.png", width = 6 * 300, height = 4 * 300, res = 300)  # 6x4 inci @ 300 DPI
print(ll)
dev.off()

##TEST
mm = ggplot(d, aes(x=Repetition, y=Accuracy, group=Method, color=Method))+
  geom_line(linewidth = 1) +
  labs(x = "Repetition", y = "Accuracy") + 
  theme(
    legend.position = "none",
    axis.title.x = element_text(size = 15),  # Ukuran teks sumbu x
    axis.title.y = element_text(size = 15),   # Ukuran teks sumbu y
    axis.text.x = element_text(size = 12),   # Ukuran angka pada sumbu x
    axis.text.y = element_text(size = 12)    # Ukuran angka pada sumbu y   # Ukuran teks sumbu y
  );

png("/cloud/project/Akurasi 2023 test.png", width = 6 * 300, height = 4 * 300, res = 300)  # 6x4 inci @ 300 DPI
print(mm)
dev.off()

nn = ggplot(d, aes(x=Repetition, y=Sensitivity, group=Method, color=Method))+
  geom_line(linewidth = 1) +
  labs(x = "Repetition", y = "Sensitivity") + 
  theme(
    legend.position = "none",
    axis.title.x = element_text(size = 15),  # Ukuran teks sumbu x
    axis.title.y = element_text(size = 15),   # Ukuran teks sumbu y
    axis.text.x = element_text(size = 12),   # Ukuran angka pada sumbu x
    axis.text.y = element_text(size = 12)    # Ukuran angka pada sumbu y   # Ukuran teks sumbu y
  );

png("/cloud/project/Sensitivitas 2023 test.png", width = 6 * 300, height = 4 * 300, res = 300)  # 6x4 inci @ 300 DPI
print(nn)
dev.off()

oo = ggplot(d, aes(x=Repetition, y=Specificity, group=Method, color=Method))+
  geom_line(linewidth = 1) +
  labs(x = "Repetition", y = "Specificity") + 
  theme(
    legend.position = "none",
    axis.title.x = element_text(size = 15),  # Ukuran teks sumbu x
    axis.title.y = element_text(size = 15),   # Ukuran teks sumbu y
    axis.text.x = element_text(size = 12),   # Ukuran angka pada sumbu x
    axis.text.y = element_text(size = 12)    # Ukuran angka pada sumbu y   # Ukuran teks sumbu y
  );

png("/cloud/project/Spesifisitas 2023 test.png", width = 6 * 300, height = 4 * 300, res = 300)  # 6x4 inci @ 300 DPI
print(oo)
dev.off()

pp = ggplot(d, aes(x=Repetition, y=AUC, group=Method, color=Method))+
  geom_line(linewidth = 1) +
  labs(x = "Repetition", y = "AUC") + 
  theme(
    legend.position = "none",
    axis.title.x = element_text(size = 15),  # Ukuran teks sumbu x
    axis.title.y = element_text(size = 15),   # Ukuran teks sumbu y
    axis.text.x = element_text(size = 12),   # Ukuran angka pada sumbu x
    axis.text.y = element_text(size = 12)    # Ukuran angka pada sumbu y   # Ukuran teks sumbu y
  );

png("/cloud/project/AUC 2023 test.png", width = 6 * 300, height = 4 * 300, res = 300)  # 6x4 inci @ 300 DPI
print(pp)
dev.off()

thn23 = ggarrange(ii, jj, kk, ll, mm, nn, oo, pp,
                  ncol = 3, nrow = 3);thn23

dev.size("px")  # Cek ukuran dalam piksel
dev.size("in")  # Cek ukuran dalam inci

# Membuka device PNG untuk menyimpan plot
png("/cloud/project/method.png", width = 6 * 300, height = 4 * 300, res = 300)

# Membuat plot dengan hanya legenda tanpa menampilkan grafik
aaa = ggplot(a, aes(x = Repetition, y = Accuracy, group = Method, color = Method)) +
  geom_line(linewidth = 1) +
  labs(x = "Repetition", y = "Accuracy", color = "Classification Method") + 
  guides(
    color = guide_legend(title = "Classification Method"),  # Menampilkan legenda untuk `Method`
    linetype = "none",  # Menyembunyikan legenda untuk `linetype`
    size = "none"  # Menyembunyikan legenda untuk `size`
  ) +
  theme(
    legend.position = "right", 
    legend.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 12),
    axis.title.x = element_text(size = 15),
    axis.title.y = element_text(size = 15),
    axis.text.x = element_text(size = 12),
    axis.text.y = element_text(size = 12)
  )

# Menampilkan plot ke file (legend + tanpa grafik)
print(aaa)

# Menutup device
dev.off()

