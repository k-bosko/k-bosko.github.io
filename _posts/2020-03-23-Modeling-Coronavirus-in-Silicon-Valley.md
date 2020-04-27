---
title: "Modeling COVID-19 in Silicon Valley"
tags:
- COVID-19 in Bay Area

date: March 23, 2020
header:
  teaser: /assets/images/thumbnails/coronavirus-unsplash-600.jpg
excerpt: "A simple model of coronavirus spread in Silicon Valley shows that things get really bad in May 2020."
---


{% include figure image_path="/assets/images/posts/coronavirus-unsplash-1000.jpg" alt="Coronavirus Unsplash CDC" caption="" %}
Photo by <a style="background-color:black;color:white;text-decoration:none;padding:4px 6px;font-family:-apple-system, BlinkMacSystemFont, &quot;San Francisco&quot;, &quot;Helvetica Neue&quot;, Helvetica, Ubuntu, Roboto, Noto, &quot;Segoe UI&quot;, Arial, sans-serif;font-size:12px;font-weight:bold;line-height:1.2;display:inline-block;border-radius:3px" href="https://unsplash.com/@cdc?utm_medium=referral&amp;utm_campaign=photographer-credit&amp;utm_content=creditBadge" target="_blank" rel="noopener noreferrer" title="Download free do whatever you want high-resolution photos from CDC"><span style="display:inline-block;padding:2px 3px"><svg xmlns="http://www.w3.org/2000/svg" style="height:12px;width:auto;position:relative;vertical-align:middle;top:-2px;fill:white" viewBox="0 0 32 32"><title>unsplash-logo</title><path d="M10 9V0h12v9H10zm12 5h10v18H0V14h10v9h12v-9z"></path></svg></span><span style="display:inline-block;padding:2px 3px">CDC</span></a>

*A simple model of coronavirus spread in Silicon Valley shows that practicing social distance might help in slowing the spread of coronavirus. But if the growth rate doesn't change, then in May we will face a critical situation similar to Italy in March.*

&nbsp;
&nbsp;

On March 16, 2020 Santa Clara County - home to Silicon Valley and to almost 2 mln people - issued a ['shelter-in-place' order](https://www.sfchronicle.com/bayarea/article/Bay-Area-to-shelter-in-place-What-you-need-15135087.php) in attempt to slow the spread of Coronavirus. 

I've been collecting data on Coronavirus cases in Santa Clara County for a week now. We had 155 cases when the order was declared. This number doubled a week later - 302 cases on March 22. 


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

\\[ y(t) = y_0 e^{kt} \\]

where 
<br/>
\\(y_0\\) - the number of cases on March 16 <br/>
\\(y\\) - the number of cases after certain time period (\\(t\\)) in days <br/>
\\(k\\) - continuous growth rate 

Based on this, we can model 3 scenarios:
- if COVID-19 cases double each week (as now)
- if cases double faster - each 6 days
- if cases double slower - each 8 days

Here are my results:

{% include figure image_path="/assets/images/posts/coronavirus-in-Silicon-Valley.png" alt="Model of Coronavirus in Silicon Valley" %}

In reality, the numbers above will be different. Still, they give us a feeling of how things might go. If nothing changes, we might expect that situation will be pretty bad around May in Silicon Valley. 

However, as with any exponential growth, even change of one day in spreading speed makes a big difference. So practicing social distance should help.

Stay healthy!
