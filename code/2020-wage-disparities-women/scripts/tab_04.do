// Run to replicate Table 4
// Title: "Components of change in wage gaps between male-typed and mixed/female-typed occupations, 1992Ð1999, 1999Ð2007, 2007Ð2015"


// Requires -jmpierce2- by Ben Jann (DOI: 10.7892/boris.69426)


cd "PLEASE_PROVIDE/2020-wage-disparities-women"


* Prep
run "scripts/utils/jmp_per_period.do"
use "input/aux/master.dta", clear

* decompositions
jmp_per_period, versus(2) start(0) end(3) with_age	// period 1, male vs. female occs

	* copy key matrices
	mat DD = r(DD)
	mat E = r(E)
	mat U = r(U)
	
	* store results in vector
	mat fem1 = DD[1,1] \ E[1..12,2] \ E[1..12,3] \ U[1,2] \ U[1,3]


jmp_per_period, versus(2) start(3) end(7) with_age	// period 2, male vs. female occs

	* copy key matrices
	mat DD = r(DD)
	mat E = r(E)
	mat U = r(U)
	
	* store results in vector
	mat fem2 = DD[1,1] \ E[1..12,2] \ E[1..12,3] \ U[1,2] \ U[1,3]

jmp_per_period, versus(2) start(7) end(11) with_age	// period 3, male vs. female occs

	* copy key matrices
	mat DD = r(DD)
	mat E = r(E)
	mat U = r(U)
	
	* store results in vector
	mat fem3 = DD[1,1] \ E[1..12,2] \ E[1..12,3] \ U[1,2] \ U[1,3]
	
jmp_per_period, versus(1) start(0) end(3) with_age	// period 1, male vs. mixed occs

	* copy key matrices
	mat DD = r(DD)
	mat E = r(E)
	mat U = r(U)
	
	* store results in vector
	mat mix1 = DD[1,1] \ E[1..12,2] \ E[1..12,3] \ U[1,2] \ U[1,3]
	
jmp_per_period, versus(1) start(3) end(7) with_age	// period 2, male vs. mixed occs

	* copy key matrices
	mat DD = r(DD)
	mat E = r(E)
	mat U = r(U)
	
	* store results in vector
	mat mix2 = DD[1,1] \ E[1..12,2] \ E[1..12,3] \ U[1,2] \ U[1,3]

jmp_per_period, versus(1) start(7) end(11) with_age	// period 3, male vs. mixed occs

	* copy key matrices
	mat DD = r(DD)
	mat E = r(E)
	mat U = r(U)
	
	* store results in vector
	mat mix3 = DD[1,1] \ E[1..12,2] \ E[1..12,3] \ U[1,2] \ U[1,3]	
	
	
* finalize output
mat result = fem1, fem2, fem3, mix1, mix2, mix3
local n_rows = rowsof(result)
local n_cols = colsof(result)
foreach row of numlist 1/`n_rows' {
	foreach col of numlist 1/`n_cols' {
		mat result[`row',`col'] = round(result[`row',`col'], 0.001)  // round
	}
}

* print output
estout matrix(result), style(tex)  // requires -estout- ; style can be changed
