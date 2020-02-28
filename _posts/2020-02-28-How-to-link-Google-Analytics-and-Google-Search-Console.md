---
title: "How to link Google Analytics and Google Search Console"
tags:
  - Google Analytics
  - Google Search Console
  - Jekyll
  - minimal-mistakes
  - website performance

date: February 28, 2020
header:
  teaser: /assets/images/thumbnails/joel-filipe-thumb-800.jpg
---

In another [post](/Personal-website-with-Minimal-Mistakes-Jekyll-Theme-HOWTO-Part-IV) I described how to register your Minimal Mistakes website with Google Analytics and Google Search Console. It turns out that I missed one crucial step - linking them together. Here's #howto do it.
&nbsp;
&nbsp;

First of all, why do you want to link these two products? Well, it turns out that you will have lots of insights in dashboards-like format that were not available before. Like, for instance, these:

<figure style="width: 400px" class="align-center">
  <img src="{{ site.url }}{{ site.baseurl }}/assets/images/posts/Google-Analytics-intelligence.png" alt="Google Analytics Intelligence Example">
</figure> 
&nbsp;
Looks cool, right?

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

{% include figure image_path="/assets/images/posts/Google-Search-Console-URL-prefix-property.png" alt="Google Search Console URL-Prefix Property" %}

After that go to your Google Analytics account and click on Settings in the left down corner. Choose from the PRODUCT LINKING (middle pane) “All Products”. Scroll down to “Search Console”:

{% include figure image_path="/assets/images/posts/Google-Analytics-Product-Linking.png" alt="Google Analytics Product Linking" %}

Now you can enable the Google Search Console data in Google Analytics:

{% include figure image_path="/assets/images/posts/Google-Analytics-enable-Search-Console.png" alt="Enable Search Console data in Google Analytics" %}


I hope this post was helpful, thumbs up below if you liked it! 


