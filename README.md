# Land Use Classification

## Overview
This project aims to classify land use based on Sentinel-2 satellite imagery using multiple classification methods to evaluate model performance in distinguishing three land use categories: vegetation, non-vegetation, and water bodies. By leveraging remote sensing techniques, machine learning, and deep learning approaches, this project provides a better understanding of land use change dynamics around the university area.

After the classification process, a density analysis was conducted using QGIS to understand the spatial distribution of non-vegetation and identify concentration patterns related to infrastructure development in the study area.

## Background
Land use change is a crucial phenomenon that occurs alongside regional development and infrastructure demands. University surroundings often experience significant changes due to high academic, social, and economic activities. Therefore, land use mapping is essential to support better and more efficient spatial planning.

Land cover conversion around educational centers, such as universities, is an inevitable consequence of increasing urban activity. The development of boarding houses, commercial zones, and other infrastructure often follows the expansion of academic institutions. To support sustainable spatial planning, early identification of land cover and analysis of spatial distribution patterns are crucial for zoning regulation and infrastructure management.

With advancements in remote sensing technology, particularly satellite imagery, land use classification can now be performed more efficiently and with high accuracy. This approach utilizes satellite image data to classify areas into specific categories, which are useful for spatial analysis and resource management.

This study focuses on classifying land cover and analyzing spatial patterns around Universitas Riau (UNRI) using Sentinel-2 satellite imagery with a 10-meter spatial resolution.

## Project Objectives
This project aims to classify land use around the university area using Sentinel-2 satellite imagery and evaluate the performance of various classification methods based on accuracy, sensitivity, specificity, and Area Under the Curve (AUC). In addition, the project includes density analysis using QGIS to identify the spatial distribution of non-vegetation and point distribution analysis to understand the overall land use category distribution patterns.

## Methodology
A supervised classification approach was applied, utilizing spectral bands—specifically Near-Infrared (NIR) and Short-Wave Infrared (SWIR)—as explanatory variables. The response variable was land cover, categorized into vegetation, non-vegetation, and water bodies.

Several classification methods used in this study include:

1. **Support Vector Machine (SVM)**: A supervised machine learning algorithm that seeks the optimal hyperplane to separate data classes in binary classification.
2. **Naive Bayes (NB)**: A probabilistic model based on Bayes' theorem, assuming feature independence, suitable for probability-based classification.
3. **Backpropagation Neural Network (BNN)**: A neural network algorithm used to optimize weights in spatial data classification.

The models were trained and tested using a stratified 80-20 data split to ensure a balanced evaluation.

## Data Used
The dataset used in this project consists of Sentinel-2 satellite imagery, focusing on band 8 (Near Infrared) and band 11 (Shortwave Infrared). This data is combined with ground truth information from manual digitization to improve classification accuracy. The dataset is used to train and test models in identifying three land use categories:

1. Vegetation
2. Non-vegetation
3. Water bodies

The dataset band can be accessed via the following link:
[Google Drive - Dataset](https://drive.google.com/drive/folders/1jSsVc_lkQj-PvB0hrmVFfENTGLtWjKvv?usp=sharing)

## Result
Experimental results show that the Support Vector Machine (SVM) method delivers the best performance in land use classification, achieving the highest accuracy with minimal differences between training and testing data. Among the models, SVM demonstrated the highest accuracy, achieving an average of 91.15% in 2022 and 83.90% in 2023 with minimal variance, confirming its reliability for land cover classification.

Spatially, non-vegetation areas were concentrated near major access routes and facilities, highlighting the influence of infrastructure development on land conversion. Beyond land use classification, a density analysis using QGIS was conducted to examine the distribution of non-vegetation within the study area. The results reveal a significant concentration of non-vegetation around major infrastructure, indicating the impact of urban development.

Additionally, potential growth zones within a 3–5 km radius from Universitas Riau (UNRI) were identified, emphasizing the importance of implementing sustainable land-use policies in accordance with Law No. 26/2007 on Spatial Planning.

Point distribution analysis indicates that vegetation is concentrated around UNRI, reflecting the presence of green spaces and open areas within the campus environment. Meanwhile, non-vegetation is more dominant in areas near main roads and residential zones, while water bodies are sporadically distributed across several points in the study area.

These findings support the formulation of spatial strategies aligned with Law No. 26 of 2007 on Spatial Planning and offer valuable insights for guiding urban development around academic hubs.
