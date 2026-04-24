// Generates occupation-level variables that will be merged with the ACS data.
// Requires O*NET data from wave 15.1 placed in folder /input by author.
//
// The data preparation is implemented in three steps:
// 1. Extraction of 5 principal components from O*NET's skills data
// 2. Extraction of first principal component from 12 variables of O*NET's work context data
// 3. Translation from O*NET-SOC (originally used in O*NET) to OCC2010 (used in ACS 2019)
//
// After preparing the data, they can be merged with the ACS 2019 data set via the shared OCC2010 variable.



**********
* Skills *
**********
import delimited using "input/wave15_1_skills.csv", varnames(1) encoding(utf-8) delimiters(";") clear

*** prep var names ***
// This is done to prepare the rotation of the data (see next step)
gen var_name = ""
replace var_name = "read" if element_name == "Reading Comprehension"
replace var_name = "listen" if element_name == "Active Listening"
replace var_name = "write" if element_name == "Writing"
replace var_name = "speak" if element_name == "Speaking"
replace var_name = "math" if element_name == "Mathematics"
replace var_name = "science" if element_name == "Science"
replace var_name = "crit_think" if element_name == "Critical Thinking"
replace var_name = "act_learn" if element_name == "Active Learning"
replace var_name = "learn_strat" if element_name == "Learning Strategies"
replace var_name = "monitor" if element_name == "Monitoring"
replace var_name = "soc_percept" if element_name == "Social Perceptiveness"
replace var_name = "coord" if element_name == "Coordination"
replace var_name = "persuas" if element_name == "Persuasion"
replace var_name = "negot" if element_name == "Negotiation"
replace var_name = "instruct" if element_name == "Instructing"
replace var_name = "service" if element_name == "Service Orientation"
replace var_name = "complex_prob" if element_name == "Complex Problem Solving"
replace var_name = "oper_analys" if element_name == "Operations Analysis"
replace var_name = "techn_design" if element_name == "Technology Design"
replace var_name = "equip_select" if element_name == "Equipment Selection"
replace var_name = "install" if element_name == "Installation"
replace var_name = "programm" if element_name == "Programming"
replace var_name = "oper_monitor" if element_name == "Operation Monitoring"
replace var_name = "oper_control" if element_name == "Operation and Control"
replace var_name = "equip_maint" if element_name == "Equipment Maintenance"
replace var_name = "trouble" if element_name == "Troubleshooting"
replace var_name = "repair" if element_name == "Repairing"
replace var_name = "qual_control" if element_name == "Quality Control Analysis"
replace var_name = "judg_decision" if element_name == "Judgment and Decision Making"
replace var_name = "sys_analy" if element_name == "Systems Analysis"
replace var_name = "sys_eval" if element_name == "Systems Evaluation"
replace var_name = "manag_time" if element_name == "Time Management"
replace var_name = "manag_fin" if element_name == "Management of Financial Resources"
replace var_name = "manag_material" if element_name == "Management of Material Resources"
replace var_name = "manag_person" if element_name == "Management of Personnel Resources"

*** reshape ***
// Here, we rotate the data from long to wide format.
// After this step, we have 1 row per observed occupation with 35 skill variables each.
drop element_* date source
reshape wide value@, i(onet_soc_2010) j(var_name) string

*** rename ***
// This makes the variable names more readable.
foreach var of varlist valueact_learn - valuewrite {
	local old_name = "`var'"
	di "`old_name'"
	local new_name = substr("`old_name'", 6, .)
	di "`new_name'"
	ren `var' `new_name'
}

*** set order according to ONET element groups
order onet_soc_2010 read listen write speak math science crit_think act_learn learn_strat monitor soc_percept coord persuas negot instruct service complex_prob oper_analys techn_design equip_select install programm oper_monitor oper_control equip_maint trouble repair qual_control judg_decis sys_analy sys_eval manag_time manag_fin manag_mate manag_person

*** PCA ***
// In this step, we run the principal components analysis and extract 5 components.
// Ex ante, it is unclear how many components one should extract. The exact number should be determined on the basis
// of empirical and theoretical considerations. We relied on multiple empirical guidelines/indicators in our case.
// While these indicators suggested that we should focus on either 4 or 5 components, we went with 5 components
// based on an inspection of the results with either number of components.
	
// Compute factor scores
// After this step, we have 5 new variables in the dataset, representing our skill scores
pca read - manag_person, components(5)
rotate, promax(5)
predict analytic mechanical interpersonal management hightech, score  
	
// Standardize scores
// The original scale of the extracted skill variables is difficult to interpret.
// Hence, we standardize each variable around their means. As a result, each
// unit is 1 standard deviation, and the means are all zero.
egen analytic_std = std(analytic)
egen mechanical_std = std(mechanical)
egen interpersonal_std = std(interpersonal)
egen management_std = std(management)
egen hightech_std = std(hightech)


*** store intermediate result ***
save "input/aux/onet_skills.dta", replace



****************************
* Physical hazard / strain *
****************************
// In this section, we repeat the previous steps, but with O*NET's work context data.
// The process is identical with what we do above, only that we extract 2 components here.
// We eperimented with both components, but in our final chapter, we only included the first
// components which we interpret as indicator for phsycial strain or hazard.
import delimited using "input/wave15_1_context.csv", varnames(1) encoding(utf-8) delimiters(";") clear

*** prep var names ***
gen var_name = ""
replace var_name = "noise" if element_name == "Sounds, Noise Levels Are Distracting or Uncomfortable"
replace var_name = "temp" if element_name == "Very Hot or Cold Temperatures"
replace var_name = "lighting" if element_name == "Extremely Bright or Inadequate Lighting"
replace var_name = "contam" if element_name == "Exposed to Contaminants"
replace var_name = "positions" if element_name == "Cramped Work Space, Awkward Positions"
replace var_name = "vibration" if element_name == "Exposed to Whole Body Vibration"
replace var_name = "high" if element_name == "Exposed to High Places"
replace var_name = "conditions" if element_name == "Exposed to Hazardous Conditions"
replace var_name = "equipment" if element_name == "Exposed to Hazardous Equipment"
replace var_name = "burns" if element_name == "Exposed to Minor Burns, Cuts, Bites, or Stings"
replace var_name = "radiation" if element_name == "Exposed to Radiation"
replace var_name = "infect" if element_name == "Exposed to Disease or Infections"

*** reshape ***
drop element_* date source
reshape wide value@, i(onet_soc_2010) j(var_name) string

*** rename ***
foreach var of varlist valueburns - valuevibration {
	local old_name = "`var'"
	di "`old_name'"
	local new_name = substr("`old_name'", 6, .)
	di "`new_name'"
	ren `var' `new_name'
}

*** PCA ***
pca burns - vibration, components(2)
rotate, promax(4)
predict compens_physical compens_medical, score
egen compens_physical_std = std(compens_physical)
egen compens_medical_std = std(compens_medical)

*** store results ***
save "input/aux/onet_hazard_strain.dta", replace



***************************************************
* Merge 3 datasets & translate into OCC2010 codes *
***************************************************
// Note that for "physical hazard / strain", we are missing 7 occupations.
// This is due to fewer observations in the O*NET work context module compared to its skills module.

*** merging ***
use "input/aux/onet_skills.dta", clear
keep onet_soc_2010 analytic_std mechanical_std interpersonal_std management_std hightech_std
merge 1:1 onet_soc_2010 using "input/aux/onet_hazard_strain.dta", keepusing(compens_physical_std)
drop _merge

*** translate to Census codes
// The ACS data includes a variable named OCC2010, which we use to identify the occupations in which individuals are employed.
// O*NET's wave 15.1 used its own occupational classification (called O*NET-SOC 2010), that we need to translate to the OCC2010 scheme.

// This translation is done in 3 steps:
// 1. ONET-SOC-2010 => SOC-2010: Done by cutting the last two digits of the ONET-SOC-2010 codes
// 2. SOC-2010 => Census-2010: Here, we rely on an official crosswalk by the U.S. Bureau of Labor Statistics, modified to fit our needs
// 3. Census-2010 => OCC2010: We rely on a crosswalk again, and we base it mainly on the ACS 2011 data where both, Census 2010 and OCC2010 values are included. Some 48 missing code were added manually.

// Finally, we collapse the data in order to have a single row per OCC2010 category. This step is necessary because our original occupation
// classification (ONET-SOC-2010) is much more detailed than the one in the ACS (OCC2010). In this final step, we use total employment per
// occupation as weights in order to reduce distortions when merging smaller with larger occupation groups.


// O*NET-SOC_2010 to SOC_2010
gen soc_2010 = substr(onet_soc_2010,1,7)
order soc_2010, after(onet_soc_2010)

// SOC_2010 to Census_2010
do "scripts/utils/xwalk_soc_2010_to_census_2010.do"

// Census_2010 to OCC2010
do "scripts/utils/xwalk_census_2010_to_occ2010.do"

// add weight for collapsing Census_2010 to OCC2010
do "scripts/utils/xwalk_census_2010_to_occ2010_weights.do"
	
*** collapse by OCC2010
// After this step, we have occupation-level data for 437 occupations.
// Note: there are 2 missing values in the variable compens_physical_std.
drop onet_soc_2010 soc_2010 census_2010
collapse (mean) analytic_std - compens_physical_std [pw=weight], by(OCC2010)
	
*** save
save "input/aux/onet_final.dta", replace  // This file can be merged with the ACS
