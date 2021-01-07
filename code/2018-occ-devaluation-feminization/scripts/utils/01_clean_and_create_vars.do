// This do-file drops data from the sample and constructs required variables.
// The modified data set is stored as "master_1_01.dta".


// Drop data we do not need (sample selection)

	* Keep relevant years
	keep if year==1960 | year==1970 | year==1980 | year==1990 | year==2000 | year==2010
	
	* Keep if at work or unemployed
	keep if empstatd==10 | empstatd==20
	
	* Drop if no occ information
	drop if occ1990==991 | occ1990==999 | occ1990==905  // Unemployed , Unknown , Military
	
	* Drop if wage income is zero
	drop if incwage==0  // => approx. 21 mio. observations remaining
	
	
// Variable creation before dropping unemployed

	* New variable: aggregate industry clusters
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
	drop ind1990
	
	* New variable: observations counts
	// Note: Needed to generate var for relative size of groups
	bysort year occ1990 ind1990 empstatd: gen count_all = _N
	label var count_all "total n of people in group by year occ1990 ind1990 empstatd"
	
	* New variable: count of unemployed per cluster
	gen count_ue_1 = count_all if empstatd == 20
	bysort year occ1990 ind1990: egen count_ue=max(count_ue_1)
	label var count_ue "count of unemployed observed per year, occ1990, ind1990"
	drop count_ue_1
	
	* New variable: percent Female
	bysort year occ1990 ind1990_agg empstatd: egen percent_f=mean(sex-1)
	
	
// Further sample selection

	* Keep working age population 25-65
	keep if age>=25 & age <=65

	* Drop unemployed
	drop if empstatd == 20
	
	
// Variable creation after cutting sample

	* New variable: continuous work hours per week
	// Note: this step includes harmonization of data over waves
	gen hours=.
	replace hours=7.5 if hrswork2==1 & year<1980
	replace hours=22 if hrswork2==2 & year<1980
	replace hours=32 if hrswork2==3 & year<1980
	replace hours=37 if hrswork2==4 & year<1980
	replace hours=40 if hrswork2==5 & year<1980
	replace hours=44.5 if hrswork2==6 & year<1980
	replace hours=54 if hrswork2==7 & year<1980
	replace hours=60 if hrswork2==8 & year<1980
	replace hours=uhrswork if year>=1980
	drop if hours == 0
	
	* New variable: continuous weeks
	drop if wkswork2==0 // weeks worked unknown
	gen weeks=.
	replace weeks=wkswork1 if wkswork1!=.
	replace weeks=7 if wkswork2==1 & weeks==.
	replace weeks=20 if wkswork2==2 & weeks==.
	replace weeks=33. if wkswork2==3 & weeks==.
	replace weeks=43.5 if wkswork2==4 & weeks==.
	replace weeks=48.5 if wkswork2==5 & weeks==.
	replace weeks=51 if wkswork2==6 & weeks==.
	
	* New variable: real wage (income per hour)
	gen hours_ann = weeks*hours  // hours per annum
	gen wage_h = incwage / hours_ann
	label var wage_h "hourly wage in previous year"
	gen rwage_h = wage_h*cpi99
	label var rwage_h "real hourly wage in previous year"	
	
	* New variable: continuous years in education
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
	
	* New variable: potential labor market experience
	gen lmexp=age-eduyear-6
	
	* New variable: race
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
	drop race_2 hispan
	
	* New variable: marital status
	gen mar=1 if marst==1
	replace mar=0 if mar==.
	label var mar "married"
	label define mar 0 "(0) Other" 1 "(1) Married"
	label values mar mar
	drop marst
	
	* New variable: private vs. public sector
	gen public=.
	label define public 0 "(0) private" 1 "(1) public",modify
	label values public public
	replace public=0 if classwkrd==22 | classwkrd==23
	replace public=1 if classwkrd>=24 & classwkrd<=28
	ta public classwkrd,m
	drop if public==.  // also drops self-employed
	
	
// Restrict to required variables & store to disk
keep year perwt nchlt5 sex age occ1990 ind1990 hours rwage_h eduyear lmexp race mar public count_all count_ue percent_f
save "input/master_1_01.dta",replace  // has about 15.6 mio. observations
	
