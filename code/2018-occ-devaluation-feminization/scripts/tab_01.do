// Run to replicate Table 1
// Title: "Total N of Observed Occupation-Industry Cells by Quintile and Period"
//
// Working directory must be specified before running


// load data & prep
cd "PLEASE_PROVIDE/2018-occ-devaluation-feminization"
use "input/master_1_02.dta", clear
xtset id year	

// matrix for output
mat A = J(5,6,.)
mat list A

// analysis
local row = 1
foreach quint of numlist 1/5 {
	local column = 1
	foreach year of numlist 1960(10)2010 {
		ta percent_f if year==`year' & quint==`quint'
		mat A[`row',`column'] = r(N)
		local column = `column' + 1
	}
	local row = `row' + 1
}

mat list A
