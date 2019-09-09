---
title: "Personal Website with Minimal Mistakes Jekyll Theme HOWTO - Part III"
header:
  teaser: /assets/images/thumbnails/joel-filipe-thumb-800.jpg
excerpt: "How to host personal website on GitHub Pages and use private domain"
date: August 28, 2019
tags:
  - Jekyll
  - minimal-mistakes
  - GitHub Pages
  - DNS
---

_This is Part III of the website HOWTO series. See [Part I](/Personal-website-with-Minimal-Mistakes-Jekyll-Theme-HOWTO-Part-I) on Docker and [Part II](/Personal-website-with-Minimal-Mistakes-Jekyll-Theme-HOWTO-Part-II) on theme customization and [Part IV](/Personal-website-with-Minimal-Mistakes-Jekyll-Theme-HOWTO-Part-IV) on social share and analytics._

&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;

### PUBLISHING ON GITHUB PAGES USING PRIVATE DOMAIN[^ft1]

[^ft1]: I relied mostly on Curtis Larson's great [tutorial]((http://www.curtismlarson.com/blog/2015/04/12/github-pages-google-domains/)). However, I found that few things changed since the article was posted, so decided to write my own HOWTO.

When you feel ready to put your site online, go to your GitHub and create a new repository. For hosting with GitHub Pages it should have a name in a format like this:
`USERNAME.github.io`, where USERNAME is the name of your registered GitHub account.  Move your website's code to this repository. 

If you want to use private domain with GitHub Pages, you can buy one on [Google Domains](https://domains.google.com/m/registrar/search). For instance, I registered my `www.cross-validated.com` for only $12 per year. 

To redirect the traffic from GitHub Pages to your private domain, you need to create a file called `CNAME` in the root directory of your `USERNAME.github.io` repository. It should include the name of your private domain:

{% include figure image_path="/assets/images/posts/cname.png" alt="CNAME file" %}

Now we need to configure DNS records at Google Domains that should point to GitHub's servers[^ft2]:  

* 185.199.108.153
* 185.199.109.153
* 185.199.110.153
* 185.199.111.153

{% include figure image_path="/assets/images/posts/google-domains.png" alt="Google Domains DNS configuration" %}

[^ft2]: If you experience any problems, check out the GitHub's ["Troubleshooting custom domains" page](https://help.github.com/en/articles/troubleshooting-custom-domains).

Now your GitHub Pages should point to your private domain. To check it go to Settings of your  `USERNAME.github.io` repository. Here you can also secure your GitHub Pages site with HTTPS to encrypt traffic between GitHub's servers and your browser. 

{% include figure image_path="/assets/images/posts/github-pages.jpg" alt="GitHub Pages" %}

<i class="far fa-sticky-note"></i> **Note:** It will take some time to actually enforce HTTPS on GitHub Pages, so be patient. When it does, you will see lock icon in your browser’s address bar.
{: .notice--info}
{: .text-justify}

