---
title: "Personal Website with Minimal Mistakes Jekyll Theme HOWTO - Part II"
header:
  teaser: /assets/images/thumbnails/joel-filipe-thumb-800.jpg
excerpt: "How to customize Jekyll Minimal Mistakes theme for personal website"
date: August 28, 2019
toc: true
toc_label: "Content"
toc_sticky: true
tags:
  - Minimal Mistakes Jekyll
  - CSS
---
_This is Part II of the website HOWTO series. See [Part I](/Personal-website-with-Minimal-Mistakes-Jekyll-Theme-HOWTO-Part-I) on Docker, [Part III](/Personal-website-with-Minimal-Mistakes-Jekyll-Theme-HOWTO-Part-III) on deployment with GitHub pages and [Part IV](/Personal-website-with-Minimal-Mistakes-Jekyll-Theme-HOWTO-Part-IV) on SEO and analytics._
{: .notice--primary}
&nbsp;
&nbsp;

This website is built with **Jekyll using Minimal Mistakes theme** and hosted on **GitHub Pages**. For development and writing posts I use Docker that builds a static website locally and serves it from a Docker container. I then push the local changes upstream to GitHub which then builds the website on GitHub's servers.

In this second HOWTO serie, I explain most of the changes I made to the [Minimal Mistakes theme](https://github.com/mmistakes/minimal-mistakes). So if you like how this site looks,  it will save you long hours of tweaking and experimenting!


When working on my customization, I found these MM documentation links particularly useful:

* [Creating New Posts](https://mmistakes.github.io/minimal-mistakes/docs/pages/)
* [Useful Markup Overview](https://mmistakes.github.io/minimal-mistakes/markup/markup-html-tags-and-formatting/)
* [Code Highlighting](https://mmistakes.github.io/minimal-mistakes/markup-syntax-highlighting/)
* [Image Alignment](https://mmistakes.github.io/minimal-mistakes/markup/markup-image-alignment/)
* [More on Image Alignment](https://mmistakes.github.io/minimal-mistakes/markup-more-images/)
* [Overlay Image](https://mmistakes.github.io/minimal-mistakes/layout/uncategorized/layout-header-overlay-image/)
* [Splash Page](https://mmistakes.github.io/minimal-mistakes/splash-page/)

<i class="far fa-sticky-note"></i> **Tip:** You can find these posts in your project to see the raw code and learn from there.
{: .notice--info}
{: .text-justify}


-----------------------------------------------------
### HOW TO CHANGE AVATAR FROM ROUND TO SQUARE?

* Navigate to `_sidebar.scss` 
* Find `img` 
* Increasing `border-radius` makes it eclipse. Change to 0% if you want the square shape. 
`padding` and `border` are responsible for frame around your avatar. I don't like it, so set to 0px.

```css
img {
    max-width: 200px;
    border-radius: 0%;

    @include breakpoint($large) {
      padding: 0px;
      border: 0px solid $border-color;
    }
  }
```

-----------------------------------------------------
### HOW TO CHANGE SIZE OF AVATAR?

* Navigate to `_sidebar.scss`
* Find `img`
* Change `max-width`, e.g. from 200px to 180px

-----------------------------------------------------
### HOW TO CHANGE SIZE OF AUTHOR BIO AND MAKE IT ITALIC?

* Navigate to `_sidebar.scss` 
* Find `.author__bio` 
* Add font-size and font-style, e.g.:

```css
.author__bio {
  margin: 0;
  font-size: 0.9em;
  font-style: italic;

  @include breakpoint($large) {
    margin-top: 10px;
    margin-bottom: 20px;
  }
}
```
-----------------------------------------------------
### HOW TO CHANGE LOOK OF PHOTO CREDIT IN HEADER?

* Navigate to `_page.scss`
* Find `.page__hero-caption`
* I changed the font-size to 0.6em and opacity to 0.4 here

-----------------------------------------------------
### HOW TO CHANGE LOOK OF TITLE IN HEADER?

* Navigate to `_page.scss`
* Find `.page__title`
* I tweaked text-shadow here:

```css
    .page__title,
    .page__meta,
    .page__lead,
    .btn {
      color: #fff;
      text-shadow: 3px 3px 4px rgba(#000, 0.8);
    }
```


-----------------------------------------------------
### HOW TO CHANGE COLOR OF LINKS?

* Navigate to your skin (e.g. `_contrast.scss`)
* Change `$link-color`. I opted for LinkedIn color:

```css
$link-color: #007bb6 !default;
```
-----------------------------------------------------
### HOW TO CHANGE SIZE OF POST TITLE ON HOME PAGE? 

* Navigate to `_archive.scss`
* Add font-size to `.archive__item`, e.g.:

```css
.archive__item {
  position: relative;
  font-size: 0.8em;
```
-----------------------------------------------------
### HOW TO CHANGE FONT TYPE EVERYWHERE?

* Navigate to `_variables.scss`
* Find `$global-font-family`
* Change it to one specified earlier in that section or add a new one
e.g.

```css
$global-font-family: $helvetica, Arial !default;
```

-------------------------------------------------------
### HOW TO CHANGE FONT SIZE IN POSTS?

* Navigate to `_page.scss`
* Find `.page__content`
* Change p,a,li,dl font-size from 1em to e.g. 0.9em to make it smaller

```css
  p,
  li,
  dl {
    font-size: 0.8em;
  }
```

-------------------------------------------------------
### HOW TO CHANGE MARGINS BETWEEN HEADERS/PARAGRAPHS?

* Navigate to `_base.scss`
* Change headers margin (h1,h2,h3,h4…) on the top from 2em to 1.3em 
* Change paragraphs (p)  margin-bottom from 1.3em to 1.5em

-------------------------------------------------------
### HOW TO DELETE CALENDAR ICON IN POSTS DATE?

* Navigate to `single.html`
* Find `class="page__date"`
* And delete:

```html
<i class="fas fa-fw fa-calendar-alt" aria-hidden="true">
```
-------------------------------------------------------
### HOW TO MAKE POST DATE APPEAR AFTER THE TITLE?

* Navigate to `single.html`
* Move the following code from `<footer>` to `<header>`:

```html
{% raw %}
{% if page.last_modified_at %}
  <p class="page__date"><strong>{{ site.data.ui-text[site.locale].date_label | default: "Updated:" }}</strong> <time datetime="{{ page.last_modified_at | date: "%Y-%m-%d" }}">{{ page.last_modified_at | date: "%B %d, %Y" }}</time></p>
{% elsif page.date %}
  <p class="page__date"><strong>{{ site.data.ui-text[site.locale].date_label | default: "Updated:" }}</strong> <time datetime="{{ page.date | date_to_xmlschema }}">{{ page.date | date: "%B %d, %Y" }}</time></p>
{% endif %}
{% endraw %}
```

(Optional)

Delete “Updated:” from `single.html` and from `ui-text.yml` (called date_label)

-----------------------------------------------
### HOW TO MAKE SHARE BUTTONS APPEAR AFTER THE TITLE ON TOP OF THE PAGE?

* Navigate to `single.html`
* Move this code from footer to header:

```
{% raw %}
{% if page.share %}{% include social-share.html %}{% endif %}
 {% endraw %}
```

Few more nicities for the look of share buttons and we are done.

* Navigate to `social-share.html`
* Delete the first if Liquid block with h4 `page__share-title` 
* Delete the words Twitter, LinkedIn and Facebook in between `<span>``</span>` tags
* Navigate to `_page.scss` 
* Find `.page__share`
* Delete `border-top`, `padding-top` and  `margin-top`

-----------------------------------------------
### HOW TO DELETE PAGINATION IN POSTS?

These are the buttons “previous”/“next”

* Navigate to `single.html`
* Delete `{% raw %}{% include post_pagination.html %}{% endraw %}`

-----------------------------------------------
### HOW TO CHANGE WIDTH OF CONTENT IN POSTS?

My MacBook Pro has dimensions larger than `$max-width` specified in `_page.scss` like so:

```css
@include breakpoint($x-large) {
    max-width: $max-width;
  }
```

`$max-width` currently is 1280px and lives in `_variables.scss`.
I have increased it to 1400px to have more space for content.

-----------------------------------------------
### HOW TO CHANGE CODE HIGHLIGHTING?

There are two ways to highlight code:

WAY 1
```html
{% raw %}
{% highlight html linenos %}
some code
{% endhighlight %}
{% endraw %}
```

WAY 2

Just use markdown for block of code:

{% highlight html %}
  {% raw %}
    ``` python
    Your block of code here
    ```
  {% endraw %}
{% endhighlight %}

In both cases, the colors to use are specified in your skin. For instance, contrast skin uses these colors, which you can find in `_contrast.scss`:

```css
/* contrast syntax highlighting (base16) */
$base00: #000000;
$base01: #242422;
$base02: #484844;
$base03: #6c6c66;
$base04: #918f88;
$base05: #b5b3aa;
$base06: #d9d7cc;
$base07: #fdfbee;
$base08: #ff6c60;
$base09: #e9c062;
$base0a: #ffffb6;
$base0b: #a8ff60;
$base0c: #c6c5fe;
$base0d: #96cbfe;
$base0e: #ff73fd;
$base0f: #b18a3d;
```

<i class="far fa-sticky-note"></i> **Tip:** You can specify colors from another skin. Or check other [base16 colors](https://github.com/chriskempson/base16).
{: .notice--info}
{: .text-justify}

You also have base16 in the `_variables.scss` where they are specified as default colors

<i class="far fa-sticky-note"></i> **Note:** If you have Liquid syntax in your code block, don’t forget to wrap it  into raw/endraw tags or it won’t be displayed otherwise.
{: .notice--info}
{: .text-justify}


-----------------------------------------------
### HOW TO CHANGE FONT SIZE/FONT TYPE OF CODE?

To change size/background color of inline code highlighted with `` (backticks):

* Navigate to `_base.scss`
* Change font-size in this part of code : 

```css
p > code,
a > code,
li > code,
figcaption > code,
td > code {
  padding-top: 0.1rem;
  padding-bottom: 0.1rem;
  font-size: 0.9em;
```

To change font type and font size of code blocks:

```css
tt,
code,
kbd,
samp,
pre {
  font-family: $monospace;
  font-size: 0.9em;
}
```
-----------------------------------------------
### HOW TO CHANGE LINE HIGHT IN HIGHLIGHTED CODE?

* Navigate to `_syntax.scss`
* Find `div.highlighter-rouge`
* Change `line-height`

-----------------------------------------------
### HOW TO CREATE TAGS ARCHIVE?

* Create `tags/tag-archive.md` with this content: 

```
---
title: "Posts by Tag"
permalink: /tags/
layout: tags
author_profile: true
---
```

* Navigate to `0.0.0.0:4000/tags/` in your browser to see tags archive.

<i class="far fa-sticky-note"></i> **Note:** Make sure that the following code is uncommented in your `_config.yml`:
{: .notice--info}
{: .text-justify}

```
tag_archive:
  type: liquid
  path: /tags/
```

-----------------------------------------------
### HOW TO CREATE POSTS BY YEAR ARCHIVE?

* Add to `navigation.yml` another nav link, e.g.

```
  - title: "Archive"
    url: /year-archive/
```

* Create `year-archive.md` with this content:

```
---
title: "Posts by Year"
permalink: /year-archive/
layout: posts
author_profile: true
---
```