---
layout: single
title: "Portfolio"
permalink: /portfolio/
header:
    overlay_image: /assets/images/joel-filipe-small-warmer.jpg
    caption: "Photo by [Joel Filipe](https://unsplash.com/@joelfilip) on [Unsplash](https://unsplash.com)"
author_profile: true
classes: wide
date: April 30, 2023

feature_row0-1:
  - image_path: assets/gif/gifify.gif
    alt: "AWS app demo"
    title: "Gifify App"
    text: "I developed a Gifify app where a user can upload a video and get it processed into a gif. This is a Flask app deployed to AWS EC2 instance. The user login data is saved into DynamoDB, while the users' uploaded videos and resulting gifs are stored on S3 buckets. The video processing is implemented through a Lambda function (deployed via Docker to ECS)."
    url: "https://github.com/k-bosko/gifify"
    btn_label: "Code"
    btn_class: "btn--primary"
    tags:
        - AWS
        - Lambda
        - S3
        - EC2
        - DynamoDB
        - Flask
        - ECS
        - Docker

feature_row0-2:
  - image_path: assets/gif/wumpus.gif
    alt: "Java game demo"
    title: "Hunt the Wumpus Game"
    text: "Java-based implementation of the '73 classics [\"Hunt the Wumpus\"](https://en.wikipedia.org/wiki/Hunt_the_Wumpus), using MVC design pattern and object oriented programming (OOP). The game can be played in both GUI and text-based modes."
    url: "https://github.com/k-bosko/HWT"
    btn_label: "Java code"
    btn_class: "btn--primary"
    url2: "https://github.com/k-bosko/HWT"
    btn_label2: "UML Diagram"
    btn_class: "btn--primary"
    tags:
        - Java
        - MVC
        - OOP
        - UML

feature_row0-3:
  - image_path: assets/gif/ghostkitchen.gif
    alt: "Node.js app demo"
    title: "GhostKitchen App"
    text: "In a series of GhostKitchen projects, I teamed up with another student to develop a Node.js app that supports CRUD operations for processing new orders for a restaurant chain. The app has 3 versions that differ in database used for backend - one version is based on SQLite, another on MongoDB and yet another on Redis."
    url: "https://github.com/k-bosko/GhostKitchen"
    btn_label: "SQL code"
    btn_class: "btn--primary"
    url2: "https://github.com/k-bosko/GhostKitchen-II"
    btn_label2: "MongoDB code"
    btn_class: "btn--primary"
    url3: "https://github.com/k-bosko/GhostKitchen-III"
    btn_label3: "Redis code"
    btn_class: "btn--primary"
    tags:
        - Node.js
        - SQL
        - MongoDB
        - Redis
        - Bootstrap

feature_row0-4:
  - image_path: assets/gif/best_companies.gif
    alt: "Forbes 500 best companies for work"
    title: "Best Companies for Work App"
    text: "In this project, I teamed up with another student to develop a Python app to explore Forbes 500 best companies to work for. I was responsible for web scraping, data cleaning, creating a SQLite database and data visualizations."
    url: "https://github.com/k-bosko/Best_Companies_to_Work_For"
    btn_label: "Code"
    btn_class: "btn--primary"
    tags:
        - Python
        - SQLite
        - OOP

feature_row0-5:
  - image_path: assets/images/portfolio/kd-tree-performance-results.png
    alt: "Performance results for KD Tree algorithm"
    title: "Measuring the performance of KD Tree algorithm"
    text: "The idea of this project was to test the performance of custom KD Tree implementation versus the naive approach for solving the nearest neighbor problem (KNN). The implementation was tested using the image recoloring approach."
    url: "https://github.com/k-bosko/kd_tree"
    btn_label: "Code"
    btn_class: "btn--primary"
    tags:
        - Python
        - Algorithms
        - KNN
        - Performance

feature_row1-0:
  - image_path: assets/images/portfolio/system-failure-detection-poster.png
    alt: "Detecting System Failure poster"
    title: "Signal Processing + Convolutional Neural Networks on Time Series data"
    text: "I participated in [experiential learning project](https://experiential-learning.northeastern.edu/) at Northeastern University in cooperation with [Lightning eMotors](https://lightningemotors.com/), an automotive research and manufacturing company that develops zero-emission all-electric powertrains. The company provided a dataset with over 9 million unique observations for 19 different variables across different vehicle units. Using this dataset, we developed a method to predict system failure with Signal Processing and Machine Learning techniques (CNN). The predictive model yielded outstanding results (0.95 accuracy score on test data) and can be utilized commercially as an early detection mechanism for system failure. "
    url: "../assets/docs/reports/kbosko-system-failure-detection-poster.pdf"
    btn_label: "Poster"
    btn_class: "btn--primary"
    url2: "../assets/docs/reports/kbosko-system-failure-detection-presentation.pdf"
    btn_label2: "Presentation"
    btn_class: "btn--primary"
    tags:
        - Time Series
        - Signal Processing
        - Convolutional Neural Network

feature_row1-1:
  - image_path: assets/images/posts/starbucks-cluster-conversion-rates.png
    alt: "Clusterisation results based on Conversion Rates"
    title: "Unsupervised Machine Learning"
    text: "In this project, I analyzed the customer behavior in the Starbucks Rewards Mobile App. After signing up for the app, customers receive promotions every few days. The task was to identify which customers are influenced by promotional offers the most and what types of offers to send them in order to maximize the revenue. I used PCA and K-Means clustering to arrive at 3 customer segments (Disinterested, BOGO, Discount) based on Average Conversion Rates and explored their demographic profiles and shopping habits."
    url: "https://github.com/k-bosko/Starbucks_rewards"
    btn_label: "Code + Presentation"
    btn_class: "btn--primary"
    url2: "/Starbucks-Rewards-Program/"
    btn_label2: "Technical Report"
    btn_class: "btn--primary"
    tags:
        - Marketing
        - Segmentation
        - k-means clustering

feature_row1-2:
  - image_path: /assets/images/portfolio/retention_rates.png
    alt: "Retention Rates"
    title: "Marketing Analytics"
    text: "In a series of Marketing Analytics projects, I used Online Retail II dataset to create cohorts based on monthly data, calculated retention rates and visualized them via a heatmap. Then I created RFM (Recency, Frequency, Monetary) segments, calculated RFM Score for each customer and segmented into 3 custom segments 'Top', 'Middle' and 'Low' based on the total RFM Score. Finally, I calculated the revenue-based CLV (Customer Lifetime Value) for each customer."
    url: "https://github.com/k-bosko/cohort_analysis"
    btn_label: "Code for Cohort Analysis"
    btn_class: "btn--primary"
    url2: "https://github.com/k-bosko/RFM_analysis"
    btn_label2: "Code for RFM Analysis"
    btn_class: "btn--primary"
    url3: "https://github.com/k-bosko/CLV_prediction"
    btn_label3: "Code for CLV Prediction"
    btn_class: "btn--primary"
    tags:
    - CLV
    - Cohort Analysis
    - RFM Analysis

feature_row1-3:
  - image_path: /assets/images/portfolio/purchase-analytics-1200.jpg
    alt: "Purchas Analytics results"
    title: "Purchase Analytics"
    text: "In this project, I analyzed purchase behavior of customers that bought 5 different brands of chocolate bars in a physical FMCG store during 2 years. In total, they made 58,693 transactions, captured through the loyalty cards they used at checkout. Based on the results of customer segmentation, I explored the segments sizes and answered the following business questions: 1. How often do people from different segments visit the store? 2. What brand do customer segments prefer on average? 3. How much revenue each customer segment brings?"
    url: "https://github.com/k-bosko/purchase_analytics"
    btn_label: "Code"
    btn_class: "btn--primary"
    tags:
    - EDA
    - Business Analytics

feature_row1-4:
  - image_path: /assets/images/portfolio/Tableau-dashboard-1200.jpg
    alt: "Tableau Dashboard"
    title: "Tableau Dashboard"
    text: "In this project, I performed data analysis to recommend short-term renting strategy for Watershed, a residential rental properties firm. To do this, I extracted relevant data from a real estate MySQL database, analyzed data in Excel to identify the best opportunities to increase revenue and maximize profits and created a Tableau dashboard to show the results of a sensitivity analysis."
    url: "https://public.tableau.com/profile/katerina.bosko#!/vizhome/Bosko_dashboardforWatershedproperties/FinalDashboard"
    btn_label: "Dashboard"
    btn_class: "btn--primary"
    tags:
    - Tableau
    - Excel
    - MySQL

feature_row2:
  - image_path: /assets/images/portfolio/disaster-response-thumb-800.jpg
    alt: "disaster response Flask app"
    title: "Disaster Response app"
    text: "In this project, I built a model for an API that classifies disaster messages. The datasets provided by Figure Eight contain real messages sent during disaster events and their respective categories. The task was to train the supervised ML classifier to automate categorization of the new messages so that different disaster relief agencies would receive only relevant ones. The model was then deployed as a Python Flask app to Heroku."
    url: "https://github.com/k-bosko/disaster_response"
    btn_label: "Code"
    btn_class: "btn--primary"
    url2: "https://disaster-reponse-api.herokuapp.com"
    btn_label2: "App"
    btn_class: "btn--primary"
    tags:
    - NLP
    - Flask
    - ML Pipeline

feature_row3:
  - image_path: /assets/images/portfolio/IBM_DS_platform.jpg
    alt: "IBM data science platform"
    title: "Content Recommendations"
    text: "In this project, I implemented different recommendation engines for users of the IBM Watson Studio platform. <br>
    - _Rank Based Recommendations_: recommended the most popular articles based on the highest user interactions <br>
    - _User-User Based Collaborative Filtering_: recommended unseen articles that were viewed by most similar users <br>
    - _Content Based Recommendations_: recommended articles based on similarity of content <br>"
    url: "https://github.com/k-bosko/recommendations_IBM"
    btn_label: "Code"
    btn_class: "btn--primary"
    tags:
    - recommender system
    - collaborative filtering


feature_row5:
  - image_path: assets/images/portfolio/deep_learning-thumb-800.jpg
    portfolio_caption: Photo Credit [Ardon Dertat](https://towardsdatascience.com/applied-deep-learning-part-1-artificial-neural-networks-d7834f67a4f6)
    alt: "deep learning network"
    title: "Deep Learning"
    text: "In this project, I have first developed code for an image classifier built with PyTorch in Jupyter Notebook, then converted it into a command line application. The application allows you to choose one of the pretrained architectures, specify different hyperparameters (learning rate, hidden layers, epochs) and use either GPU or CPU for training. I also implemented saving the checkpoints so that you can continue training if stopped. Image Classifier predicts 102 flower categories. "
    url: "https://github.com/k-bosko/image_classifier"
    btn_label: "Code"
    btn_class: "btn--primary"
    tags:
        - deep-learning
        - transfer-learning
        - PyTorch
---

## Projects in Computer Science

{% include feature_row id="feature_row0-1" type="left" %}
<a name="Gifify AWS app"></a>
{% include feature_row id="feature_row0-2" type="left" %}
<a name="HWT game"></a>
{% include feature_row id="feature_row0-3" type="left" %}
<a name="GhostKitchen Node.js app"></a>
{% include feature_row id="feature_row0-4" type="left" %}
<a name="Python app"></a>
<a name="NLP Flask app"></a>
{% include feature_row id="feature_row2" type="left" %}
<a name="KD Tree algorithm"></a>
{% include feature_row id="feature_row0-5" type="left" %}

## Projects in Data Science

&nbsp;
<a name="Signal-Processing">
{% include feature_row id="feature_row1-0" type="left" %}
{% include feature_row id="feature_row5" type="left" %}
<a name="Deep-Learning">
{% include feature_row id="feature_row1-1" type="left" %}
<a name="Marketing-Analytics"></a>
{% include feature_row id="feature_row1-2" type="left" %}
<a name="Purchase-Analytics"></a>
{% include feature_row id="feature_row1-3" type="left" %}
<a name="Tableau-Dashboard"></a>
{% include feature_row id="feature_row1-4" type="left" %}
<!-- <a name="Digital-Marketing"></a>
{% include feature_row id="feature_row4" type="left" %} -->
<a name="Recommender-System"></a>
{% include feature_row id="feature_row3" type="left" %}



