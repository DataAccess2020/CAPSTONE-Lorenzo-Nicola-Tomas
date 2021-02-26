#TITLE

## About the project

This is the Capstone project of Nicola Destro, Lorenzo Sioli and Tomas Ruzza, for the course *Data Access and Regulation, Module II*
With a focus on the last Italian government crisis, the purpose of our project was to provide an overview about italian political instability and technocracies (in Italy and in Europe).

The original goal was to create a sort of "definitive guide" about Italian government crisis, also because the literature on this topic was fewer and, at times, more contradictory than one would expect.

Such analysis ended up being just a beginning of our work which we developed in four different phases:

- Italian government crisis
- Technocracies in Europe
- Perception of the Italian situation in foreign newspapers
- Comparison between the speeches of Mario Monti and Mario Draghi

## Personal goals

Our final work contains a variety of charts and visualization tools. Our main interest was in fact to experiment and have fun in the highest possible number of ways with R.
We had to approach many different datasets and situations and we learnt a lot from the difficulties  we encountered.
The Capstone Project was for us a first an important chance to challenge ourselves and discover practically the application of our new set of skills and knowledge.


## Set Up

All of the mentioned datasets are retrievable in thw project folders.

Part 1
- We started by creating a specific script for setting up our software for the analysis, choosing and loading the required packages

- We imported the "parl_gov" dataset and filtered it for observations about Italy.

- We scraped Wikipedia to perfect our df with some important missing variables

Part 2
- This bit required a second dataset gathered from the scraping of an academic paper (McDonnel, Valbruzzi 2014)

- We had to import the coordinates for the European capital cities from kaggle

Part 3

- The data for this part was gathered scraping the websites of some newspapers (The Guardian, BBC, Le Monde, Der Spiegel)

Part 4
- We manually imported the speeches of Monti and Draghi as .txt files





## Folders

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

tidyverse, tidytext, rio, stringr, xml2, httr, RCurl, qdapRegex, rvest, lubridate, stargazer, kableExtra, plotly, tm, syuzhet, rJava, qdap, rnaturalearth, rnaturalearthdata, rgeos, devtools, wordcountaddin.

## Authors
Ruzza Tomas, Sioli Lorenzo, Destro Nicola

