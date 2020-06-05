---
title: "Personal Website with Minimal Mistakes Jekyll Theme HOWTO - Part I"
header:
  teaser: /assets/images/thumbnails/joel-filipe-thumb-400.jpg
excerpt: "How to install Minimal Mistakes Jekyll theme using Docker container"
date: August 28, 2019
tags:
  - Docker
  - Minimal Mistakes Jekyll
---

_This is Part I of the website HOWTO series. See [Part II](/Personal-website-with-Minimal-Mistakes-Jekyll-Theme-HOWTO-Part-II) on theme customization, [Part III](/Personal-website-with-Minimal-Mistakes-Jekyll-Theme-HOWTO-Part-III) on deployment on GitHub pages and [Part IV](/Personal-website-with-Minimal-Mistakes-Jekyll-Theme-HOWTO-Part-IV) on SEO and analytics._
{: .notice--primary}
&nbsp;
&nbsp;

This website is built with **Jekyll using Minimal Mistakes theme** and hosted on **GitHub Pages**. For development and writing posts I use Docker that builds a static website locally and serves it from a Docker container. I then push the local changes upstream to GitHub which then builds the website on GitHub's servers.


In this first HOWTO serie, I explain how you can set up Docker environment and run website locally.

### Installation using Docker
After forking the [Minimal Mistakes theme](https://github.com/mmistakes/minimal-mistakes) on GitHub and cloning it to local machine, you can create Docker container to use virtual environment with already preinstalled ruby.
{: .text-justify}


[Docker](https://www.docker.com) <i class="fab fa-docker"></i>
: is a tool that allows you to create OS-level virtual environments that can package and run applications by using containers. A container thus have all the libraries and other dependencies your app needs. You can run several containers on one host in parallel or connect them with each other via defined channels. 

<br>
### STEP 1 - Create container with ruby environment

For this you create `Dockerfile` in the app's working directory and code:

{% highlight docker linenos %}
FROM ruby:2.5

WORKDIR /usr/src/app

# we put README.md as placeholder, because Docker cannot create empty container
COPY README.md ./

#create volume for later mounting of your local directory
VOLUME /usr/src/app
{% endhighlight %}

Build the container in the terminal:
```docker
docker build -t ruby-environment .
```
<br>
### STEP 2 - Creating Gemfile.lock

Now we generate `Gemfile.lock` for minimal-mistakes theme with these commands:

```docker
docker run --volume="$PWD:/usr/src/app" -it ruby-environment bundle install
```
<br>
### STEP 3 - Creating container for our website

Add `port` and `host` to your `_config.yml` prior to building container.

```yaml
# Site Settings
locale                   : "en-US"
title                    : "Minimal Mistakes"
title_separator          : "-"
subtitle                 : "Development Test Site"
name                     : "Your Name"
description              : "Minimal Mistakes theme test."
port                     : 4000
host                     : "0.0.0.0"
```

Modify the Dockerfile as follows:

{% highlight docker linenos %}
FROM ruby:2.5

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

# prepare to install ruby packages into container
COPY Gemfile Gemfile.lock minimal-mistakes-jekyll.gemspec ./

RUN bundle install

VOLUME /usr/src/app

EXPOSE 4000

CMD ["jekyll", "serve"]
{% endhighlight %}

Next steps are:
1. Build a container 
    ```
    docker build -t minimal-mistakes .
    ```
2. Run your container
    ```docker
    docker run --volume="$PWD:/usr/src/app" -p 4000:4000 -t minimal-mistakes
    ```
3. Go to [http://0.0.0.0:4000/](http://0.0.0.0:4000/) 


And that's it! 😊

Now you have your own Docker container running! It makes working on web development a pleasant experience - you see the changes immediately in your web browser. 
{: .text-justify}

With one exception: Each time you change something in .yml files (like adding a new navigation page in `_data/navigation.yml` or some configuration in your `_config.yml`), you need to rebuild the container and run it again to see these changes.
{: .text-justify}


<i class="far fa-sticky-note"></i> **Note:** Want to try out the test version of the mm theme? NP. Navigate to test directory and add `host` and `port` to `_config.yml` there as well. Then run this command:
{: .notice--info}
{: .text-justify}

```docker
docker run --volume="$PWD:/usr/src/app" -p 6000:4000 -it minimal-mistakes bundle exec rake preview
```
So now we can have two instances of the same docker container running in parallel. One on `http://0.0.0.0:4000` with the main website and another one (test version) on `http://0.0.0.0:6000`.
{: .text-justify}
