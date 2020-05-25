// Run to replicate Figures A1 and A2
// Title Fig A1: "Coefficients for occupational tasks from fixed effects regression, 1992Ð2015: analytical, quantitative, verbal, creative"
// Title Fig A2: "Coefficients for occupational tasks from fixed effects regression, 1992Ð2015: management, care, computer, routine"


cd "PLEASE_PROVIDE/2020-wage-disparities-women"



* load
use "input/aux/master.dta", clear

* prep
tsset pid year

* year vars for plot
gen year_plot = .	
local line = 1
foreach year of numlist 0/11 {
	replace year_plot = `year' in `line'
	local line = `line' + 1
	
}
label define year_plot 0 "1992/1993" 1 "1994/1995" 2 "1996/1997" 3 "1998/1999" ///
	4 "2000/2001" 5 "2002/2003" 6 "2004/2005" 7 "2006/2007" 8 "2008/2009" ///
	9 "2010/2011" 10 "2012/2013" 11 "2014/2015"
label values year_plot year_plot
		
		
* estimate

	* controls
	local edu_skills i.educatt3 c.lmexp_ft##c.lmexp_ft c.tenure
	local work_fam i.overwork1 i.kids5 c.housework c.childcare
	local sector i.ind_short i.fsize_4cat i.public
	local demo i.east i.partsta i.marsta
	local tasks c.verb c.quant c.analyt c.create c.comp c.manage c.care c.routine
	local task_years i.year_dyad#c.verb i.year_dyad#c.quant i.year_dyad#c.analyt i.year_dyad#c.create i.year_dyad#c.comp i.year_dyad#c.manage i.year_dyad#c.care i.year_dyad#c.routine

	* model + mar
	xtreg logwage_cap i.year_dyad i.year_dyad#i.occ_gender i.occ_gender  `edu_skills' `work_fam' `sector' `demo' `tasks' `task_years', fe vce(robust)
	local varlist verb quant analyt create comp manage care routine
	margins,  dydx(`varlist') over(year_dyad)
			
	* store results
	mat results = r(table)
	local count = 1
	local startrow = 1
	local endrow = 12
	local varlist verb quant analyt create comp manage care routine
	foreach var in `varlist' {
		mat aa`count' = results[1,`startrow'..`endrow']' , results[5..6,`startrow'..`endrow']'
		mat colnames aa`count' = b_`var' ll_`var' ul_`var'
		local count = `count' + 1
		local startrow = `startrow' + 12
		local endrow = `endrow' + 12
	}
	mat aa = aa1, aa2, aa3, aa4, aa5, aa6, aa7, aa8  // contains all estimates of coeffs, upper and lower CI for all vars
	svmat aa, names(col)
	
	
	* PLOT: verb
	twoway (connected b_verb year_plot, sort lcolor(black) mcolor(black)) ///
		(rcap ll_verb ul_verb year_plot, lcolor(black)), ///
		xtitle("") ytitle("") ///
		xlabel(0(1)11, angle(45) labsize(small) valuelabel) ///
		ylabel(-0.006(0.001)0.006, glcolor(gs15) angle(0) labsize(medsmall)) ///
		bgcolor(white) graphregion(color(white)) ///
		legend(off) ///
		saving(output/task_verb, replace)
		
	* PLOT: quant
	twoway (connected b_quant year_plot, sort lcolor(black) mcolor(black)) ///
		(rcap ll_quant ul_quant year_plot, lcolor(black)), ///
		xtitle("") ytitle("") ///
		xlabel(0(1)11, angle(45) labsize(small) valuelabel) ///
		ylabel(-0.006(0.001)0.006, glcolor(gs15) angle(0) labsize(medsmall)) ///
		bgcolor(white) graphregion(color(white)) ///
		legend(off) ///
		saving(output/task_quant, replace)
		
				
	* PLOT: analyt
	twoway (connected b_analyt year_plot, sort lcolor(black) mcolor(black)) ///
		(rcap ll_analyt ul_analyt year_plot, lcolor(black)), ///
		xtitle("") ytitle("") ///
		xlabel(0(1)11, angle(45) labsize(small) valuelabel) ///
		ylabel(-0.006(0.001)0.006, glcolor(gs15) angle(0) labsize(medsmall)) ///
		bgcolor(white) graphregion(color(white)) ///
		legend(off) ///
		saving(output/task_analyt, replace)
		
		
	* PLOT: create
	twoway (connected b_create year_plot, sort lcolor(black) mcolor(black)) ///
		(rcap ll_create ul_create year_plot, lcolor(black)), ///
		xtitle("") ytitle("") ///
		xlabel(0(1)11, angle(45) labsize(small) valuelabel) ///
		ylabel(-0.006(0.001)0.006, glcolor(gs15) angle(0) labsize(medsmall)) ///
		bgcolor(white) graphregion(color(white)) ///
		legend(off) ///
		saving(output/task_create, replace)
		
		
	* PLOT: comp
	twoway (connected b_comp year_plot, sort lcolor(black) mcolor(black)) ///
		(rcap ll_comp ul_comp year_plot, lcolor(black)), ///
		xtitle("") ytitle("") ///
		xlabel(0(1)11, angle(45) labsize(small) valuelabel) ///
		ylabel(-0.006(0.001)0.006, glcolor(gs15) angle(0) labsize(medsmall)) ///
		bgcolor(white) graphregion(color(white)) ///
		legend(off) ///
		saving(output/task_comp, replace)
		

	* PLOT: manage
	twoway (connected b_manage year_plot, sort lcolor(black) mcolor(black)) ///
		(rcap ll_manage ul_manage year_plot, lcolor(black)), ///
		xtitle("") ytitle("") ///
		xlabel(0(1)11, angle(45) labsize(small) valuelabel) ///
		ylabel(-0.006(0.001)0.006, glcolor(gs15) angle(0) labsize(medsmall)) ///
		bgcolor(white) graphregion(color(white)) ///
		legend(off) ///
		saving(output/task_manage, replace)		
	
	
	* PLOT: care
	twoway (connected b_care year_plot, sort lcolor(black) mcolor(black)) ///
		(rcap ll_care ul_care year_plot, lcolor(black)), ///
		xtitle("") ytitle("") ///
		xlabel(0(1)11, angle(45) labsize(small) valuelabel) ///
		ylabel(-0.006(0.001)0.006, glcolor(gs15) angle(0) labsize(medsmall)) ///
		bgcolor(white) graphregion(color(white)) ///
		legend(off) ///
		saving(output/task_care, replace)		

		
	* PLOT: routine
	twoway (connected b_routine year_plot, sort lcolor(black) mcolor(black)) ///
		(rcap ll_routine ul_routine year_plot, lcolor(black)), ///
		xtitle("") ytitle("") ///
		xlabel(0(1)11, angle(45) labsize(small) valuelabel) ///
		ylabel(-0.006(0.001)0.006, glcolor(gs15) angle(0) labsize(medsmall)) ///
		bgcolor(white) graphregion(color(white)) ///
		legend(off) ///
		saving(output/task_routine, replace)
