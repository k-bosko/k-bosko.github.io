---
title: "Modeling COVID-19 in Silicon Valley"
tags:
- Coronavirus
- COVID-19
- Bay Area
- Silicon Valley
- Exponential Model

date: March 23, 2020
header:
  teaser: /assets/images/thumbnails/joel-filipe-thumb-800.jpg
---

*A simple model of coronavirus spread in Silicon Valley shows that things get really bad in May 2020.*

&nbsp;
&nbsp;

On March 16, 2020 Santa Clara County - home to Silicon Valley and to almost 2 mln people - issued a ['shelter-in-place' order](https://www.sfchronicle.com/bayarea/article/Bay-Area-to-shelter-in-place-What-you-need-15135087.php) in attempt to slow the spread of Coronavirus. 

I've been collecting data on Coronavirus cases in Santa Clara County for a week now. We had 155 cases when the oder was declared. This number doubled a week later - 302 cases on March 22. 


### COVID-19 Cases in Santa Clara County

| Time | Total Confirmed  Cases	| Hospitalized	| Deaths |
| :---: | :---: | :---: | :---: | :---: |
| 16-Mar | 155 | 56	| 4 |
| 17-Mar | 175 | 56	| 6 |
| 18-Mar | 189 | 62 |	6 |
| 19-Mar | 196 | 65 |	8	|
| 20-Mar | 263 | 93 |	8	|
| 22-Mar | 302 | 108 | 10 |

<sup>**Source**: Own compilation based on data provided by [the County of Santa Clara Public Health Department](https://www.sccgov.org/sites/phd/DiseaseInformation/novel-coronavirus/Pages/home.aspx)</sup>

Assuming exponential growth, we can model the coronavirus spread as following:
y(t) = y_0 * $e^k*t$

$$x_1$$