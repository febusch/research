// Generates weight based on total employment per Census 2010 occupations in 2011.
// The 2010 numbers where not available at the time of retrieval, so I rely on 2011 figures.
// The weight can be used when collapsing Census_2010 to OCC2010 groups.

gen weight = .
order weight, after(census_2010)
replace weight = 1515 if census_2010 == 10
replace weight = 978 if census_2010 == 20
replace weight = 16 if census_2010 == 30
replace weight = 87 if census_2010 == 40
replace weight = 1009 if census_2010 == 50
replace weight = 63 if census_2010 == 60
replace weight = 128 if census_2010 == 100
replace weight = 553 if census_2010 == 110
replace weight = 1107 if census_2010 == 120
replace weight = 21 if census_2010 == 135
replace weight = 243 if census_2010 == 136
replace weight = 38 if census_2010 == 137
replace weight = 259 if census_2010 == 140
replace weight = 204 if census_2010 == 150
replace weight = 254 if census_2010 == 160
replace weight = 978 if census_2010 == 205
replace weight = 926 if census_2010 == 220
replace weight = 853 if census_2010 == 230
replace weight = 106 if census_2010 == 300
replace weight = 1051 if census_2010 == 310
replace weight = 13 if census_2010 == 325
replace weight = 23 if census_2010 == 330
replace weight = 148 if census_2010 == 340
replace weight = 529 if census_2010 == 350
replace weight = 16 if census_2010 == 360
replace weight = 40 if census_2010 == 400
replace weight = 587 if census_2010 == 410
replace weight = 329 if census_2010 == 420
replace weight = 5 if census_2010 == 425
replace weight = 3173 if census_2010 == 430
replace weight = 48 if census_2010 == 500
replace weight = 12 if census_2010 == 510
replace weight = 170 if census_2010 == 520
replace weight = 259 if census_2010 == 530
replace weight = 296 if census_2010 == 540
replace weight = 198 if census_2010 == 565
replace weight = 119 if census_2010 == 600
replace weight = 595 if census_2010 == 630
replace weight = 65 if census_2010 == 640
replace weight = 130 if census_2010 == 650
replace weight = 88 if census_2010 == 700
replace weight = 707 if census_2010 == 710
replace weight = 109 if census_2010 == 725
replace weight = 78 if census_2010 == 726
replace weight = 205 if census_2010 == 735
replace weight = 281 if census_2010 == 740
replace weight = 1653 if census_2010 == 800
replace weight = 88 if census_2010 == 810
replace weight = 53 if census_2010 == 820
replace weight = 24 if census_2010 == 830
replace weight = 84 if census_2010 == 840
replace weight = 371 if census_2010 == 850
replace weight = 117 if census_2010 == 860
replace weight = 8 if census_2010 == 900
replace weight = 326 if census_2010 == 910
replace weight = 70 if census_2010 == 930
replace weight = 110 if census_2010 == 940
replace weight = 77 if census_2010 == 950
replace weight = 20 if census_2010 == 1005
replace weight = 447 if census_2010 == 1006
replace weight = 44 if census_2010 == 1007
replace weight = 459 if census_2010 == 1010
replace weight = 1044 if census_2010 == 1020
replace weight = 182 if census_2010 == 1030
replace weight = 461 if census_2010 == 1050
replace weight = 134 if census_2010 == 1060
replace weight = 233 if census_2010 == 1105
replace weight = 98 if census_2010 == 1106
replace weight = 306 if census_2010 == 1107
replace weight = 18 if census_2010 == 1200
replace weight = 2 if census_2010 == 1210
replace weight = 116 if census_2010 == 1220
replace weight = 37 if census_2010 == 1230
replace weight = 6 if census_2010 == 1240
replace weight = 181 if census_2010 == 1300
replace weight = 42 if census_2010 == 1310
replace weight = 144 if census_2010 == 1320
replace weight = 1 if census_2010 == 1330
replace weight = 12 if census_2010 == 1340
replace weight = 74 if census_2010 == 1350
replace weight = 383 if census_2010 == 1360
replace weight = 77 if census_2010 == 1400
replace weight = 309 if census_2010 == 1410
replace weight = 45 if census_2010 == 1420
replace weight = 174 if census_2010 == 1430
replace weight = 9 if census_2010 == 1440
replace weight = 32 if census_2010 == 1450
replace weight = 322 if census_2010 == 1460
replace weight = 11 if census_2010 == 1500
replace weight = 20 if census_2010 == 1510
replace weight = 25 if census_2010 == 1520
replace weight = 337 if census_2010 == 1530
replace weight = 147 if census_2010 == 1540
replace weight = 376 if census_2010 == 1550
replace weight = 62 if census_2010 == 1560
replace weight = 39 if census_2010 == 1600
replace weight = 114 if census_2010 == 1610
replace weight = 28 if census_2010 == 1640
replace weight = 156 if census_2010 == 1650
replace weight = 0 if census_2010 == 1660
replace weight = 20 if census_2010 == 1700
replace weight = 7 if census_2010 == 1710
replace weight = 88 if census_2010 == 1720
replace weight = 98 if census_2010 == 1740
replace weight = 152 if census_2010 == 1760
replace weight = 23 if census_2010 == 1800
replace weight = 3 if census_2010 == 1815
replace weight = 197 if census_2010 == 1820
replace weight = 4 if census_2010 == 1830
replace weight = 26 if census_2010 == 1840
replace weight = 60 if census_2010 == 1860
replace weight = 24 if census_2010 == 1900
replace weight = 21 if census_2010 == 1910
replace weight = 77 if census_2010 == 1920
replace weight = 10 if census_2010 == 1930
replace weight = 3 if census_2010 == 1940
replace weight = 3 if census_2010 == 1950
replace weight = 151 if census_2010 == 1965
replace weight = 732 if census_2010 == 2000
replace weight = 769 if census_2010 == 2010
replace weight = 94 if census_2010 == 2015
replace weight = 131 if census_2010 == 2016
replace weight = 83 if census_2010 == 2025
replace weight = 414 if census_2010 == 2040
replace weight = 44 if census_2010 == 2050
replace weight = 85 if census_2010 == 2060
replace weight = 1085 if census_2010 == 2100
replace weight = 5 if census_2010 == 2105
replace weight = 67 if census_2010 == 2110
replace weight = 404 if census_2010 == 2145
replace weight = 209 if census_2010 == 2160
replace weight = 1355 if census_2010 == 2200
replace weight = 707 if census_2010 == 2300
replace weight = 2848 if census_2010 == 2310
replace weight = 1136 if census_2010 == 2320
replace weight = 388 if census_2010 == 2330
replace weight = 812 if census_2010 == 2340
replace weight = 48 if census_2010 == 2400
replace weight = 198 if census_2010 == 2430
replace weight = 37 if census_2010 == 2440
replace weight = 950 if census_2010 == 2540
replace weight = 140 if census_2010 == 2550
replace weight = 180 if census_2010 == 2600
replace weight = 766 if census_2010 == 2630
replace weight = 28 if census_2010 == 2700
replace weight = 149 if census_2010 == 2710
replace weight = 272 if census_2010 == 2720
replace weight = 20 if census_2010 == 2740
replace weight = 191 if census_2010 == 2750
replace weight = 44 if census_2010 == 2760
replace weight = 53 if census_2010 == 2800
replace weight = 70 if census_2010 == 2810
replace weight = 158 if census_2010 == 2825
replace weight = 166 if census_2010 == 2830
replace weight = 60 if census_2010 == 2840
replace weight = 218 if census_2010 == 2850
replace weight = 89 if census_2010 == 2860
replace weight = 106 if census_2010 == 2900
replace weight = 148 if census_2010 == 2910
replace weight = 57 if census_2010 == 2920
replace weight = 3 if census_2010 == 2960
replace weight = 56 if census_2010 == 3000
replace weight = 181 if census_2010 == 3010
replace weight = 102 if census_2010 == 3030
replace weight = 28 if census_2010 == 3040
replace weight = 274 if census_2010 == 3050
replace weight = 822 if census_2010 == 3060
replace weight = 82 if census_2010 == 3110
replace weight = 6 if census_2010 == 3120
replace weight = 19 if census_2010 == 3140
replace weight = 112 if census_2010 == 3150
replace weight = 222 if census_2010 == 3160
replace weight = 14 if census_2010 == 3200
replace weight = 14 if census_2010 == 3210
replace weight = 134 if census_2010 == 3220
replace weight = 125 if census_2010 == 3230
replace weight = 2 if census_2010 == 3235
replace weight = 138 if census_2010 == 3245
replace weight = 71 if census_2010 == 3250
replace weight = 2706 if census_2010 == 3255
replace weight = 33 if census_2010 == 3256
replace weight = 5 if census_2010 == 3257
replace weight = 100 if census_2010 == 3258
replace weight = 26 if census_2010 == 3260
replace weight = 321 if census_2010 == 3300
replace weight = 148 if census_2010 == 3310
replace weight = 342 if census_2010 == 3320
replace weight = 185 if census_2010 == 3400
replace weight = 511 if census_2010 == 3420
replace weight = 560 if census_2010 == 3500
replace weight = 116 if census_2010 == 3510
replace weight = 51 if census_2010 == 3520
replace weight = 167 if census_2010 == 3535
replace weight = 70 if census_2010 == 3540
replace weight = 1981 if census_2010 == 3600
replace weight = 17 if census_2010 == 3610
replace weight = 75 if census_2010 == 3620
replace weight = 146 if census_2010 == 3630
replace weight = 307 if census_2010 == 3640
replace weight = 395 if census_2010 == 3645
replace weight = 74 if census_2010 == 3646
replace weight = 48 if census_2010 == 3647
replace weight = 38 if census_2010 == 3648
replace weight = 119 if census_2010 == 3649
replace weight = 158 if census_2010 == 3655
replace weight = 42 if census_2010 == 3700
replace weight = 107 if census_2010 == 3710
replace weight = 44 if census_2010 == 3720
replace weight = 111 if census_2010 == 3730
replace weight = 305 if census_2010 == 3740
replace weight = 20 if census_2010 == 3750
replace weight = 446 if census_2010 == 3800
replace weight = 151 if census_2010 == 3820
replace weight = 6 if census_2010 == 3830
replace weight = 7 if census_2010 == 3840
replace weight = 668 if census_2010 == 3850
replace weight = 8 if census_2010 == 3860
replace weight = 6 if census_2010 == 3900
replace weight = 92 if census_2010 == 3910
replace weight = 963 if census_2010 == 3930
replace weight = 59 if census_2010 == 3940
replace weight = 27 if census_2010 == 3945
replace weight = 146 if census_2010 == 3955
replace weight = 347 if census_2010 == 4000
replace weight = 505 if census_2010 == 4010
replace weight = 1990 if census_2010 == 4020
replace weight = 784 if census_2010 == 4030
replace weight = 392 if census_2010 == 4040
replace weight = 326 if census_2010 == 4050
replace weight = 255 if census_2010 == 4060
replace weight = 2059 if census_2010 == 4110
replace weight = 181 if census_2010 == 4120
replace weight = 347 if census_2010 == 4130
replace weight = 273 if census_2010 == 4140
replace weight = 286 if census_2010 == 4150
replace weight = 4 if census_2010 == 4160
replace weight = 292 if census_2010 == 4200
replace weight = 274 if census_2010 == 4210
replace weight = 2186 if census_2010 == 4220
replace weight = 1419 if census_2010 == 4230
replace weight = 75 if census_2010 == 4240
replace weight = 1247 if census_2010 == 4250
replace weight = 120 if census_2010 == 4300
replace weight = 192 if census_2010 == 4320
replace weight = 49 if census_2010 == 4340
replace weight = 179 if census_2010 == 4350
replace weight = 113 if census_2010 == 4400
replace weight = 8 if census_2010 == 4410
replace weight = 46 if census_2010 == 4420
replace weight = 182 if census_2010 == 4430
replace weight = 8 if census_2010 == 4460
replace weight = 23 if census_2010 == 4465
replace weight = 89 if census_2010 == 4500
replace weight = 758 if census_2010 == 4510
replace weight = 251 if census_2010 == 4520
replace weight = 81 if census_2010 == 4530
replace weight = 38 if census_2010 == 4540
replace weight = 1231 if census_2010 == 4600
replace weight = 1057 if census_2010 == 4610
replace weight = 390 if census_2010 == 4620
replace weight = 59 if census_2010 == 4640
replace weight = 105 if census_2010 == 4650
replace weight = 3217 if census_2010 == 4700
replace weight = 1088 if census_2010 == 4710
replace weight = 3158 if census_2010 == 4720
replace weight = 139 if census_2010 == 4740
replace weight = 131 if census_2010 == 4750
replace weight = 3224 if census_2010 == 4760
replace weight = 254 if census_2010 == 4800
replace weight = 531 if census_2010 == 4810
replace weight = 267 if census_2010 == 4820
replace weight = 69 if census_2010 == 4830
replace weight = 503 if census_2010 == 4840
replace weight = 1297 if census_2010 == 4850
replace weight = 78 if census_2010 == 4900
replace weight = 811 if census_2010 == 4920
replace weight = 30 if census_2010 == 4930
replace weight = 108 if census_2010 == 4940
replace weight = 201 if census_2010 == 4950
replace weight = 226 if census_2010 == 4965
replace weight = 1423 if census_2010 == 5000
replace weight = 39 if census_2010 == 5010
replace weight = 40 if census_2010 == 5020
replace weight = 7 if census_2010 == 5030
replace weight = 211 if census_2010 == 5100
replace weight = 471 if census_2010 == 5110
replace weight = 1300 if census_2010 == 5120
replace weight = 5 if census_2010 == 5130
replace weight = 168 if census_2010 == 5140
replace weight = 26 if census_2010 == 5150
replace weight = 413 if census_2010 == 5160
replace weight = 64 if census_2010 == 5165
replace weight = 11 if census_2010 == 5200
replace weight = 12 if census_2010 == 5210
replace weight = 86 if census_2010 == 5220
replace weight = 45 if census_2010 == 5230
replace weight = 1916 if census_2010 == 5240
replace weight = 85 if census_2010 == 5250
replace weight = 334 if census_2010 == 5260
replace weight = 135 if census_2010 == 5300
replace weight = 153 if census_2010 == 5310
replace weight = 113 if census_2010 == 5320
replace weight = 117 if census_2010 == 5330
replace weight = 33 if census_2010 == 5340
replace weight = 113 if census_2010 == 5350
replace weight = 40 if census_2010 == 5360
replace weight = 1259 if census_2010 == 5400
replace weight = 99 if census_2010 == 5410
replace weight = 118 if census_2010 == 5420
replace weight = 8 if census_2010 == 5500
replace weight = 249 if census_2010 == 5510
replace weight = 239 if census_2010 == 5520
replace weight = 28 if census_2010 == 5530
replace weight = 146 if census_2010 == 5540
replace weight = 348 if census_2010 == 5550
replace weight = 60 if census_2010 == 5560
replace weight = 236 if census_2010 == 5600
replace weight = 559 if census_2010 == 5610
replace weight = 1503 if census_2010 == 5620
replace weight = 70 if census_2010 == 5630
replace weight = 2871 if census_2010 == 5700
replace weight = 126 if census_2010 == 5800
replace weight = 334 if census_2010 == 5810
replace weight = 136 if census_2010 == 5820
replace weight = 2 if census_2010 == 5830
replace weight = 246 if census_2010 == 5840
replace weight = 93 if census_2010 == 5850
replace weight = 1061 if census_2010 == 5860
replace weight = 45 if census_2010 == 5900
replace weight = 7 if census_2010 == 5910
replace weight = 18 if census_2010 == 5920
replace weight = 513 if census_2010 == 5940
replace weight = 52 if census_2010 == 6005
replace weight = 22 if census_2010 == 6010
replace weight = 10 if census_2010 == 6020
replace weight = 95 if census_2010 == 6040
replace weight = 708 if census_2010 == 6050
replace weight = 37 if census_2010 == 6100
replace weight = 2 if census_2010 == 6110
replace weight = 14 if census_2010 == 6120
replace weight = 61 if census_2010 == 6130
replace weight = 634 if census_2010 == 6200
replace weight = 19 if census_2010 == 6210
replace weight = 146 if census_2010 == 6220
replace weight = 1330 if census_2010 == 6230
replace weight = 189 if census_2010 == 6240
replace weight = 70 if census_2010 == 6250
replace weight = 1253 if census_2010 == 6260
replace weight = 21 if census_2010 == 6300
replace weight = 1 if census_2010 == 6310
replace weight = 369 if census_2010 == 6320
replace weight = 150 if census_2010 == 6330
replace weight = 682 if census_2010 == 6355
replace weight = 48 if census_2010 == 6360
replace weight = 47 if census_2010 == 6400
replace weight = 528 if census_2010 == 6420
replace weight = 8 if census_2010 == 6430
replace weight = 519 if census_2010 == 6440
replace weight = 24 if census_2010 == 6460
replace weight = 7 if census_2010 == 6500
replace weight = 222 if census_2010 == 6515
replace weight = 126 if census_2010 == 6520
replace weight = 66 if census_2010 == 6530
replace weight = 5 if census_2010 == 6540
replace weight = 63 if census_2010 == 6600
replace weight = 75 if census_2010 == 6660
replace weight = 30 if census_2010 == 6700
replace weight = 45 if census_2010 == 6710
replace weight = 32 if census_2010 == 6720
replace weight = 105 if census_2010 == 6730
replace weight = 7 if census_2010 == 6740
replace weight = 11 if census_2010 == 6750
replace weight = 36 if census_2010 == 6765
replace weight = 46 if census_2010 == 6800
replace weight = 23 if census_2010 == 6820
replace weight = 9 if census_2010 == 6830
replace weight = 78 if census_2010 == 6840
replace weight = 10 if census_2010 == 6910
replace weight = 17 if census_2010 == 6920
replace weight = 8 if census_2010 == 6930
replace weight = 68 if census_2010 == 6940
replace weight = 313 if census_2010 == 7000
replace weight = 305 if census_2010 == 7010
replace weight = 150 if census_2010 == 7020
replace weight = 16 if census_2010 == 7030
replace weight = 35 if census_2010 == 7040
replace weight = 6 if census_2010 == 7050
replace weight = 14 if census_2010 == 7100
replace weight = 20 if census_2010 == 7110
replace weight = 38 if census_2010 == 7120
replace weight = 53 if census_2010 == 7130
replace weight = 164 if census_2010 == 7140
replace weight = 140 if census_2010 == 7150
replace weight = 17 if census_2010 == 7160
replace weight = 855 if census_2010 == 7200
replace weight = 312 if census_2010 == 7210
replace weight = 199 if census_2010 == 7220
replace weight = 52 if census_2010 == 7240
replace weight = 95 if census_2010 == 7260
replace weight = 24 if census_2010 == 7300
replace weight = 338 if census_2010 == 7315
replace weight = 43 if census_2010 == 7320
replace weight = 433 if census_2010 == 7330
replace weight = 422 if census_2010 == 7340
replace weight = 38 if census_2010 == 7350
replace weight = 58 if census_2010 == 7360
replace weight = 124 if census_2010 == 7410
replace weight = 201 if census_2010 == 7420
replace weight = 76 if census_2010 == 7430
replace weight = 2 if census_2010 == 7440
replace weight = 46 if census_2010 == 7510
replace weight = 0 if census_2010 == 7520
replace weight = 28 if census_2010 == 7540
replace weight = 7 if census_2010 == 7550
replace weight = 14 if census_2010 == 7560
replace weight = 5 if census_2010 == 7600
replace weight = 24 if census_2010 == 7610
replace weight = 215 if census_2010 == 7630
replace weight = 727 if census_2010 == 7700
replace weight = 20 if census_2010 == 7710
replace weight = 156 if census_2010 == 7720
replace weight = 34 if census_2010 == 7730
replace weight = 32 if census_2010 == 7740
replace weight = 860 if census_2010 == 7750
replace weight = 207 if census_2010 == 7800
replace weight = 342 if census_2010 == 7810
replace weight = 12 if census_2010 == 7830
replace weight = 90 if census_2010 == 7840
replace weight = 24 if census_2010 == 7850
replace weight = 115 if census_2010 == 7855
replace weight = 72 if census_2010 == 7900
replace weight = 13 if census_2010 == 7920
replace weight = 6 if census_2010 == 7930
replace weight = 8 if census_2010 == 7940
replace weight = 100 if census_2010 == 7950
replace weight = 5 if census_2010 == 7960
replace weight = 65 if census_2010 == 8000
replace weight = 15 if census_2010 == 8010
replace weight = 4 if census_2010 == 8020
replace weight = 419 if census_2010 == 8030
replace weight = 16 if census_2010 == 8040
replace weight = 7 if census_2010 == 8060
replace weight = 45 if census_2010 == 8100
replace weight = 5 if census_2010 == 8120
replace weight = 66 if census_2010 == 8130
replace weight = 505 if census_2010 == 8140
replace weight = 4 if census_2010 == 8150
replace weight = 6 if census_2010 == 8160
replace weight = 15 if census_2010 == 8200
replace weight = 7 if census_2010 == 8210
replace weight = 368 if census_2010 == 8220
replace weight = 41 if census_2010 == 8250
replace weight = 217 if census_2010 == 8255
replace weight = 16 if census_2010 == 8256
replace weight = 174 if census_2010 == 8300
replace weight = 48 if census_2010 == 8310
replace weight = 169 if census_2010 == 8320
replace weight = 11 if census_2010 == 8330
replace weight = 8 if census_2010 == 8340
replace weight = 94 if census_2010 == 8350
replace weight = 1 if census_2010 == 8360
replace weight = 5 if census_2010 == 8400
replace weight = 14 if census_2010 == 8410
replace weight = 16 if census_2010 == 8420
replace weight = 1 if census_2010 == 8430
replace weight = 5 if census_2010 == 8440
replace weight = 47 if census_2010 == 8450
replace weight = 22 if census_2010 == 8460
replace weight = 66 if census_2010 == 8500
replace weight = 17 if census_2010 == 8510
replace weight = 1 if census_2010 == 8520
replace weight = 32 if census_2010 == 8530
replace weight = 20 if census_2010 == 8540
replace weight = 21 if census_2010 == 8550
replace weight = 50 if census_2010 == 8600
replace weight = 95 if census_2010 == 8610
replace weight = 71 if census_2010 == 8620
replace weight = 39 if census_2010 == 8630
replace weight = 65 if census_2010 == 8640
replace weight = 94 if census_2010 == 8650
replace weight = 84 if census_2010 == 8710
replace weight = 34 if census_2010 == 8720
replace weight = 11 if census_2010 == 8730
replace weight = 647 if census_2010 == 8740
replace weight = 41 if census_2010 == 8750
replace weight = 87 if census_2010 == 8760
replace weight = 288 if census_2010 == 8800
replace weight = 120 if census_2010 == 8810
replace weight = 43 if census_2010 == 8830
replace weight = 3 if census_2010 == 8840
replace weight = 9 if census_2010 == 8850
replace weight = 11 if census_2010 == 8860
replace weight = 3 if census_2010 == 8900
replace weight = 10 if census_2010 == 8910
replace weight = 37 if census_2010 == 8920
replace weight = 37 if census_2010 == 8930
replace weight = 20 if census_2010 == 8940
replace weight = 54 if census_2010 == 8950
replace weight = 777 if census_2010 == 8965
replace weight = 228 if census_2010 == 9000
replace weight = 121 if census_2010 == 9030
replace weight = 43 if census_2010 == 9040
replace weight = 88 if census_2010 == 9050
replace weight = 13 if census_2010 == 9110
replace weight = 573 if census_2010 == 9120
replace weight = 3059 if census_2010 == 9130
replace weight = 342 if census_2010 == 9140
replace weight = 62 if census_2010 == 9150
replace weight = 45 if census_2010 == 9200
replace weight = 5 if census_2010 == 9230
replace weight = 52 if census_2010 == 9240
replace weight = 11 if census_2010 == 9260
replace weight = 22 if census_2010 == 9300
replace weight = 37 if census_2010 == 9310
replace weight = 8 if census_2010 == 9330
replace weight = 6 if census_2010 == 9340
replace weight = 73 if census_2010 == 9350
replace weight = 76 if census_2010 == 9360
replace weight = 32 if census_2010 == 9410
replace weight = 32 if census_2010 == 9415
replace weight = 16 if census_2010 == 9420
replace weight = 5 if census_2010 == 9500
replace weight = 63 if census_2010 == 9510
replace weight = 51 if census_2010 == 9520
replace weight = 4 if census_2010 == 9560
replace weight = 528 if census_2010 == 9600
replace weight = 331 if census_2010 == 9610
replace weight = 1787 if census_2010 == 9620
replace weight = 36 if census_2010 == 9630
replace weight = 393 if census_2010 == 9640
replace weight = 21 if census_2010 == 9650
replace weight = 92 if census_2010 == 9720
replace weight = 1 if census_2010 == 9730
replace weight = 3 if census_2010 == 9740
replace weight = 62 if census_2010 == 9750
