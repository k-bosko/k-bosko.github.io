---
title: "How to improve SEO by boosting website speed"
tags:
  - Google Lighthouse
  - Minimal Mistakes Jekyll
  - SEO
  - PageSpeed Insights

toc: true
toc_label: "Content"

date: April 27, 2020
header:
  teaser: /assets/images/thumbnails/joel-filipe-thumb-800.jpg
excerpt: "How to Run Website Speed Test with Google PageSpeed Insights"
---

Recently I taught myself how to conduct technical audit to improve SEO and want to share my knowledge here. 

My two reasons for speed slowdown were **Image Sizes** and  **Font Awesome**. Read on to learn my solutions.

<i class="far fa-sticky-note"></i> **Note:** Although my solutions are universal, I have some specific advice for those who built their website with [Minimal Mistakes Jekyll theme](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/) and [run it on GitHub Pages](/Personal-website-with-Minimal-Mistakes-Jekyll-Theme-HOWTO-Part-III/).
  {: .notice--info}
  {: .text-justify}



## Why speed matters?
Website's speed affects a lot of important metrics such as:
- the ranking position in Google Search results
- bounce rate
- conversion rate 

Just by reducing the page load time from 3 seconds to 1 second, you can reduce bounce rate by 32%, according to [Google data](https://support.google.com/webmasters/answer/9205520). 

Google also created a [useful tool](https://www.thinkwithgoogle.com/feature/testmysite/) that allows you to measure the impact of a faster site on your revenue. Here's an example:

{% include figure image_path="/assets/images/posts/Google-Lighthouse-speed-revenue-impact-tool.png" alt="Google tool to evaluate impact of a website speed on revenue" %}


## Running Speed Test
You can run speed test in two (identical) ways:

- with Page Speed Insights from Google Search Console Speed tab 

{% include figure image_path="/assets/images/posts/Google-Lighthouse-PageSpeed-Insights-1500.jpg" alt="PageSpeed Insights in Google Search Console" %}

- From Chrome Dev Tools Audits tab (Lighthouse)

{% include figure image_path="/assets/images/posts/Google-Lighthouse-audit-tab-1000.jpg" alt="Google Lighthouse Audit tab" %}

Both tests produce reports across mobile and desktop devices. While Google’s PageSpeed Insight tool shows you only the Performance score, Lighthouse tool accessible from Chrome Dev Tools provides few more metrics on top of Performance such as Accessibility, Best Practices and SEO.

<i class="far fa-sticky-note"></i> **Note:** If you want to learn more about Lighthouse Score components and how they are created, checkout this official [Lighthouse Score Weighting doc](https://docs.google.com/spreadsheets/d/1up5rxd4EMCoMaxH8cppcK1x76n6HLx0e7jxb0e0FXvc/edit#gid=283330180). There is also a free [Website Performance Optimization course](https://www.udacity.com/course/website-performance-optimization--ud884) on Udacity.
  {: .notice--info}
  {: .text-justify}



## Benchmark Score

The tools such as Lighthouse or PageSpeed Insights allow you to test the speed of any page of your website. I decided to start with the main page - https://www.cross-validated.com

When I first checked my blog’s performance, it turned out that the page speed was really good for desktop version (98/100) but only average for mobile version (56/100 rating):

{% include figure image_path="/assets/images/posts/Google-Lighthouse-PageSpeed-Insights-results-1500.jpg" alt="Google PageSpeed Insight results for cross-validated mobile" caption="Page Speed Rating on Mobile before Optimization" %}
 
Troubleshooting why it took so long for my website to load, I came down to two main delay sources - **Large Images** and **Font Awesome**.


## Speed Delay Sources

### Large Images 

Large image sizes are really critical for the site's mobile version. It turned out that my avatar was 1.3 Mb and it was one main reason for the average audit score. Interestingly, this wasn't a problem for the desktop version, where I got a score of almost 100.

I knew that big image sizes adversly affect the load time. But how big is big? Before I thought that the image quality is the king and the size around 400 kb is really small. Now I try to optimize my images and resize them to get good quality with the maximum image size around 100 Kb.

I batch resize image files from Mac Terminal using native `sips` (scriptable image processing system) like so[^ft1]:

```terminal
# Batch Resize 
sips -Z 800 *.png

# Batch Convert PNG to JPG
mkdir jpegs; sips -s format jpeg *.* --out jpegs

# Batch Convert JPG to PNG
mkdir pngs; sips -s format png *.* --out pngs
```


For screen shots captured automatically with `Command+Shift+4` on Mac, it works best if you first resize the `png` screen shot and then convert it to `jpeg`.


<i class="far fa-sticky-note"></i> **Note:** There is a nice Jekyll plugin to automatically resize images - [Picture Tag](https://github.com/rbuchberger/jekyll_picture_tag). However, if you host your website on GitHub Pages like me, you can't use this tool because it is not supported by GitHub Pages. [GitHub Pages cannot build sites using unsupported plugins](https://help.github.com/en/github/working-with-github-pages/about-github-pages-and-jekyll).  
  {: .notice--info}
  {: .text-justify}

&nbsp;
&nbsp;

### Font Awesome

Font Awesome provides Twitter, LinkedIN, GitHub and other icons on my blog. Before optimization, it was delivered as JavaScript and was very slow to load.

The solution is to load a **CSS version of Font Awesome instead of JavaScript**.

If you are using **Jekyll Minimal Mistakes theme** like me, you can switch to Font Awesome CSS like so:

- Go to `head.html` and add Font-Awesome minified CSS delivered from Cloudflare CDN as a second line after `main.css` like so:

```md
<!-- For all browsers -->
<link rel="stylesheet" href="{{ '/assets/css/main.css' | relative_url }}">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css">
```
- Delete the referral to Font Awesome JavaScript from `_includes/scripts.html`:

```md
<script src="https://kit.fontawesome.com/4eee35f757.js"></script>
```

## Performance Score after Optimization

Resizing large images and switching to CSS for Font Awesome boosted the page’s performance score from 59 to 97 on mobile:

{% include figure image_path="/assets/images/posts/Google-Lighthouse-after-Optimization-1500.jpg" alt="Google PageSpeed Insight results for cross-validated mobile after optimization" caption="Page Speed Rating on Mobile after Optimization"%}
 

## Further Testing and Unresolved Problems

Testing pages with posts, however, showed again average results (around 80/100). The major problem is that I’m using several third-party JavaScript providers such as:

- Disqus (commenting platform)
- Google Analytics
- Google Tag Manager (Google Optimize was installed with GTM)
- MathJax

Switching off Disqus, for instance, almost halved Time to Interactive (from 11s to 6s). Right now, I am not ready to give up on Disqus. So I think this is a trade-off I have to face.

Another problem that I can’t solve right now is the caching time of static assets. Since I’m hosting on GitHub Pages, I cannot change cache policy which apparently is only 10 m for images on GitHub. :( Now thinking about about moving my site to AWS cloud.

[^ft1]: Learned about it thanks to [Tutorial Shares](http://tutorialshares.com/batch-convert-png-jpg-mac-terminal/).