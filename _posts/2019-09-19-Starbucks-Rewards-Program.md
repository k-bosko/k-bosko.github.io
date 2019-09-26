---
title: "Target Audience for Direct Marketing in Starbucks Rewards Mobile App"
toc: true
toc_label: "Contents"
tags:
  - Udacity DSDN
  - customer segmentation
  - direct marketing
  - K-means
  - PCA

date: September 19, 2019
header:
  teaser: /assets/images/thumbnails/daiga-ellaby-unsplash-600.png
excerpt: "The technical report for the capstone project in Udacity Data Science Nanodegree"
---

{% include figure image_path="/assets/images/posts/daiga-ellaby-unsplash-1200.png" alt="Starbucks cup of coffee and mobile" caption="" %}
Photo by <a style="background-color:black;color:white;text-decoration:none;padding:4px 6px;font-family:-apple-system, BlinkMacSystemFont, &quot;San Francisco&quot;, &quot;Helvetica Neue&quot;, Helvetica, Ubuntu, Roboto, Noto, &quot;Segoe UI&quot;, Arial, sans-serif;font-size:12px;font-weight:bold;line-height:1.2;display:inline-block;border-radius:3px" href="https://unsplash.com/@daiga_ellaby?utm_medium=referral&amp;utm_campaign=photographer-credit&amp;utm_content=creditBadge" target="_blank" rel="noopener noreferrer" title="Download free do whatever you want high-resolution photos from Daiga Ellaby"><span style="display:inline-block;padding:2px 3px"><svg xmlns="http://www.w3.org/2000/svg" style="height:12px;width:auto;position:relative;vertical-align:middle;top:-2px;fill:white" viewBox="0 0 32 32"><title>unsplash-logo</title><path d="M10 9V0h12v9H10zm12 5h10v18H0V14h10v9h12v-9z"></path></svg></span><span style="display:inline-block;padding:2px 3px">Daiga Ellaby</span></a>

_This is the technical report I wrote for the capstone project in Udacity Data Science Nanodegree. The code for this project can be found on my GitHub [here](https://github.com/k-bosko/Starbucks_rewards)._
{: .notice--primary}

# 1. Project Definition
## 1.1. Project Overview

In this project I analyze the customer behavior in the Starbucks rewards mobile app.[^ft1] After signing up for the app, customers receive promotions every few days. The task is to identify what customers are influenced by promotional offers the most and what types of offers to send them in order to maximize the revenue. 

There are three types of promotions:
  * discount 
  * bogo (buy one, get one free)
  * informational - product advertisiment without any price off

Each offer is valid for certain number of days before it expires. Discounts and bogos have also different difficulty level, depending on how much the customer needs to spend in order to earn the promotion. Promotions are distributed via different multiple channels (social, web, email, mobile).

All transactions made through the app are tracked automatically. The app also records information about which offers have been sent, which have been viewed and which have been completed and when these three events happened.

## 1.2. Dataset Overview
The data is organized in three files:

* `portfolio.json` (10 offers x 6 fields) - offer types sent during 30-day test period 
* `profile.json` (17000 users x 5 fields) - demographic profile of app users 
* `transcript.json` (306648 events x 4 fields) - event log on transactions, offers received, offers viewed, and offers completed 

Here is the schema and explanation of each variable in the files:

**portfolio.json**

  * id (string) - offer id
  * offer_type (string) - type of offer ie BOGO, discount, informational
  * difficulty (int) - minimum required spend to complete an offer
  * reward (int) - reward given for completing an offer
  * duration (int) - time for offer to be open, in days
  * channels (list of strings)

**profile.json**
  * age (int) - age of the customer 
  * became_member_on (int) - date when customer created an app account
  * gender (str) - gender of the customer 
  * id (str) - customer id
  * income (float) - customer's income

**transcript.json**
  * event (str) - record description (ie transaction, offer received, offer viewed, etc.)
  * person (str) - customer id
  * time (int) - time in hours since start of test. The data begins at time t=0
  * value - (dict of strings) - either an offer id or transaction amount depending on the record


## 1.3. Problem Statement

The aim of this project is to identify target audience for a successful marketing campaign in direct marketing:

> Direct marketing describes the marketer's efforts to directly reach the customer through direct marketing communications (direct mail, e-mail, social media, and similar "personalized" or one-on-one means). The direct marketiing effort requires marketers to have a target list of customers that will each receive a marketing message tailored to their needs and interests. --- John A. Davis: "Measuring Marketing", 3d Edition, 2018, Part 8.

To solve this task, I decided to use customer segmentation using **K-means clustering technique**. 

The idea is to divide app users into major groups - those more prone to discounts vs. those more keen on bogos vs. those that are not interested in promotions at all. The number of groups was decided at the later stage depending on the actual patterns in the final dataset.

## 1.4. Metrics

The critical decision in customer segmentation task is to choose the optimal number of segments. The problem is that unsupervised machine learning doesn't have clearly defined benchmark metrics for model performance evaluation on par with supervised ML (e.g. accuracy score, f1-score, AUC, etc.). Instead there is a number of heuristics that aid analysts during decision-making process, but which ultimately doesn't say anything whether the modeling results are good or bad. For k-means clustering, these heuristics are elbow curve method and silouhette score for deciding upon optimal number of clusters (see section 4.4. for more details). 

To evaluate the segmentation results, I relied on the following marketing metrics[^ft2]:
  * **Response Rate (RR)** - the percentage of customers who viewed an offer relative to the number of customers that received the offer
  * **Conversion Rage (CVR)** - the percentage of customers who completed an offer relative to the number of customers who viewed an offer

These two marketing metrics helps marketers to improve efficiency and reduce costs of marketing campaign. The response rate tells how many customers are interested in offers, while the conversion rates shows whether the offers sent were attractive enough to complete them.

By calculating each customer's RR and CVR for all bogos, discounts and informational offers sent to him/her, I was able to evaluate the resulting segments in alignment with the project's task, i.e. identify target audience for each promotion type. 


# 2. Methodology

## 2.1. Data Preprocessing

Similar to most data science tasks, the data cleaning and preprocessing consumed the most amount of time when I worked on this project. 

The first step was to combine the three datasets (portfolio, profile, transactions) into one final dataset. Because the project's goal was to identify the customer segments based on their engagement with promotional offers, I decided to aggregate data at the level of each customer. However, before that was possible I needed to reorganize transactions data which was rather messy. In the following I describe the major challenge confronted here. 

**Correcting Offers Completed and Offers Viewed**

The particular challenge here was that event log doesn't take into account user behavior when tracking completed offers. As it is now, the app marks offers as completed when they satisfy the offer criteria (expiration date and amount to be spent). This means that users might earn rewards even when they haven't viewed an offer. Similarly, the viewed offers as recorded in the event log don't take timing into consideration, which results into a situation when a user viewed an offer after it expired. As a result, the completed and viewed offers as they are recorded in the event log don't reflect the actual campaign's effect and the overall campaign results will be distorted. 

To address this problem, I identified which offers were viewed during the offer time window (before expiration date) and which offers were completed after viewing and before expiration date. These were separated from offers that were incorrectly attributed as completed or viewed. Both CVR and RR metrics reported here are based on the corrected values. 

The technical side of this step can be summarized as follows. 

**Create unique identifier for each offer sent:**

  To evaluate which offers were viewed and completed correctly, I had to organize data at the offer level with timestamps for each event (received, viewed, completed). However, some customers received the same offer type more than once, meaning that the offer id is not a unique identifier in this case. When aggregating this data at later stage, information on these offers will be lost unless we create unique identifiers for them. To get an idea, there are 76277 offers sent, from which 51570 offers were sent to a certain customer only once, while 24707 offers of the same types where sent more than once.

  So first, I created a unique identfier for each offer by combining `groupby()` and `cumcount()` functions to count how many times the same offer type was sent to the same person and then combine this counter with the offer id into a unique identifier:

```python
#create unique identifier for each offer sent (because same offers could be sent more than once)
  starbucks_time['id_unique_received'] = starbucks_time[starbucks_time.offer_received == 1].groupby(['person', 'offer_id']).cumcount()
  starbucks_time['id_unique_viewed'] = starbucks_time[starbucks_time.offer_viewed == 1].groupby(['person', 'offer_id']).cumcount()
  starbucks_time['id_unique_completed'] = starbucks_time[starbucks_time.offer_completed == 1].groupby(['person', 'offer_id']).cumcount()
  starbucks_time['id_unique_events'] = starbucks_time[['id_unique_received', 'id_unique_viewed', 'id_unique_completed']].max(axis=1).values
  starbucks_time['id_unique'] = starbucks_time['offer_id'] + "-" + starbucks_time['id_unique_events'].apply(lambda x: str(x))
```
For instance, if the offer type `'fafdcd668e3743c1bb461111dcafc2a4'` was sent to the same person twice, the first offer sent gets unique id as `'fafdcd668e3743c1bb461111dcafc2a4-0.0'` while the second offer of the same type gets unique id of `'fafdcd668e3743c1bb461111dcafc2a4-1.0'`. 

&nbsp;

**Pivot timestamps data from long to wide format**

  Since the data in transactions dataset was in the long format, the next challenge was to organize it into wide format with combination of `groupby()`, `max()` and `unstack()` functions.  

```python
  # create columns with time for each event
  starbucks_time['offer_received_time'] = starbucks_time['offer_received']*starbucks_time.time
  starbucks_time['offer_viewed_time'] = starbucks_time['offer_viewed']*starbucks_time.time
  starbucks_time['offer_completed_time'] = starbucks_time['offer_completed']*starbucks_time.time
  starbucks_time = starbucks_time[['person', 'id_unique', 'offer_id', 'time', 'offer_received_time', 'offer_viewed_time', 'offer_completed_time']]

  # unstack values to get to the level of each (person, offer id) tuple
  # need to take max values to avoid 0s
  starbucks_time_full = starbucks_time.groupby(by=['person', 'id_unique', 'time']).max().unstack()
  starbucks_time_full.fillna(0, inplace=True)

  # create the final time-based dataset for each offer sent
  offers = pd.DataFrame(starbucks_time_full.index.get_level_values('id_unique'), starbucks_time_full.index.get_level_values('person')).reset_index()
  offers['offer_received_time'] = starbucks_time_full['offer_received_time'].values.max(axis=1)
  offers['offer_viewed_time'] = starbucks_time_full['offer_viewed_time'].values.max(axis=1)
  offers['offer_completed_time'] = starbucks_time_full['offer_completed_time'].values.max(axis=1)
```
So from this:
{% include figure image_path="/assets/images/posts/starbucks-timestamps-original.png" alt="Timestamp records of each event" %}

... we got to this:
{% include figure image_path="/assets/images/posts/starbucks-timestamps-organized.png" alt="Timestamps of each event organized at offer level" %}

&nbsp;
**Add offer end time**

Then I combined the time-based data with portfolio data to access the duration of each offer and calculate the offer expiration timestamp by adding the duration time (converted from days to hours) to received timestamp in hours.

```python
# add information about each offer from portfolio
  offers['id'] = offers.id_unique.apply(lambda x: x.split("-")[0])
  offers = offers.merge(portfolio, on='id', how='left')

  # add offer end time (convert duration time that is in days to hours)
  offers['offer_end_time'] = offers['offer_received_time']+offers['duration'].values*24
```
&nbsp;

**Identify completed offers and viewed offers correctly**

Now I had all the needed information on offer level to correctly attribute offers as completed or viewed. 

For offer to be counted as _"viewed"_ it had to be viewed before offer expiration date. 

```python
offers['viewed_binary'] = offers.offer_viewed_time.apply(lambda x: 1 if x > 0 else 0)
offers['viewed_on_time'] = (offers.offer_viewed_time < offers.offer_end_time)*offers['viewed_binary'] 
```

For offer to be _"completed"_ it had to meet these conditions:
1. be completed before offer expiration date
2. completed after viewing 

```python 
offers['completed_binary'] = offers.offer_completed_time.apply(lambda x: 1 if x > 0 else 0)
offers['completed_on_time'] = (offers.offer_completed_time < offers.offer_end_time)*offers['completed_binary'] 

completed_before_expires = (offers.offer_completed_time < offers.offer_end_time)
completed_after_viewing =(offers.offer_completed_time > offers.offer_viewed_time)*offers['viewed_binary']
offers['completed_after_viewing'] = (completed_after_viewing & completed_before_expires)*offers['completed_binary']
 ```
The effect of this "cleanup" is not to be underestimated. According to my analysis, **Starbucks could have saved almost $70,000** if it tracked completed offers correctly:

{% include figure image_path="/assets/images/posts/starbucks-amount-wasted.png" alt="Analysis results on rewarded total and amount waisted due to incorrect attribution of completed offers" %}


## 2.2. Feature Engineering

The final dataset has 32 features, most of which were calculated or engineered. Thus, I created the following features:

- `total_amount` (int): the amount spent by each customer during the 30 day test period 
- `total_rewarded` (int): the amount each customer was rewarded (Note: not the recorded sum, but correctly attributed sum)
- `transactions_num` (int): number of transactions each customer made during the test period
- `offers_received` (int): total number of offers received by each customer
- `offers_viewed` (int): total number of offers viewed by each customer 
- `offers_completed` (int): total number of offers completed by each customer
- `bogo_received`, `bogo_viewed`, `bogo_completed` (int): the number of bogo offers correspondingly received, viewed and completed
- `discount_received`, `discount_viewed`, `discount_completed` (int): the number of discount offers correspondingly received, viewed and completed
- `informational_received`, `informational_viewed` (int): the number of informational offers correspondingly received and viewed 
- `total_bogo`, `total_discount` (int): the amount each customer got rewarded correspondingly on bogo and discount offers
- `avg_order_size` (int): average order size as total amount divided by number of transactions
- `avg_reward_size` (int): average reward size as total amount rewarded divided by the number of discounts and bogo offers completed
- `avg_bogo_size`, `avg_discount_size` (int): average bogo size as the number of total bogo amount rewarded divided by total number of bogo completed and the corresponding numbers for average discount size for each customer
- `offers_rr`, `bogo_rr`, `discount_rr`, `informational_rr` (int): response rates of each customer at the overall offer level, bogo, discount and informational level
- `offers_cvr`, `bogo_cvr`, `discount_cvr` (int): conversion rates of each customer at the general offer level and at the bogo and discount levels.


<i class="far fa-sticky-note"></i> **Note:** All features that have to deal with offer viewing or completing reflect not recorded number, but correctly attributed number and the amounts that are based on these numbers reflect the correctly attributed sums, not the recorded sums (see 2.1. for more information). This ensures that we measure customer interaction with offers correctly.
{: .notice--info}

## 2.3. Imputing Missing Values 

It turned out that there are about 2175 customers (12.8%) with missing values in the profile dataset. Rows with missing data had no information on customer's age, income and gender simultaneously. I implemented two strategies to deal with missing data in a function:
 - drop the missing values all together (which is worse, since 12% is a lot of data) 
 - impute with median values for numerical columns (age and income) or impute the mode for categorical column (gender). The median values for age and income turned out to be _55 years_ and _$64000_ correspondingly and _Male_ as the most frequent value for gender.  


# 3. Analysis 

## Data Exploration
## Data Visualization

# 4. Model Implementation 

The linear unsupervised machine learning and K-means clustering in particular rely on distances as measure of similarity and hence are prone to data scaling. To account for this problem, I further transformed the data before clustering - one-hot encoded categorical features, scaled the features and perform dimensionality reduction.

## 4.1. One Hot Encoding

The majority of features in the final dataset are numerical except for `gender`, which is categorical. This column had to be one-hot encoded, meaning its values had to be converted into binary (dummy) variables that take on either 0 or 1 . Earlier in the project I also one-hot encoded offer types.
<!-- TOODO: add code? more info? -->

Besides that I decided to transform the original `became_member_on` into categorical column with membership years as its values. The categorical membership column now could serve as a proxy for customers loyalty and was easier to interpret afterwards. Because there are only 6 possible years (2013-2018), the one-hot encoding of this feature didn't increase the data dimensionality that much.


## 4.2. Feature Scaling

Next, the data was transformed to achieve the same scale needed for PCA and K-means clustering. This is an important step, as otherwise features with large scale would dominate the clustering process. There are two popular scaling techniques implemented in scikit-learn library:

- StandardScaler: standardizes/normalizes the data by substracting the mean and dividing by the standard deviation; 
- MinMaxScaler: transforms the data so that all of its values are between zero and one.

I tried both scaling techniques in this project (see more in 4.5.)


## 4.3. Dimensionality Reduction with PCA

Dimensionality reduction helps reduce the noise in the data by projecting it from high-dimensional into low-dimensional space, while retaining as much of the variation as possible. The ML algorithms thus can identify patterns in the data more effectively (because of less variability in data) and more efficiently (because of less dimensions hence less computational power needed to make calculations).[^ft3] 

In this project, I used standard Principal Component Analysis (PCA). In the first step, I performed PCA on the original number of dimensions (i.e. features) and visualized the importance of each component with the scree plot:

<figure style="width: 70%" class="align-center">
  <img src="{{ site.url }}{{ site.baseurl }}/assets/images/posts/starbucks-scree-plot.png" alt="">
</figure> 
From the scree plot, one can easily see that the first 10 components in total capture about 50% of the variance in the data. 

As a good rule of thumb, one should keep as many components that together explain about 80% of variance. For the binned dataset, this number is 19. I wrote the code to automatically select this number of PCA components, so that I could easily test different datasets when clustering:

```python
pca = PCA()
X_pca = pca.fit_transform(starbucks_scaled)
cum_expl_var_ratio = np.cumsum(pca.explained_variance_ratio_)

#choose number of components that explain ~80% of variance
components_num = len(cum_expl_var_ratio[cum_expl_var_ratio <= 0.805])
print(f"number of pca components that explain 80%: {components_num}")
pca = PCA(components_num).fit(starbucks_scaled)
starbucks_pca = pca.transform(starbucks_scaled)
```

## 4.4. K-means clustering

The goal of clustering is to identify groups of data, in which values are similar to each other. K-means is a popular algorithm in that it finds the data points that are closest to the cluster centroid. In technical terms, it tries to minimize the sum of the squared distances of each data point to the mean of the assigned cluster. [^ft4] 

Since the cluster means are assigned initially randomly, there is no guarantee that it will produce the optimal clustering result. It is usually recommended to run Therefore, I specified the number of iterations as 10 to find 


## 4.5. Refinement

When going through the full analytical cycle for the first time, I made the following decisions that predetermined the clustering results:
- the decision to impute values
- the decision to use standardization when scaling
- the decision to perform PCA 
- the decision to create 3 clusters

In an attempt to diminish the influence of these decisions, I decided to refactor the code in form of functions that would allow quick experimentation. In particular, I was keen on checking the clustering results when:
- missing values were dropped instead of imputed
- MinMax scaler was used instead of Standard Scaler
- no PCA was performed
- different number of clusters was used

 <!-- TODO: add the results of experimentation -->

# 5. Results

## 5.1. Model Evaluation and Validation

## 5.2. Justification

# 6. Conclusion

## 6.1. Reflection
Having segmented data into 3 groups, we now have better insight into Starbucks rewards user base. The clustering results would allow the company to better target audience with tailored offers in the next marketing campaign. 

To arrive at this solution, I performed the full analysis cycle - cleaning and preprocessing the data, dealing with missing values, feature engineering, feature scaling, one hot encoding, dimensionality reduction and clustering. I also wrote a number of functions to generate the clustering results automatically, which allowed some quick experimentation. 

While working on this project, I found that data preprocessing consumed a lot of time and was particularly challenging in this case because the event log didn't account for particular marketing needs. As a marketer, for instance, I would not like when my response rates would be contaminated by offers viewed after the offer expiration date. Similarly, I would not like to waste marketing budget on customers that would buy the product even without promotional offer or earn rewards even when not viewing the offers. By imposing conditions on when offers should be considered as properly "viewed" or "completed", I managed to fix this problem with original records. In the future, however, it would be advisable for Starbucks to implement a different tracking strategy as, for instance, by putting a reference code in the campaign message and asking the consumers to mention the code in order to receive the reward.


## 6.2. Improvement
One of the possible ways to improve the clustering results is to predict the missing age, income and gender values instead of simply imputing them. In this case, I would use the supervised machine learning, experimenting with different models like RandomForest, AdaBoost, etc. Another useful improvement would be to use the clustering results as labels in supervised modeling to actually predict customer's probability of completing the offer. This would be a nice practical application that would allow extension on new customers and so would assist in executing a successful marketing campaign in the future.

[^ft1]: The data is simulated but mimics the actual customer behavior closely. It is also a simplified version, since it contains information only about one product, while the real app sells a variaty of products. Finally, the data provided contains information on transactions/offer events during the 30 days trial test. 

[^ft2]: Farris, P., Bendle, N., Pfeifer, Ph., Reibstein, D. (2016): Marketing Metrics: The Manager's Guide to Measuring Marketing Performance, 3rd Edition. Pearson Education, Inc. Chapter 8 "Promotions", pp. 271-293.

[^ft3]: cf. Ankur A. Patel (2019): "Hands-On Unsupervised Learning Using Python".

[^ft4]: cf. Peter Bruce, Andrew Bruce (2018): "Practical Statistics for Data Scientists", O'Reilly.


<!-- This is a capstone project for Udacity Data Science Nanodegree.  -->