// Run to replicate Table 1
// Title: "Sample descriptive statistics: Pooled means and deltas (2015Ð1992)"


cd "PLEASE_PROVIDE/2020-wage-disparities-women"


* load
use "input/aux/master.dta", clear

* set to survey data
svyset pid [pweight=weight]

* compute averages
local vars casmin1 casmin2 casmin3 lmexp_ft tenure whour_deal whour_over overwork2 kids5 housework childcare fsize1 fsize2 fsize3 fsize4 public indu1 indu2 indu3 indu4 indu5 indu6 indu7 indu8 age east partsta marsta
local vars_n: word count `vars'
mat A = J(`vars_n', 6, .)
local row = 1
mat list A
foreach var of varlist `vars' {

	* means
	svy: mean `var' if occ_gender == 0
	mat A[`row', 1] = _b[`var']
	svy: mean `var' if occ_gender == 1
	mat A[`row', 3] = _b[`var']
	svy: mean `var' if occ_gender == 2
	mat A[`row', 5] = _b[`var']
	
	* deltas
	svy: mean `var' if occ_gender == 0 & year == 1992
	local value92 = _b[`var']
	svy: mean `var' if occ_gender == 0 & year == 2015
	local value15 = _b[`var']
	mat A[`row', 2] = `value15' - `value92'
	
	svy: mean `var' if occ_gender == 1 & year == 1992
	local value92 = _b[`var']
	svy: mean `var' if occ_gender == 1 & year == 2015
	local value15 = _b[`var']
	mat A[`row', 4] = `value15' - `value92'
	
	svy: mean `var' if occ_gender == 2 & year == 1992
	local value92 = _b[`var']
	svy: mean `var' if occ_gender == 2 & year == 2015
	local value15 = _b[`var']
	mat A[`row', 6] = `value15' - `value92'
	
	* increment
	local row = `row' + 1

}
mata : st_matrix("A", round(st_matrix("A"),0.01))
mat rownames A = `vars'
mat list A
estout matrix(A), style(tex)  // "estout" must be installed before use, style can be changed
