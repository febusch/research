// Run to replicate Table 1
// Title: "Means on All Variables, Separately for Male, Mixed, and Female Occupations"


cd "PLEASE_PROVIDE/2021-devaluation-reader"


* load data
use "input/master.dta", clear
keep if fulltime == 1

** prep vars
qui ta female, gen(female)
qui ta race, gen(race)
qui ta region, gen(region)
qui ta metro, gen(metro)
qui ta edu_attain, gen(edu_attain)
qui ta public, gen(public)
qui ta ind1990_agg, gen(ind1990_agg)

** drop vars
keep pcf_cat_3 wage lmexp analytic_std mechanical_std interpersonal_std management_std hightech_std compens_physical_std wage_ln female1-ind1990_agg14 perwt
order perwt pcf_cat_3 wage* lmexp female* race* region* metro* edu* public* ind* analytic_std mechanical_std interpersonal_std management_std hightech_std compens_physical_std

** collapse
collapse (mean) wage-compens_physical_std [pw=perwt], by(pcf_cat_3)
