// Generates datasets for analysis.
// Requires SOEP v32.1 and previously constructed aux datasets.


// Load data from different sources
do "scripts/utils/prep_soep_load_data.do"


// Generate occupational gender type variable
do "scripts/utils/prep_soep_ratios.do"


// Generate variables & clean data (prep for analysis)
do "scripts/utils/prep_soep_gen_vars_clean.do"
