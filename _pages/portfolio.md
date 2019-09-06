---
layout: single
title: "Portfolio"
header:
    overlay_image: /assets/images/joel-filipe-small-darker.jpg
    caption: "Photo by [Joel Filipe](https://unsplash.com/@joelfilip) on [Unsplash](https://unsplash.com)"
author_profile: true
classes: wide
date: August 27, 2019
feature_row1:
  - image_path: assets/images/deep_learning.png
    portfolio_caption: Photo Credit [Ardon Dertat](https://towardsdatascience.com/applied-deep-learning-part-1-artificial-neural-networks-d7834f67a4f6)
    alt: "placeholder image 2"
    title: "Image Classifier"
    text: "In this project, I have first developed code for an image classifier built with PyTorch in Jupyter Notebook, then converted it into a command line application. The application allows you to choose one of the pretrained architectures, specify different hyperparameters (learning rate, hidden layers, epochs) and use either GPU or CPU for training. I also implemented saving the checkpoints so that you can continue training if stopped. Image Classifier predicts 102 flower categories. "
    url: "https://github.com/k-bosko/image_classifier"
    btn_label: "Code"
    btn_class: "btn--primary"
    tags: 
        - deep-learning
        - transfer-learning
        - PyTorch

feature_row2:
  - image_path: /assets/images/disaster-response.png
    alt: "placeholder image 2"
    title: "Disaster Response"
    text: "In this project, I built a model for an API that classifies disaster messages. The datasets provided by Figure Eight contain real messages sent during disaster events and their respective categories. The task was to train the supervised ML classifier to automate categorization of the new messages so that different disaster relief agencies would receive only relevant ones. The model was then deployed as a Python Flask app to Heroku."
    url: "https://github.com/k-bosko/disaster_response"
    btn_label: "Code"
    btn_class: "btn--primary"
    url2: "https://github.com/k-bosko/disaster_response"
    btn_label2: "App"
    btn_class: "btn--primary"
    tags: 
    - NLP
    - Flask-app
    - ML Pipeline

feature_row3:
  - image_path: /assets/images/IBM_DS_platform.png
    alt: "placeholder image 2"
    title: "Recommendations with IBM"
    text: "In this project, I implemented different recommendation engines for users of the IBM Watson Studio platform. <br>
    - _Rank Based Recommendations_: recommended the most popular articles based on the highest user interactions <br>
    - _User-User Based Collaborative Filtering_: recommended unseen articles that were viewed by most similar users <br>
    - _Content Based Recommendations_: recommended articles based on similarity of content <br>
    - _Matrix Factorization_: performed SVD to predict articles a user might interact with"
    url: "https://github.com/k-bosko/recommendations_IBM"
    btn_label: "Code"
    btn_class: "btn--primary"
    tags: 
    - recommender system
    - collaborative filtering

feature_row4:
  - image_path: assets/images/customer_segmentation.png
    portfolio_caption: "Photo Credit [Dynamic Concepts Blog](http://www.dynamic-concepts.nl/en/segmentation/)"
    alt: "placeholder image 2"
    title: "Customer Segmentation"
    text: "In this project, I applied unsupervised learning techniques to identify segments of the population that form the core customer base for a mail-order sales company in Germany. I worked with real-life data provided by Bertelsmann partners AZ Direct and Arvato Finance Solution. Prior to applying the machine learning methods, I assessed and cleaned the data in order to convert the data into a usable form."
    url: "https://github.com/k-bosko/customer_segmentation"
    btn_label: "Code"
    btn_class: "btn--primary"
    tags: 
        - k-means clustering
        - PCA
        - unsupervised ML
---

**Skills**: Python, Git, Tableau, SQL, Excel

**Libraries**: NumPy, Pandas, Scikit-learn, PyTorch, matplotlib, seaborn, nltk, BeautifulSoup

**Selected projects**:

{% include feature_row id="feature_row1" type="left" %}
{% include feature_row id="feature_row2" type="left" %}
{% include feature_row id="feature_row3" type="left" %}
{% include feature_row id="feature_row4" type="left" %}


