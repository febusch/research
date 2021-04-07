// Run to replicate Table 2
// Title: "Coefficients from OLS Regressions Predicting Ln Wage From Occupational Percent Female and Controls"


cd "PLEASE_PROVIDE/2021-devaluation-reader" 


* load data
use "input/master.dta", clear

* model 1: only pcf
reg wage_ln i.pcf_cat_3 [pweight=perwt] if fulltime == 1
est sto mod1

* model 2: + race + region + metro
reg wage_ln i.pcf_cat_3 i.female i.race i.region i.metro [pweight=perwt] if fulltime == 1
est sto mod2

* model 3: + education
reg wage_ln i.pcf_cat_3 i.female i.race i.region i.metro i.edu_attain [pweight=perwt] if fulltime == 1
est sto mod3

* model 4: + public + ind1990_agg + lmexp
reg wage_ln i.pcf_cat_3 i.female i.race i.region i.metro i.edu_attain i.public i.ind1990_agg c.lmexp [pweight=perwt] if fulltime == 1
est sto mod4

* model 5: + analytic_std + mechanical_std + interpersonal_std + management_std + hightech_std + compens_physical_std
reg wage_ln i.pcf_cat_3 i.female i.race i.region i.metro i.edu_attain i.public i.ind1990_agg c.lmexp c.analytic_std c.mechanical_std c.interpersonal_std c.management_std c.hightech_std c.compens_physical_std [pweight=perwt] if fulltime == 1
est sto mod5

* display results
estout mod1 mod2 mod3 mod4 mod5
