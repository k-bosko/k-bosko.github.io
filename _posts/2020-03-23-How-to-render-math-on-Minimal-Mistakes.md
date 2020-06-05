---
title: "How to render math equations on your Minimal Mistakes"
tags:
  - MathJax
  - Minimal Mistakes Jekyll

date: March 23, 2020
header:
  teaser: /assets/images/thumbnails/joel-filipe-thumb-400.jpg
excerpt: "Enabling MathJax on Minimal Mistakes Jekyll theme"
---

You need [MathJax](https://www.mathjax.org) if you want to render mathematical equations on your Minimal Mistakes website.

I first learned about it from [the blog post by Peter Willis](http://www.pwills.com/posts/2017/12/20/website.html) (thanks, Peter!) However, I couldn't enable MathJax even after following his instructions. So here's what I did.

### 1. 
Add this snippet at the end of the `scripts.html` which is in the `_includes` folder:

```html
{% if page.mathjax %}
<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" defer
        src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">
</script>{% endif %}
```

The [MathJax documentation](https://www.mathjax.org/#gettingstarted) says that with this snippet you won't need to change anything with each new version of MathJax. 

### 2. 

Enable MathJax in `_config.yml` by adding `mathjax: true` to the page defaults

```yml
# Defaults
defaults:
  # _posts
  - scope:
      path: ""
      type: posts
    values:
      layout: single
      author_profile: true
      read_time: true
      comments: true
      share: true
      related: true
      mathjax: true
```
<i class="far fa-sticky-note"></i> **Note:** If you are using Docker, don't forget to rebuild your container after making changes to `_config.yml`.
  {: .notice--info}
  {: .text-justify}

```
docker build -t minimal-mistakes .
```

Basically that's it. Try rendering \\(y_0\\) using `\\(` and `\\)` delimeters for inline equations. 

Use `\\[` and `\\]` to display equations like this one:

\\[ f(a) = \frac{1}{2\pi i} \oint_\gamma \frac{f(z)}{z-a} dz \\]


<i class="far fa-sticky-note"></i> **Note:** If things don't work, check if the MathJax script is added to the page using Developer tools.
  {: .notice--info}
  {: .text-justify}
