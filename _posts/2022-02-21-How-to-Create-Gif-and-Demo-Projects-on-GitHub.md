---
title: "Demo your projects on GitHub with gif"
toc: false
tags:
  - gif

date: February 21, 2022
header:
  teaser: /assets/images/thumbnails/joel-filipe-thumb-400.jpg
excerpt: "How to create gif programmatically on MacOS for free"
---

*If you have Mac, you probably used QuickTime many times. In this post, you will learn how to create gif from a screen recording in a terminal.*

There are plenty of tools to create gifs on the internet. Yet many tools are not free, produce gifs of low quality or are for Windows only.

After some research, I came across this amazing [tool created by SlexAxton](https://gist.github.com/SlexAxton/4989674).

Since the tool was created many years ago, I found that installation instructions provided by Alex are outdated.

In order to use the tool, you need to install:

```
brew install ffmpeg
brew install --cask xquartz
brew install gifsicle
brew install imagemagick
```

Then add gifify() written by Alex to Zsh, a Unix shell:

```
vim ~/.zshrc

gifify() {
  if [[ -n "$1" ]]; then
    if [[ $2 == '--good' ]]; then
      ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
      time convert -verbose +dither -layers Optimize -resize 600x600\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
      rm out-static*.png
    else
      ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}
```

After you made a screen recording with QuickTime, just run the following commands in your terminal:

```
cd {path-to-your-recorded-file}
gifify {name-of-your-recorded-file} --good
```

Upload the newly created gif file to the root of your GitHub repo.

Add this line to your README.md file where you want the GIF to show:
```
![](name-of-giphy.gif)
```

Happy gififying! 😊

