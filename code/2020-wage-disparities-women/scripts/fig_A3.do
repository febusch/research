// Run to replicate Figure A3
// Title: "Percent with tertiary degree, by gender (1992Ð2015, smooth)"


cd "PLEASE_PROVIDE/2020-wage-disparities-women"



* load
use "input/aux/soep_2.dta", clear

* collapse
collapse (mean) casmin3 [pweight = weight], by(male year)

* tsset
tsset male year

* gen smooth values for hourwage
tssmooth ma casmin_313=casmin3, window(3 1 3)
replace casmin_313 = round(casmin_313*100, 0.01)

* plot
twoway (tsline casmin_313 if male == 0, lcolor(black)) ///
	(tsline casmin_313 if male == 1, lcolor(gs9)), ///
	legend(label(1 "Women") label(2 "Men") rows(1)) ///
	xtitle("") ytitle("") ///
	xlabel(1992(1)2015, angle(45) labsize(small)) ///
	ylabel(,glcolor(gs15) angle(0) labsize(medium)) ///
	bgcolor(white) graphregion(color(white))
