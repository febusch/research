
<a href="https://scholar.google.com/citations?user=AW--DlgAAAAJ"><img src="../../img/scholar.png" width="25"></a>
&nbsp;&nbsp;<a href="mailto:busch@soziologie.uzh.ch"><img src="../../img/mail.png" width="25"></a>
&nbsp;&nbsp;<a href="https://www.fbusch.org/"><img src="../../img/www.png" width="25"></a>
&nbsp;&nbsp;<a href="https://twitter.com/felixbusch3"><img src="../../img/twitter.png" width="25"></a>
&nbsp;&nbsp;<a href="https://www.linkedin.com/in/felix-busch-45157194/"><img src="../../img/linkedin.png" width="25"></a>

# Use
The preparation of files and the analysis are run in Stata. Make sure to install all external dependencies in the code, and see the section on **Data** for the required datasets.

## Folders & instructions

`scripts/`: Contains Stata do-files that can be used to replicate graphs and tables. Before anything runs, you need to execute `prep_files.do`. This script provides all the cleaned and formatted data required to run analyses. After that, you can run other scripts (e.g. `tab_01.do` for Table 1) in order to replicate analyses.

`input/`: Drop datasets in this folder. The scripts are adjusted to recognize files in this folder. Depending on your folder names, you might adjust paths inside the scripts so that Stata finds the input data. Subfolder `aux` used to store intermediary results.

`output/`: Outputs for some generated tables or graphs. Most output is just displayed interactively. You have to store it manually if you want to keep it.

The do-files only run if you provide the correct working directory in `scripts/prep_files.do`. They are optimized for Unix/Mac. If you want to run them on **Windows**, you will have to change forward slashes into backslashes in all of them.



## Data
In order to run the replication scripts, you must have access to five survey data files. These files should be stored in the `input` folder.

| Name  | Data provider | DOI / Link |
|:------------- |:---------------:| :-------------:|
|   Socio-Economic Panel (SOEP) v32.1   | [SOEP Research Data Center](https://www.diw.de/en/diw_02.c.222518.en/research_data_center_of_the_soep.html) |  [10.5684618/soep.v32.1](https://doi.org/10.5684/soep.v32.1)   |
|   BIBB/IAB Employment Survey 1991/92    | [BIBB Research Data Center](https://www.bibb.de/en/53.php) |  [10.4232/1.2565](https://doi.org/10.4232/1.2565)   |
|   BIBB/IAB Employment Survey 1998/99    | [BIBB Research Data Center](https://www.bibb.de/en/53.php) |  [10.4232/1.12247](https://doi.org/10.4232/1.12247)   |
|   BIBB/BAuA Employment Survey 2006    | [BIBB Research Data Center](https://www.bibb.de/en/53.php) |  [10.4232/1.11072](https://doi.org/10.4232/1.11072)   |
|   BIBB/BAuA Employment Survey 2012    | [BIBB Research Data Center](https://www.bibb.de/en/53.php) |  [10.7803/501.12.1.1.40](https://doi.org/10.7803/501.12.1.1.40)   |





