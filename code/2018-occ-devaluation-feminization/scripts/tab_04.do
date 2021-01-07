// Run to replicate Table 4
// Title: "Coefficients (t-values in parentheses) from OLS Regression of 2010 Occupational Log Wages"
//
// Note: Working directory must be specified before running


// load data & prep
cd "PLEASE_PROVIDE/2018-occ-devaluation-feminization"
use "input/master_1_02.dta", clear


// Generate variable: missing in 1980
gen obs1980 = 1 if year == 1980
bysort occ1990 ind1990_agg : egen miss1980 = total(obs1980) // = 0 if 1980 is missing
xtset id year


// Models 1 & 2: "percent female" only
reg wageln percent_f if year==2010 & miss1980!=0
eststo Model1
reg wageln L30.percent_f if year==2010
eststo Model2


// Models 3 & 4: + "education"
reg wageln percent_f edu if year==2010 & miss1980!=0 // 
eststo Model3
reg wageln L30.percent_f edu if year==2010 // 
eststo Model4


// Models 5 & 6: + controls
reg wageln percent_f hours public black_w-hisp_w edu c.lmexp##c.lmexp mar nchlt5 rel_size if year==2010 & miss1980!=0
eststo Model5
reg wageln L30.percent_f hours public black_w-hisp_w edu c.lmexp##c.lmexp mar nchlt5 rel_size if year==2010
eststo Model6


// show results
estout Model1 Model2 Model3 Model4 Model5 Model6, style(tex) cells(b(star fmt(4)) t(par fmt(2))) starlevels(* 0.05 ** 0.01 *** 0.001)	
