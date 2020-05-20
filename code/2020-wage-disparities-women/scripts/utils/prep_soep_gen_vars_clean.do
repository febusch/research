// Generates datasets used for analysis.
// Requires previously generated "soep_1.dta".


use "input/aux/soep_1.dta", clear

// select sample
keep if employ >=1 & employ <= 4
drop if employ == 3	 // apprentices
keep if year >= 1992 & year <= 2015
keep if age>= 18 & age <= 67
drop if jobpos >= 410 & jobpos <= 440  // self-employed and similar
drop jobpos

// drop if missing
keep if public == 1 | public == 2
drop if partsta == -1
drop if tenure == -3 | tenure == -1
drop if educatt == -1 | educatt == 0  // education missing or in school
drop if wage_gross < 1  // if income zero or not observed
drop if whour_deal <= 0  // if working hours zero or not observed
drop if whour_real <= 0
drop if occ == -1 | occ == -2  // if no occ observed	
drop if marsta < 1
drop if fsize == -1
drop if lmexp_ft == -1
drop if industry == -1
drop if childcare < 0
drop if housework < 0

// clean variable: occupation
drop if occ >= 9710  // groups with unclear functions / residual groups
drop if occ >= 7210 & occ <= 7248  // boat and nautic personnel (no occ data available and few obs's)	
		
// generate variable: occupational gender type (merge from aux)
* note: some from using not matched, these are occ's that were only observed in SOEP before 1992
merge m:1 occ using "input/aux/soep_occ_gender.dta", keepusing(occ_gender)
drop if _merge == 2
drop _merge
recode occ_gender (2 = .), gen(occ_gender_mix)  // binary where male = 0, mixed = 1
recode occ_gender (1 = .) (2=1), gen(occ_gender_fem)  // binary where male = 0, female = 1
recode occ_gender (2 = .) (0 = 1) (1 = 0), gen(occ_gender_mix_rev)  // same as above but reverse
recode occ_gender (1 = .) (2 = 0) (0 = 1), gen(occ_gender_fem_rev)  // same as above but reverse

// generate variable: hourly wage

	* constant 2015 Euros
	gen multiplier = 106.6 / cpi // 106.6 is value for 2015
	gen wage_gross_const = wage_gross * multiplier // monthly gross lab income in 2015 euros

	* hourly wage
	gen hours_month = whour_deal * 4.35 // 4.35 to approximate month (= 365 days per year / 12 mohts / 7 days in week )
	gen hourwage = round(wage_gross_const / hours_month, 0.01)
	label var hourwage "hourly wage, from wage_gross_const and whour_deal"
	label variable wage_gross_const "monthly wage in constant 2015 Euro"
	label variable wage_gross "real hourly wage"
	drop multiplier cpi hours_month

	* top- and bottom-coding
	gen hourwage_cap = hourwage
	label var hourwage_cap "hourly wage top- and bottom-coded at 10*median and median/10 respectively"
	local count_bottom=0
	local count_top=0
	foreach year of numlist 1992/2015 {
		quietly sum hourwage if year == `year', d
		local median = r(p50)
		local min = `median' / 10
		local max = `median' * 10
		quietly sum hourwage_cap if hourwage_cap < `min' & year == `year'
		local count_bottom = `count_bottom' + r(N)
		quietly sum hourwage_cap if hourwage_cap > `max' & year == `year'
		local count_top = `count_top' + r(N)
		replace hourwage_cap = `min' if hourwage_cap < `min' & year == `year'
		replace hourwage_cap = `max' if hourwage_cap > `max' & year == `year'
	}
	local count_total = `count_bottom' + `count_top'
	di "Bottom coded total of `count_bottom' observations"
	di "Top coded total of `count_top' observations"
	di "Total: `count_total' observations"

	* log hourly wage
	gen logwage = log(hourwage)
	label var logwage "log hourly wage, from hourwage"		
	gen logwage_cap = log(hourwage_cap)
	label var logwage_cap "log hourly wage, from hourwage_cap"

		
// clean variable: public
recode public (2=0)
label define public 0 "[0] private" 1 "[1] public"
label values public public
label variable public "working in public sector"
ta public, gen(public)
	
// clean variable: partnership
recode partsta (1 2 3 4 = 1)
label define partsta 0 "[0] no partner in hh" 1 "[1] partner in hh"
label values partsta partsta
label variable partsta "partnership in household status"
ta partsta, gen(partsta)
	
// clean variable: male
recode sex (2 = 0), gen(male)
label var male "male gender"
label define male 0 "[0] female" 1 "[1] male"
label values male male
drop sex
	
// clean variable: kids (below 2)
recode kids2 (1 2 3 = 1)
label variable kids2 "children below 2 in hh"
label define kids2 0 "[0] no kids <2 in hh" 1 "[1] kids <2 in hh"
label values kids2 kids2
	
// clean variable: kids (below 5)
gen kids5 = 1 if (kids24 >= 1 & kids24 <=4) | kids2 == 1
replace kids5 = 0 if kids5 == .
label variable kids5 "children below 5 in hh"
label define kids5 0 "[0] no kids <5 in hh" 1 "[1] kids <5 in hh"
label values kids5 kids5
ta kids5, gen(kids5)
	
// clean variable: marital status
recode marsta (2 3 4 5 6 8 = 0) (1 7=1)
label define marsta 0 "[0] not married & together" 1 "[1] married & together"
label values marsta marsta
label variable marsta "marital status"
ta marsta, gen(marsta)
	
// clean variable: firm tenure	
label variable tenure "firm tenure in years"
	
// clean variable: work hours (as per contract)
label variable whour_deal "work hours per week as per contract"
gen whour_deal_sq = whour_deal*whour_deal
	
// clean variable: work hours (real)
label variable whour_real "real work hours"
	
// generate variable: over work (50hrs+)
gen over_work = .
replace over_work = 1 if whour_real >= 50
replace over_work = 0 if whour_real < 50
label define over_work 0 "[0] no overwork" 1 "[1] overwork"
label values over_work over_work
label variable over_work "working 50+ hours per week"
ta over_work, gen(overwork)
	
// generate variable: educational attainment
gen educatt3 = .
replace educatt3 = 0 if educatt >= 1 & educatt <=3
replace educatt3 = 1 if educatt >= 4 & educatt <=7
replace educatt3 = 2 if educatt >= 8 & educatt <=9
label variable educatt3 "educational attainment (CASMIN), 3 groups"
ta educatt3, gen(casmin)
drop educatt
	
// generate variable: firm size
ta fsize,m
recode fsize (1/5 11 = 0) (6/8 = 1) (9 = 2) (10 = 3), gen(fsize_4cat)
label define fsize_4cat 0 "[0] LT 20" 1 "[1] GE 20 LT 200" 2 "[2] GE 200 LT 2000" 3 "[3] GE 2000"
label values fsize_4cat fsize_4cat
label variable fsize "firm size, 4 categories"
ta fsize_4cat, gen(fsize)
drop fsize
	
// clean variable: LM experience
label variable lmexp_ft "labor market experience full-time"
gen lmexp_ft_sq = lmexp_ft*lmexp_ft
	
// clean variable: age
label variable age "age of respondent"
gen age_sq = age*age

// generate variable: industry
recode industry (3 = 2), gen(ind_short)
drop industry
ta ind_short, gen(indu)	
		
// clean variable: living in East Germany
ta east,m
recode east (1=0) (2=1)
label define east 0 "[0] living in old West Germany" 1 "[1] living in old East Germany"
label values east east
label variable east "living in Eastern Germany"
ta east, gen(east)
	
// clean variable: childcare
label var childcare "hours childcare on typical workday"
	
// clean variable: housework
label var housework "hours housework on typical workday"

// generate variable: year dyads
recode year (1992 1993 = 0) (1994 1995 = 1) (1996 1997 = 2) (1998 1999 = 3) (2000 2001 = 4) ///
	(2002 2003 = 5) (2004 2005 = 6) (2006 2007 = 7) (2008 2009 = 8) ///
	(2010 2011 = 9) (2012 2013 = 10) (2014 2015 = 11), gen(year_dyad)
label define year_dyad 0 "1992/1993" 1 "1994/1995" 2 "1996/1997" 3 "1998/1999" ///
	 4 "2000/2001" 5 "2002/2003" 6 "2004/2005" 7 "2006/2007" 8 "2008/2009" ///
	  9 "2010/2011" 10 "2012/2013" 11 "2014/2015"
label values year_dyad year_dyad
	
save "input/aux/soep_2.dta", replace  // we can run analyses for women and men using this file



// keep only women
use "input/aux/soep_2.dta", clear	
keep if male == 0
save "input/aux/soep_3.dta", replace
	


// add occupational data from Employment Surveys
use "input/aux/soep_3.dta", clear

	* adjust Kldb_92 to the merged format
	gen occ_92_3d = int(occ/10)
	label var occ_92_3d "occ. by KldB92 3-digit"
	
	* merge to create clusters with enough incumbents (starting new codes from 1000)
	gen occ_92_3d_m = occ_92_3d
	replace occ_92_3d_m =1007 if occ_92_3d==12
	replace occ_92_3d_m =1007 if occ_92_3d==13
	replace occ_92_3d_m =1007 if occ_92_3d==14
	replace occ_92_3d_m =1007 if occ_92_3d==31
	replace occ_92_3d_m =1007 if occ_92_3d==32
	replace occ_92_3d_m =1008 if occ_92_3d==61
	replace occ_92_3d_m =1000 if occ_92_3d==70
	replace occ_92_3d_m =1000 if occ_92_3d==71
	replace occ_92_3d_m =1000 if occ_92_3d==72
	replace occ_92_3d_m =1000 if occ_92_3d==80
	replace occ_92_3d_m =1001 if occ_92_3d==101
	replace occ_92_3d_m =1001 if occ_92_3d==112
	replace occ_92_3d_m =1002 if occ_92_3d==131
	replace occ_92_3d_m =1002 if occ_92_3d==135
	replace occ_92_3d_m =1003 if occ_92_3d==142
	replace occ_92_3d_m =1003 if occ_92_3d==145
	replace occ_92_3d_m =1004 if occ_92_3d==152
	replace occ_92_3d_m =1004 if occ_92_3d==153
	replace occ_92_3d_m =1005 if occ_92_3d==161
	replace occ_92_3d_m =1005 if occ_92_3d==162
	replace occ_92_3d_m =1005 if occ_92_3d==164
	replace occ_92_3d_m =1009 if occ_92_3d==172
	replace occ_92_3d_m =1009 if occ_92_3d==173
	replace occ_92_3d_m =1009 if occ_92_3d==175
	replace occ_92_3d_m =1009 if occ_92_3d==176
	replace occ_92_3d_m =1006 if occ_92_3d==181
	replace occ_92_3d_m =1006 if occ_92_3d==185
	replace occ_92_3d_m =1010 if occ_92_3d==194
	replace occ_92_3d_m =1011 if occ_92_3d==211
	replace occ_92_3d_m =1011 if occ_92_3d==212
	replace occ_92_3d_m =1011 if occ_92_3d==213
	replace occ_92_3d_m =1012 if occ_92_3d==220
	replace occ_92_3d_m =1012 if occ_92_3d==224
	replace occ_92_3d_m =1012 if occ_92_3d==229
	replace occ_92_3d_m =1013 if occ_92_3d==231
	replace occ_92_3d_m =1013 if occ_92_3d==233
	replace occ_92_3d_m =1013 if occ_92_3d==234
	replace occ_92_3d_m =1013 if occ_92_3d==235
	replace occ_92_3d_m =1014 if occ_92_3d==245
	replace occ_92_3d_m =1015 if occ_92_3d==250
	replace occ_92_3d_m =1015 if occ_92_3d==252
	replace occ_92_3d_m =1015 if occ_92_3d==256
	replace occ_92_3d_m =1015 if occ_92_3d==259
	replace occ_92_3d_m =1016 if occ_92_3d==261
	replace occ_92_3d_m =1016 if occ_92_3d==265
	replace occ_92_3d_m =1016 if occ_92_3d==266
	replace occ_92_3d_m =1016 if occ_92_3d==269
	replace occ_92_3d_m =1017 if occ_92_3d==270
	replace occ_92_3d_m =1017 if occ_92_3d==276
	replace occ_92_3d_m =1017 if occ_92_3d==278
	replace occ_92_3d_m =1018 if occ_92_3d==282
	replace occ_92_3d_m =1018 if occ_92_3d==287
	replace occ_92_3d_m =1019 if occ_92_3d==290
	replace occ_92_3d_m =1019 if occ_92_3d==292
	replace occ_92_3d_m =1019 if occ_92_3d==293
	replace occ_92_3d_m =1019 if occ_92_3d==294
	replace occ_92_3d_m =1019 if occ_92_3d==295
	replace occ_92_3d_m =1020 if occ_92_3d==302
	replace occ_92_3d_m =1020 if occ_92_3d==305
	replace occ_92_3d_m =1020 if occ_92_3d==307
	replace occ_92_3d_m =1020 if occ_92_3d==308
	replace occ_92_3d_m =1020 if occ_92_3d==309
	replace occ_92_3d_m =1021 if occ_92_3d==315
	replace occ_92_3d_m =1022 if occ_92_3d==321
	replace occ_92_3d_m =1023 if occ_92_3d==331
	replace occ_92_3d_m =1023 if occ_92_3d==332
	replace occ_92_3d_m =1023 if occ_92_3d==341
	replace occ_92_3d_m =1023 if occ_92_3d==344
	replace occ_92_3d_m =1023 if occ_92_3d==349
	replace occ_92_3d_m =1024 if occ_92_3d==352
	replace occ_92_3d_m =1024 if occ_92_3d==353
	replace occ_92_3d_m =1024 if occ_92_3d==354
	replace occ_92_3d_m =1024 if occ_92_3d==359
	replace occ_92_3d_m =1023 if occ_92_3d==361
	replace occ_92_3d_m =1025 if occ_92_3d==371
	replace occ_92_3d_m =1025 if occ_92_3d==372
	replace occ_92_3d_m =1025 if occ_92_3d==373
	replace occ_92_3d_m =1025 if occ_92_3d==374
	replace occ_92_3d_m =1025 if occ_92_3d==376
	replace occ_92_3d_m =1025 if occ_92_3d==378
	replace occ_92_3d_m =1026 if occ_92_3d==393
	replace occ_92_3d_m =1027 if occ_92_3d==421
	replace occ_92_3d_m =1027 if occ_92_3d==423
	replace occ_92_3d_m =1027 if occ_92_3d==424
	replace occ_92_3d_m =1028 if occ_92_3d==431
	replace occ_92_3d_m =1029 if occ_92_3d==440
	replace occ_92_3d_m =1029 if occ_92_3d==443
	replace occ_92_3d_m =1030 if occ_92_3d==460
	replace occ_92_3d_m =1030 if occ_92_3d==463
	replace occ_92_3d_m =1030 if occ_92_3d==465
	replace occ_92_3d_m =1030 if occ_92_3d==466
	replace occ_92_3d_m =1031 if occ_92_3d==471
	replace occ_92_3d_m =1031 if occ_92_3d==472
	replace occ_92_3d_m =1032 if occ_92_3d==480
	replace occ_92_3d_m =1032 if occ_92_3d==481
	replace occ_92_3d_m =1032 if occ_92_3d==484
	replace occ_92_3d_m =1032 if occ_92_3d==485
	replace occ_92_3d_m =1032 if occ_92_3d==486
	replace occ_92_3d_m =1033 if occ_92_3d==492
	replace occ_92_3d_m =1034 if occ_92_3d==502
	replace occ_92_3d_m =1034 if occ_92_3d==505
	replace occ_92_3d_m =1034 if occ_92_3d==506
	replace occ_92_3d_m =1035 if occ_92_3d==510
	replace occ_92_3d_m =1035 if occ_92_3d==514
	replace occ_92_3d_m =1036 if occ_92_3d==523
	replace occ_92_3d_m =1037 if occ_92_3d==540
	replace occ_92_3d_m =1037 if occ_92_3d==541
	replace occ_92_3d_m =1038 if occ_92_3d==544
	replace occ_92_3d_m =1038 if occ_92_3d==545
	replace occ_92_3d_m =1039 if occ_92_3d==604
	replace occ_92_3d_m =1039 if occ_92_3d==605
	replace occ_92_3d_m =1039 if occ_92_3d==608
	replace occ_92_3d_m =1039 if occ_92_3d==609
	replace occ_92_3d_m =1040 if occ_92_3d==625
	replace occ_92_3d_m =1041 if occ_92_3d==632
	replace occ_92_3d_m =1041 if occ_92_3d==634
	replace occ_92_3d_m =1042 if occ_92_3d==663
	replace occ_92_3d_m =1043 if occ_92_3d==673
	replace occ_92_3d_m =1043 if occ_92_3d==674
	replace occ_92_3d_m =1043 if occ_92_3d==675
	replace occ_92_3d_m =1044 if occ_92_3d==685
	replace occ_92_3d_m =1044 if occ_92_3d==686
	replace occ_92_3d_m =1045 if occ_92_3d==692
	replace occ_92_3d_m =1046 if occ_92_3d==706
	replace occ_92_3d_m =1047 if occ_92_3d==716
	replace occ_92_3d_m =1048 if occ_92_3d==731
	replace occ_92_3d_m =1049 if occ_92_3d==743
	replace occ_92_3d_m =1050 if occ_92_3d==754
	replace occ_92_3d_m =1051 if occ_92_3d==755
	replace occ_92_3d_m =1051 if occ_92_3d==756
	replace occ_92_3d_m =1052 if occ_92_3d==761
	replace occ_92_3d_m =1053 if occ_92_3d==765
	replace occ_92_3d_m =1054 if occ_92_3d==783
	replace occ_92_3d_m =1055 if occ_92_3d==793
	replace occ_92_3d_m =1056 if occ_92_3d==794
	replace occ_92_3d_m =1057 if occ_92_3d==795
	replace occ_92_3d_m =1058 if occ_92_3d==812
	replace occ_92_3d_m =1059 if occ_92_3d==834
	replace occ_92_3d_m =1060 if occ_92_3d==838
	replace occ_92_3d_m =1061 if occ_92_3d==839
	replace occ_92_3d_m =1062 if occ_92_3d==843
	replace occ_92_3d_m =1063 if occ_92_3d==851
	replace occ_92_3d_m =1063 if occ_92_3d==855
	replace occ_92_3d_m =1064 if occ_92_3d==858
	replace occ_92_3d_m =1065 if occ_92_3d==862
	replace occ_92_3d_m =1065 if occ_92_3d==866
	replace occ_92_3d_m =1065 if occ_92_3d==869
	replace occ_92_3d_m =1066 if occ_92_3d==870
	replace occ_92_3d_m =1066 if occ_92_3d==878
	replace occ_92_3d_m =1067 if occ_92_3d==880
	replace occ_92_3d_m =1067 if occ_92_3d==884
	replace occ_92_3d_m =1067 if occ_92_3d==887
	replace occ_92_3d_m =1068 if occ_92_3d==894
	replace occ_92_3d_m =1069 if occ_92_3d==936
	replace occ_92_3d_m =1069 if occ_92_3d==937
	replace occ_92_3d_m =1007 if occ_92_3d==11
	replace occ_92_3d_m =1008 if occ_92_3d==62
	replace occ_92_3d_m =1009 if occ_92_3d==174
	replace occ_92_3d_m =1010 if occ_92_3d==191
	replace occ_92_3d_m =1014 if occ_92_3d==241
	replace occ_92_3d_m =1017 if occ_92_3d==274
	replace occ_92_3d_m =1021 if occ_92_3d==317
	replace occ_92_3d_m =1022 if occ_92_3d==322
	replace occ_92_3d_m =1023 if occ_92_3d==358
	replace occ_92_3d_m =1024 if occ_92_3d==351
	replace occ_92_3d_m =1026 if occ_92_3d==392
	replace occ_92_3d_m =1028 if occ_92_3d==435
	replace occ_92_3d_m =1033 if occ_92_3d==491
	replace occ_92_3d_m =1036 if occ_92_3d==522
	replace occ_92_3d_m =1040 if occ_92_3d==623
	replace occ_92_3d_m =1041 if occ_92_3d==633
	replace occ_92_3d_m =1042 if occ_92_3d==662
	replace occ_92_3d_m =1045 if occ_92_3d==691
	replace occ_92_3d_m =1046 if occ_92_3d==705
	replace occ_92_3d_m =1047 if occ_92_3d==715
	replace occ_92_3d_m =1048 if occ_92_3d==732
	replace occ_92_3d_m =1049 if occ_92_3d==744
	replace occ_92_3d_m =1050 if occ_92_3d==753
	replace occ_92_3d_m =1051 if occ_92_3d==751
	replace occ_92_3d_m =1052 if occ_92_3d==763
	replace occ_92_3d_m =1053 if occ_92_3d==764
	replace occ_92_3d_m =1054 if occ_92_3d==784
	replace occ_92_3d_m =1055 if occ_92_3d==792
	replace occ_92_3d_m =1056 if occ_92_3d==915
	replace occ_92_3d_m =1057 if occ_92_3d==876
	replace occ_92_3d_m =1058 if occ_92_3d==813
	replace occ_92_3d_m =1059 if occ_92_3d==833
	replace occ_92_3d_m =1060 if occ_92_3d==832
	replace occ_92_3d_m =1061 if occ_92_3d==837
	replace occ_92_3d_m =1062 if occ_92_3d==841
	replace occ_92_3d_m =1064 if occ_92_3d==857
	replace occ_92_3d_m =1065 if occ_92_3d==861
	replace occ_92_3d_m =1066 if occ_92_3d==879
	replace occ_92_3d_m =1067 if occ_92_3d==881
	replace occ_92_3d_m =1068 if occ_92_3d==891
	label var occ_92_3d_m "occ. classification KldB92, merged small cells"	
	
	* merge
	merge m:1 occ_92_3d_m using "input/aux/etb_averages.dta"	
	ta occ_92_3d_m if _merge == 2 // 8 occs from using not merged, all merged from master
	drop if _merge == 2
	drop _merge
	
save "input/aux/master.dta", replace
