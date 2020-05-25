// Run to replicate Table 5
// Title: "Marginal changes in hourly wage after occupational switch, by year-dyads, via fixed-effects regressions, 1992Ð2015"


cd "PLEASE_PROVIDE/2020-wage-disparities-women"


* load
use "input/aux/master.dta", clear

* prep
tsset pid year


* Model 1: empty

	* estimate model
	xtreg logwage_cap i.year_dyad##i.occ_gender, fe vce(robust)
	margins {occ_gender 1 -1 0}@year_dyad {occ_gender 1 0 -1}@year_dyad, contrast
	
	* store results
	local n_years = 12  // number of year-dyads
	local start_2 = `n_years' + 1
	mat results = r(table)
	mat bmix = results[1,1..`n_years']'  // betas male vs. mixed
	mat bfem = results[1,`start_2'...]'  // betas male vs. female
	mat pmix = results[4,1..`n_years']'  // p-values male vs. mixed
	mat pfem = results[4,`start_2'...]'  // p-values male vs. female
	mat model1 = bmix, bfem
	mat pvalues1 = pmix, pfem
	
	
* Model 2:  + individual characteristics
	
	* controls
	local edu_skills i.educatt3 c.lmexp_ft##c.lmexp_ft c.tenure
	local work_fam i.overwork1 i.kids5 c.housework c.childcare
	local sector i.ind_short i.fsize_4cat i.public
	local demo i.east i.partsta i.marsta c.age##c.age

	* model (+ ind. chars)
	xtreg logwage_cap i.year_dyad##i.occ_gender `edu_skills' `work_fam' `sector' `demo', fe vce(robust)
	margins {occ_gender 1 -1 0}@year_dyad {occ_gender 1 0 -1}@year_dyad, contrast	
	
	* store results
	local n_years = 12  // number of year-dyads
	local start_2 = `n_years' + 1
	mat results = r(table)
	mat bmix = results[1,1..`n_years']'  // betas male vs. mixed
	mat bfem = results[1,`start_2'...]'  // betas male vs. female
	mat pmix = results[4,1..`n_years']'  // p-values male vs. mixed
	mat pfem = results[4,`start_2'...]'  // p-values male vs. female
	mat model2 = bmix, bfem
	mat pvalues2 = pmix, pfem
	
	
* Model 3: + occ. tasks

	* controls
	local edu_skills i.educatt3 c.lmexp_ft##c.lmexp_ft c.tenure
	local work_fam i.overwork1 i.kids5 c.housework c.childcare
	local sector i.ind_short i.fsize_4cat i.public
	local demo i.east i.partsta i.marsta c.age##c.age
	local tasks c.verb c.quant c.analyt c.create c.comp c.manage c.care c.routine

	* model (+ tasks)
	xtreg logwage_cap i.year_dyad##i.occ_gender `edu_skills' `work_fam' `sector' `demo' `tasks', fe vce(robust)
	margins {occ_gender 1 -1 0}@year_dyad {occ_gender 1 0 -1}@year_dyad, contrast 

	* store results
	local n_years = 12  // number of year-dyads
	local start_2 = `n_years' + 1
	mat results = r(table)
	mat bmix = results[1,1..`n_years']'  // betas male vs. mixed
	mat bfem = results[1,`start_2'...]'  // betas male vs. female
	mat pmix = results[4,1..`n_years']'  // p-values male vs. mixed
	mat pfem = results[4,`start_2'...]'  // p-values male vs. female
	mat model3 = bmix, bfem
	mat pvalues3 = pmix, pfem
	
	
* Model 4: + occ. tasks * periods

	* controls
	local edu_skills i.educatt3 c.lmexp_ft##c.lmexp_ft c.tenure
	local work_fam i.overwork1 i.kids5 c.housework c.childcare
	local sector i.ind_short i.fsize_4cat i.public
	local demo i.east i.partsta i.marsta c.age##c.age
	local tasks c.verb c.quant c.analyt c.create c.comp c.manage c.care c.routine
	local task_years i.year_dyad#c.verb i.year_dyad#c.quant i.year_dyad#c.analyt i.year_dyad#c.create i.year_dyad#c.comp i.year_dyad#c.manage i.year_dyad#c.care i.year_dyad#c.routine

	* model (+ tasks)
	xtreg logwage_cap i.year_dyad##i.occ_gender  `edu_skills' `work_fam' `sector' `demo' `tasks' `task_years', fe vce(robust)
	margins {occ_gender 1 -1 0}@year_dyad {occ_gender 1 0 -1}@year_dyad, contrast 
			
	* store results
	local n_years = 12  // number of year-dyads
	local start_2 = `n_years' + 1
	mat results = r(table)
	mat bmix = results[1,1..`n_years']'  // betas male vs. mixed
	mat bfem = results[1,`start_2'...]'  // betas male vs. female
	mat pmix = results[4,1..`n_years']'  // p-values male vs. mixed
	mat pfem = results[4,`start_2'...]'  // p-values male vs. female
	mat model4 = bmix, bfem
	mat pvalues4 = pmix, pfem
	
	
* print results for all models

	* construct matrix for betas
	mat b = model1, model2 \ model3, model4
	mat p = pvalues1, pvalues2 \ pvalues3, pvalues4
	
	* print
	estout matrix(b), style(tex)  // requires -estout- ; style can be changed
	local path "output/results_FE_betas.txt"
	estout matrix(b) using `path', style(tex)
	local path "output/results_FE_pvalues.txt"
	estout matrix(p) using `path', style(tex)  // these are p-values
