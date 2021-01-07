// Run to prepare all files for analysis
//
// Before running:
// 		- include folder "master_1_00.dta" in folder "input"
//		- provide working directory in line XX


clear

// WORKING DIRECTORY MUST BE PROVIDED
// The scripts are optimized to be run from paper directory ".../.../2018-occ-devaluation-feminization".
// If you choose another directory, you might have to correct relative paths in all other scripts.
cd "PLEASE_PROVIDE/2018-occ-devaluation-feminization"


// Clean data set and create required variables
use "input/master_1_00.dta"
do "scripts/utils/01_clean_and_create_vars.do"


// Collapse data and prepare for analysis
use "input/master_1_01.dta", clear
do "scripts/utils/02_collapse.do"
