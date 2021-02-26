#TITLE

## About the project

 This is the Capstone project of Nicola Destro, Lorenzo Sioli and Tomas Ruzza, for the course *Data Access and Regulation, Module II*
With a focus on the last Italian government crisis, the purpose of our project was to provide an overview about italian political instability and technocracies (in Italy and in Europe).


The original goal was to create a sort of "definitive guide" about Italian government crisis, also because the literature on this topic was fewer and, at times, more contradictory than one would expect.

Such analysis ended up being just a beginning of our work which we developed in four different phases:

-italian government crisis
-technocracies in Europe
-perception of the italian situation in foreign newspapers
-comparison between the speeches of Mario Monti and Mario Draghi


This analysis became our starting point for experimenting some data visualization in R and for having a look to the impact of technocracy in Italy, comparing it with other technocratic governments around Europe. 
Ultimately, we decided to compare Mario Monti's and Mario Draghi's governments.
We started with scraping some european newspapers in order to find out how they narrated this particular cabinets and we completed our project by comparing Monti's and Draghi's inaugural speeches in order to produce a text analysis.


## Folder

Folder name | Content
------------ | -------------
scripts | the heart of the project
figs | plots exported
unused | unused scripts
download | Downloaded articles
dataset | All datasets we used
docs | Useful papers and documents
report | The final report in rmd and html

## Packages Required

tidyverse, tidytext, rio, stringr, xml2, httr, RCurl, qdapRegex, rvest, lubridate, stargazer, kableExtra, plotly,tm, syuzhet

#run after a corpus has been created
library(rJava)
library(qdap)

## Authors:
Ruzza Tomas, Sioli Lorenzo, Destro Nicola

