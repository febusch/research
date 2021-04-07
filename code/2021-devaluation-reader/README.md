<a href="https://scholar.google.com/citations?user=AW--DlgAAAAJ"><img src="../../img/scholar.png" width="25"></a>
&nbsp;&nbsp;<a href="mailto:busch@soziologie.uzh.ch"><img src="../../img/mail.png" width="25"></a>
&nbsp;&nbsp;<a href="https://www.fbusch.org/"><img src="../../img/www.png" width="25"></a>
&nbsp;&nbsp;<a href="https://twitter.com/felixbusch3"><img src="../../img/twitter.png" width="25"></a>
&nbsp;&nbsp;<a href="https://www.linkedin.com/in/felix-busch-45157194/"><img src="../../img/linkedin.png" width="25"></a>

# Documentation
This material is made available by Felix Busch together with the chapter *Does an Occupation’s Percent Female Affect How Much it Pays? An Update on the Devaluation Thesis*, published together with **Paula England** in: 

Grusky, David, Nima Dahir, and Claire Daviss (eds.). 2022. Social Stratification. 5th Edition. New York. Routledge.

Any use of this repo's material in a publication should cite the original paper.

## Use
The preparation of files and the analysis are run in Stata. See the section on **Data** for the required datasets.

## Folders & instructions

**scripts/**: Contains Stata do-files that can be used to replicate graphs and tables. Before anything, you need to execute `prep_files.do`. This script provides all the cleaned and formatted data required to run analyses. After that, you can run other scripts (e.g. `tab_01.do` for Table 1) in order to replicate analyses. Note that before you can execute `prep_files.do` successfully, you need to provide the ACS data (as described below).

**input/**: This folder holds the original data sets from the ACS and from O\*NET. The data from O\*NET is provided by the author, but the ACS data needs to be provided by you. For requiremdents on what to include, see the Data section below. The scripts included in this repository are adjusted to recognize files in this folder (input/). Depending on your folder names, you might have to adjust paths inside the scripts so that Stata finds the input data. Subfolder `aux` used to store intermediary results.

The do-files only run if you provide the correct working directory in `scripts/prep_files.do`. They are optimized for Unix/Mac. If you want to run them on **Windows**, you will have to change forward slashes into backslashes in all of them.



## Data
In order to run the replication scripts, you must have downloaded a data extraction from [IPUMS USA](https://usa.ipums.org/). This prepared file should be named `acs_2019.dta` and be stored in the folder input/.

IPUMS allows users to generate customized extractions from different census and survey data sets. The extraction for this publication was made on 2021-02-18.

For our chapter, we extracted data from the 2019 ACS (see sample descriptions [here](https://usa.ipums.org/usa/sampdesc.shtml)):

Following variables are required for the replication:

- region
- metro
- perwt
- sex
- age
- race
- raced
- hispan
- hispand
- educ
- educd
- empstat
- empstatd
- classwkr
- classwkrd
- occ2010
- ind1990
- wkswork1
- uhrswork
- incwage
