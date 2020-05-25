// Run to replicate Figure 1
// Title: "Median hourly wages in male-, mixed, and female-typed occupations 1992Ð2015, by gender (2015 euros, smooth)"


cd "PLEASE_PROVIDE/2020-wage-disparities-women"


* A: Women

	* data
	use "input/aux/soep_2.dta", clear
	keep if male == 0
	
	* collapse
	collapse (median) hourwage_cap [pweight = weight], by(occ_gender year)
	label var hourwage_cap "hourly wage in 2015 Euros, capped"
	
	* tsset
	tsset occ_gender year
	
	* gen smooth values for hourwage
	tssmooth ma hw_ma313=hourwage_cap, window(3 1 3)
		
	* graph (smoothened 313)
	twoway (tsline hw_ma313 if occ_gender == 0, lcolor(black)) ///
		(tsline hw_ma313 if occ_gender == 1, lcolor(gs10)) ///
		(tsline hw_ma313 if occ_gender == 2, lcolor(black) lpattern(dash)), ///
		legend(label(1 "Male-typed") label(2 "Mixed-typed") label(3 "Female-typed") rows(1)) ///
		xtitle("") ytitle("") ///
		xlabel(1992(1)2015, angle(45) labsize(small)) ///
		ylabel(12(1)20,glcolor(gs15) angle(0) labsize(medium)) ///
		bgcolor(white) graphregion(color(white))
		
		
* B: Men

	* data
	use "input/aux/soep_2.dta", clear
	keep if male == 1
	
	* collapse
	collapse (median) hourwage_cap [pweight = weight], by(occ_gender year)
	label var hourwage_cap "hourly wage in 2015 Euros, capped"
	
	* tsset
	tsset occ_gender year
	
	* gen smooth values for hourwage
	tssmooth ma hw_ma313=hourwage_cap, window(3 1 3)
		
	* graph (smoothened 313)
	twoway (tsline hw_ma313 if occ_gender == 0, lcolor(black)) ///
		(tsline hw_ma313 if occ_gender == 1, lcolor(gs10)) ///
		(tsline hw_ma313 if occ_gender == 2, lcolor(bkack) lpattern(dash)), ///
		legend(label(1 "Male-typed") label(2 "Mixed-typed") label(3 "Female-typed") rows(1)) ///
		xtitle("") ytitle("") ///
		xlabel(1992(1)2015, angle(45) labsize(small)) ///
		ylabel(12(1)20,glcolor(gs15) angle(0) labsize(medium)) ///
		bgcolor(white) graphregion(color(white))
