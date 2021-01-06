// Run to replicate Figure 2
// Title: "Percentage of women and men with tertiary degree, by occupational gender type, smooth, 1992–2015"


cd "PLEASE_PROVIDE/2020-wage-disparities-women"


* load & collapse
use "input/aux/soep_2.dta", clear
collapse (mean) casmin3 [pweight = weight], by(occ_gender year male)
sort male occ_gender year

* gen time-series panel var
gen panelvar = .
label define panelvar 0 "male occ - fem" 1 "male occ - mal" 2 "mixed occ - fem" 3 "mixed occ - mal" 4 "female occ - fem" 5 "female occ - mal"
replace panelvar = 0 if occ_gender == 0 & male == 0
replace panelvar = 1 if occ_gender == 0 & male == 1
replace panelvar = 2 if occ_gender == 1 & male == 0
replace panelvar = 3 if occ_gender == 1 & male == 1
replace panelvar = 4 if occ_gender == 2 & male == 0
replace panelvar = 5 if occ_gender == 2 & male == 1
label values panelvar panelvar

* tsset
tsset panelvar year

* gen smooth values for hourwage
tssmooth ma casmin_313=casmin3, window(3 1 3)
replace casmin_313 = round(casmin_313*100, 0.01)

* male jobs
tw (line casmin_313 year if occ_gender == 0 & male == 0, lcolor(black)) ///
	(line casmin_313 year if occ_gender == 0 & male == 1, lcolor(gs9)), ///
	legend(off) /// // legend(label(1 "Women") label(2 "Men"))
	xtitle("") ytitle("") title("Male type", color(black)) ///
	xlabel(1992(2)2015, angle(45) labsize(small)) ///
	ylabel(10(10)50, glcolor(gs15) angle(0) labsize(medium)) ///
	bgcolor(white) graphregion(color(white)) ///		
	saving(output/occgender0, replace)

* mixed jobs
tw (line casmin_313 year if occ_gender == 1 & male == 0, lcolor(black)) ///
	(line casmin_313 year if occ_gender == 1 & male == 1, lcolor(gs9)), ///
	legend(off) ///
	xtitle("") ytitle("") title("Mixed type", color(black)) ///
	xlabel(1992(2)2015, angle(45) labsize(small)) ///
	ylabel(10(10)50, glcolor(gs15) angle(0) labsize(medium)) ///
	bgcolor(white) graphregion(color(white)) ///
	saving(output/occgender1, replace)

* female jobs
tw (line casmin_313 year if occ_gender == 2 & male == 0, lcolor(black)) ///
	(line casmin_313 year if occ_gender == 2 & male == 1, lcolor(gs9)), ///
	legend(off) ///
	xtitle("") ytitle("") title("Female type", color(black)) ///
	xlabel(1992(2)2015, angle(45) labsize(small)) ///
	ylabel(10(10)50, glcolor(gs15) angle(0) labsize(medium)) ///
	bgcolor(white) graphregion(color(white)) ///
	saving(output/occgender2, replace)
	
* combine
graph combine output/occgender0.gph output/occgender1.gph output/occgender2.gph, ///
	imargin(medium) graphregion(color(white))
