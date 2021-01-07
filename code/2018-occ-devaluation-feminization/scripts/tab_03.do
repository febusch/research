// Run to replicate Table 3
// Title: "Correlations of Percent F and Current/Subsequent Occupational Log Wages"
//
// Note: Working directory must be specified before running


// load data & prep
cd "PLEASE_PROVIDE/2018-occ-devaluation-feminization"
use "input/master_1_02.dta", clear


// re-format data
reshape wide wage-count_ue wageln-rel_size_ue, i(occ1990 ind1990_agg) j(year)


// Output
corr percent_f1960 percent_f1970 percent_f1980 percent_f1990 percent_f2000 percent_f2010 wageln1960 wageln1970 wageln1980 wageln1990 wageln2000 wageln2010
