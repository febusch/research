// Run to replicate Table 2
// Title: "Coefficients (t-values in parentheses) from Fixed Effects Regressions of Occupational Log Wages"
//
// Note: Working directory must be specified before running


// load data & prep
cd "PLEASE_PROVIDE/2018-occ-devaluation-feminization"
use "input/master_1_02.dta", clear
xtset id year	
		
// Model estimation: male wages
xtreg wage_m_ln c.percent_f i.year hours_male public_male black_w-hisp_w edu_male c.lmexp_male##c.lmexp_male mar_male nchlt5_male rel_size, fe vce(robust)		
eststo Model1

// Model estimation: female wages
xtreg wage_f_ln c.percent_f i.year hours_fem public_fem black_w-hisp_w edu_fem c.lmexp_fem##c.lmexp_fem mar_fem nchlt5_fem rel_size, fe vce(robust)
eststo Model2

* print results
estout Model1 Model2, style(tex) cells(b(star fmt(4)) t(par fmt(2))) starlevels(* 0.05 ** 0.01 *** 0.001)	
