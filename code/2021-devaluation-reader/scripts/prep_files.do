// Run to prepare all files for analysis
//
// Before running: 
// 		- include file "acs_2019.dta" in folder "input"
//		- provide working directory in line 13


clear

// WORKING DIRECTORY MUST BE PROVIDED
// The scripts are optimized to be run from paper directory ".../.../2021-devaluation-reader".
// If you choose another directory, you might have to correct relative paths in all other scripts.
cd "PLEASE_PROVIDE/2021-devaluation-reader"


// Process O*NET data
// Generate occupation-level data that will be merged with ACS data
do "scripts/utils/prep_onet.do"  


// Process ACS data
// Generate final datasets for analysis
do "scripts/utils/prep_acs.do"
