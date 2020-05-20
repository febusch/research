// Fetches variables from different SOEP sources & provides dataset for further processing.
// Requires SOEP v32.1.

* pgen variables
use "input/SOEP-LONG_v32.1_stata_bilingual/pgen.dta", clear
keep pid syear pgkldb92 pglabgro pgtatzeit pgvebzeit pguebstd pgexpft pgexppt pgoeffd pgerwzeit pgbetr pgpartz pgfamstd pgcasmin pgemplst pgstib
ren pgkldb92 occ 
ren pglabgro wage_gross 
ren pgtatzeit whour_real
ren pgvebzeit whour_deal
ren pguebstd whour_over
ren pgexpft lmexp_ft
ren pgexppt lmexp_pt
ren pgoeffd public
ren pgerwzeit tenure
ren pgbetr fsize
ren pgpartz partsta
ren pgfamstd marsta
ren pgcasmin educatt
ren pgemplst employ
ren pgstib jobpos
	
* pequiv variables
merge 1:1 pid syear using "input/SOEP-LONG_v32.1_stata_bilingual/pequiv.dta", keepusing(y11101 d11101 e11106 h11103 h11104 l11102) nogenerate
ren y11101 cpi
ren d11101 age
ren e11106 industry
ren h11103 kids2
ren h11104 kids24
ren l11102 east
	
* ppfad variables (gender, sample category, cross-sectional weight)
merge 1:1 pid syear using "input/SOEP-LONG_v32.1_stata_bilingual/ppfadl.dta", keepusing(sex psample phrf) nogenerate
ren phrf weight
	
* p variables
merge 1:1 pid syear using "input/SOEP-LONG_v32.1_stata_bilingual/pl.dta", keepusing(pli0040 pli0041 pli0043 pli0044 pli0045 plb0195) nogenerate
ren pli0040 errands
ren pli0043 housework
ren pli0044 childcare
ren plb0195 overtime_comp // type of compensation for overtime [available 1992-2014, 2015 not available] [combine with whour_over]
	
ren syear year

save "input/aux/soep_1.dta", replace
