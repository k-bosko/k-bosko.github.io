---
title: "How to link Google Analytics and Google Search Console"
tags:
  - Google Analytics
  - Google Search Console
  - Minimal Mistakes Jekyll

date: February 28, 2020
header:
  teaser: /assets/images/thumbnails/joel-filipe-thumb-400.jpg
excerpt: "How to enable the Google Search Console data in Google Analytics"
---

In another [post](/Personal-website-with-Minimal-Mistakes-Jekyll-Theme-HOWTO-Part-IV) I described how to register your Minimal Mistakes website with Google Analytics and Google Search Console. It turns out that I missed one crucial step - linking them together. Here's a HOWTO do it.
&nbsp;
&nbsp;

## Why linking Google Search Console with Google Analytics?
**Google Search Console** captures queries that people use to find your website in Google. In otherwords, the keywords that drive organic traffic to your site. It also provides major metrics relevant for SEO:
- Total Clicks
- Total impressions
- Average Click-Trough-Rate (CTR)
- Average position (in Google Search) 

By linking with Google Analytics, you will have all these data in **Acquisition --> Search Console** tab, which is handy.

Connecting Google Search Console with Google Analytics also enabled [Analytics Intelligence](https://support.google.com/analytics/answer/7411707?hl=en&ref_topic=7346206) - ML-generated insights in dashboards-like format to better understand trends and user behavior on your site [^ft1]:

<figure style="width: 400px" class="align-center">
  <img src="{{ site.url }}{{ site.baseurl }}/assets/images/posts/Google-Analytics-intelligence.png" alt="Google Analytics Intelligence Example">
</figure> 
&nbsp;


## URL-prefix verification
At first, I couldn't figure out why I get the message "You haven't verified any sites".
I thought I did - since I have my Google Search Console running. It turned out that when you first registered with Google Search Console, you went through **domain verfication** process. But to link it with Google Analytics, you need to go through **URL-prefix verification** process first. 
&nbsp;
&nbsp;

For this, go to your Google Search Console and add another property (in the left top corner):

<figure style="width: 400px" class="align-center">
  <img src="{{ site.url }}{{ site.baseurl }}/assets/images/posts/Google-Search-Console-add-new-property.png" alt="Google Search Console Add New Property">
</figure> 
&nbsp;

Then click to add URL-prefix property and type your website's URL.

{% include figure image_path="/assets/images/posts/Google-Search-Console-URL-prefix-property.jpg" alt="Google Search Console URL-Prefix Property" %}

After that go to your Google Analytics account and click on Settings in the left down corner. Choose from the PRODUCT LINKING (middle pane) “All Products”. Scroll down to “Search Console”:

{% include figure image_path="/assets/images/posts/Google-Analytics-Product-Linking.png" alt="Google Analytics Product Linking" %}

Now you can enable the Google Search Console data in Google Analytics:

{% include figure image_path="/assets/images/posts/Google-Analytics-enable-Search-Console.png" alt="Enable Search Console data in Google Analytics" %}


I hope this post was helpful, thumbs up below if you liked it! 


[^ft1]: I must say I am not quite sure how exactly I enabled Analytics Intelligence in Google Analytics. It could be due to URL-prefix verfication in Google Search Console.