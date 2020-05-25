// Run to provide program fpr JMP decompositions


capture program drop jmp_per_period
program jmp_per_period
	syntax , ///
		versus(integer) ///  				// 2 (male- vs. female-typed), 1 (male- vs. mixed-typed)
		start(integer) end(integer) ///  	// values from variable year_dyad (e.g. 0 for first dyad)
		[with_age ///  						// if age and age_2 are included in model
		with_uo ///							// if unpaid overtime and sqaured are included in model
		ols_output ///						// show OLS output
		end_2014]							// if end should not be year-dyad, but 2014 (required for robustness check)
		
	// checking parameters
	if (`versus' != 2 & `versus' != 1) {
		display as err "versus can only be 2 (vs. female type) or 1 (vs mixed type)"
		exit 198
	}
	if (`start'<0 | `end'<0 | `start'>11 | `end'>11)  {
		display as err "start or end must be >=0 and <=11"
		exit 198
	}
	
	// defining variable blocks
	
		* education & skills
		local edu casmin2 casmin3
		local exp lmexp_ft lmexp_ft_sq
		local tenure tenure
		
		* work & family
		local overwork overwork2
		local kids kids52
		local house housework childcare
		if "`with_uo'" == "with_uo" {
			local unpaid_over whour_over_nocomp whour_over_nocomp_sq
		}		
		
		* work sector
		local indu indu2 indu3 indu4 indu5 indu6 indu7 indu8
		local fsize fsize2 fsize3 fsize4
		local public public2

		* demographics	
		local east east2
		local fam_status partsta2 marsta2
		if "`with_age'" == "with_age" {
			local age age age_sq
		}
		
	// prep OLS running modes
	
		* ols output
		local command "qui reg"
		if "`ols_output'" == "ols_output" {
			local command "reg"
		}
		
		* end condition
		local end_condition "year_dyad == `end'"
		if "`end_2014'" == "end_2014" {
			local end_condition "year == 2014"
		}
	
	// running regressions
	`command' logwage_cap `edu' `exp' `tenure' `overwork' `kids' `house' `indu' `fsize' `public' `east' `fam_status' `age' `unpaid_over' [pw=weight] if year_dyad == `start' & occ_gender == 0
	est store male1
	`command' logwage_cap `edu' `exp' `tenure' `overwork' `kids' `house' `indu' `fsize' `public' `east' `fam_status' `age' `unpaid_over' [pw=weight] if year_dyad == `start' & occ_gender == `versus'
	est store versus1
	`command' logwage_cap `edu' `exp' `tenure' `overwork' `kids' `house' `indu' `fsize' `public' `east' `fam_status' `age' `unpaid_over' [pw=weight] if `end_condition' & occ_gender == 0
	est store male2
	`command' logwage_cap `edu' `exp' `tenure' `overwork' `kids' `house' `indu' `fsize' `public' `east' `fam_status' `age' `unpaid_over' [pw=weight] if `end_condition' & occ_gender == `versus'
	est store versus2	
	
	// prep JMP running modes
	
		* with age
		local age_component ""
		if "`with_age'" == "with_age" {
			local age_component ", age =  `age'"
		}
		
		* with unpaid overtime
		local uo_component ""
		if "`with_uo'" == "with_uo" {
			local uo_component ", unpaid_over =  `unpaid_over'"
		}
	
	// running JMP decomposition
	jmpierce2 male1 versus1 male2 versus2, ///
		detail( ///
				edu = `edu' casmin1 , ///
				lmxp = `exp' , ///
				tenure = `tenure' , ///
				overwork = `overwork' overwork1 , ///
				kids = `kids' kids51 , ///
				house = `house' , ///
				indu = `indu' indu1 , ///
				fsize = `fsize' fsize1 , ///
				public = `public' public1, ///
				east = `east' east1 , ///
				fam_status = `fam_status' partsta1 marsta1 `age_component' `uo_component')

end
