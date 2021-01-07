// Run to replicate Figure 3
// Title: "Differences in marginal effect sizes, 2010 and 1960, by wage quintile and gender, and 95 percent confidence intervals"
//
// Note: Working directory must be specified before running


// load data & prep
cd "PLEASE_PROVIDE/2018-occ-devaluation-feminization"
use "input/master_1_02.dta", clear
xtset id year


// Prep matrix for output
mat A=J(10,5,.)
mat colnames A = female quint effect ll ul // mat names
mat list A


// Models for male wages
local row = 1
foreach quint of numlist 1/5 {
	xtreg wage_m_ln c.percent_f##ib1960.year hours_male public_male black_w-hisp_w edu_male c.lmexp_male##c.lmexp_male mar_male nchlt5_male rel_size if quint==`quint', fe vce(robust)
	margins, dydx(percent_f) at(year=(1960(10)2010)) pwcompare
	mat B = r(table_vs)
	mat A[`row',1] = 0 // gender
	mat A[`row',2] = `quint' // quintile
	mat A[`row',3] = B[1,5] // effect
	mat A[`row',4] = B[5,5] // lower limit
	mat A[`row',5] = B[6,5] // upper limit
	local row = `row' + 1
	}

// Models for female wages
local row = 6
foreach quint of numlist 1/5 {
	xtreg wage_f_ln c.percent_f##ib1960.year hours_fem public_fem black_w-hisp_w edu_fem c.lmexp_fem##c.lmexp_fem mar_fem nchlt5_fem rel_size if quint==`quint', fe vce(robust) 
	margins, dydx(percent_f) at(year=(1960(10)2010)) pwcompare
	mat B = r(table_vs)
	mat A[`row',1] = 1 // gender
	mat A[`row',2] = `quint' // quintile
	mat A[`row',3] = B[1,5] // effect
	mat A[`row',4] = B[5,5] // lower limit
	mat A[`row',5] = B[6,5] // upper limit
	local row = `row' + 1
	}


// transform into data
mat list A
clear
svmat A, names(col)


// Produce graph
label define female 0 "male wages" 1 "female wages", modify
label values female female
graph dot (asis) effect ll ul, by(female,  graphregion(color(white)) legend(off) note("") ) /// 
	over(quint, relabel(1 "1st quintile" 2 "	o	" 3 "	o	" 4 "	o	" 5 "5th quintile") label(labgap(4))) ///
	marker(1,msymbol(O) mcolor(black)) marker(2,msymbol(oh) mcolor(black)) marker(3,msymbol(oh) mcolor(black)) ///
	subtitle(,bcolor(white) position(12) bmargin(medium)) ///
	yline(0,lcolor(gs4)) noextendline 
