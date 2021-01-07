<a href="https://scholar.google.com/citations?user=AW--DlgAAAAJ"><img src="../../img/scholar.png" width="25"></a>
&nbsp;&nbsp;<a href="mailto:busch@soziologie.uzh.ch"><img src="../../img/mail.png" width="25"></a>
&nbsp;&nbsp;<a href="https://www.fbusch.org/"><img src="../../img/www.png" width="25"></a>
&nbsp;&nbsp;<a href="https://twitter.com/felixbusch3"><img src="../../img/twitter.png" width="25"></a>
&nbsp;&nbsp;<a href="https://www.linkedin.com/in/felix-busch-45157194/"><img src="../../img/linkedin.png" width="25"></a>

# Documentation
This material is made available by Felix Busch together with the article *Occupational Devaluation Due to Feminization? Causal Mechanics, Effect Heterogeneity, and Evidence from the United States, 1960 to 2010* ([link](https://doi.org/10.1093/sf/sox077)) published in Social Forces (2018). Any use of this repo's material in a publication should cite the original paper.

## Use
The preparation of files and the analysis are run in Stata. Make sure to install all external dependencies in the code, and see the section on **Data** for the required datasets.

## Folders & instructions

`scripts/`: Contains Stata do-files that can be used to replicate graphs and tables. Before anything runs, you need to execute `prep_files.do`. This script provides all the cleaned and formatted data required to run analyses. After that, you can run other scripts (e.g. `tab_01.do` for Table 1) in order to replicate analyses.

`input/`: Drop dataset in this folder as specified in section **Data**. The scripts are adjusted to recognize files in this folder. Depending on your folder names, you might adjust paths inside the scripts so that Stata finds the input data.

The do-files only run if you provide the correct working directory in `scripts/prep_files.do`. They are optimized for Unix/Mac. If you want to run them on **Windows**, you will have to change forward slashes into backslashes in all of them.



## Data
In order to run the replication scripts, you must have prepared a data extraction from [IPUMS USA](https://usa.ipums.org/). This prepared file should be named `master_1_00.dta` and be stored in the `input` folder.

IPUMS allows users to generate customized extractions from different census and survey data sets. The extraction for this publication was made on 2016-03-28.

Following data sets were included in the extraction (see sample descriptions [here](https://usa.ipums.org/usa/sampdesc.shtml)):

- 1960 5% sample
- 1970 1% form 1 and 2 state samples
- 1980 5% state sample
- 1990 5% state sample
- 2000 5% sample
- 2010 ACS

Following variables are required for the replication:

- year
- empstatd
- occ1990
- ind1990
- incwage
- sex
- age
- hrswork2
- uhrswork
- wkswork1
- wkswork2
- cpi99
- educd
- race
- hispan
- marst
- classwkrd
- perwt
- nchlt5