// This do-file prepares aggregations on the occupation-industry level.
// It then collapses our data per occupation-industry cluster.
// The modified data set is stored as "master_1_02.dta".



// Drop cells with less than 20 obs's
bysort year occ1990 ind1990_agg sex: gen count=_N
drop if count<20  // 99,555 observations deleted


// Drop occ*ind*year cells where not both, male and female, are represented
gen count_m=count if sex==1
gen count_f=count if sex==2
bysort year occ1990 ind1990_agg: egen count_m_all=max(count_m)
bysort year occ1990 ind1990_agg: egen count_f_all=max(count_f)
gen check=1 if count_m_all!=. & count_f_all!=.
replace check=0 if check==.
drop if check==0  // 772,995 observations deleted
drop count-check


// New variables: gender-specific control variables

	* median wages by occ-year
	bysort year occ1990 ind1990_agg: egen wage_male=median(rwage_h) if sex==1
	bysort year occ1990 ind1990_agg: egen wage_fem=median(rwage_h) if sex==2
	
	* mean education
	bysort year occ1990 ind1990_agg: egen edu_male=mean(eduyear) if sex==1
	bysort year occ1990 ind1990_agg: egen edu_fem=mean(eduyear) if sex==2
	
	* lmexp
	bysort year occ1990 ind1990_agg: egen lmexp_male=mean(lmexp) if sex==1
	bysort year occ1990 ind1990_agg: egen lmexp_fem=mean(lmexp) if sex==2
	
	* public
	bysort year occ1990 ind1990_agg: egen public_male=mean(public) if sex==1
	bysort year occ1990 ind1990_agg: egen public_fem=mean(public) if sex==2
	
	* hours
	bysort year occ1990 ind1990_agg: egen hours_male=mean(hours) if sex==1
	bysort year occ1990 ind1990_agg: egen hours_fem=mean(hours) if sex==2
	
	* mar
	bysort year occ1990 ind1990_agg: egen mar_male=mean(mar) if sex==1
	bysort year occ1990 ind1990_agg: egen mar_fem=mean(mar) if sex==2		
	
	* nchlt5
	bysort year occ1990 ind1990_agg: egen nchlt5_male=mean(nchlt5) if sex==1
	bysort year occ1990 ind1990_agg: egen nchlt5_fem=mean(nchlt5) if sex==2
	
	
// New variables: binary race varibles
ta race, gen(race)
	
		
// Collapse data set
collapse (median) rwage_h (mean) nchlt5 public hours race1-race6 eduyear lmexp mar (max) wage_male-nchlt5_fem percent_f count_all count_ue, by(year occ1990 ind1990_agg)


// Drop occ*ind groups that are only available for 1 year
sort occ1990 ind1990_agg year
gen id=1 if occ1990!=occ1990[_n-1] | ind1990_agg!=ind1990_agg[_n-1]
replace id=sum(id)
bysort id: gen count=_N
label var count "count of observations for group"
drop if count==1
drop id count


// Re-scale & round percent variables
foreach var of varlist public race1-race6 mar public_male public_fem mar_male mar_fem percent_f {
		replace `var'=round(`var'*100,0.01)
		format %9.0g `var'
		}
	
foreach var of varlist rwage_h hours eduyear lmexp wage_male-lmexp_fem hours_male hours_fem nchlt5_male nchlt5_fem  {
	replace `var'=round(`var',0.01)
	}
	
	
// Re-label variables
ren rwage_h wage
label var wage "median hourly wage, constant 1999USD"
ren eduyear edu
label var edu "mean years in education"
label var lmexp "mean labour market experience in years"
label var mar "per cent married"
label var hours "mean working hours per week"
label var public "per cent in public sector"	
label var percent_f "share of women in occ*ind*year group"


// Generate variable: ln(wage)
gen wageln=ln(wage)
gen wage_m_ln=ln(wage_male)
gen wage_f_ln=ln(wage_fem)


// Generate variables: relative race ratios
gen black_w=race2/race1
label var black_w "black/white ratio"
gen nat_w=race3/race1
label var nat_w "native american/white ratio"
gen asia_w=race4/race1
label var asia_w "asian/white ratio"
gen hisp_w=race5/race1
label var hisp_w "hisp/white ratio"

		
// Generate variable: relative size of sector 
bysort year: egen count_lm_total = total(count_all)
sort occ1990 ind1990_agg year
gen rel_size = count_all / count_lm_total
replace rel_size = rel_size*100
label var rel_size "relative size of occ-ind sector of total employment in %"


// Generate variable: relatve size of industry
bysort year ind1990_agg: egen count_lm_ind = total(count_all)
sort occ1990 ind1990_agg year
gen rel_size_ind = count_lm_ind / count_lm_total * 100
label var rel_size_ind "relative size of industrial sector of total employment in %"


// Generate variable: relative size of unemployed
gen count_ue_zero = count_ue
replace count_ue_zero = 0 if count_ue_zero == .
gen rel_size_ue = count_ue_zero / count_all * 100
label var rel_size_ue "relative size of unemployed in occ-ind group in %"


// Generate variable: wage quintile group
bysort occ1990 ind1990_agg : egen wage_mean = mean(wage)
egen id = group(occ1990 ind1990_agg)
egen p20 = pctile(wage_mean) if id!=id[_n-1] , p(20)
egen p40 = pctile(wage_mean) if id!=id[_n-1] , p(40)
egen p60 = pctile(wage_mean) if id!=id[_n-1] , p(60)
egen p80 = pctile(wage_mean) if id!=id[_n-1] , p(80)
egen p20all = max(p20)
egen p40all = max(p40)
egen p60all = max(p60)
egen p80all = max(p80)
gen quint = .
replace quint = 1 if wage_mean <= p20all
replace quint = 2 if wage_mean > p20all & wage_mean <= p40all
replace quint = 3 if wage_mean > p40all & wage_mean <= p60all
replace quint = 4 if wage_mean > p60all & wage_mean <= p80all
replace quint = 5 if wage_mean > p80all
drop p20-p80all


// Store to disk
save "input/master_1_02.dta", replace  // has 5,720 observations
