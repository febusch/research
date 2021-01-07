// Run to replicate Figure 2
// Title: "Marginal effects of feminization on wages, by occupational wage quintiles and gender (1960–2010)"
//
// Note: Working directory must be specified before running


// load data & prep
cd "PLEASE_PROVIDE/2018-occ-devaluation-feminization"
use "input/master_1_02.dta", clear
xtset id year


// Prep matrix for output
mat A=J(60,8,.)
mat colnames A = quint year effect_m effect_f ci_low_m ci_high_m ci_low_f ci_high_f // mat names
mat list A


// Models for male wages
mat Y_male = 0.9 \ 2.9 \ 4.9 \ 6.9 \ 8.9 \ 10.9 // prep year mat for men	
local row = 1
foreach quint of numlist 1/5 {
	xtreg wage_m_ln c.percent_f##ib1960.year hours_male public_male black_w-hisp_w edu_male c.lmexp_male##c.lmexp_male mar_male nchlt5_male rel_size if quint==`quint', fe vce(robust)
	margins, dydx(percent_f) at(year=(1960(10)2010))
	mat T=r(table)'
	mat A[`row',3] = T[.,"b"] // coefficient
	mat A[`row',5] = T[.,"ll"] // lower limit
	mat A[`row',6] = T[.,"ul"] // upper limit
	mat U = J(6,1,`quint')
	mat A[`row',1] = U // quintile number
	mat A[`row',2] = Y_male // year	
	local row = `row' + 6
	}


// Models for female wages
mat Y_female = 1.1 \ 3.1 \ 5.1 \ 7.1 \ 9.1 \ 11.1 // prep year mat for men	
local row = 31
foreach quint of numlist 1/5 {
	xtreg wage_f_ln c.percent_f##ib1960.year hours_fem public_fem black_w-hisp_w edu_fem c.lmexp_fem##c.lmexp_fem mar_fem nchlt5_fem rel_size if quint==`quint', fe vce(robust) 
	margins, dydx(percent_f) at(year=(1960(10)2010))
	mat T=r(table)'
	mat A[`row',4] = T[.,"b"] // coefficient
	mat A[`row',7] = T[.,"ll"] // lower limit
	mat A[`row',8] = T[.,"ul"] // upper limit
	mat U = J(6,1,`quint')
	mat A[`row',1] = U // quintile number
	mat A[`row',2] = Y_female // year	
	local row = `row' + 6
	}		
	

// transform into data
mat list A
clear
svmat A, names(col)


// Graph for 1st quintile	
graph tw (connected effect_m year, msymbol(smcircle) mcolor(gs3) lcolor(gs3)) ///
	(connected effect_f year, msymbol(smcircle) mcolor(gs8) lcolor(gs8)) ///
	(rcap ci_high_m ci_low_m year, lcolor(gs3) lwidth(medthin) msize(small)) /// // men
	(rcap ci_high_f ci_low_f year, lcolor(gs8) lwidth(medthin) msize(small)) if quint == 1, /// // women
	xlabel(1 "1960" 3 "1970" 5 "1980" 7 "1990" 9 "2000" 11 "2010", noticks labgap(2) labsize(medium)) ///
	ylabel(-0.005(0.0025)0.01,glcolor(gs15) angle(horizontal) labsize(medium) labgap(2) tlength(1) gmin gmax) ///
	xtitle("") bgcolor(white) graphregion(color(white)) legend(off) xscale(alt noline) ysize(4.5) xsize(5.2) aspect(0.95) text(0.00875 6 "1st wage quintile", box margin(small) fcolor(white) lcolor(gs10))
	
	
// Graph for 2nd quintile
graph tw (connected effect_m year, msymbol(smcircle) mcolor(gs3) lcolor(gs3)) ///
	(connected effect_f year, msymbol(smcircle) mcolor(gs8) lcolor(gs8)) ///
	(rcap ci_high_m ci_low_m year, lcolor(gs3) lwidth(medthin) msize(small)) /// // men
	(rcap ci_high_f ci_low_f year, lcolor(gs8) lwidth(medthin) msize(small)) if quint == 2, /// // women
	xlabel(1 "1960" 3 "1970" 5 "1980" 7 "1990" 9 "2000" 11 "2010", noticks labgap(2) labsize(medium)) ///
	ylabel(-0.005(0.0025)0.01,glcolor(gs15) angle(horizontal) labsize(medium) labgap(2) tlength(1)  gmin gmax) ///
	xtitle("") bgcolor(white) graphregion(color(white)) legend(off) xscale(alt noline) yscale(alt off fill) ysize(4.5) xsize(5.2) aspect(0.95) text(0.00875 6 "2nd wage quintile", box margin(small) fcolor(white) lcolor(gs10))


// Graph for 3rd quintile
graph tw (connected effect_m year, msymbol(smcircle) mcolor(gs3) lcolor(gs3)) ///
	(connected effect_f year, msymbol(smcircle) mcolor(gs8) lcolor(gs8)) ///
	(rcap ci_high_m ci_low_m year, lcolor(gs3) lwidth(medthin) msize(small)) /// // men
	(rcap ci_high_f ci_low_f year, lcolor(gs8) lwidth(medthin) msize(small)) if quint == 3, /// // women
	xlabel(1 "1960" 3 "1970" 5 "1980" 7 "1990" 9 "2000" 11 "2010", noticks labgap(2) labsize(medium)) ///
	ylabel(-0.005(0.0025)0.01,glcolor(gs15) angle(horizontal) labsize(medium) labgap(2) tlength(1)  gmin gmax) ///
	xtitle("") bgcolor(white) graphregion(color(white)) legend(off) xscale(off fill) ysize(4.5) xsize(5.2) aspect(0.95) text(0.00875 6 "3rd wage quintile", box margin(small) fcolor(white) lcolor(gs10))


// Graph for 4th quintile
graph tw (connected effect_m year, msymbol(smcircle) mcolor(gs3) lcolor(gs3)) ///
	(connected effect_f year, msymbol(smcircle) mcolor(gs8) lcolor(gs8)) ///
	(rcap ci_high_m ci_low_m year, lcolor(gs3) lwidth(medthin) msize(small)) /// // men
	(rcap ci_high_f ci_low_f year, lcolor(gs8) lwidth(medthin) msize(small)) if quint == 4, /// // women
	xlabel(1 "1960" 3 "1970" 5 "1980" 7 "1990" 9 "2000" 11 "2010", noticks labgap(2) labsize(medium)) ///
	ylabel(-0.005(0.0025)0.01,glcolor(gs15) angle(horizontal) labsize(medium) labgap(2) tlength(1)  gmin gmax) ///
	xtitle("") bgcolor(white) graphregion(color(white)) legend(off) xscale(noline) yscale(alt off fill) ysize(4.5) xsize(5.2) aspect(0.95) text(0.00875 6 "4th wage quintile", box margin(small) fcolor(white) lcolor(gs10))


// Graph for 5th quintile
graph tw (connected effect_m year, msymbol(smcircle) mcolor(gs3) lcolor(gs3)) ///
	(connected effect_f year, msymbol(smcircle) mcolor(gs8) lcolor(gs8)) ///
	(rcap ci_high_m ci_low_m year, lcolor(gs3) lwidth(medthin) msize(small)) /// // men
	(rcap ci_high_f ci_low_f year, lcolor(gs8) lwidth(medthin) msize(small)) if quint == 5, /// // women
	xlabel(1 "1960" 3 "1970" 5 "1980" 7 "1990" 9 "2000" 11 "2010", noticks labgap(2) labsize(medium)) ///
	ylabel(-0.005(0.0025)0.01,glcolor(gs15) angle(horizontal) labsize(medium) labgap(2) tlength(1) gmin gmax) ///
	xtitle("") bgcolor(white) graphregion(color(white)) legend(off) xscale(noline) ysize(4.5) xsize(5.2) aspect(0.95) text(0.00875 6 "5th wage quintile", box margin(small) fcolor(white) lcolor(gs10))			
