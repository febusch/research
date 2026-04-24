// Prepares individual-level variables and merges them with the occupational variables extracted from O*NET.
// Requires the ACS 2019 data placed in folder /input.
//
// After running this script successfully, we have to final dataset used for analysis.


** load data
use "input/acs_2019.dta", clear


** sample selection
keep if age >= 15 & age <= 64 // working age
keep if empstat == 1 // all employed (not unemployed or out of labor force)
keep if incwage > 0 // had income above 0
keep if occ2010 >= 10 & occ2010 < 9800 // has occupation information & is not in military


** generate variable: female
recode sex (1 = 0 "[0] male")  (2 = 1 "[1] female"), gen(female)
label var female "binary indicator for being female"


** generate variable: percent female (continuous & categorical)
svyset [pweight=perwt]
gen pcf = .
levelsof occ2010, local(occs)
foreach occ in `occs' {
	svy: mean female if occ2010 == `occ'
	replace pcf = round(_b["female"]*100, 0.01) if occ2010 == `occ'
}
keep if classwkr == 2 // keep employees, drop self-employed (we only do this after computing percent female)
label var pcf "% female in occ2010 cell, continuous"


** generate variable: percent female (categorical)
// This is the categorical variable used to distinguish female-typed, mixed, and male-typed occupations.
// It is an important modeling choice how many categories (in our case: 3) to look at.
// In order to facilitate experimentation with more categories, we include variables with 4, 5, and 10 groups.

	** 3 categories
	recode pcf ///
		(0/33 = 0 "[0] 0-33%") ///
		(33.001/66 = 1 "[1] 33-66%") ///
		(66.001/100 = 2 "[2] 66-100%"), ///
		gen(pcf_cat_3)
	label var pcf_cat_3 "% female in occ2010 cell, 3 categories"
	
	** 4 categories
	recode pcf ///
		(0/25 = 0 "[0] 0-25%") ///
		(25.001/50 = 1 "[1] 25-50%") ///
		(50.001/75 = 2 "[2] 50-75%") ///
		(75.001/100 = 3 "[3] 75-100%"), ///
		gen(pcf_cat_4)
	label var pcf_cat_4 "% female in occ2010 cell, 4 categories"
	
	** 5 categories
	recode pcf ///
		(0/20 = 0 "[0] 0-20%") ///
		(20.001/40 = 1 "[1] 20-40%") ///
		(40.001/60 = 2 "[2] 40-60%") ///
		(60.001/80 = 3 "[3] 60-80%") ///
		(80.001/100 = 4 "[4] 80-100%"), ///
		gen(pcf_cat_5)
	label var pcf_cat_5 "% female in occ2010 cell, 5 categories"	
	
	** 10 categories
	recode pcf ///
		(0/10 = 0 "[0] 0-10%") ///
		(10.001/20 = 1 "[1] 10-20%") ///
		(20.001/30 = 2 "[2] 20-30%") ///
		(30.001/40 = 3 "[3] 30-40%") ///
		(40.001/50 = 4 "[4] 40-50%") ///
		(50.001/60 = 5 "[5] 50-60%") ///
		(60.001/70 = 6 "[6] 60-70%") ///
		(70.001/80 = 7 "[7] 70-80%") ///
		(80.001/90 = 8 "[8] 80-90%") ///
		(90.001/100 = 9 "[9] 90-100%"), ///
		gen(pcf_cat_10)
	label var pcf_cat_10 "% female in occ2010 cell, 10 categories"
	

** generate variable: hourly wage
// In the ACS, the underlying variables here are measured for the past 12 months (not the last calendric year).
// We apply top- and bottom-coding so that heavy outliers are prevented.
gen hours_annum = wkswork1*uhrswork  // hours per annum
gen wage = incwage / hours_annum
quietly sum wage, d
local median = r(p50)
local min = `median' / 20
local max = `median' * 20
replace wage = `min' if wage < `min'  // => (962 real changes made), changes 0.08% of sample
replace wage = `max' if wage > `max'  // => (2,682 real changes made), changes 0.2% of sample (mostly people with very low amount of work hours)
label var wage "hourly wage in previous 12 months"
gen wage_ln = ln(wage)
label var wage_ln "hourly wage in previous 12 months, ln transformed"


** generate variable: educational attainment
recode educ (0/5 = 0 "[0] below HS") (6 = 1 "[1] HS") (7/9 = 2 "[2] some College") (10 = 3 "[3] BA degree") (11 = 4 "[4] advanced degree"), gen(edu_attain)
ta educ edu_attain
label var edu_attain "categorical indicators for educational attainment"


** generate variable: continuous years in education
gen eduyear=.
replace eduyear=0 if educd==0
replace eduyear=0 if educd==1
replace eduyear=0 if educd==2
replace eduyear=4 if educd==10
replace eduyear=0 if educd==11
replace eduyear=0 if educd==12
replace eduyear=2.5 if educd==13
replace eduyear=1 if educd==14
replace eduyear=2 if educd==15
replace eduyear=3 if educd==16
replace eduyear=4 if educd==17
replace eduyear=6.5 if educd==20
replace eduyear=5.5 if educd==21
replace eduyear=5 if educd==22
replace eduyear=6 if educd==23
replace eduyear=7.5 if educd==24
replace eduyear=7 if educd==25
replace eduyear=8 if educd==26
replace eduyear=9 if educd==30
replace eduyear=10 if educd==40
replace eduyear=11 if educd==50
replace eduyear=12 if educd==60
replace eduyear=12 if educd==61
replace eduyear=12 if educd==62
replace eduyear=12 if educd==63
replace eduyear=12 if educd==64
replace eduyear=12 if educd==65
replace eduyear=13 if educd==70
replace eduyear=13 if educd==71
replace eduyear=14 if educd==80
replace eduyear=14 if educd==81
replace eduyear=14 if educd==82
replace eduyear=14 if educd==83
replace eduyear=15 if educd==90
replace eduyear=16 if educd==100
replace eduyear=16 if educd==101
replace eduyear=17 if educd==110
replace eduyear=18 if educd==111
replace eduyear=19 if educd==112
replace eduyear=20 if educd==113
replace eduyear=17 if educd==114
replace eduyear=19 if educd==115
replace eduyear=20 if educd==116
label var eduyear "years in education, continuous, estimated based on attainment"


** generate variable: potential labor market experience
// The ACS does not include information on actual labor market experience.
// In order to approximate experience, a conventional approach is to subtract the number in and before education from the person's age.
// While this is approach is accepted as valid approximation, note that it is particularly problematic for women, where child rearing often
// subtracts additional years from time spent in the labor market.
gen lmexp=age-eduyear-6
label var lmexp "potential years in labor market"


** generate variable: race
ren race race_2
gen race=.
label define race 0 "(0) non-hispanic white" 1 "(1) black" 2 "(2) native american" 3 "(3) asian" 4 "(4) hispanic" 5 "(5) Other"
label values race race
replace race=0 if race_2==1 & hispan==0
replace race=1 if race_2==2 & hispan==0
replace race=2 if race_2==3 & hispan==0
replace race=3 if (race_2==4 | race_2==5 | race_2==6) & hispan==0
replace race=4 if hispan==1 | hispan==2 | hispan==3 | hispan==4
replace race=5 if race==.
ta race race_2
drop race_2 hispan raced hispand
label var race "categorical indicator for six race groups"


** generate variable: private vs. public sector
gen public=.
label define public 0 "(0) private" 1 "(1) public",modify
label values public public
replace public=0 if classwkrd==22 | classwkrd==23
replace public=1 if classwkrd>=24 & classwkrd<=28
ta public classwkrd,m
drop if public==.  // drops unpaid family workers
label var public "binary indicator for work in public sector"


** generate variable: metropolitan area
// In general, individuals either live in a metro area or not. However, due to data limitations in the ACS,
// there is a third category ("mixed") which is used if it cannot be properly determined if the person 
// lived in a metro area or not.
ren metro metro2
recode metro2 (0 = 3 "[3] in mixed area") (1 = 1 "[1] not in metro area") (2/4 = 2 "[2] in metro area"), gen(metro)
ta metro metro2
drop metro2
label var metro "categorical indicator for living in metropolitan area"


** generate variable: parttime/fulltime
// We define full-time workers as those who have worked min. 35 hours per week
recode uhrswork (0/34.9999 = 0 "[0] below 35hrs") (35/. = 1 "[1] 35hrs +"), gen(fulltime)
label var fulltime "binary indicator for working full-time"


** generate variable: aggregate industry
gen ind1990_agg=.
label var ind1990_agg "industrial codes, 1990 scheme, aggregated"
label define ind1990_agg 0 "(0) Not applicable" 1 "(1) Agriculture, forestry, and fisheries" 2 "(2) Mining" 3 "(3) Construction" 4 "(4) Manufacturing" 5 "(5) Transportation, communications, and other public utilities" 6 "(6) Wholesale trade" 7 "(7) Retail trade" 8 "(8) Finance, insurance, and real estate" 9 "(9) Business and repair services" 10 "(10) Personal services" 11 "(11) Entertainment and recreation services" 12 "(12) Professional and related services" 13 "(13) Public administration" 14 "(14) Active duty military" 15 "(15) Experienced unemployment not classified by industry" 16 "(16) Did not respond"
label values ind1990_agg ind1990_agg
replace ind1990_agg=0 if ind1990==0
replace ind1990_agg=1 if ind1990>=10 & ind1990<=32
replace ind1990_agg=2 if ind1990>=40 & ind1990<=50
replace ind1990_agg=3 if ind1990>=60 & ind1990<=60
replace ind1990_agg=4 if ind1990>=100 & ind1990<=392
replace ind1990_agg=5 if ind1990>=400 & ind1990<=472
replace ind1990_agg=6 if ind1990>=500 & ind1990<=571
replace ind1990_agg=7 if ind1990>=580 & ind1990<=691
replace ind1990_agg=8 if ind1990>=700 & ind1990<=712
replace ind1990_agg=9 if ind1990>=721 & ind1990<=760
replace ind1990_agg=10 if ind1990>=761 & ind1990<=791
replace ind1990_agg=11 if ind1990>=800 & ind1990<=810
replace ind1990_agg=12 if ind1990>=812 & ind1990<=893
replace ind1990_agg=13 if ind1990>=900 & ind1990<=932
replace ind1990_agg=14 if ind1990>=940 & ind1990<=960
replace ind1990_agg=15 if ind1990>=992 & ind1990<=992
replace ind1990_agg=16 if ind1990>=999 & ind1990<=999
drop if ind1990_agg==0
drop if ind1990_agg==15
drop if ind1990_agg==16
drop ind1990


** keep variables relevant for analysis
keep occ2010 ind1990_agg pcf pcf_cat_3 pcf_cat_4 pcf_cat_5 pcf_cat_10 wage wage_ln age female race eduyear edu_attain lmexp fulltime public metro region serial pernum perwt
order occ2010 ind1990_agg pcf pcf_cat_3 pcf_cat_4 pcf_cat_5 pcf_cat_10 wage wage_ln age female race eduyear edu_attain lmexp fulltime public metro region serial pernum perwt


** drop occupations for which we have below 10 observations for either sex
bysort occ2010 female: gen count = _N
ta occ2010 if count < 10  // 19 of 422 occupations that we have to drop
levelsof occ2010 if count < 10, local(occs)
foreach occ in `occs' {
	drop if occ2010 == `occ'
}  // => dropped total of 5672 observations
drop count


** add occupation-level data
ren occ2010 OCC2010
merge m:1 OCC2010 using "input/aux/onet_final.dta"
ren OCC2010 occ2010
ta occ2010 if _merge == 1  // 12 occupations (of 21,957 observations) from ACS are not matched with ONET data => we drop them
drop if _merge == 1 | _merge == 2
drop _merge
egen miss = rmiss(analytic_std - compens_physical_std)
ta occ2010 if miss != 0  // 2 occupations (of 1,748 observations) are without variables for physical strain/hazard => drop them
drop if miss != 0
drop miss


** store final data set
save "input/master.dta", replace  // this is the data set we use for analysis
