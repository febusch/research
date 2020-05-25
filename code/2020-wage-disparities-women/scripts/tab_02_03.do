// Run to replicate Tables 2 and 3
// Title table 2: "Summary components of change in wage gaps between male-typed and mixed/female-typed occupations, 1992-2015"
// Title table 3: "Detailed observed components of change in wage gaps between male-typed and mixed/female-typed occupations, 1992Ð2015"

// Requires -jmpierce2- by Ben Jann (DOI: 10.7892/boris.69426)


cd "PLEASE_PROVIDE/2020-wage-disparities-women"


* Prep
run "scripts/utils/jmp_per_period.do"
use "input/aux/master.dta", clear


* A: model (male vs. female)
	
	* run model
	jmp_per_period, versus(2) start(0) end(11) with_age
				
	* store results
	
		* number of rows 
		local n_vars = 12
		
		* copy key matrices
		mat DD = r(DD)
		mat E = r(E)
		mat U = r(U)
		
		* store head matrix
		mat head = DD[1,1..2]' \ E[`n_vars'+1,2..4]' \ U[1,1..4]'
		// row 1: total diff
		// row 2-5: explained total, Q, P, QP
		// row 6-9: unexplained total, Q, P, QP
		
		* store detail matrices
		mat det_q = E[1..`n_vars', 2]  // quantities
		mat det_p = E[1..`n_vars', 3]  // prices
		
		* full matrix
		mat A = head \ det_q \ det_p
		
		* add percent values
		// we list percent of total diff explained
		local n_rows_results = rowsof(A)  // number of rows
		mat percent = J(`n_rows_results',1,.)
		foreach row of numlist 2/`n_rows_results' {
			mat percent[`row',1] = A[`row',1] / A[1,1]
		}
		
		* full matrix update
		mat A = A , percent
		
		
* B: model (male vs. mixed)

	* run model
	jmp_per_period, versus(1) start(0) end(11) with_age
				
	* store results
	
		* number of rows 
		local n_vars = 12  // vars in detail()
		
		* copy key matrices
		mat DD = r(DD)
		mat E = r(E)
		mat U = r(U)
		
		* store head matrix
		mat head = DD[1,1..2]' \ E[`n_vars'+1,2..4]' \ U[1,1..4]'
		// row 1: total diff
		// row 2-5: explained total, Q, P, QP
		// row 6-9: unexplained total, Q, P, QP
		
		* store detail matrices
		mat det_q = E[1..`n_vars', 2]  // quantities
		mat det_p = E[1..`n_vars', 3]  // prices
		
		* full matrix
		mat B = head \ det_q \ det_p
		
		* add percent values
		// we list percent of total diff explained
		local n_rows_results = rowsof(B)  // number of rows
		mat percent = J(`n_rows_results',1,.)
		foreach row of numlist 2/`n_rows_results' {
			mat percent[`row',1] = B[`row',1] / B[1,1]
		}
		
		* full matrix update
		mat B = B , percent	
		

* join result matrices A + B & do some cleaning
mat result = A , B
local n_rows = rowsof(result)
local n_cols = colsof(result)
foreach row of numlist 1/`n_rows' {
	foreach col of numlist 1/`n_cols' {
		mat result[`row',`col'] = round(result[`row',`col'], 0.001)  // round
		if `col' == 2 | `col' == 4 {  // if percentage: convert to percent value
			mat result[`row',`col'] = round((result[`row',`col'] * 100), 0.1)
			if result[`row',`col'] < 0 {
				mat result[`row',`col'] = result[`row',`col'] * -1  // switch to positive sign if negative
			}
		}
	}
}


* output
estout matrix(result), style(tex)  // requires -estout- ; style can be changed
// Note: Rows D-QP are Table 2; remaining rows are Table 3
