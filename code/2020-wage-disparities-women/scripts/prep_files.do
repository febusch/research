// Run to prepare all files for analysis
//
// Before running: 
// 		- include "SOEP-LONG_v32.1_stata_bilingual" in folder "input"
//		- include "ZA2565_1992" in folder "input"
//		- include "ZA3379_1999" in folder "input"
//		- include "ZA4820_2006" in folder "input"
//		- include "ZA5657_2012" in folder "input"
//		- provide working directory in line 17


clear

// WORKING DIRECTORY MUST BE PROVIDED
// The scripts are optimized to be run from paper directory ".../.../2020-wage-disparities-women".
// If you choose another directory, you might have to correct relative paths in all other scripts.
cd "/Users/felixbusch/Documents/06_Studium/09_Open_source/research/code/2020-wage-disparities-women"  


// Process Employment Surveys data
// Generate task and routine variables that will be merged with SOEP data
do "scripts/utils/prep_etb.do"  


// Process SOEP data
// Generate final datasets for analysis
do "scripts/utils/prep_soep.do"
