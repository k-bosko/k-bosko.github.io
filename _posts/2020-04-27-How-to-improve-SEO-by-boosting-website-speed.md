---
title: "How to improve SEO by boosting website speed"
tags:
  - Google Lighthouse
  - Minimal Mistakes Jekyll
  - SEO
toc: true

date: April 27, 2020
header:
  teaser: /assets/images/thumbnails/joel-filipe-thumb-800.jpg
excerpt: "How to Run Website Speed Test with Google Lighthouse"
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

- From Chrome Dev Tools Audits tab

{% include figure image_path="/assets/images/posts/Google-Lighthouse-audit-tab-1000.jpg" alt="Google Lighthouse Audit tab" %}


## Benchmark Score

When I first checked my blog's performance, it turned out that it was really average for **mobile version**:

{% include figure image_path="/assets/images/posts/Google-Lighthouse-PageSpeed-Insights-results-1500.jpg" alt="Google PageSpeed Insight results for cross-validated mobile" %}
 
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

Identify slow third-party JavaScript

Third-party code can significantly impact load performance. Limit the number of redundant third-party providers and try to load third-party code after your page has primarily finished loading


Font Awesome was slow to load - taking over 600ms.

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

&nbsp;
&nbsp;
### Other Optimization Techniques and Tools

Minify CSS with [CSS Minifier](https://cssminifier.com) - reduces the filesize by removing any extra whitespace or characters and squeezing code into one line 

Minify JavaScript with [JavaScript Minifier](https://javascript-minifier.com) - the same process as described above but for JavaScript


<i class="far fa-sticky-note"></i> **Note:** For Minimal Mistakes users, there is no need to minify CSS or JavaScript.  
  {: .notice--info}
  {: .text-justify}

&nbsp;
&nbsp;

**Thumbs up below if you find this post helpful.**

[^ft1]: Learned about it thanks to [Tutorial Shares](http://tutorialshares.com/batch-convert-png-jpg-mac-terminal/).