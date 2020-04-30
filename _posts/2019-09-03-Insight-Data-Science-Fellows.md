---
title: "Insight Data Science Fellows: Who are They?"
toc: true
toc_label: "Content"
toc_sticky: true
tags:
  - Insight Data Science Fellowship

date: September 3, 2019
header:
  teaser: /assets/images/thumbnails/insight-data-science-thumb-600.jpg
excerpt: "In this post, I scrape Insight Data Science Fellows, clean the data, perform EDA and a hypothesis test via bootstrapping"
---
{% include figure image_path="/assets/images/posts/insight-data-science-1000.jpg" alt="Insight Data Science webpage" caption="INSIGHT Data Science" %}

The [INSIGHT Data Science Fellows Program](https://www.insightdatascience.com) is a competitive fellowship targeted at academics from the top universities. It helps recent PhDs and Postdocs to find a prestigious job as data scientists in the industry. 
{: .text-justify}
During 7 weeks of the program,  the fellows work on their own data science projects, which form the core of their portfolio to showcase during job hunting. INSIGHT also helps to prepare for interviews and, as far as I understand, has numerous industry partners. The fellows thus benefit from the extensive network of diverse highly qualified data scientists the program connected throughout the years.
{: .text-justify}

I applied for the fellowship twice, made it to interviews, but unfortunately was rejected. So I was really curious about who are these top 'quants' and were they landed a job. I scraped the data from the INSIGHT website and did some quick exploratory data analysis (EDA). 
{: .text-justify}



## 1. How Many Fellows?

The final dataset has 794 rows (i.e. so many fellows participated in the INSIGHT Data Science Fellowship)[^ft1] and 5 features:
* Name
* Company
* Project
* Position
* University
* (Academic) Field
* Status (Postdoc/PhD/Other)

<i class="far fa-sticky-note"></i> **Note:** All fellows that are not PhD or Postdoc (working/studying) were encoded as 'Other' and do not contain information in 'University' or 'Field' columns.
{: .notice--info}
{: .text-justify}


## 2. What Universities?

The 794 INSIGHT Fellows come from 198 different universities - very diverse!
{: .text-justify} 
    
However, almost 50% of the fellows come from the TOP 20 universities (see figure below). Moreover, almost 30% of fellows (219) are from the Californian universities - either Stanford or other UCs. The pattern is not suprising given that it is primarily Silicon Valley companies that hire DS fellows the most. 
{: .text-justify}
The TOP 5 universities that convert PhDs to data scientists are Stanford (79 fellows), UC Berkeley (53), Harvard (31), NYU (22) and University of Texas at Austin (18).
{: .text-justify}
{% include figure image_path="/assets/images/posts/insight-universities.png" alt="Insight Data Science: TOP 20 Universities" %}

## 3. What Background?

The majority of INSIGHT fellows (64%) are freshly completed PhDs. There are about 29% Postdocs and about 7% practitioners (uni faculty, managers, researchers, etc).
{: .text-justify}

<figure style="width: 40%" class="align-center">
  <img src="{{ site.url }}{{ site.baseurl }}/assets/images/posts/insight-status.png" alt="">
</figure> 

Almost every third fellow studied Physics/Astrophysics (32%). The next biggest group - 10% - are neuroscientists.[^ft2] 
{: .text-justify}

{% include figure image_path="/assets/images/posts/insight-field.png" alt="Insight Data Science: Fellows by their background" %}


## 4. What Job Titles?

The following figure provides some insights into the popular job titles of INSIGHT DS Fellows.[^ft3] Two thirds of all fellows (587) have "Data Scientist" as part of their job title. About 15% of fellows managed to get more senior positions with titles such as "Senior", "Head", "Lead" and even "Director". Only three fellows started as interns or in junior roles. All together, INSIGHT fellows don't start low and so the fellowship is a great starting point for those transitioning from academia. 
{: .text-justify} 

{% include figure image_path="/assets/images/posts/insight-jobs.png" alt="Insight Data Science: Fellows by Job Titles" %}

## 5. What Companies?

794 INSIGHT fellows started working in 383 different companies, 72% of which hired just 1 fellow. 
{: .text-justify}

About 40% of all fellows went to work in TOP 30 companies (see figure below). The TOP 5 companies among these are Facebook (54 fellows), LinkedIn (22), Stitch Fix (19), Netflix (15) and Intuit (14). All five are in the Silicon Valley, where the demand for Data Scientist is naturally the highest. Interestingly, INSIGHT also tends to hire own graduates.
{: .text-justify} 

{% include figure image_path="/assets/images/posts/insight-companies.png" alt="Insight Data Science: TOP 30 Companies" %}


## 6. Does LinkedIN Prefer Hiring Postdocs?

When exploring the patterns of TOP10 companies that hired INSIGHT fellows I came across an interesting observation. LinkedIn seems to stand out from the rest 9 companies in that it hired disproportionally more postdocs compared to other Top10 companies:
{: .text-justify} 

{% include figure image_path="/assets/images/posts/insight-crosstab.png" alt="Insight Data Science: TOP10 companies by fellows' status" %}

Let's check if the difference is statistically significant and perform a hypothesis test via bootstrapping. So I divide the initial dataset into two groups - linkedin/not_linkedin companies. Then I find the observed difference in postdoc means for both groups and bootstrap the data to see if the difference is statistically significant at alpha=0.05.
{: .text-justify} 

**H<sub>0</sub>**: linkedin_postdoc_mean <= non_linkedin postdoc mean <br>
**H<sub>1</sub>**: linkedin_postdoc_mean > non_linkedin postdoc mean


Distribution under the null hypothesis with the plot line for observed statistic looks like this:

<figure style="width: 70%" class="align-center">
  <img src="{{ site.url }}{{ site.baseurl }}/assets/images/posts/insight-linkedin-H0.png" alt="">
</figure> 

The p-value (0.057) is slightly higher than alpha=0.05. So it's in the gray area of rejecting/retaining H<sub>0</sub>. Considering practical significance, I think I'm ok with 5% error rate in this case and conclude that LinkedIn indeed prefer hiring Postdocs over PhDs, thus rejecting the H<sub>0</sub> hypothesis.
{: .text-justify}

So if you are the INSIGHT fellow and fresh PhD and want to get a job at LinkedIN - beware, there will be much more competition from more experienced colleagues!
{: .text-justify}

## Conclusion

This is a brief exploratory analysis of the INSIGHT Data Fellows - what background they have, where they studied and where they got jobs. 
{: .text-justify} 

In this project I first scraped the data and then analyzed it in Jupyter Notebook. You can find the source code on my [GitHub](https://github.com/k-bosko/insight_fellows).
{: .text-justify} 

There are also other insteresting things to explore with the INSIGHT Fellowship:
{: .text-justify} 
The program has also other [tracks](https://www.insightdatascience.com/fellows) besides Data Science like AI, Data Eng, Data PM, etc. One can scrape all INSIGHT Fellows and check if there are different patterns compared to the DS track.
{: .text-justify} 
Tracing the fellows on LinkedIn and checking how they are doing now - i.e. measuring the impact of the program. Are they still in DS? Do they change companies often? Do they hold senior positions now? etc.
{: .text-justify} 
&nbsp;
&nbsp;
&nbsp;
&nbsp;


[^ft1]: Although in an interview I was told that the INSIGHT stopped updating the database of fellows publicly. So the actual number of fellows by now should be much higher. 

[^ft2]: Fields were aggregated by simple string matching. For instance, "Politic" as a field aggregates here all instances with string "Politic" in the 'Field' column. As a result, it includes also "Political Economy", "Politics", "Political Science".  Furthermore, some fellows provided several backgrounds, so they might be counted twice. 

[^ft3]: The list of categories is not exhaustive and is meant only for illustration purposes. It should also be noted that categories are not mutually exclusive. This means that, for instance, the fellow wno is "Senior Data Scientist" appears in both Data Science and Seniority categories.