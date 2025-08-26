# Land Use Classification

## Overview
This project classifies land use around Universitas Riau (UNRI) using Sentinel-2 satellite imagery. Three land use categories—vegetation, non-vegetation, and water bodies—are distinguished using machine learning and deep learning methods. A subsequent density analysis with QGIS highlights spatial patterns of non-vegetation, providing insights into infrastructure development impacts.

## Background
Land use change is a common consequence of regional development and urbanization, particularly around academic institutions. Expansion of facilities, commercial areas, and housing often alters the landscape. Mapping and analyzing land cover are essential for sustainable spatial planning, zoning regulation, and infrastructure management. Remote sensing offers efficient and accurate tools to classify land cover and analyze spatial patterns.

## Objectives
- Classify land use around UNRI using Sentinel-2 imagery.
- Evaluate classification methods based on accuracy, sensitivity, specificity, and Area Under the Curve (AUC).
- Conduct density and point distribution analysis to understand spatial patterns of land use categories.

## Methodology
A supervised classification approach was applied using spectral bands (NIR—Band 8, SWIR—Band 11) as predictors and land cover (vegetation, non-vegetation, water bodies) as the response. Methods used include:

- **Support Vector Machine (SVM)**: Optimizes a hyperplane to separate classes; suitable for multi-class classification.
- **Naive Bayes (NB)**: Probabilistic classifier assuming feature independence.
- **Backpropagation Neural Network (BNN)**: Optimizes weights in neural networks for spatial data classification.

Data were split using stratified 80-20 training-testing sets to ensure balanced evaluation.

## Data
Sentinel-2 imagery (10 m resolution) was combined with ground truth from manual digitization to improve accuracy. The dataset focused on three classes: vegetation, non-vegetation, and water bodies. Data can be accessed via [Google Drive – Dataset](https://drive.google.com/drive/folders/1jSsVc_lkQj-PvB0hrmVFfENTGLtWjKvv?usp=sharing).

## Result
- **Classification Performance**: SVM achieved the highest accuracy: 91.15% (2022) and 83.90% (2023), with minimal variance between training and testing sets.
- **Spatial Patterns**: Non-vegetation areas are concentrated near major roads and facilities, indicating infrastructure influence. Vegetation dominates campus green spaces, while water bodies are scattered.
- **Density Analysis**: Highlights high concentration zones of non-vegetation, reflecting urban development trends.
- **Growth Zones**: Potential expansion areas within 3–5 km of UNRI emphasize the need for sustainable land-use policies in accordance with Law No. 26/2007 on Spatial Planning.

These findings provide valuable insights for urban development planning around academic hubs. Detailed analyses and discussions are published in the corresponding journal article: [Access Journal Publication](https://journal.ummat.ac.id/index.php/jtam/article/view/29683).
