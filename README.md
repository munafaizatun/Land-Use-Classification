# Land Use Classification

## Overview
This project aims to classify land use based on Sentinel-2 satellite imagery using multiple classification methods to evaluate model performance in distinguishing three land use categories: vegetation, non-vegetation, and water bodies. By leveraging remote sensing techniques and machine learning and deep learning approaches, this project provides a better understanding of land use change dynamics around the university area.

After the classification process, a density analysis was conducted using QGIS to understand the spatial distribution of non-vegetation and identify concentration patterns related to infrastructure development in the study area.

## Background
Land use change is a crucial phenomenon that occurs alongside regional development and infrastructure demands. University surroundings often experience significant changes due to high academic, social, and economic activities. Therefore, land use mapping is essential to support better and more efficient spatial planning.

With advancements in remote sensing technology, particularly satellite imagery, land use classification can now be performed more efficiently and with high accuracy. This approach utilizes satellite image data to classify areas into specific categories, which are useful for spatial analysis and resource management.

## Project Objectives
This project aims to classify land use around the university area using Sentinel-2 satellite imagery and evaluate the performance of various classification methods based on accuracy, sensitivity, specificity, and Area Under the Curve (AUC). In addition, the project includes density analysis using QGIS to identify the spatial distribution of non-vegetation and point distribution analysis to understand the overall land use category distribution patterns.

## Methodology
Several classification methods used in this study include:

1. **Support Vector Machine (SVM)**: A supervised machine learning algorithm that seeks the optimal hyperplane to separate data classes in binary classification.
2. **Naive Bayes (NB)**: A probabilistic model based on Bayes' theorem, assuming feature independence, suitable for probability-based classification.
3. **Backpropagation Neural Network (BNN)**: A neural network algorithm used to optimize weights in spatial data classification.

## Data Used
The dataset used in this project consists of Sentinel-2 satellite imagery, focusing on band 8 (Near Infrared) and band 11 (Shortwave Infrared). This data is combined with ground truth information from manual digitization to improve classification accuracy. The dataset is used to train and test models in identifying three land use categories:

1. Vegetation
2. Non-vegetation
3. Water bodies

The dataset band can be accessed via the following link:
[Google Drive - Dataset](https://drive.google.com/drive/folders/1jSsVc_lkQj-PvB0hrmVFfENTGLtWjKvv?usp=sharing)

## Result
Experimental results show that the Support Vector Machine (SVM) method delivers the best performance in land use classification, achieving the highest accuracy with minimal differences between training and testing data. This model successfully identifies classification patterns with lower error rates than other methods. These findings indicate that machine learning-based approaches, particularly SVM, can serve as a foundation for developing more efficient and accurate spatial classification models for future land use analysis.

Beyond land use classification, a density analysis using QGIS was conducted to examine the distribution of non-vegetation within the study area. The results reveal a significant concentration of non-vegetation around major infrastructure, indicating the impact of urban development. Additionally, potential growth areas within a 3-5 km radius of Universitas Riau (UNRI) were identified, emphasizing the importance of implementing sustainable land-use policies in accordance with Law No. 26/2007 on Spatial Planning.

Point distribution analysis indicates that vegetation is concentrated around UNRI, reflecting the presence of green spaces and open areas within the campus environment. Meanwhile, non-vegetation is more dominant in areas near main roads and residential zones, while water bodies are sporadically distributed across several points in the study area.
