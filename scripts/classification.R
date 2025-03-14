library(rgdal) 
library(raster)    
library(sp)  
library(sf)  
library(caret)  
library(kernlab)
library(pROC)
library(data.table)
library(naivebayes)
library(neuralnet)

data<-read.csv("datatrainingg.csv")
#data <-read.csv(file.choose(), header=TRUE, sep=",") 
data <- na.omit(data) #discards NA values
data=data[sample(nrow(data)),] #shuffle the data so that the data is evenly distributed
data$class = as.factor(data$class) #make class a factor
dim(data) #dimensions
head(data)
str(data)

#share training data
N_FILES=3000
SPLT=0.8 #80% train
b= floor(SPLT*N_FILES)
train = data[1:b,]
test = data[(b+1):N_FILES,]

#SUPPORT VECTOR MACHINE
modFit_svm_linear <- caret::train(as.factor(class) ~ B8+B11, method = "svmLinear", data=train) #membuat model

#Predict train data
validation_result_svm_linear<-predict(modFit_svm_linear,newdata=train) 
result_comparison_svm_linear<-cbind(as.numeric(as.character(validation_result_svm_linear)),as.numeric(as.character(train[,4])))
preds_svm_linear<-result_comparison_svm_linear[,1]
y_svm_linear<-result_comparison_svm_linear[,2]

#confusion matrix SVM Train
confmat_svm_linear <- confusionMatrix(as.factor(y_svm_linear),as.factor(preds_svm_linear), positive='1')
confmat_svm_linear

#ROC curve of 3 class train data
kurva_roc_svm_linier<-multiclass.roc(preds_svm_linear, y_svm_linear)
kurva_roc_svm_linier
plot(kurva_roc_svm_linear, print.auc= TRUE)

#Perform test data predictions
validation_result_svm_linear_test<-predict(modFit_svm_linear,newdata=test)
result_comparison_svm_linear_test<-cbind(as.numeric(as.character(validation_result_svm_linear_test)),as.numeric(as.character(test[,4])))
preds_svm_linear_test<-result_comparison_svm_linear_test[,1]
y_svm_linear_test<-result_comparison_svm_linear_test[,2]

#confusion matrix SVM data Test
confmat_svm_linear_test <- confusionMatrix(as.factor(y_svm_linear_test),as.factor(preds_svm_linear_test), positive='1')
confmat_svm_linear_test

#ROC curve of 3 class test data
kurva_roc_svm_linear_test<-multiclass.roc(preds_svm_linear_test, y_svm_linear_test)
kurva_roc_svm_linear_test
plot(kurva_roc_svm_linear_test, print.auc= TRUE)

#NAIVE BAYES
modFit_nb <- caret::train(as.factor(class) ~ B8+B11, method = "naive_bayes", data=train)

#Predict train data
validation_result_nb<-predict(modFit_nb,newdata=train)
result_comparison_nb<-cbind(as.numeric(as.character(validation_result_nb)),as.numeric(as.character(train[,4])))
preds_nb<-result_comparison_nb[,1]
y_nb<-result_comparison_nb[,2]

#confusion matrix data train
confmat_nb <- confusionMatrix(as.factor(y_nb),as.factor(preds_nb), positive='1')
confmat_nb

#ROC curve train data
kurva_roc_nb<-multiclass.roc(preds_nb, y_nb)
kurva_roc_nb
plot(kurva_roc_nb, print.auc= TRUE)

#perform predictions on test data
validation_result_nb_test<-predict(modFit_nb,newdata=test)
result_comparison_nb_test<-cbind(as.numeric(as.character(validation_result_nb_test)),as.numeric(as.character(test[,4])))
preds_nb_test<-result_comparison_nb_test[,1]
y_nb_test<-result_comparison_nb_test[,2]

#confusion matrix data test
confmat_nb_test<- confusionMatrix(as.factor(y_nb_test),as.factor(preds_nb_test), positive='1')
confmat_nb_test

#ROC curve test data
kurva_roc_nb_test<-multiclass.roc(preds_nb_test, y_nb_test)
kurva_roc_nb_test
plot(kurva_roc_nb_test, print.auc= TRUE)

#NEURAL NETWORK
modFit_nn <- neuralnet(as.factor(class)~B8+B11,data=train, hidden=c(2,4),
                       linear.output=FALSE)
plot(modFit_nn)

#Predict train data
Pred <- predict(modFit_nn, newdata = train)
View(Pred)

#extract the class with the highest prediction values as the predicted result
Prediksi <- data.frame("Pred"=ifelse(max.col(Pred[ ,1:3])==1, "0",
                                     ifelse(max.col(Pred[ ,1:3])==2, "1", "2")))
results <- cbind(actual = as.numeric(as.character(train[,4])), Prediksi)
preds_nn<-results[,2]
y_nn<-results[,1]

#confusion matrix data train
confmat_nn <- confusionMatrix(as.factor(y_nn),as.factor(preds_nn))
confmat_nn

#ROC curve train data
kurva_roc_nn<-multiclass.roc(preds_nn, y_nn)
kurva_roc_nn

#Predict test data
Pred_test <- predict(modFit_nn, newdata = test)

#extract the class with the highest prediction values as the predicted result
Prediksi_test <- data.frame("Pred_test"=ifelse(max.col(Pred_test[ ,1:3])==1, "0",
                                               ifelse(max.col(Pred_test[ ,1:3])==2, "1", "2")))
results_test <- cbind(actual = as.numeric(as.character(test[,4])), Prediksi_test)
preds_nn_test<-results_test[,2]
y_nn_test<-results_test[,1]

#confusion matrix data test
confmat_nn_test <- confusionMatrix(as.factor(y_nn_test),as.factor(preds_nn_test))
confmat_nn_test

#ROC curve test data
kurva_roc_nn_test<-multiclass.roc(preds_nn_test, y_nn_test)
kurva_roc_nn_test


#ITERATION
data=data[sample(nrow(data)),] #shuffle the data so that the data is evenly distributed
data$class = as.factor(data$class) #make class a factor

#share training data
N_FILES=3000
SPLT=0.8 #80% train
b= floor(SPLT*N_FILES)
train = data[1:b,]
test = data[(b+1):N_FILES,]

#SUPPORT VECTOR MACHINE
modFit_svm_linear <- caret::train(as.factor(class) ~ B8+B11, method = "svmLinear", data=train) #membuat model

#Predict train data
validation_result_svm_linear<-predict(modFit_svm_linear,newdata=train) 
result_comparison_svm_linear<-cbind(as.numeric(as.character(validation_result_svm_linear)),as.numeric(as.character(train[,4])))
preds_svm_linear<-result_comparison_svm_linear[,1]
y_svm_linear<-result_comparison_svm_linear[,2]

#confusion matrix SVM Train
confmat_svm_linear <- confusionMatrix(as.factor(y_svm_linear),as.factor(preds_svm_linear), positive='1')
confmat_svm_linear

#ROC curve of 3 class train data
kurva_roc_svm_linier<-multiclass.roc(preds_svm_linear, y_svm_linear)
kurva_roc_svm_linier
plot(kurva_roc_svm_linear, print.auc= TRUE)

#Perform test data predictions
validation_result_svm_linear_test<-predict(modFit_svm_linear,newdata=test)
result_comparison_svm_linear_test<-cbind(as.numeric(as.character(validation_result_svm_linear_test)),as.numeric(as.character(test[,4])))
preds_svm_linear_test<-result_comparison_svm_linear_test[,1]
y_svm_linear_test<-result_comparison_svm_linear_test[,2]

#confusion matrix SVM data Test
confmat_svm_linear_test <- confusionMatrix(as.factor(y_svm_linear_test),as.factor(preds_svm_linear_test), positive='1')
confmat_svm_linear_test

#ROC curve of 3 class test data
kurva_roc_svm_linear_test<-multiclass.roc(preds_svm_linear_test, y_svm_linear_test)
kurva_roc_svm_linear_test
plot(kurva_roc_svm_linear_test, print.auc= TRUE)

#NAIVE BAYES
modFit_nb <- caret::train(as.factor(class) ~ B8+B11, method = "naive_bayes", data=train)

#Predict train data
validation_result_nb<-predict(modFit_nb,newdata=train)
result_comparison_nb<-cbind(as.numeric(as.character(validation_result_nb)),as.numeric(as.character(train[,4])))
preds_nb<-result_comparison_nb[,1]
y_nb<-result_comparison_nb[,2]

#confusion matrix data train
confmat_nb <- confusionMatrix(as.factor(y_nb),as.factor(preds_nb), positive='1')
confmat_nb

#ROC curve train data
kurva_roc_nb<-multiclass.roc(preds_nb, y_nb)
kurva_roc_nb
plot(kurva_roc_nb, print.auc= TRUE)

#perform predictions on test data
validation_result_nb_test<-predict(modFit_nb,newdata=test)
result_comparison_nb_test<-cbind(as.numeric(as.character(validation_result_nb_test)),as.numeric(as.character(test[,4])))
preds_nb_test<-result_comparison_nb_test[,1]
y_nb_test<-result_comparison_nb_test[,2]

#confusion matrix data test
confmat_nb_test<- confusionMatrix(as.factor(y_nb_test),as.factor(preds_nb_test), positive='1')
confmat_nb_test

#ROC curve test data
kurva_roc_nb_test<-multiclass.roc(preds_nb_test, y_nb_test)
kurva_roc_nb_test
plot(kurva_roc_nb_test, print.auc= TRUE)

#NEURAL NETWORK
modFit_nn <- neuralnet(as.factor(class)~B8+B11,data=train, hidden=c(2,4),
                       linear.output=FALSE)
plot(modFit_nn)

#Predict train data
Pred <- predict(modFit_nn, newdata = train)
View(Pred)

#extract the class with the highest prediction values as the predicted result
Prediksi <- data.frame("Pred"=ifelse(max.col(Pred[ ,1:3])==1, "0",
                                     ifelse(max.col(Pred[ ,1:3])==2, "1", "2")))
results <- cbind(actual = as.numeric(as.character(train[,4])), Prediksi)
preds_nn<-results[,2]
y_nn<-results[,1]

#confusion matrix data train
confmat_nn <- confusionMatrix(as.factor(y_nn),as.factor(preds_nn))
confmat_nn

#ROC curve train data
kurva_roc_nn<-multiclass.roc(preds_nn, y_nn)
kurva_roc_nn

#Predict test data
Pred_test <- predict(modFit_nn, newdata = test)

#extract the class with the highest prediction values as the predicted result
Prediksi_test <- data.frame("Pred_test"=ifelse(max.col(Pred_test[ ,1:3])==1, "0",
                                               ifelse(max.col(Pred_test[ ,1:3])==2, "1", "2")))
results_test <- cbind(actual = as.numeric(as.character(test[,4])), Prediksi_test)
preds_nn_test<-results_test[,2]
y_nn_test<-results_test[,1]

#confusion matrix data test
confmat_nn_test <- confusionMatrix(as.factor(y_nn_test),as.factor(preds_nn_test))
confmat_nn_test

#ROC curve test data
kurva_roc_nn_test<-multiclass.roc(preds_nn_test, y_nn_test)
kurva_roc_nn_test


#CREATING PREDICTION IMAGES
#read the entire image
dat<-read.csv("datasetnew.csv")
#dat <-read.csv(file.choose(),header=TRUE,sep="," )
head(dat)
dim(dat)

o=predict(modFit_svm_linear,newdata=dat)
o=as.numeric(as.character(o))
head(o)

final_output=cbind(dat[,2],dat[,3],o)
head(final_output)

vegetasi=subset(final_output,o==1)
colnames(vegetasi)[1] = "x"
colnames(vegetasi)[2] = "y"
colnames(vegetasi)[3] = "vegetasi"
head(vegetasi)
write.csv(vegetasi, file = '', row.names = TRUE )
#make raster
r1 <- rasterFromXYZ(vegetasi)
crs(r1)<-crs("+init=epsg:32647")
writeRaster(r1, "vegetasi.tif", overwrite=TRUE)
writeRaster(r1, filename = "", overwrite=TRUE)

perairan=subset(final_output,o==0)
colnames(perairan)[1] = "x"
colnames(perairan)[2] = "y"
colnames(perairan)[3] = "perairan"
write.csv(perairan, file = '', row.names = TRUE )
#make raster
r2 <- rasterFromXYZ(perairan)
crs(r2)<-crs("+init=epsg:32647")
writeRaster(r2, "perairan.tif", overwrite=TRUE)
writeRaster(r2, filename = "", overwrite=TRUE)

bangunan=subset(final_output,o==2)
colnames(bangunan)[1] = "x"
colnames(bangunan)[2] = "y"
colnames(bangunan)[3] = "bangunan"
write.csv(bangunan, file = '', row.names = TRUE )
#make raster
r3 <- rasterFromXYZ(bangunan)
crs(r3)<-crs("+init=epsg:32647")
writeRaster(r3, "bangunan.tif", overwrite=TRUE)
writeRaster(r3, filename = "", overwrite=TRUE)

#overall final ouput
write.csv(final_output, 'hasilprediksi.csv' )
write.csv(final_output, file = '', row.names = TRUE )
#make raster
r <- rasterFromXYZ(final_output)
crs(r)<-crs("+init=epsg:32647")
writeRaster(r, "prediksi.tif", overwrite=TRUE)
writeRaster(r, filename = "", overwrite=TRUE)

