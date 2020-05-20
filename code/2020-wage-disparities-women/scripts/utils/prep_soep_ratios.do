* load
use "input/aux/soep_1.dta", clear

* dropping
ta employ, m
keep if employ >=1 & employ <= 4 //note: we are keeping those in apprenticeships in this step
keep if year >= 1992 & year <= 2015

* clean occupation var
drop if occ == .
drop if occ == -1 | occ == -2 // if no occ observed
drop if occ >= 9710 // groups with unclear functions / residual groups
drop if occ >= 7210 & occ <= 7248 // boat and nautic personnel (no occ data available and few obs's)	

* create matrices with names and frequencies
tab occ, matcell(occ_freqs) matrow(occ_names)
local mat_len = rowsof(occ_freqs) // length of matrix
mat A = J(`mat_len',2,.)
forv i=1/`mat_len' {
	mat A[`i',1] = occ_names[`i',1]
	mat A[`i',2] = occ_freqs[`i',1]
}
clear
svmat A
ren A1 occ
ren A2 freqs
sum freqs, d

* sort into frequency groups
label define freq_group 0 "[0] below 10" 1 "[1] 10 to 19" 2 "[2] 20 to 29" 3 "[3] 30 to 49" 4 "[4] 50 to 99" 5 "[5] 100 and above"
gen freq_group = .
replace freq_group = 0 if freqs < 10
replace freq_group = 1 if freqs >= 10 & freqs < 20
replace freq_group = 2 if freqs >= 20 & freqs < 30
replace freq_group = 3 if freqs >= 30 & freqs < 50
replace freq_group = 4 if freqs >= 50 & freqs < 100
replace freq_group = 5 if freqs >= 100
label values freq_group freq_group

* gen new occ var
gen occ_stable = occ if freq_group >= 2

* recoding (e.g. merging small cells)
replace occ_stable = 111 if occ == 111
replace occ_stable = 111 if occ == 112
replace occ_stable = 111 if occ == 113
replace occ_stable = 111 if occ == 114
replace occ_stable = 111 if occ == 115
replace occ_stable = 233 if occ == 233
replace occ_stable = 233 if occ == 234
replace occ_stable = 233 if occ == 235
replace occ_stable = 233 if occ == 236
replace occ_stable = 241 if occ == 241
replace occ_stable = 241 if occ == 242
replace occ_stable = 241 if occ == 244
replace occ_stable = 241 if occ == 245
replace occ_stable = 241 if occ == 247
replace occ_stable = 241 if occ == 249
replace occ_stable = 311 if occ == 311
replace occ_stable = 311 if occ == 312
replace occ_stable = 311 if occ == 313
replace occ_stable = 321 if occ == 321
replace occ_stable = 321 if occ == 322
replace occ_stable = 321 if occ == 323
replace occ_stable = 321 if occ == 324
replace occ_stable = 321 if occ == 326
replace occ_stable = 321 if occ == 329
replace occ_stable = 512 if occ == 512
replace occ_stable = 512 if occ == 513
replace occ_stable = 512 if occ == 515
replace occ_stable = 512 if occ == 516
replace occ_stable = 611 if occ == 611
replace occ_stable = 611 if occ == 615
replace occ_stable = 611 if occ == 616
replace occ_stable = 611 if occ == 619
replace occ_stable = 622 if occ == 622
replace occ_stable = 622 if occ == 627
replace occ_stable = 622 if occ == 628
replace occ_stable = 701 if occ == 701
replace occ_stable = 701 if occ == 702
replace occ_stable = 701 if occ == 703
replace occ_stable = 701 if occ == 707
replace occ_stable = 710 if occ == 710
replace occ_stable = 710 if occ == 712
replace occ_stable = 710 if occ == 713
replace occ_stable = 710 if occ == 715
replace occ_stable = 710 if occ == 716
replace occ_stable = 710 if occ == 717
replace occ_stable = 710 if occ == 718
replace occ_stable = 710 if occ == 719
replace occ_stable = 801 if occ == 801
replace occ_stable = 801 if occ == 803
replace occ_stable = 801 if occ == 806
replace occ_stable = 801 if occ == 807
replace occ_stable = 1010 if occ == 1010
replace occ_stable = 1010 if occ == 1011
replace occ_stable = 1010 if occ == 1013
replace occ_stable = 1010 if occ == 1014
replace occ_stable = 1010 if occ == 1015
replace occ_stable = 1010 if occ == 1018
replace occ_stable = 1010 if occ == 1019
replace occ_stable = 1211 if occ == 1211
replace occ_stable = 1211 if occ == 1212
replace occ_stable = 1211 if occ == 1213
replace occ_stable = 1211 if occ == 1215
replace occ_stable = 1211 if occ == 1219
replace occ_stable = 1311 if occ == 1311
replace occ_stable = 1311 if occ == 1312
replace occ_stable = 1311 if occ == 1315
replace occ_stable = 1311 if occ == 1316
replace occ_stable = 1311 if occ == 1319
replace occ_stable = 1350 if occ == 1350
replace occ_stable = 1350 if occ == 1351
replace occ_stable = 1350 if occ == 1352
replace occ_stable = 1350 if occ == 1353
replace occ_stable = 1350 if occ == 1357
replace occ_stable = 1350 if occ == 1359
replace occ_stable = 1450 if occ == 1450
replace occ_stable = 1450 if occ == 1452
replace occ_stable = 1450 if occ == 1454
replace occ_stable = 1521 if occ == 1521
replace occ_stable = 1521 if occ == 1522
replace occ_stable = 1521 if occ == 1523
replace occ_stable = 1521 if occ == 1525
replace occ_stable = 1521 if occ == 1526
replace occ_stable = 1531 if occ == 1531
replace occ_stable = 1531 if occ == 1532
replace occ_stable = 1531 if occ == 1533
replace occ_stable = 1531 if occ == 1534
replace occ_stable = 1531 if occ == 1535
replace occ_stable = 1531 if occ == 1536
replace occ_stable = 1531 if occ == 1537
replace occ_stable = 1531 if occ == 1538
replace occ_stable = 1531 if occ == 1539
replace occ_stable = 1622 if occ == 1622
replace occ_stable = 1622 if occ == 1623
replace occ_stable = 1622 if occ == 1628
replace occ_stable = 1640 if occ == 1640
replace occ_stable = 1640 if occ == 1641
replace occ_stable = 1640 if occ == 1642
replace occ_stable = 1640 if occ == 1643
replace occ_stable = 1640 if occ == 1647
replace occ_stable = 1715 if occ == 1715
replace occ_stable = 1715 if occ == 1716
replace occ_stable = 1715 if occ == 1718
replace occ_stable = 1761 if occ == 1761
replace occ_stable = 1761 if occ == 1762
replace occ_stable = 1761 if occ == 1765
replace occ_stable = 1851 if occ == 1851
replace occ_stable = 1851 if occ == 1852
replace occ_stable = 1851 if occ == 1853
replace occ_stable = 1851 if occ == 1857
replace occ_stable = 1851 if occ == 1859
replace occ_stable = 1911 if occ == 1911
replace occ_stable = 1911 if occ == 1912
replace occ_stable = 1911 if occ == 1913
replace occ_stable = 1911 if occ == 1915
replace occ_stable = 1911 if occ == 1917
replace occ_stable = 1911 if occ == 1919
replace occ_stable = 1940 if occ == 1940
replace occ_stable = 1940 if occ == 1945
replace occ_stable = 1940 if occ == 1947
replace occ_stable = 2011 if occ == 2011
replace occ_stable = 2011 if occ == 2012
replace occ_stable = 2011 if occ == 2013
replace occ_stable = 2011 if occ == 2014
replace occ_stable = 2011 if occ == 2019
replace occ_stable = 2111 if occ == 2111
replace occ_stable = 2111 if occ == 2117
replace occ_stable = 2132 if occ == 2132
replace occ_stable = 2132 if occ == 2133
replace occ_stable = 2132 if occ == 2134
replace occ_stable = 2132 if occ == 2137
replace occ_stable = 2132 if occ == 2139
replace occ_stable = 2221 if occ == 2221
replace occ_stable = 2221 if occ == 2227
replace occ_stable = 2221 if occ == 2229
replace occ_stable = 2251 if occ == 2251
replace occ_stable = 2251 if occ == 2253
replace occ_stable = 2251 if occ == 2254
replace occ_stable = 2251 if occ == 2255
replace occ_stable = 2251 if occ == 2256
replace occ_stable = 2251 if occ == 2257
replace occ_stable = 2251 if occ == 2259
replace occ_stable = 2291 if occ == 2291
replace occ_stable = 2291 if occ == 2293
replace occ_stable = 2291 if occ == 2294
replace occ_stable = 2291 if occ == 2295
replace occ_stable = 2291 if occ == 2299
replace occ_stable = 2341 if occ == 2341
replace occ_stable = 2341 if occ == 2343
replace occ_stable = 2341 if occ == 2347
replace occ_stable = 2341 if occ == 2349
replace occ_stable = 2350 if occ == 2350
replace occ_stable = 2350 if occ == 2351
replace occ_stable = 2350 if occ == 2352
replace occ_stable = 2350 if occ == 2353
replace occ_stable = 2350 if occ == 2357
replace occ_stable = 2350 if occ == 2359
replace occ_stable = 2412 if occ == 2412
replace occ_stable = 2412 if occ == 2413
replace occ_stable = 2412 if occ == 2415
replace occ_stable = 2520 if occ == 2520
replace occ_stable = 2520 if occ == 2521
replace occ_stable = 2520 if occ == 2522
replace occ_stable = 2520 if occ == 2527
replace occ_stable = 2553 if occ == 2553
replace occ_stable = 2553 if occ == 2557
replace occ_stable = 2553 if occ == 2559
replace occ_stable = 2560 if occ == 2560
replace occ_stable = 2560 if occ == 2561
replace occ_stable = 2560 if occ == 2562
replace occ_stable = 2560 if occ == 2563
replace occ_stable = 2560 if occ == 2567
replace occ_stable = 2611 if occ == 2611
replace occ_stable = 2611 if occ == 2613
replace occ_stable = 2611 if occ == 2614
replace occ_stable = 2641 if occ == 2641
replace occ_stable = 2641 if occ == 2642
replace occ_stable = 2732 if occ == 2732
replace occ_stable = 2732 if occ == 2733
replace occ_stable = 2732 if occ == 2734
replace occ_stable = 2732 if occ == 2735
replace occ_stable = 2732 if occ == 2736
replace occ_stable = 2741 if occ == 2741
replace occ_stable = 2741 if occ == 2747
replace occ_stable = 2741 if occ == 2749
replace occ_stable = 2811 if occ == 2811
replace occ_stable = 2811 if occ == 2819
replace occ_stable = 2833 if occ == 2833
replace occ_stable = 2833 if occ == 2835
replace occ_stable = 2833 if occ == 2837
replace occ_stable = 2833 if occ == 2839
replace occ_stable = 2921 if occ == 2921
replace occ_stable = 2921 if occ == 2923
replace occ_stable = 2921 if occ == 2926
replace occ_stable = 2921 if occ == 2928
replace occ_stable = 2940 if occ == 2940
replace occ_stable = 2940 if occ == 2942
replace occ_stable = 2940 if occ == 2944
replace occ_stable = 2940 if occ == 2949
replace occ_stable = 3001 if occ == 3001
replace occ_stable = 3001 if occ == 3003
replace occ_stable = 3001 if occ == 3006
replace occ_stable = 3001 if occ == 3008
replace occ_stable = 3001 if occ == 3009
replace occ_stable = 3032 if occ == 3032
replace occ_stable = 3032 if occ == 3037
replace occ_stable = 3050 if occ == 3050
replace occ_stable = 3050 if occ == 3053
replace occ_stable = 3050 if occ == 3054
replace occ_stable = 3091 if occ == 3091
replace occ_stable = 3091 if occ == 3094
replace occ_stable = 3091 if occ == 3097
replace occ_stable = 3091 if occ == 3099
replace occ_stable = 3131 if occ == 3131
replace occ_stable = 3131 if occ == 3132
replace occ_stable = 3131 if occ == 3133
replace occ_stable = 3131 if occ == 3137
replace occ_stable = 3131 if occ == 3139
replace occ_stable = 3152 if occ == 3152
replace occ_stable = 3152 if occ == 3157
replace occ_stable = 3152 if occ == 3159
replace occ_stable = 3310 if occ == 3310
replace occ_stable = 3310 if occ == 3313
replace occ_stable = 3310 if occ == 3319
replace occ_stable = 3411 if occ == 3411
replace occ_stable = 3411 if occ == 3413
replace occ_stable = 3411 if occ == 3417
replace occ_stable = 3511 if occ == 3511
replace occ_stable = 3511 if occ == 3512
replace occ_stable = 3511 if occ == 3514
replace occ_stable = 3511 if occ == 3517
replace occ_stable = 3591 if occ == 3591
replace occ_stable = 3591 if occ == 3597
replace occ_stable = 3610 if occ == 3610
replace occ_stable = 3610 if occ == 3611
replace occ_stable = 3610 if occ == 3617
replace occ_stable = 3610 if occ == 3618
replace occ_stable = 3610 if occ == 3619
replace occ_stable = 3730 if occ == 3730
replace occ_stable = 3730 if occ == 3731
replace occ_stable = 3730 if occ == 3733
replace occ_stable = 3730 if occ == 3737
replace occ_stable = 3741 if occ == 3741
replace occ_stable = 3741 if occ == 3742
replace occ_stable = 3741 if occ == 3743
replace occ_stable = 3763 if occ == 3763
replace occ_stable = 3763 if occ == 3764
replace occ_stable = 3763 if occ == 3767
replace occ_stable = 3763 if occ == 3769
replace occ_stable = 3923 if occ == 3923
replace occ_stable = 3923 if occ == 3927
replace occ_stable = 4011 if occ == 4011
replace occ_stable = 4011 if occ == 4012
replace occ_stable = 4011 if occ == 4013
replace occ_stable = 4011 if occ == 4015
replace occ_stable = 4111 if occ == 4111
replace occ_stable = 4111 if occ == 4112
replace occ_stable = 4111 if occ == 4113
replace occ_stable = 4111 if occ == 4119
replace occ_stable = 4210 if occ == 4210
replace occ_stable = 4210 if occ == 4217
replace occ_stable = 4230 if occ == 4230
replace occ_stable = 4230 if occ == 4231
replace occ_stable = 4230 if occ == 4233
replace occ_stable = 4230 if occ == 4234
replace occ_stable = 4230 if occ == 4236
replace occ_stable = 4230 if occ == 4239
replace occ_stable = 4413 if occ == 4413
replace occ_stable = 4413 if occ == 4417
replace occ_stable = 4413 if occ == 4419
replace occ_stable = 4421 if occ == 4421
replace occ_stable = 4421 if occ == 4427
replace occ_stable = 4711 if occ == 4711
replace occ_stable = 4711 if occ == 4719
replace occ_stable = 4811 if occ == 4811
replace occ_stable = 4811 if occ == 4812
replace occ_stable = 4811 if occ == 4814
replace occ_stable = 4811 if occ == 4817
replace occ_stable = 4821 if occ == 4821
replace occ_stable = 4821 if occ == 4822
replace occ_stable = 4821 if occ == 4823
replace occ_stable = 4821 if occ == 4825
replace occ_stable = 4821 if occ == 4826
replace occ_stable = 4821 if occ == 4827
replace occ_stable = 4821 if occ == 4828
replace occ_stable = 4851 if occ == 4851
replace occ_stable = 4851 if occ == 4853
replace occ_stable = 4851 if occ == 4854
replace occ_stable = 4851 if occ == 4856
replace occ_stable = 4851 if occ == 4857
replace occ_stable = 4860 if occ == 4860
replace occ_stable = 4860 if occ == 4861
replace occ_stable = 4860 if occ == 4864
replace occ_stable = 4922 if occ == 4922
replace occ_stable = 4922 if occ == 4923
replace occ_stable = 4922 if occ == 4924
replace occ_stable = 4922 if occ == 4925
replace occ_stable = 4922 if occ == 4927
replace occ_stable = 5011 if occ == 5011
replace occ_stable = 5011 if occ == 5015
replace occ_stable = 5011 if occ == 5016
replace occ_stable = 5011 if occ == 5018
replace occ_stable = 5060 if occ == 5060
replace occ_stable = 5060 if occ == 5061
replace occ_stable = 5060 if occ == 5062
replace occ_stable = 5060 if occ == 5063
replace occ_stable = 5060 if occ == 5067
replace occ_stable = 5060 if occ == 5068
replace occ_stable = 5102 if occ == 5102
replace occ_stable = 5102 if occ == 5107
replace occ_stable = 5102 if occ == 5109
replace occ_stable = 5112 if occ == 5112
replace occ_stable = 5112 if occ == 5113
replace occ_stable = 5112 if occ == 5114
replace occ_stable = 5112 if occ == 5115
replace occ_stable = 5112 if occ == 5117
replace occ_stable = 5112 if occ == 5119
replace occ_stable = 5122 if occ == 5122
replace occ_stable = 5122 if occ == 5124
replace occ_stable = 5122 if occ == 5125
replace occ_stable = 5122 if occ == 5126
replace occ_stable = 5122 if occ == 5127
replace occ_stable = 5215 if occ == 5215
replace occ_stable = 5215 if occ == 5217
replace occ_stable = 5215 if occ == 5219
replace occ_stable = 5223 if occ == 5223
replace occ_stable = 5223 if occ == 5225
replace occ_stable = 5223 if occ == 5226
replace occ_stable = 5223 if occ == 5228
replace occ_stable = 5412 if occ == 5412
replace occ_stable = 5412 if occ == 5413
replace occ_stable = 5412 if occ == 5414
replace occ_stable = 5412 if occ == 5419
replace occ_stable = 5461 if occ == 5461
replace occ_stable = 5461 if occ == 5464
replace occ_stable = 5461 if occ == 5466
replace occ_stable = 5493 if occ == 5493
replace occ_stable = 5493 if occ == 5496
replace occ_stable = 5493 if occ == 5497
replace occ_stable = 5493 if occ == 5499
replace occ_stable = 6025 if occ == 6025
replace occ_stable = 6025 if occ == 6028
replace occ_stable = 6025 if occ == 6029
replace occ_stable = 6064 if occ == 6064
replace occ_stable = 6064 if occ == 6065
replace occ_stable = 6064 if occ == 6068
replace occ_stable = 6064 if occ == 6069
replace occ_stable = 6091 if occ == 6091
replace occ_stable = 6091 if occ == 6092
replace occ_stable = 6091 if occ == 6094
replace occ_stable = 6091 if occ == 6095
replace occ_stable = 6114 if occ == 6114
replace occ_stable = 6114 if occ == 6116
replace occ_stable = 6114 if occ == 6119
replace occ_stable = 6121 if occ == 6121
replace occ_stable = 6121 if occ == 6122
replace occ_stable = 6121 if occ == 6124
replace occ_stable = 6121 if occ == 6125
replace occ_stable = 6121 if occ == 6129
replace occ_stable = 6232 if occ == 6232
replace occ_stable = 6232 if occ == 6234
replace occ_stable = 6232 if occ == 6235
replace occ_stable = 6232 if occ == 6238
replace occ_stable = 6232 if occ == 6239
replace occ_stable = 6251 if occ == 6251
replace occ_stable = 6251 if occ == 6252
replace occ_stable = 6251 if occ == 6253
replace occ_stable = 6251 if occ == 6256
replace occ_stable = 6262 if occ == 6262
replace occ_stable = 6262 if occ == 6265
replace occ_stable = 6262 if occ == 6266
replace occ_stable = 6262 if occ == 6268
replace occ_stable = 6281 if occ == 6281
replace occ_stable = 6281 if occ == 6283
replace occ_stable = 6312 if occ == 6312
replace occ_stable = 6312 if occ == 6313
replace occ_stable = 6312 if occ == 6314
replace occ_stable = 6312 if occ == 6315
replace occ_stable = 6312 if occ == 6316
replace occ_stable = 6331 if occ == 6331
replace occ_stable = 6331 if occ == 6332
replace occ_stable = 6331 if occ == 6334
replace occ_stable = 6331 if occ == 6335
replace occ_stable = 6331 if occ == 6336
replace occ_stable = 6331 if occ == 6338
replace occ_stable = 6414 if occ == 6414
replace occ_stable = 6414 if occ == 6415
replace occ_stable = 6414 if occ == 6416
replace occ_stable = 6414 if occ == 6419
replace occ_stable = 6421 if occ == 6421
replace occ_stable = 6421 if occ == 6422
replace occ_stable = 6421 if occ == 6423
replace occ_stable = 6421 if occ == 6424
replace occ_stable = 6421 if occ == 6425
replace occ_stable = 6421 if occ == 6426
replace occ_stable = 6516 if occ == 6516
replace occ_stable = 6516 if occ == 6519
replace occ_stable = 6611 if occ == 6611
replace occ_stable = 6611 if occ == 6618
replace occ_stable = 6891 if occ == 6891
replace occ_stable = 6891 if occ == 6899
replace occ_stable = 6921 if occ == 6921
replace occ_stable = 6921 if occ == 6922
replace occ_stable = 6921 if occ == 6925
replace occ_stable = 6921 if occ == 6929
replace occ_stable = 6953 if occ == 6953
replace occ_stable = 6953 if occ == 6956
replace occ_stable = 7052 if occ == 7052
replace occ_stable = 7052 if occ == 7055
replace occ_stable = 7052 if occ == 7056
replace occ_stable = 7052 if occ == 7059
replace occ_stable = 7062 if occ == 7062
replace occ_stable = 7062 if occ == 7063
replace occ_stable = 7131 if occ == 7131
replace occ_stable = 7131 if occ == 7133
replace occ_stable = 7131 if occ == 7134
replace occ_stable = 7131 if occ == 7139
replace occ_stable = 7411 if occ == 7411
replace occ_stable = 7411 if occ == 7414
replace occ_stable = 7411 if occ == 7415
replace occ_stable = 7411 if occ == 7418
replace occ_stable = 7411 if occ == 7419
replace occ_stable = 7552 if occ == 7552
replace occ_stable = 7552 if occ == 7553
replace occ_stable = 7552 if occ == 7558
replace occ_stable = 7552 if occ == 7559
replace occ_stable = 7820 if occ == 7820
replace occ_stable = 7820 if occ == 7823
replace occ_stable = 7820 if occ == 7826
replace occ_stable = 7820 if occ == 7828
replace occ_stable = 7853 if occ == 7853
replace occ_stable = 7853 if occ == 7854
replace occ_stable = 7853 if occ == 7855
replace occ_stable = 7853 if occ == 7856
replace occ_stable = 7853 if occ == 7858
replace occ_stable = 7912 if occ == 7912
replace occ_stable = 7912 if occ == 7914
replace occ_stable = 7912 if occ == 7915
replace occ_stable = 7912 if occ == 7919
replace occ_stable = 7921 if occ == 7921
replace occ_stable = 7921 if occ == 7922
replace occ_stable = 7921 if occ == 7929
replace occ_stable = 7940 if occ == 7940
replace occ_stable = 7940 if occ == 7941
replace occ_stable = 7940 if occ == 7942
replace occ_stable = 7940 if occ == 7944
replace occ_stable = 8030 if occ == 8030
replace occ_stable = 8030 if occ == 8034
replace occ_stable = 8030 if occ == 8039
replace occ_stable = 8212 if occ == 8212
replace occ_stable = 8212 if occ == 8216
replace occ_stable = 8235 if occ == 8235
replace occ_stable = 8235 if occ == 8236
replace occ_stable = 8311 if occ == 8311
replace occ_stable = 8311 if occ == 8312
replace occ_stable = 8323 if occ == 8323
replace occ_stable = 8323 if occ == 8324
replace occ_stable = 8323 if occ == 8327
replace occ_stable = 8323 if occ == 8329
replace occ_stable = 8331 if occ == 8331
replace occ_stable = 8331 if occ == 8333
replace occ_stable = 8331 if occ == 8334
replace occ_stable = 8355 if occ == 8355
replace occ_stable = 8355 if occ == 8356
replace occ_stable = 8355 if occ == 8357
replace occ_stable = 8374 if occ == 8374
replace occ_stable = 8374 if occ == 8375
replace occ_stable = 8374 if occ == 8376
replace occ_stable = 8374 if occ == 8378
replace occ_stable = 8381 if occ == 8381
replace occ_stable = 8381 if occ == 8382
replace occ_stable = 8381 if occ == 8383
replace occ_stable = 8381 if occ == 8384
replace occ_stable = 8381 if occ == 8385
replace occ_stable = 8381 if occ == 8386
replace occ_stable = 8381 if occ == 8388
replace occ_stable = 8381 if occ == 8389
replace occ_stable = 8392 if occ == 8392
replace occ_stable = 8392 if occ == 8393
replace occ_stable = 8392 if occ == 8394
replace occ_stable = 8392 if occ == 8395
replace occ_stable = 8573 if occ == 8573
replace occ_stable = 8573 if occ == 8574
replace occ_stable = 8573 if occ == 8576
replace occ_stable = 8573 if occ == 8578
replace occ_stable = 8590 if occ == 8590
replace occ_stable = 8590 if occ == 8592
replace occ_stable = 8821 if occ == 8821
replace occ_stable = 8821 if occ == 8822
replace occ_stable = 8821 if occ == 8823
replace occ_stable = 8821 if occ == 8826
replace occ_stable = 8830 if occ == 8830
replace occ_stable = 8830 if occ == 8832
replace occ_stable = 8830 if occ == 8833
replace occ_stable = 8830 if occ == 8836
replace occ_stable = 8830 if occ == 8839
replace occ_stable = 8840 if occ == 8840
replace occ_stable = 8840 if occ == 8843
replace occ_stable = 8840 if occ == 8845
replace occ_stable = 8840 if occ == 8849
replace occ_stable = 8911 if occ == 8911
replace occ_stable = 8911 if occ == 8914
replace occ_stable = 8911 if occ == 8915
replace occ_stable = 8911 if occ == 8916
replace occ_stable = 8911 if occ == 8918
replace occ_stable = 8911 if occ == 8919
replace occ_stable = 8941 if occ == 8941
replace occ_stable = 8941 if occ == 8944
replace occ_stable = 9024 if occ == 9024
replace occ_stable = 9024 if occ == 9029
replace occ_stable = 9121 if occ == 9121
replace occ_stable = 9121 if occ == 9122
replace occ_stable = 9121 if occ == 9123
replace occ_stable = 9121 if occ == 9126
replace occ_stable = 9121 if occ == 9128
replace occ_stable = 9210 if occ == 9210
replace occ_stable = 9210 if occ == 9214
replace occ_stable = 9311 if occ == 9311
replace occ_stable = 9311 if occ == 9312
replace occ_stable = 9311 if occ == 9313
replace occ_stable = 9311 if occ == 9319
replace occ_stable = 8760 if occ == 8761
replace occ_stable = 7750 if occ == 7753
replace occ_stable = 3080 if occ == 3082
replace occ_stable = 8610 if occ == 8618
replace occ_stable = 2210 if occ == 2214
replace occ_stable = 1790 if occ == 1793
replace occ_stable = 3930 if occ == 3932
replace occ_stable = 1810 if occ == 1811
replace occ_stable = 8811 if occ == 8818
replace occ_stable = 7632 if occ == 7639
replace occ_stable = 6050 if occ == 6052
replace occ_stable = 1810 if occ == 1815
replace occ_stable = 2500 if occ == 2507
replace occ_stable = 6321 if occ == 6325
replace occ_stable = 9230 if occ == 9235
replace occ_stable = 7120 if occ == 7127
replace occ_stable = 1410 if occ == 1416
replace occ_stable = 6860 if occ == 6862
replace occ_stable = 6210 if occ == 6213
replace occ_stable = 9010 if occ == 9017
replace occ_stable = 1810 if occ == 1816
replace occ_stable = 6000 if occ == 6005
replace occ_stable = 9150 if occ == 9156
replace occ_stable = 2821 if occ == 2822
replace occ_stable = 3021 if occ == 3023
replace occ_stable = 7261 if occ == 7262
replace occ_stable = 8221 if occ == 8220
replace occ_stable = 3910 if occ == 3913
replace occ_stable = 5452 if occ == 5450
replace occ_stable = 2331 if occ == 2330
replace occ_stable = 5440 if occ == 5446
replace occ_stable = 3160 if occ == 3168
replace occ_stable = 9340 if occ == 9349
replace occ_stable = 6041 if occ == 6042
replace occ_stable = 4631 if occ == 4637
replace occ_stable = 1751 if occ == 1759
replace occ_stable = 2661 if occ == 2662
replace occ_stable = 8752 if occ == 8751
replace occ_stable = 7010 if occ == 7015
replace occ_stable = 3231 if occ == 3232
replace occ_stable = 7030 if occ == 7039
replace occ_stable = 5142 if occ == 5143
replace occ_stable = 5142 if occ == 5149
replace occ_stable = 4830 if occ == 4837
replace occ_stable = 9010 if occ == 9011
replace occ_stable = 5142 if occ == 5141
replace occ_stable = 8052 if occ == 8050
replace occ_stable = 1410 if occ == 1418
replace occ_stable = 8781 if occ == 8782
replace occ_stable = 7632 if occ == 7631
replace occ_stable = 7570 if occ == 7573
replace occ_stable = 7930 if occ == 7932
replace occ_stable = 2821 if occ == 2827
replace occ_stable = 6291 if occ == 6299
replace occ_stable = 8020 if occ == 8021
replace occ_stable = 5021 if occ == 5022
replace occ_stable = 3520 if occ == 3521
replace occ_stable = 8860 if occ == 8862
replace occ_stable = 3080 if occ == 3083
replace occ_stable = 2591 if occ == 2599
replace occ_stable = 6621 if occ == 6627
replace occ_stable = 8620 if occ == 8627
replace occ_stable = 8630 if occ == 8632
replace occ_stable = 8551 if occ == 8553
replace occ_stable = 3170 if occ == 3175
replace occ_stable = 8690 if occ == 8693
replace occ_stable = 3910 if occ == 3912
replace occ_stable = 8760 if occ == 8763
replace occ_stable = 3080 if occ == 3081
replace occ_stable = 2451 if occ == 2457
replace occ_stable = 8361 if occ == 8369
replace occ_stable = 4870 if occ == 4872
replace occ_stable = 9110 if occ == 9113
replace occ_stable = 4243 if occ == 4247
replace occ_stable = 9010 if occ == 9018
replace occ_stable = 8670 if occ == 8677
replace occ_stable = 7020 if occ == 7029
replace occ_stable = 521 if occ == 522
replace occ_stable = 4662 if occ == 4667
replace occ_stable = 2240 if occ == 2247
replace occ_stable = 1730 if occ == 1735
replace occ_stable = 2650 if occ == 2652
replace occ_stable = 9140 if occ == 9146
replace occ_stable = 7010 if occ == 7018
replace occ_stable = 7650 if occ == 7651
replace occ_stable = 8811 if occ == 8810
replace occ_stable = 7531 if occ == 7539
replace occ_stable = 4243 if occ == 4240
replace occ_stable = 4610 if occ == 4614
replace occ_stable = 3080 if occ == 3087
replace occ_stable = 2951 if occ == 2952
replace occ_stable = 8851 if occ == 8855
replace occ_stable = 4870 if occ == 4873
replace occ_stable = 3720 if occ == 3727
replace occ_stable = 6321 if occ == 6328
replace occ_stable = 2650 if occ == 2657
replace occ_stable = 8860 if occ == 8865
replace occ_stable = 8681 if occ == 8684
replace occ_stable = 2951 if occ == 2953
replace occ_stable = 4401 if occ == 4407
replace occ_stable = 5501 if occ == 5503
replace occ_stable = 3321 if occ == 3323
replace occ_stable = 8792 if occ == 8791
replace occ_stable = 5501 if occ == 5504
replace occ_stable = 1740 if occ == 1749
replace occ_stable = 1121 if occ == 1125
replace occ_stable = 2760 if occ == 2767
replace occ_stable = 2125 if occ == 2127
replace occ_stable = 3910 if occ == 3915
replace occ_stable = 8130 if occ == 8138
replace occ_stable = 9140 if occ == 9142
replace occ_stable = 8361 if occ == 8360
replace occ_stable = 7613 if occ == 7615
replace occ_stable = 4601 if occ == 4604
replace occ_stable = 3910 if occ == 3918
replace occ_stable = 2125 if occ == 2128
replace occ_stable = 3321 if occ == 3327
replace occ_stable = 1780 if occ == 1783
replace occ_stable = 2951 if occ == 2957
replace occ_stable = 3160 if occ == 3162
replace occ_stable = 1427 if occ == 1421
replace occ_stable = 4653 if occ == 4650
replace occ_stable = 6740 if occ == 6745
replace occ_stable = 530 if occ == 531
replace occ_stable = 6050 if occ == 6056
replace occ_stable = 5452 if occ == 5451
replace occ_stable = 6271 if occ == 6272
replace occ_stable = 6050 if occ == 6051
replace occ_stable = 8340 if occ == 8345
replace occ_stable = 3120 if occ == 3127
replace occ_stable = 1810 if occ == 1818
replace occ_stable = 6271 if occ == 6279
replace occ_stable = 8530 if occ == 8531
replace occ_stable = 7832 if occ == 7835
replace occ_stable = 4653 if occ == 4656
replace occ_stable = 1720 if occ == 1721
replace occ_stable = 6341 if occ == 6345
replace occ_stable = 8130 if occ == 8139
replace occ_stable = 8811 if occ == 8812
replace occ_stable = 7020 if occ == 7022
replace occ_stable = 6700 if occ == 6702
replace occ_stable = 5050 if occ == 5054
replace occ_stable = 6081 if occ == 6084
replace occ_stable = 7561 if occ == 7569
replace occ_stable = 4910 if occ == 4912
replace occ_stable = 1610 if occ == 1615
replace occ_stable = 4662 if occ == 4669
replace occ_stable = 7040 if occ == 7043
replace occ_stable = 7613 if occ == 7611
replace occ_stable = 2900 if occ == 2907
replace occ_stable = 7010 if occ == 7019
replace occ_stable = 9010 if occ == 9014
replace occ_stable = 4601 if occ == 4602
replace occ_stable = 3520 if occ == 3526
replace occ_stable = 7120 if occ == 7125
replace occ_stable = 9110 if occ == 9119
replace occ_stable = 8690 if occ == 8699
replace occ_stable = 3580 if occ == 3582
replace occ_stable = 7420 if occ == 7423
replace occ_stable = 8740 if occ == 8741
replace occ_stable = 9360 if occ == 9363
replace occ_stable = 8740 if occ == 8744
replace occ_stable = 6341 if occ == 6349
replace occ_stable = 7320 if occ == 7329
replace occ_stable = 9370 if occ == 9379
replace occ_stable = 6321 if occ == 6329
replace occ_stable = 6240 if occ == 6246
replace occ_stable = 7432 if occ == 7431
replace occ_stable = 5142 if occ == 5140
replace occ_stable = 4910 if occ == 4911
replace occ_stable = 4870 if occ == 4877
replace occ_stable = 2870 if occ == 2873
replace occ_stable = 1751 if occ == 1750
replace occ_stable = 8681 if occ == 8689
replace occ_stable = 2331 if occ == 2337
replace occ_stable = 9110 if occ == 9116
replace occ_stable = 1730 if occ == 1732
replace occ_stable = 7781 if occ == 7782
replace occ_stable = 6030 if occ == 6039
replace occ_stable = 2210 if occ == 2215
replace occ_stable = 2870 if occ == 2879
replace occ_stable = 7640 if occ == 7641
replace occ_stable = 6240 if occ == 6243
replace occ_stable = 2700 if occ == 2707
replace occ_stable = 3120 if occ == 3121
replace occ_stable = 8340 if occ == 8344
replace occ_stable = 6740 if occ == 6741
replace occ_stable = 7781 if occ == 7780
replace occ_stable = 1410 if occ == 1412
replace occ_stable = 1610 if occ == 1613
replace occ_stable = 7730 if occ == 7734
replace occ_stable = 3021 if occ == 3024
replace occ_stable = 4350 if occ == 4353
replace occ_stable = 7040 if occ == 7042
replace occ_stable = 3321 if occ == 3322
replace occ_stable = 1121 if occ == 1123
replace occ_stable = 2671 if occ == 2677
replace occ_stable = 6910 if occ == 6911
replace occ_stable = 4653 if occ == 4652
replace occ_stable = 8851 if occ == 8859
replace occ_stable = 5021 if occ == 5029
replace occ_stable = 7741 if occ == 7743
replace occ_stable = 3021 if occ == 3020
replace occ_stable = 4631 if occ == 4632
replace occ_stable = 4310 if occ == 4313
replace occ_stable = 7320 if occ == 7322
replace occ_stable = 7531 if occ == 7530
replace occ_stable = 7150 if occ == 7152
replace occ_stable = 6200 if occ == 6208
replace occ_stable = 2760 if occ == 2761
replace occ_stable = 4610 if occ == 4613
replace occ_stable = 6520 if occ == 6523
replace occ_stable = 1730 if occ == 1733
replace occ_stable = 4910 if occ == 4917
replace occ_stable = 7861 if occ == 7864
replace occ_stable = 7861 if occ == 7869
replace occ_stable = 8052 if occ == 8051
replace occ_stable = 5050 if occ == 5055
replace occ_stable = 3110 if occ == 3117
replace occ_stable = 4662 if occ == 4661
replace occ_stable = 7952 if occ == 7951
replace occ_stable = 8340 if occ == 8349
replace occ_stable = 6740 if occ == 6749
replace occ_stable = 8121 if occ == 8122
replace occ_stable = 6341 if occ == 6342
replace occ_stable = 5230 if occ == 5231
replace occ_stable = 2125 if occ == 2120
replace occ_stable = 130 if occ == 131
replace occ_stable = 7640 if occ == 7649
replace occ_stable = 4880 if occ == 4885
replace occ_stable = 1121 if occ == 1122
replace occ_stable = 9370 if occ == 9373
replace occ_stable = 4610 if occ == 4612
replace occ_stable = 2331 if occ == 2333
replace occ_stable = 6240 if occ == 6249
replace occ_stable = 1740 if occ == 1743
replace occ_stable = 8610 if occ == 8615
replace occ_stable = 8041 if occ == 8042
replace occ_stable = 5440 if occ == 5442
replace occ_stable = 8520 if occ == 8523
replace occ_stable = 7840 if occ == 7842
replace occ_stable = 1121 if occ == 1127
replace occ_stable = 2951 if occ == 2959
replace occ_stable = 1780 if occ == 1785
replace occ_stable = 2331 if occ == 2332
replace occ_stable = 2760 if occ == 2769
replace occ_stable = 6041 if occ == 6046
replace occ_stable = 7840 if occ == 7845
replace occ_stable = 4601 if occ == 4607
replace occ_stable = 6751 if occ == 6752
replace occ_stable = 7261 if occ == 7263
replace occ_stable = 3071 if occ == 3072
replace occ_stable = 9010 if occ == 9012
replace occ_stable = 9140 if occ == 9144
replace occ_stable = 4350 if occ == 4354
replace occ_stable = 3120 if occ == 3124
replace occ_stable = 4910 if occ == 4914
replace occ_stable = 6010 if occ == 6018
replace occ_stable = 4601 if occ == 4605
replace occ_stable = 5050 if occ == 5058
replace occ_stable = 3221 if occ == 3229
replace occ_stable = 7150 if occ == 7153
replace occ_stable = 9340 if occ == 9342
replace occ_stable = 8650 if occ == 8657
replace occ_stable = 7420 if occ == 7422
replace occ_stable = 8630 if occ == 8639
replace occ_stable = 7791 if occ == 7798
replace occ_stable = 3720 if occ == 3723
replace occ_stable = 5021 if occ == 5028
replace occ_stable = 9360 if occ == 9362
replace occ_stable = 6720 if occ == 6722
replace occ_stable = 8640 if occ == 8642
replace occ_stable = 6520 if occ == 6529
replace occ_stable = 721 if occ == 722
replace occ_stable = 5440 if occ == 5445
replace occ_stable = 3071 if occ == 3077
replace occ_stable = 8111 if occ == 8113
replace occ_stable = 4653 if occ == 4651
replace occ_stable = 7160 if occ == 7163
replace occ_stable = 5021 if occ == 5027
replace occ_stable = 3219 if occ == 3211
replace occ_stable = 2350 if occ == 2310
replace occ_stable = 3411 if occ == 3448
replace occ_stable = 3411 if occ == 3447
replace occ_stable = 3411 if occ == 3496
replace occ_stable = 3763 if occ == 3710
replace occ_stable = 4832 if occ == 4840
replace occ_stable = 3411 if occ == 3441
replace occ_stable = 3411 if occ == 3491
replace occ_stable = 4832 if occ == 4842
replace occ_stable = 3763 if occ == 3711
replace occ_stable = 4810 if occ == 4801
replace occ_stable = 3411 if occ == 3443
replace occ_stable = 3763 if occ == 3784
replace occ_stable = 3520 if occ == 3533
replace occ_stable = 3520 if occ == 3543
replace occ_stable = 3763 if occ == 3717
replace occ_stable = 4810 if occ == 4807
replace occ_stable = 3411 if occ == 3440
replace occ_stable = 7320 if occ == 7311
	
* check missings
ta occ if occ_stable == .
keep occ occ_stable freqs
save "input/aux/soep_stable_groups.dta", replace
		
* compute gender ratios
use "input/aux/soep_1.dta", clear

* cleaning general
keep if employ >=1 & employ <= 4 // note: we are keeping those in apprenticeships in this step
keep if year >= 1992 & year <= 2015

* clean occupation var
drop if occ == .
drop if occ == -1 | occ == -2 // if no occ observed
drop if occ >= 9710 // groups with unclear functions / residual groups
drop if occ >= 7210 & occ <= 7248 // boat and nautic personnel (no occ data available and few obs's)	

* merge in occ_stable
keep sex weight occ
merge m:1 occ using "input/aux/soep_stable_groups.dta"
drop _merge
		
* compute female/mixed/male occs 
recode sex (2 = 0), gen(male)
label var male "male gender"
drop sex
label define male 0 "[0] female" 1 "[1] male"
label values male male
collapse (mean) male [pweight=weight], by(occ_stable)
ren male mean_male
label variable mean_male "occupational gender, continuous"
replace mean_male = round(mean_male, 0.01)
recode mean_male (0/0.39 = 2) (0.40/0.60 = 1) (0.61/1 = 0), gen(occ_gender)
label define occ_gender 0 "[0] male type" 1 "[1] mixed type" 2 "[2] female type"
label values occ_gender occ_gender
label variable occ_gender "occupational gender type"

* save
save "input/aux/soep_stable_groups_with_ratios.dta", replace

* merge with occ_stable data set
use "input/aux/soep_stable_groups.dta", clear
merge m:1 occ_stable using "input/aux/soep_stable_groups_with_ratios.dta"
drop _merge
		
* save final
save "input/aux/soep_occ_gender.dta", replace
