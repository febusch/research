// Generates task and routine variables that will be merged with SOEP data.
// Requires 1991, 1998, 2006, and 2012 Employment Surveys.


// **************** //
// ***** 1991 ***** //
// **************** //

* load data
use "input/ZA2565_1992/ZA2565.dta", clear
keep v55 v77 v186 v187 v140 v160 v161 v162 v86 v61 v185 v48 v49 v180 v182 v177 v178 v179 v181 v176 v174 v175 v316 v16 v318

* rename vars
ren v16 occ

* clean occ KldB 88 4-digit
//note: some codes in the data do not correspond to any category so we change them to fitting group
gen occ_88_4d = occ
recode occ_88_4d (2701 = 2700) (2821 = 2820) (6246 = 6240) (6842 = 6841) (7328 = 7321) (7427 = 7420) (7530 = 7531) (7990 = .) (8583 = .) (8671 = .) (9613 = .)

* create occ KldB 92 3-digit
gen occ_92_3d = .
replace occ_92_3d=11 if occ_88_4d==110
replace occ_92_3d=11 if occ_88_4d==111
replace occ_92_3d=11 if occ_88_4d==112
replace occ_92_3d=11 if occ_88_4d==113
replace occ_92_3d=11 if occ_88_4d==114
replace occ_92_3d=11 if occ_88_4d==115
replace occ_92_3d=11 if occ_88_4d==116
replace occ_92_3d=11 if occ_88_4d==118
replace occ_92_3d=11 if occ_88_4d==119
replace occ_92_3d=12 if occ_88_4d==120
replace occ_92_3d=12 if occ_88_4d==121
replace occ_92_3d=12 if occ_88_4d==129
replace occ_92_3d=23 if occ_88_4d==210
replace occ_92_3d=23 if occ_88_4d==211
replace occ_92_3d=23 if occ_88_4d==212
replace occ_92_3d=23 if occ_88_4d==213
replace occ_92_3d=23 if occ_88_4d==214
replace occ_92_3d=23 if occ_88_4d==215
replace occ_92_3d=23 if occ_88_4d==216
replace occ_92_3d=23 if occ_88_4d==217
replace occ_92_3d=23 if occ_88_4d==218
replace occ_92_3d=23 if occ_88_4d==219
replace occ_92_3d=23 if occ_88_4d==220
replace occ_92_3d=23 if occ_88_4d==221
replace occ_92_3d=23 if occ_88_4d==222
replace occ_92_3d=23 if occ_88_4d==223
replace occ_92_3d=23 if occ_88_4d==227
replace occ_92_3d=23 if occ_88_4d==229
replace occ_92_3d=31 if occ_88_4d==311
replace occ_92_3d=31 if occ_88_4d==312
replace occ_92_3d=31 if occ_88_4d==319
replace occ_92_3d=32 if occ_88_4d==321
replace occ_92_3d=32 if occ_88_4d==322
replace occ_92_3d=32 if occ_88_4d==323
replace occ_92_3d=32 if occ_88_4d==324
replace occ_92_3d=32 if occ_88_4d==325
replace occ_92_3d=32 if occ_88_4d==329
replace occ_92_3d=13 if occ_88_4d==410
replace occ_92_3d=13 if occ_88_4d==411
replace occ_92_3d=13 if occ_88_4d==412
replace occ_92_3d=13 if occ_88_4d==413
replace occ_92_3d=13 if occ_88_4d==414
replace occ_92_3d=13 if occ_88_4d==415
replace occ_92_3d=13 if occ_88_4d==417
replace occ_92_3d=13 if occ_88_4d==419
replace occ_92_3d=13 if occ_88_4d==421
replace occ_92_3d=14 if occ_88_4d==431
replace occ_92_3d=24 if occ_88_4d==440
replace occ_92_3d=24 if occ_88_4d==441
replace occ_92_3d=24 if occ_88_4d==442
replace occ_92_3d=24 if occ_88_4d==443
replace occ_92_3d=24 if occ_88_4d==444
replace occ_92_3d=24 if occ_88_4d==445
replace occ_92_3d=24 if occ_88_4d==446
replace occ_92_3d=24 if occ_88_4d==447
replace occ_92_3d=24 if occ_88_4d==448
replace occ_92_3d=24 if occ_88_4d==449
replace occ_92_3d=51 if occ_88_4d==510
replace occ_92_3d=51 if occ_88_4d==511
replace occ_92_3d=51 if occ_88_4d==512
replace occ_92_3d=51 if occ_88_4d==513
replace occ_92_3d=51 if occ_88_4d==514
replace occ_92_3d=51 if occ_88_4d==515
replace occ_92_3d=51 if occ_88_4d==517
replace occ_92_3d=51 if occ_88_4d==519
replace occ_92_3d=52 if occ_88_4d==521
replace occ_92_3d=52 if occ_88_4d==522
replace occ_92_3d=52 if occ_88_4d==523
replace occ_92_3d=52 if occ_88_4d==524
replace occ_92_3d=52 if occ_88_4d==525
replace occ_92_3d=53 if occ_88_4d==531
replace occ_92_3d=53 if occ_88_4d==532
replace occ_92_3d=53 if occ_88_4d==537
replace occ_92_3d=61 if occ_88_4d==611
replace occ_92_3d=61 if occ_88_4d==613
replace occ_92_3d=61 if occ_88_4d==614
replace occ_92_3d=61 if occ_88_4d==615
replace occ_92_3d=61 if occ_88_4d==616
replace occ_92_3d=61 if occ_88_4d==618
replace occ_92_3d=61 if occ_88_4d==619
replace occ_92_3d=62 if occ_88_4d==621
replace occ_92_3d=62 if occ_88_4d==622
replace occ_92_3d=62 if occ_88_4d==623
replace occ_92_3d=62 if occ_88_4d==624
replace occ_92_3d=62 if occ_88_4d==627
replace occ_92_3d=62 if occ_88_4d==628
replace occ_92_3d=62 if occ_88_4d==629
replace occ_92_3d=70 if occ_88_4d==710
replace occ_92_3d=70 if occ_88_4d==711
replace occ_92_3d=70 if occ_88_4d==712
replace occ_92_3d=71 if occ_88_4d==713
replace occ_92_3d=71 if occ_88_4d==714
replace occ_92_3d=71 if occ_88_4d==717
replace occ_92_3d=71 if occ_88_4d==719
replace occ_92_3d=72 if occ_88_4d==721
replace occ_92_3d=72 if occ_88_4d==722
replace occ_92_3d=72 if occ_88_4d==723
replace occ_92_3d=72 if occ_88_4d==727
replace occ_92_3d=72 if occ_88_4d==729
replace occ_92_3d=80 if occ_88_4d==810
replace occ_92_3d=80 if occ_88_4d==811
replace occ_92_3d=80 if occ_88_4d==812
replace occ_92_3d=80 if occ_88_4d==814
replace occ_92_3d=80 if occ_88_4d==817
replace occ_92_3d=80 if occ_88_4d==819
replace occ_92_3d=80 if occ_88_4d==820
replace occ_92_3d=80 if occ_88_4d==821
replace occ_92_3d=80 if occ_88_4d==822
replace occ_92_3d=80 if occ_88_4d==823
replace occ_92_3d=80 if occ_88_4d==827
replace occ_92_3d=80 if occ_88_4d==829
replace occ_92_3d=80 if occ_88_4d==830
replace occ_92_3d=80 if occ_88_4d==831
replace occ_92_3d=80 if occ_88_4d==837
replace occ_92_3d=80 if occ_88_4d==839
replace occ_92_3d=80 if occ_88_4d==910
replace occ_92_3d=80 if occ_88_4d==911
replace occ_92_3d=80 if occ_88_4d==912
replace occ_92_3d=80 if occ_88_4d==913
replace occ_92_3d=80 if occ_88_4d==914
replace occ_92_3d=80 if occ_88_4d==915
replace occ_92_3d=80 if occ_88_4d==916
replace occ_92_3d=80 if occ_88_4d==917
replace occ_92_3d=80 if occ_88_4d==918
replace occ_92_3d=80 if occ_88_4d==919
replace occ_92_3d=101 if occ_88_4d==1010
replace occ_92_3d=101 if occ_88_4d==1011
replace occ_92_3d=101 if occ_88_4d==1012
replace occ_92_3d=101 if occ_88_4d==1013
replace occ_92_3d=101 if occ_88_4d==1014
replace occ_92_3d=101 if occ_88_4d==1015
replace occ_92_3d=101 if occ_88_4d==1016
replace occ_92_3d=101 if occ_88_4d==1017
replace occ_92_3d=101 if occ_88_4d==1019
replace occ_92_3d=101 if occ_88_4d==1020
replace occ_92_3d=101 if occ_88_4d==1021
replace occ_92_3d=101 if occ_88_4d==1022
replace occ_92_3d=101 if occ_88_4d==1023
replace occ_92_3d=101 if occ_88_4d==1024
replace occ_92_3d=101 if occ_88_4d==1025
replace occ_92_3d=101 if occ_88_4d==1026
replace occ_92_3d=101 if occ_88_4d==1027
replace occ_92_3d=101 if occ_88_4d==1029
replace occ_92_3d=112 if occ_88_4d==1110
replace occ_92_3d=112 if occ_88_4d==1111
replace occ_92_3d=112 if occ_88_4d==1112
replace occ_92_3d=112 if occ_88_4d==1113
replace occ_92_3d=112 if occ_88_4d==1117
replace occ_92_3d=112 if occ_88_4d==1119
replace occ_92_3d=112 if occ_88_4d==1120
replace occ_92_3d=112 if occ_88_4d==1121
replace occ_92_3d=112 if occ_88_4d==1122
replace occ_92_3d=112 if occ_88_4d==1123
replace occ_92_3d=112 if occ_88_4d==1124
replace occ_92_3d=112 if occ_88_4d==1125
replace occ_92_3d=112 if occ_88_4d==1127
replace occ_92_3d=112 if occ_88_4d==1129
replace occ_92_3d=121 if occ_88_4d==1210
replace occ_92_3d=121 if occ_88_4d==1211
replace occ_92_3d=121 if occ_88_4d==1212
replace occ_92_3d=121 if occ_88_4d==1213
replace occ_92_3d=121 if occ_88_4d==1214
replace occ_92_3d=121 if occ_88_4d==1215
replace occ_92_3d=121 if occ_88_4d==1216
replace occ_92_3d=121 if occ_88_4d==1217
replace occ_92_3d=121 if occ_88_4d==1218
replace occ_92_3d=121 if occ_88_4d==1219
replace occ_92_3d=131 if occ_88_4d==1310
replace occ_92_3d=131 if occ_88_4d==1311
replace occ_92_3d=131 if occ_88_4d==1312
replace occ_92_3d=131 if occ_88_4d==1317
replace occ_92_3d=131 if occ_88_4d==1320
replace occ_92_3d=131 if occ_88_4d==1321
replace occ_92_3d=131 if occ_88_4d==1322
replace occ_92_3d=131 if occ_88_4d==1323
replace occ_92_3d=131 if occ_88_4d==1324
replace occ_92_3d=131 if occ_88_4d==1327
replace occ_92_3d=131 if occ_88_4d==1329
replace occ_92_3d=131 if occ_88_4d==1330
replace occ_92_3d=131 if occ_88_4d==1331
replace occ_92_3d=131 if occ_88_4d==1332
replace occ_92_3d=131 if occ_88_4d==1333
replace occ_92_3d=131 if occ_88_4d==1334
replace occ_92_3d=131 if occ_88_4d==1335
replace occ_92_3d=131 if occ_88_4d==1336
replace occ_92_3d=131 if occ_88_4d==1337
replace occ_92_3d=131 if occ_88_4d==1339
replace occ_92_3d=131 if occ_88_4d==1340
replace occ_92_3d=131 if occ_88_4d==1341
replace occ_92_3d=131 if occ_88_4d==1342
replace occ_92_3d=131 if occ_88_4d==1343
replace occ_92_3d=131 if occ_88_4d==1344
replace occ_92_3d=131 if occ_88_4d==1345
replace occ_92_3d=131 if occ_88_4d==1349
replace occ_92_3d=135 if occ_88_4d==1350
replace occ_92_3d=135 if occ_88_4d==1351
replace occ_92_3d=135 if occ_88_4d==1352
replace occ_92_3d=135 if occ_88_4d==1353
replace occ_92_3d=135 if occ_88_4d==1354
replace occ_92_3d=135 if occ_88_4d==1355
replace occ_92_3d=135 if occ_88_4d==1356
replace occ_92_3d=135 if occ_88_4d==1357
replace occ_92_3d=135 if occ_88_4d==1358
replace occ_92_3d=135 if occ_88_4d==1359
replace occ_92_3d=141 if occ_88_4d==1410
replace occ_92_3d=141 if occ_88_4d==1411
replace occ_92_3d=141 if occ_88_4d==1412
replace occ_92_3d=141 if occ_88_4d==1413
replace occ_92_3d=141 if occ_88_4d==1414
replace occ_92_3d=141 if occ_88_4d==1416
replace occ_92_3d=141 if occ_88_4d==1417
replace occ_92_3d=141 if occ_88_4d==1419
replace occ_92_3d=142 if occ_88_4d==1421
replace occ_92_3d=142 if occ_88_4d==1427
replace occ_92_3d=145 if occ_88_4d==1430
replace occ_92_3d=145 if occ_88_4d==1431
replace occ_92_3d=145 if occ_88_4d==1432
replace occ_92_3d=145 if occ_88_4d==1433
replace occ_92_3d=145 if occ_88_4d==1434
replace occ_92_3d=145 if occ_88_4d==1436
replace occ_92_3d=145 if occ_88_4d==1437
replace occ_92_3d=145 if occ_88_4d==1438
replace occ_92_3d=145 if occ_88_4d==1439
replace occ_92_3d=145 if occ_88_4d==1440
replace occ_92_3d=145 if occ_88_4d==1441
replace occ_92_3d=145 if occ_88_4d==1447
replace occ_92_3d=145 if occ_88_4d==1449
replace occ_92_3d=150 if occ_88_4d==1510
replace occ_92_3d=152 if occ_88_4d==1511
replace occ_92_3d=152 if occ_88_4d==1512
replace occ_92_3d=152 if occ_88_4d==1513
replace occ_92_3d=153 if occ_88_4d==1514
replace occ_92_3d=153 if occ_88_4d==1515
replace occ_92_3d=153 if occ_88_4d==1516
replace occ_92_3d=150 if occ_88_4d==1517
replace occ_92_3d=153 if occ_88_4d==1518
replace occ_92_3d=150 if occ_88_4d==1519
replace occ_92_3d=161 if occ_88_4d==1610
replace occ_92_3d=161 if occ_88_4d==1611
replace occ_92_3d=161 if occ_88_4d==1612
replace occ_92_3d=161 if occ_88_4d==1613
replace occ_92_3d=161 if occ_88_4d==1614
replace occ_92_3d=161 if occ_88_4d==1615
replace occ_92_3d=161 if occ_88_4d==1616
replace occ_92_3d=161 if occ_88_4d==1617
replace occ_92_3d=161 if occ_88_4d==1619
replace occ_92_3d=162 if occ_88_4d==1620
replace occ_92_3d=162 if occ_88_4d==1621
replace occ_92_3d=162 if occ_88_4d==1622
replace occ_92_3d=162 if occ_88_4d==1623
replace occ_92_3d=162 if occ_88_4d==1624
replace occ_92_3d=162 if occ_88_4d==1627
replace occ_92_3d=162 if occ_88_4d==1629
replace occ_92_3d=178 if occ_88_4d==1630
replace occ_92_3d=178 if occ_88_4d==1631
replace occ_92_3d=178 if occ_88_4d==1632
replace occ_92_3d=178 if occ_88_4d==1637
replace occ_92_3d=178 if occ_88_4d==1639
replace occ_92_3d=164 if occ_88_4d==1640
replace occ_92_3d=164 if occ_88_4d==1641
replace occ_92_3d=164 if occ_88_4d==1642
replace occ_92_3d=164 if occ_88_4d==1643
replace occ_92_3d=164 if occ_88_4d==1644
replace occ_92_3d=164 if occ_88_4d==1645
replace occ_92_3d=164 if occ_88_4d==1647
replace occ_92_3d=164 if occ_88_4d==1649
replace occ_92_3d=171 if occ_88_4d==1710
replace occ_92_3d=171 if occ_88_4d==1711
replace occ_92_3d=171 if occ_88_4d==1712
replace occ_92_3d=171 if occ_88_4d==1713
replace occ_92_3d=171 if occ_88_4d==1714
replace occ_92_3d=171 if occ_88_4d==1715
replace occ_92_3d=171 if occ_88_4d==1719
replace occ_92_3d=173 if occ_88_4d==1720
replace occ_92_3d=173 if occ_88_4d==1721
replace occ_92_3d=173 if occ_88_4d==1722
replace occ_92_3d=173 if occ_88_4d==1723
replace occ_92_3d=173 if occ_88_4d==1724
replace occ_92_3d=173 if occ_88_4d==1725
replace occ_92_3d=173 if occ_88_4d==1726
replace occ_92_3d=173 if occ_88_4d==1729
replace occ_92_3d=174 if occ_88_4d==1730
replace occ_92_3d=174 if occ_88_4d==1731
replace occ_92_3d=174 if occ_88_4d==1732
replace occ_92_3d=174 if occ_88_4d==1739
replace occ_92_3d=174 if occ_88_4d==1740
replace occ_92_3d=174 if occ_88_4d==1741
replace occ_92_3d=174 if occ_88_4d==1742
replace occ_92_3d=174 if occ_88_4d==1743
replace occ_92_3d=174 if occ_88_4d==1749
replace occ_92_3d=175 if occ_88_4d==1750
replace occ_92_3d=175 if occ_88_4d==1751
replace occ_92_3d=175 if occ_88_4d==1753
replace occ_92_3d=175 if occ_88_4d==1754
replace occ_92_3d=175 if occ_88_4d==1759
replace occ_92_3d=176 if occ_88_4d==1760
replace occ_92_3d=176 if occ_88_4d==1761
replace occ_92_3d=176 if occ_88_4d==1763
replace occ_92_3d=176 if occ_88_4d==1764
replace occ_92_3d=176 if occ_88_4d==1769
replace occ_92_3d=179 if occ_88_4d==1771
replace occ_92_3d=179 if occ_88_4d==1777
replace occ_92_3d=181 if occ_88_4d==1810
replace occ_92_3d=181 if occ_88_4d==1811
replace occ_92_3d=181 if occ_88_4d==1812
replace occ_92_3d=181 if occ_88_4d==1813
replace occ_92_3d=181 if occ_88_4d==1814
replace occ_92_3d=181 if occ_88_4d==1815
replace occ_92_3d=181 if occ_88_4d==1817
replace occ_92_3d=181 if occ_88_4d==1818
replace occ_92_3d=181 if occ_88_4d==1819
replace occ_92_3d=185 if occ_88_4d==1821
replace occ_92_3d=185 if occ_88_4d==1822
replace occ_92_3d=185 if occ_88_4d==1823
replace occ_92_3d=185 if occ_88_4d==1824
replace occ_92_3d=185 if occ_88_4d==1825
replace occ_92_3d=185 if occ_88_4d==1827
replace occ_92_3d=185 if occ_88_4d==1829
replace occ_92_3d=185 if occ_88_4d==1830
replace occ_92_3d=185 if occ_88_4d==1831
replace occ_92_3d=185 if occ_88_4d==1832
replace occ_92_3d=185 if occ_88_4d==1833
replace occ_92_3d=185 if occ_88_4d==1834
replace occ_92_3d=185 if occ_88_4d==1835
replace occ_92_3d=185 if occ_88_4d==1837
replace occ_92_3d=185 if occ_88_4d==1839
replace occ_92_3d=185 if occ_88_4d==1841
replace occ_92_3d=185 if occ_88_4d==1842
replace occ_92_3d=185 if occ_88_4d==1847
replace occ_92_3d=191 if occ_88_4d==1910
replace occ_92_3d=191 if occ_88_4d==1911
replace occ_92_3d=191 if occ_88_4d==1912
replace occ_92_3d=191 if occ_88_4d==1913
replace occ_92_3d=191 if occ_88_4d==1914
replace occ_92_3d=191 if occ_88_4d==1917
replace occ_92_3d=191 if occ_88_4d==1919
replace occ_92_3d=194 if occ_88_4d==1920
replace occ_92_3d=194 if occ_88_4d==1921
replace occ_92_3d=194 if occ_88_4d==1922
replace occ_92_3d=194 if occ_88_4d==1923
replace occ_92_3d=194 if occ_88_4d==1927
replace occ_92_3d=194 if occ_88_4d==1929
replace occ_92_3d=194 if occ_88_4d==1930
replace occ_92_3d=194 if occ_88_4d==1931
replace occ_92_3d=194 if occ_88_4d==1932
replace occ_92_3d=194 if occ_88_4d==1937
replace occ_92_3d=194 if occ_88_4d==1939
replace occ_92_3d=201 if occ_88_4d==2010
replace occ_92_3d=201 if occ_88_4d==2011
replace occ_92_3d=201 if occ_88_4d==2012
replace occ_92_3d=201 if occ_88_4d==2013
replace occ_92_3d=201 if occ_88_4d==2017
replace occ_92_3d=201 if occ_88_4d==2019
replace occ_92_3d=201 if occ_88_4d==2020
replace occ_92_3d=201 if occ_88_4d==2021
replace occ_92_3d=201 if occ_88_4d==2022
replace occ_92_3d=201 if occ_88_4d==2023
replace occ_92_3d=201 if occ_88_4d==2024
replace occ_92_3d=201 if occ_88_4d==2025
replace occ_92_3d=201 if occ_88_4d==2027
replace occ_92_3d=201 if occ_88_4d==2029
replace occ_92_3d=201 if occ_88_4d==2031
replace occ_92_3d=201 if occ_88_4d==2032
replace occ_92_3d=201 if occ_88_4d==2037
replace occ_92_3d=211 if occ_88_4d==2111
replace occ_92_3d=211 if occ_88_4d==2112
replace occ_92_3d=211 if occ_88_4d==2113
replace occ_92_3d=211 if occ_88_4d==2114
replace occ_92_3d=211 if occ_88_4d==2117
replace occ_92_3d=211 if occ_88_4d==2119
replace occ_92_3d=212 if occ_88_4d==2120
replace occ_92_3d=212 if occ_88_4d==2121
replace occ_92_3d=212 if occ_88_4d==2122
replace occ_92_3d=212 if occ_88_4d==2123
replace occ_92_3d=212 if occ_88_4d==2124
replace occ_92_3d=212 if occ_88_4d==2125
replace occ_92_3d=212 if occ_88_4d==2126
replace occ_92_3d=212 if occ_88_4d==2127
replace occ_92_3d=212 if occ_88_4d==2128
replace occ_92_3d=212 if occ_88_4d==2129
replace occ_92_3d=213 if occ_88_4d==2131
replace occ_92_3d=213 if occ_88_4d==2132
replace occ_92_3d=213 if occ_88_4d==2133
replace occ_92_3d=213 if occ_88_4d==2134
replace occ_92_3d=213 if occ_88_4d==2135
replace occ_92_3d=213 if occ_88_4d==2137
replace occ_92_3d=213 if occ_88_4d==2139
replace occ_92_3d=221 if occ_88_4d==2210
replace occ_92_3d=221 if occ_88_4d==2211
replace occ_92_3d=221 if occ_88_4d==2212
replace occ_92_3d=221 if occ_88_4d==2213
replace occ_92_3d=221 if occ_88_4d==2214
replace occ_92_3d=221 if occ_88_4d==2215
replace occ_92_3d=221 if occ_88_4d==2217
replace occ_92_3d=221 if occ_88_4d==2219
replace occ_92_3d=222 if occ_88_4d==2220
replace occ_92_3d=222 if occ_88_4d==2221
replace occ_92_3d=222 if occ_88_4d==2222
replace occ_92_3d=222 if occ_88_4d==2223
replace occ_92_3d=222 if occ_88_4d==2227
replace occ_92_3d=222 if occ_88_4d==2229
replace occ_92_3d=229 if occ_88_4d==2230
replace occ_92_3d=229 if occ_88_4d==2231
replace occ_92_3d=229 if occ_88_4d==2232
replace occ_92_3d=229 if occ_88_4d==2237
replace occ_92_3d=229 if occ_88_4d==2239
replace occ_92_3d=224 if occ_88_4d==2240
replace occ_92_3d=224 if occ_88_4d==2241
replace occ_92_3d=224 if occ_88_4d==2242
replace occ_92_3d=224 if occ_88_4d==2247
replace occ_92_3d=224 if occ_88_4d==2249
replace occ_92_3d=225 if occ_88_4d==2250
replace occ_92_3d=225 if occ_88_4d==2251
replace occ_92_3d=225 if occ_88_4d==2252
replace occ_92_3d=225 if occ_88_4d==2253
replace occ_92_3d=225 if occ_88_4d==2254
replace occ_92_3d=225 if occ_88_4d==2255
replace occ_92_3d=225 if occ_88_4d==2256
replace occ_92_3d=225 if occ_88_4d==2257
replace occ_92_3d=225 if occ_88_4d==2258
replace occ_92_3d=225 if occ_88_4d==2259
replace occ_92_3d=229 if occ_88_4d==2261
replace occ_92_3d=229 if occ_88_4d==2262
replace occ_92_3d=229 if occ_88_4d==2263
replace occ_92_3d=229 if occ_88_4d==2269
replace occ_92_3d=231 if occ_88_4d==2310
replace occ_92_3d=231 if occ_88_4d==2311
replace occ_92_3d=231 if occ_88_4d==2312
replace occ_92_3d=231 if occ_88_4d==2317
replace occ_92_3d=231 if occ_88_4d==2319
replace occ_92_3d=294 if occ_88_4d==2320
replace occ_92_3d=294 if occ_88_4d==2321
replace occ_92_3d=294 if occ_88_4d==2323
replace occ_92_3d=294 if occ_88_4d==2324
replace occ_92_3d=294 if occ_88_4d==2327
replace occ_92_3d=294 if occ_88_4d==2329
replace occ_92_3d=233 if occ_88_4d==2330
replace occ_92_3d=233 if occ_88_4d==2331
replace occ_92_3d=233 if occ_88_4d==2332
replace occ_92_3d=233 if occ_88_4d==2333
replace occ_92_3d=233 if occ_88_4d==2337
replace occ_92_3d=233 if occ_88_4d==2339
replace occ_92_3d=234 if occ_88_4d==2340
replace occ_92_3d=234 if occ_88_4d==2341
replace occ_92_3d=234 if occ_88_4d==2342
replace occ_92_3d=234 if occ_88_4d==2343
replace occ_92_3d=234 if occ_88_4d==2347
replace occ_92_3d=234 if occ_88_4d==2349
replace occ_92_3d=235 if occ_88_4d==2350
replace occ_92_3d=235 if occ_88_4d==2351
replace occ_92_3d=235 if occ_88_4d==2352
replace occ_92_3d=235 if occ_88_4d==2353
replace occ_92_3d=235 if occ_88_4d==2354
replace occ_92_3d=235 if occ_88_4d==2355
replace occ_92_3d=235 if occ_88_4d==2357
replace occ_92_3d=235 if occ_88_4d==2359
replace occ_92_3d=241 if occ_88_4d==2410
replace occ_92_3d=241 if occ_88_4d==2411
replace occ_92_3d=241 if occ_88_4d==2412
replace occ_92_3d=241 if occ_88_4d==2413
replace occ_92_3d=241 if occ_88_4d==2414
replace occ_92_3d=241 if occ_88_4d==2415
replace occ_92_3d=241 if occ_88_4d==2417
replace occ_92_3d=241 if occ_88_4d==2419
replace occ_92_3d=245 if occ_88_4d==2420
replace occ_92_3d=245 if occ_88_4d==2421
replace occ_92_3d=245 if occ_88_4d==2422
replace occ_92_3d=245 if occ_88_4d==2423
replace occ_92_3d=245 if occ_88_4d==2427
replace occ_92_3d=245 if occ_88_4d==2429
replace occ_92_3d=245 if occ_88_4d==2430
replace occ_92_3d=245 if occ_88_4d==2431
replace occ_92_3d=245 if occ_88_4d==2437
replace occ_92_3d=245 if occ_88_4d==2439
replace occ_92_3d=245 if occ_88_4d==2440
replace occ_92_3d=245 if occ_88_4d==2441
replace occ_92_3d=245 if occ_88_4d==2449
replace occ_92_3d=256 if occ_88_4d==2510
replace occ_92_3d=256 if occ_88_4d==2511
replace occ_92_3d=256 if occ_88_4d==2512
replace occ_92_3d=256 if occ_88_4d==2513
replace occ_92_3d=256 if occ_88_4d==2514
replace occ_92_3d=256 if occ_88_4d==2515
replace occ_92_3d=256 if occ_88_4d==2516
replace occ_92_3d=256 if occ_88_4d==2517
replace occ_92_3d=256 if occ_88_4d==2518
replace occ_92_3d=256 if occ_88_4d==2519
replace occ_92_3d=252 if occ_88_4d==2520
replace occ_92_3d=252 if occ_88_4d==2521
replace occ_92_3d=252 if occ_88_4d==2522
replace occ_92_3d=252 if occ_88_4d==2523
replace occ_92_3d=252 if occ_88_4d==2527
replace occ_92_3d=252 if occ_88_4d==2529
replace occ_92_3d=261 if occ_88_4d==2610
replace occ_92_3d=261 if occ_88_4d==2611
replace occ_92_3d=261 if occ_88_4d==2612
replace occ_92_3d=261 if occ_88_4d==2613
replace occ_92_3d=261 if occ_88_4d==2614
replace occ_92_3d=261 if occ_88_4d==2615
replace occ_92_3d=261 if occ_88_4d==2616
replace occ_92_3d=261 if occ_88_4d==2617
replace occ_92_3d=261 if occ_88_4d==2618
replace occ_92_3d=261 if occ_88_4d==2619
replace occ_92_3d=264 if occ_88_4d==2620
replace occ_92_3d=267 if occ_88_4d==2621
replace occ_92_3d=268 if occ_88_4d==2622
replace occ_92_3d=266 if occ_88_4d==2623
replace occ_92_3d=264 if occ_88_4d==2624
replace occ_92_3d=264 if occ_88_4d==2627
replace occ_92_3d=264 if occ_88_4d==2629
replace occ_92_3d=264 if occ_88_4d==2630
replace occ_92_3d=264 if occ_88_4d==2631
replace occ_92_3d=264 if occ_88_4d==2632
replace occ_92_3d=264 if occ_88_4d==2633
replace occ_92_3d=264 if occ_88_4d==2637
replace occ_92_3d=254 if occ_88_4d==2700
replace occ_92_3d=254 if occ_88_4d==2707
replace occ_92_3d=256 if occ_88_4d==2710
replace occ_92_3d=256 if occ_88_4d==2711
replace occ_92_3d=256 if occ_88_4d==2712
replace occ_92_3d=256 if occ_88_4d==2714
replace occ_92_3d=259 if occ_88_4d==2715
replace occ_92_3d=256 if occ_88_4d==2716
replace occ_92_3d=256 if occ_88_4d==2717
replace occ_92_3d=256 if occ_88_4d==2719
replace occ_92_3d=265 if occ_88_4d==2721
replace occ_92_3d=153 if occ_88_4d==2722
replace occ_92_3d=265 if occ_88_4d==2723
replace occ_92_3d=265 if occ_88_4d==2724
replace occ_92_3d=153 if occ_88_4d==2725
replace occ_92_3d=265 if occ_88_4d==2727
replace occ_92_3d=265 if occ_88_4d==2729
replace occ_92_3d=273 if occ_88_4d==2730
replace occ_92_3d=273 if occ_88_4d==2731
replace occ_92_3d=273 if occ_88_4d==2732
replace occ_92_3d=273 if occ_88_4d==2733
replace occ_92_3d=273 if occ_88_4d==2734
replace occ_92_3d=273 if occ_88_4d==2735
replace occ_92_3d=273 if occ_88_4d==2736
replace occ_92_3d=273 if occ_88_4d==2737
replace occ_92_3d=273 if occ_88_4d==2738
replace occ_92_3d=273 if occ_88_4d==2739
replace occ_92_3d=274 if occ_88_4d==2740
replace occ_92_3d=274 if occ_88_4d==2741
replace occ_92_3d=274 if occ_88_4d==2742
replace occ_92_3d=274 if occ_88_4d==2743
replace occ_92_3d=274 if occ_88_4d==2747
replace occ_92_3d=255 if occ_88_4d==2750
replace occ_92_3d=255 if occ_88_4d==2751
replace occ_92_3d=255 if occ_88_4d==2752
replace occ_92_3d=255 if occ_88_4d==2753
replace occ_92_3d=255 if occ_88_4d==2757
replace occ_92_3d=255 if occ_88_4d==2759
replace occ_92_3d=281 if occ_88_4d==2810
replace occ_92_3d=281 if occ_88_4d==2817
replace occ_92_3d=282 if occ_88_4d==2820
replace occ_92_3d=282 if occ_88_4d==2827
replace occ_92_3d=283 if occ_88_4d==2830
replace occ_92_3d=283 if occ_88_4d==2833
replace occ_92_3d=283 if occ_88_4d==2837
replace occ_92_3d=283 if occ_88_4d==2839
replace occ_92_3d=300 if occ_88_4d==2840
replace occ_92_3d=300 if occ_88_4d==2841
replace occ_92_3d=307 if occ_88_4d==2842
replace occ_92_3d=307 if occ_88_4d==2843
replace occ_92_3d=300 if occ_88_4d==2844
replace occ_92_3d=300 if occ_88_4d==2845
replace occ_92_3d=300 if occ_88_4d==2847
replace occ_92_3d=300 if occ_88_4d==2849
replace occ_92_3d=300 if occ_88_4d==2850
replace occ_92_3d=300 if occ_88_4d==2851
replace occ_92_3d=300 if occ_88_4d==2852
replace occ_92_3d=281 if occ_88_4d==2853
replace occ_92_3d=300 if occ_88_4d==2854
replace occ_92_3d=300 if occ_88_4d==2855
replace occ_92_3d=300 if occ_88_4d==2856
replace occ_92_3d=300 if occ_88_4d==2857
replace occ_92_3d=278 if occ_88_4d==2858
replace occ_92_3d=300 if occ_88_4d==2859
replace occ_92_3d=308 if occ_88_4d==2860
replace occ_92_3d=308 if occ_88_4d==2861
replace occ_92_3d=308 if occ_88_4d==2862
replace occ_92_3d=308 if occ_88_4d==2863
replace occ_92_3d=308 if occ_88_4d==2864
replace occ_92_3d=308 if occ_88_4d==2867
replace occ_92_3d=308 if occ_88_4d==2869
replace occ_92_3d=292 if occ_88_4d==2910
replace occ_92_3d=292 if occ_88_4d==2911
replace occ_92_3d=293 if occ_88_4d==2912
replace occ_92_3d=292 if occ_88_4d==2913
replace occ_92_3d=294 if occ_88_4d==2914
replace occ_92_3d=294 if occ_88_4d==2915
replace occ_92_3d=300 if occ_88_4d==2916
replace occ_92_3d=292 if occ_88_4d==2917
replace occ_92_3d=292 if occ_88_4d==2919
replace occ_92_3d=300 if occ_88_4d==3010
replace occ_92_3d=300 if occ_88_4d==3011
replace occ_92_3d=295 if occ_88_4d==3012
replace occ_92_3d=295 if occ_88_4d==3013
replace occ_92_3d=309 if occ_88_4d==3014
replace occ_92_3d=308 if occ_88_4d==3015
replace occ_92_3d=304 if occ_88_4d==3016
replace occ_92_3d=300 if occ_88_4d==3017
replace occ_92_3d=300 if occ_88_4d==3018
replace occ_92_3d=300 if occ_88_4d==3019
replace occ_92_3d=302 if occ_88_4d==3020
replace occ_92_3d=302 if occ_88_4d==3021
replace occ_92_3d=302 if occ_88_4d==3022
replace occ_92_3d=302 if occ_88_4d==3023
replace occ_92_3d=302 if occ_88_4d==3024
replace occ_92_3d=302 if occ_88_4d==3025
replace occ_92_3d=303 if occ_88_4d==3031
replace occ_92_3d=303 if occ_88_4d==3037
replace occ_92_3d=304 if occ_88_4d==3041
replace occ_92_3d=305 if occ_88_4d==3050
replace occ_92_3d=305 if occ_88_4d==3051
replace occ_92_3d=305 if occ_88_4d==3052
replace occ_92_3d=305 if occ_88_4d==3053
replace occ_92_3d=305 if occ_88_4d==3054
replace occ_92_3d=305 if occ_88_4d==3055
replace occ_92_3d=305 if occ_88_4d==3056
replace occ_92_3d=305 if occ_88_4d==3057
replace occ_92_3d=305 if occ_88_4d==3058
replace occ_92_3d=305 if occ_88_4d==3059
replace occ_92_3d=309 if occ_88_4d==3061
replace occ_92_3d=309 if occ_88_4d==3062
replace occ_92_3d=309 if occ_88_4d==3063
replace occ_92_3d=309 if occ_88_4d==3065
replace occ_92_3d=309 if occ_88_4d==3067
replace occ_92_3d=309 if occ_88_4d==3068
replace occ_92_3d=309 if occ_88_4d==3069
replace occ_92_3d=310 if occ_88_4d==3110
replace occ_92_3d=316 if occ_88_4d==3111
replace occ_92_3d=311 if occ_88_4d==3112
replace occ_92_3d=311 if occ_88_4d==3113
replace occ_92_3d=318 if occ_88_4d==3114
replace occ_92_3d=311 if occ_88_4d==3115
replace occ_92_3d=311 if occ_88_4d==3116
replace occ_92_3d=310 if occ_88_4d==3117
replace occ_92_3d=311 if occ_88_4d==3118
replace occ_92_3d=310 if occ_88_4d==3119
replace occ_92_3d=312 if occ_88_4d==3120
replace occ_92_3d=312 if occ_88_4d==3121
replace occ_92_3d=312 if occ_88_4d==3122
replace occ_92_3d=312 if occ_88_4d==3123
replace occ_92_3d=312 if occ_88_4d==3124
replace occ_92_3d=312 if occ_88_4d==3127
replace occ_92_3d=313 if occ_88_4d==3130
replace occ_92_3d=313 if occ_88_4d==3131
replace occ_92_3d=313 if occ_88_4d==3132
replace occ_92_3d=313 if occ_88_4d==3133
replace occ_92_3d=313 if occ_88_4d==3137
replace occ_92_3d=316 if occ_88_4d==3140
replace occ_92_3d=316 if occ_88_4d==3141
replace occ_92_3d=316 if occ_88_4d==3142
replace occ_92_3d=316 if occ_88_4d==3143
replace occ_92_3d=317 if occ_88_4d==3144
replace occ_92_3d=316 if occ_88_4d==3145
replace occ_92_3d=317 if occ_88_4d==3146
replace occ_92_3d=316 if occ_88_4d==3147
replace occ_92_3d=316 if occ_88_4d==3148
replace occ_92_3d=316 if occ_88_4d==3149
replace occ_92_3d=315 if occ_88_4d==3151
replace occ_92_3d=315 if occ_88_4d==3152
replace occ_92_3d=315 if occ_88_4d==3153
replace occ_92_3d=315 if occ_88_4d==3154
replace occ_92_3d=315 if occ_88_4d==3155
replace occ_92_3d=315 if occ_88_4d==3157
replace occ_92_3d=315 if occ_88_4d==3159
replace occ_92_3d=321 if occ_88_4d==3217
replace occ_92_3d=322 if occ_88_4d==3220
replace occ_92_3d=322 if occ_88_4d==3227
replace occ_92_3d=322 if occ_88_4d==3229
replace occ_92_3d=323 if occ_88_4d==3230
replace occ_92_3d=323 if occ_88_4d==3237
replace occ_92_3d=331 if occ_88_4d==3310
replace occ_92_3d=331 if occ_88_4d==3311
replace occ_92_3d=331 if occ_88_4d==3312
replace occ_92_3d=331 if occ_88_4d==3313
replace occ_92_3d=331 if occ_88_4d==3314
replace occ_92_3d=331 if occ_88_4d==3315
replace occ_92_3d=331 if occ_88_4d==3316
replace occ_92_3d=331 if occ_88_4d==3317
replace occ_92_3d=331 if occ_88_4d==3319
replace occ_92_3d=332 if occ_88_4d==3320
replace occ_92_3d=332 if occ_88_4d==3321
replace occ_92_3d=332 if occ_88_4d==3322
replace occ_92_3d=332 if occ_88_4d==3323
replace occ_92_3d=332 if occ_88_4d==3327
replace occ_92_3d=332 if occ_88_4d==3329
replace occ_92_3d=341 if occ_88_4d==3410
replace occ_92_3d=341 if occ_88_4d==3411
replace occ_92_3d=341 if occ_88_4d==3412
replace occ_92_3d=341 if occ_88_4d==3413
replace occ_92_3d=341 if occ_88_4d==3414
replace occ_92_3d=341 if occ_88_4d==3417
replace occ_92_3d=341 if occ_88_4d==3419
replace occ_92_3d=341 if occ_88_4d==3420
replace occ_92_3d=341 if occ_88_4d==3421
replace occ_92_3d=341 if occ_88_4d==3422
replace occ_92_3d=341 if occ_88_4d==3423
replace occ_92_3d=341 if occ_88_4d==3424
replace occ_92_3d=341 if occ_88_4d==3425
replace occ_92_3d=341 if occ_88_4d==3427
replace occ_92_3d=341 if occ_88_4d==3428
replace occ_92_3d=341 if occ_88_4d==3429
replace occ_92_3d=349 if occ_88_4d==3431
replace occ_92_3d=349 if occ_88_4d==3432
replace occ_92_3d=349 if occ_88_4d==3433
replace occ_92_3d=349 if occ_88_4d==3437
replace occ_92_3d=344 if occ_88_4d==3440
replace occ_92_3d=344 if occ_88_4d==3441
replace occ_92_3d=344 if occ_88_4d==3442
replace occ_92_3d=344 if occ_88_4d==3443
replace occ_92_3d=344 if occ_88_4d==3444
replace occ_92_3d=344 if occ_88_4d==3445
replace occ_92_3d=344 if occ_88_4d==3446
replace occ_92_3d=344 if occ_88_4d==3447
replace occ_92_3d=344 if occ_88_4d==3448
replace occ_92_3d=344 if occ_88_4d==3449
replace occ_92_3d=349 if occ_88_4d==3451
replace occ_92_3d=349 if occ_88_4d==3452
replace occ_92_3d=349 if occ_88_4d==3453
replace occ_92_3d=349 if occ_88_4d==3454
replace occ_92_3d=349 if occ_88_4d==3457
replace occ_92_3d=349 if occ_88_4d==3460
replace occ_92_3d=349 if occ_88_4d==3461
replace occ_92_3d=349 if occ_88_4d==3462
replace occ_92_3d=349 if occ_88_4d==3463
replace occ_92_3d=349 if occ_88_4d==3464
replace occ_92_3d=349 if occ_88_4d==3465
replace occ_92_3d=349 if occ_88_4d==3467
replace occ_92_3d=349 if occ_88_4d==3469
replace occ_92_3d=351 if occ_88_4d==3510
replace occ_92_3d=351 if occ_88_4d==3511
replace occ_92_3d=351 if occ_88_4d==3512
replace occ_92_3d=351 if occ_88_4d==3513
replace occ_92_3d=351 if occ_88_4d==3514
replace occ_92_3d=351 if occ_88_4d==3515
replace occ_92_3d=351 if occ_88_4d==3516
replace occ_92_3d=351 if occ_88_4d==3517
replace occ_92_3d=351 if occ_88_4d==3518
replace occ_92_3d=351 if occ_88_4d==3519
replace occ_92_3d=352 if occ_88_4d==3520
replace occ_92_3d=352 if occ_88_4d==3522
replace occ_92_3d=352 if occ_88_4d==3523
replace occ_92_3d=352 if occ_88_4d==3524
replace occ_92_3d=352 if occ_88_4d==3525
replace occ_92_3d=352 if occ_88_4d==3526
replace occ_92_3d=352 if occ_88_4d==3527
replace occ_92_3d=352 if occ_88_4d==3528
replace occ_92_3d=352 if occ_88_4d==3529
replace occ_92_3d=353 if occ_88_4d==3530
replace occ_92_3d=353 if occ_88_4d==3531
replace occ_92_3d=353 if occ_88_4d==3532
replace occ_92_3d=353 if occ_88_4d==3533
replace occ_92_3d=353 if occ_88_4d==3534
replace occ_92_3d=353 if occ_88_4d==3535
replace occ_92_3d=353 if occ_88_4d==3536
replace occ_92_3d=353 if occ_88_4d==3537
replace occ_92_3d=353 if occ_88_4d==3538
replace occ_92_3d=353 if occ_88_4d==3539
replace occ_92_3d=359 if occ_88_4d==3540
replace occ_92_3d=359 if occ_88_4d==3541
replace occ_92_3d=359 if occ_88_4d==3542
replace occ_92_3d=359 if occ_88_4d==3543
replace occ_92_3d=359 if occ_88_4d==3544
replace occ_92_3d=359 if occ_88_4d==3547
replace occ_92_3d=359 if occ_88_4d==3549
replace occ_92_3d=354 if occ_88_4d==3550
replace occ_92_3d=354 if occ_88_4d==3551
replace occ_92_3d=354 if occ_88_4d==3553
replace occ_92_3d=354 if occ_88_4d==3554
replace occ_92_3d=354 if occ_88_4d==3556
replace occ_92_3d=354 if occ_88_4d==3557
replace occ_92_3d=354 if occ_88_4d==3558
replace occ_92_3d=354 if occ_88_4d==3559
replace occ_92_3d=358 if occ_88_4d==3560
replace occ_92_3d=358 if occ_88_4d==3561
replace occ_92_3d=358 if occ_88_4d==3562
replace occ_92_3d=358 if occ_88_4d==3563
replace occ_92_3d=358 if occ_88_4d==3564
replace occ_92_3d=358 if occ_88_4d==3565
replace occ_92_3d=358 if occ_88_4d==3566
replace occ_92_3d=358 if occ_88_4d==3568
replace occ_92_3d=358 if occ_88_4d==3569
replace occ_92_3d=358 if occ_88_4d==3571
replace occ_92_3d=359 if occ_88_4d==3573
replace occ_92_3d=359 if occ_88_4d==3577
replace occ_92_3d=359 if occ_88_4d==3579
replace occ_92_3d=361 if occ_88_4d==3610
replace occ_92_3d=361 if occ_88_4d==3611
replace occ_92_3d=361 if occ_88_4d==3617
replace occ_92_3d=361 if occ_88_4d==3619
replace occ_92_3d=361 if occ_88_4d==3620
replace occ_92_3d=361 if occ_88_4d==3621
replace occ_92_3d=361 if occ_88_4d==3622
replace occ_92_3d=361 if occ_88_4d==3623
replace occ_92_3d=361 if occ_88_4d==3624
replace occ_92_3d=361 if occ_88_4d==3625
replace occ_92_3d=361 if occ_88_4d==3626
replace occ_92_3d=361 if occ_88_4d==3627
replace occ_92_3d=361 if occ_88_4d==3628
replace occ_92_3d=361 if occ_88_4d==3629
replace occ_92_3d=371 if occ_88_4d==3711
replace occ_92_3d=371 if occ_88_4d==3712
replace occ_92_3d=371 if occ_88_4d==3713
replace occ_92_3d=371 if occ_88_4d==3714
replace occ_92_3d=371 if occ_88_4d==3717
replace occ_92_3d=371 if occ_88_4d==3719
replace occ_92_3d=372 if occ_88_4d==3720
replace occ_92_3d=372 if occ_88_4d==3721
replace occ_92_3d=372 if occ_88_4d==3722
replace occ_92_3d=372 if occ_88_4d==3723
replace occ_92_3d=372 if occ_88_4d==3724
replace occ_92_3d=372 if occ_88_4d==3727
replace occ_92_3d=372 if occ_88_4d==3729
replace occ_92_3d=373 if occ_88_4d==3730
replace occ_92_3d=373 if occ_88_4d==3731
replace occ_92_3d=373 if occ_88_4d==3732
replace occ_92_3d=373 if occ_88_4d==3733
replace occ_92_3d=373 if occ_88_4d==3734
replace occ_92_3d=373 if occ_88_4d==3735
replace occ_92_3d=373 if occ_88_4d==3736
replace occ_92_3d=373 if occ_88_4d==3737
replace occ_92_3d=373 if occ_88_4d==3738
replace occ_92_3d=373 if occ_88_4d==3739
replace occ_92_3d=374 if occ_88_4d==3740
replace occ_92_3d=374 if occ_88_4d==3741
replace occ_92_3d=374 if occ_88_4d==3742
replace occ_92_3d=374 if occ_88_4d==3743
replace occ_92_3d=374 if occ_88_4d==3744
replace occ_92_3d=374 if occ_88_4d==3747
replace occ_92_3d=374 if occ_88_4d==3749
replace occ_92_3d=374 if occ_88_4d==3750
replace occ_92_3d=374 if occ_88_4d==3751
replace occ_92_3d=374 if occ_88_4d==3757
replace occ_92_3d=374 if occ_88_4d==3759
replace occ_92_3d=376 if occ_88_4d==3761
replace occ_92_3d=376 if occ_88_4d==3762
replace occ_92_3d=376 if occ_88_4d==3763
replace occ_92_3d=376 if occ_88_4d==3764
replace occ_92_3d=376 if occ_88_4d==3765
replace occ_92_3d=376 if occ_88_4d==3766
replace occ_92_3d=376 if occ_88_4d==3767
replace occ_92_3d=376 if occ_88_4d==3768
replace occ_92_3d=376 if occ_88_4d==3769
replace occ_92_3d=376 if occ_88_4d==3770
replace occ_92_3d=376 if occ_88_4d==3771
replace occ_92_3d=376 if occ_88_4d==3772
replace occ_92_3d=376 if occ_88_4d==3777
replace occ_92_3d=376 if occ_88_4d==3779
replace occ_92_3d=378 if occ_88_4d==3780
replace occ_92_3d=378 if occ_88_4d==3781
replace occ_92_3d=378 if occ_88_4d==3782
replace occ_92_3d=378 if occ_88_4d==3783
replace occ_92_3d=378 if occ_88_4d==3784
replace occ_92_3d=378 if occ_88_4d==3785
replace occ_92_3d=378 if occ_88_4d==3786
replace occ_92_3d=378 if occ_88_4d==3787
replace occ_92_3d=378 if occ_88_4d==3789
replace occ_92_3d=391 if occ_88_4d==3910
replace occ_92_3d=391 if occ_88_4d==3911
replace occ_92_3d=391 if occ_88_4d==3912
replace occ_92_3d=391 if occ_88_4d==3913
replace occ_92_3d=391 if occ_88_4d==3914
replace occ_92_3d=391 if occ_88_4d==3915
replace occ_92_3d=391 if occ_88_4d==3916
replace occ_92_3d=391 if occ_88_4d==3917
replace occ_92_3d=391 if occ_88_4d==3919
replace occ_92_3d=392 if occ_88_4d==3920
replace occ_92_3d=392 if occ_88_4d==3921
replace occ_92_3d=392 if occ_88_4d==3922
replace occ_92_3d=392 if occ_88_4d==3927
replace occ_92_3d=392 if occ_88_4d==3929
replace occ_92_3d=401 if occ_88_4d==4010
replace occ_92_3d=401 if occ_88_4d==4011
replace occ_92_3d=401 if occ_88_4d==4012
replace occ_92_3d=401 if occ_88_4d==4013
replace occ_92_3d=401 if occ_88_4d==4017
replace occ_92_3d=401 if occ_88_4d==4019
replace occ_92_3d=401 if occ_88_4d==4020
replace occ_92_3d=401 if occ_88_4d==4021
replace occ_92_3d=401 if occ_88_4d==4022
replace occ_92_3d=401 if occ_88_4d==4023
replace occ_92_3d=401 if occ_88_4d==4024
replace occ_92_3d=401 if occ_88_4d==4025
replace occ_92_3d=401 if occ_88_4d==4027
replace occ_92_3d=401 if occ_88_4d==4029
replace occ_92_3d=435 if occ_88_4d==4030
replace occ_92_3d=435 if occ_88_4d==4031
replace occ_92_3d=435 if occ_88_4d==4033
replace occ_92_3d=435 if occ_88_4d==4037
replace occ_92_3d=435 if occ_88_4d==4039
replace occ_92_3d=411 if occ_88_4d==4110
replace occ_92_3d=411 if occ_88_4d==4111
replace occ_92_3d=411 if occ_88_4d==4112
replace occ_92_3d=411 if occ_88_4d==4113
replace occ_92_3d=411 if occ_88_4d==4114
replace occ_92_3d=411 if occ_88_4d==4115
replace occ_92_3d=411 if occ_88_4d==4116
replace occ_92_3d=411 if occ_88_4d==4117
replace occ_92_3d=411 if occ_88_4d==4118
replace occ_92_3d=411 if occ_88_4d==4119
replace occ_92_3d=435 if occ_88_4d==4120
replace occ_92_3d=435 if occ_88_4d==4121
replace occ_92_3d=435 if occ_88_4d==4122
replace occ_92_3d=435 if occ_88_4d==4123
replace occ_92_3d=435 if occ_88_4d==4124
replace occ_92_3d=435 if occ_88_4d==4127
replace occ_92_3d=423 if occ_88_4d==4210
replace occ_92_3d=423 if occ_88_4d==4211
replace occ_92_3d=423 if occ_88_4d==4212
replace occ_92_3d=423 if occ_88_4d==4217
replace occ_92_3d=421 if occ_88_4d==4220
replace occ_92_3d=421 if occ_88_4d==4221
replace occ_92_3d=421 if occ_88_4d==4222
replace occ_92_3d=421 if occ_88_4d==4223
replace occ_92_3d=421 if occ_88_4d==4224
replace occ_92_3d=421 if occ_88_4d==4227
replace occ_92_3d=421 if occ_88_4d==4229
replace occ_92_3d=423 if occ_88_4d==4230
replace occ_92_3d=423 if occ_88_4d==4231
replace occ_92_3d=423 if occ_88_4d==4232
replace occ_92_3d=423 if occ_88_4d==4233
replace occ_92_3d=423 if occ_88_4d==4234
replace occ_92_3d=423 if occ_88_4d==4235
replace occ_92_3d=423 if occ_88_4d==4237
replace occ_92_3d=423 if occ_88_4d==4239
replace occ_92_3d=424 if occ_88_4d==4240
replace occ_92_3d=424 if occ_88_4d==4241
replace occ_92_3d=424 if occ_88_4d==4242
replace occ_92_3d=424 if occ_88_4d==4243
replace occ_92_3d=424 if occ_88_4d==4244
replace occ_92_3d=424 if occ_88_4d==4245
replace occ_92_3d=424 if occ_88_4d==4247
replace occ_92_3d=424 if occ_88_4d==4249
replace occ_92_3d=431 if occ_88_4d==4311
replace occ_92_3d=431 if occ_88_4d==4312
replace occ_92_3d=431 if occ_88_4d==4313
replace occ_92_3d=431 if occ_88_4d==4314
replace occ_92_3d=431 if occ_88_4d==4315
replace occ_92_3d=431 if occ_88_4d==4316
replace occ_92_3d=431 if occ_88_4d==4317
replace occ_92_3d=431 if occ_88_4d==4318
replace occ_92_3d=431 if occ_88_4d==4319
replace occ_92_3d=435 if occ_88_4d==4320
replace occ_92_3d=435 if occ_88_4d==4321
replace occ_92_3d=435 if occ_88_4d==4322
replace occ_92_3d=435 if occ_88_4d==4324
replace occ_92_3d=435 if occ_88_4d==4327
replace occ_92_3d=435 if occ_88_4d==4328
replace occ_92_3d=435 if occ_88_4d==4329
replace occ_92_3d=393 if occ_88_4d==4331
replace occ_92_3d=393 if occ_88_4d==4332
replace occ_92_3d=393 if occ_88_4d==4333
replace occ_92_3d=393 if occ_88_4d==4334
replace occ_92_3d=393 if occ_88_4d==4337
replace occ_92_3d=393 if occ_88_4d==4338
replace occ_92_3d=393 if occ_88_4d==4339
replace occ_92_3d=441 if occ_88_4d==4410
replace occ_92_3d=441 if occ_88_4d==4411
replace occ_92_3d=441 if occ_88_4d==4413
replace occ_92_3d=441 if occ_88_4d==4414
replace occ_92_3d=441 if occ_88_4d==4415
replace occ_92_3d=441 if occ_88_4d==4417
replace occ_92_3d=442 if occ_88_4d==4419
replace occ_92_3d=442 if occ_88_4d==4420
replace occ_92_3d=442 if occ_88_4d==4421
replace occ_92_3d=442 if occ_88_4d==4422
replace occ_92_3d=442 if occ_88_4d==4423
replace occ_92_3d=442 if occ_88_4d==4424
replace occ_92_3d=442 if occ_88_4d==4427
replace occ_92_3d=442 if occ_88_4d==4429
replace occ_92_3d=487 if occ_88_4d==4510
replace occ_92_3d=487 if occ_88_4d==4511
replace occ_92_3d=487 if occ_88_4d==4512
replace occ_92_3d=487 if occ_88_4d==4513
replace occ_92_3d=487 if occ_88_4d==4517
replace occ_92_3d=487 if occ_88_4d==4519
replace occ_92_3d=488 if occ_88_4d==4520
replace occ_92_3d=488 if occ_88_4d==4521
replace occ_92_3d=488 if occ_88_4d==4522
replace occ_92_3d=488 if occ_88_4d==4523
replace occ_92_3d=488 if occ_88_4d==4524
replace occ_92_3d=488 if occ_88_4d==4527
replace occ_92_3d=488 if occ_88_4d==4529
replace occ_92_3d=443 if occ_88_4d==4531
replace occ_92_3d=443 if occ_88_4d==4537
replace occ_92_3d=443 if occ_88_4d==4539
replace occ_92_3d=461 if occ_88_4d==4610
replace occ_92_3d=461 if occ_88_4d==4612
replace occ_92_3d=461 if occ_88_4d==4613
replace occ_92_3d=461 if occ_88_4d==4617
replace occ_92_3d=461 if occ_88_4d==4619
replace occ_92_3d=461 if occ_88_4d==4620
replace occ_92_3d=461 if occ_88_4d==4621
replace occ_92_3d=461 if occ_88_4d==4622
replace occ_92_3d=461 if occ_88_4d==4623
replace occ_92_3d=461 if occ_88_4d==4627
replace occ_92_3d=461 if occ_88_4d==4629
replace occ_92_3d=463 if occ_88_4d==4630
replace occ_92_3d=463 if occ_88_4d==4637
replace occ_92_3d=463 if occ_88_4d==4639
replace occ_92_3d=460 if occ_88_4d==4640
replace occ_92_3d=460 if occ_88_4d==4647
replace occ_92_3d=460 if occ_88_4d==4649
replace occ_92_3d=465 if occ_88_4d==4650
replace occ_92_3d=465 if occ_88_4d==4651
replace occ_92_3d=465 if occ_88_4d==4652
replace occ_92_3d=465 if occ_88_4d==4653
replace occ_92_3d=465 if occ_88_4d==4657
replace occ_92_3d=465 if occ_88_4d==4659
replace occ_92_3d=466 if occ_88_4d==4660
replace occ_92_3d=466 if occ_88_4d==4661
replace occ_92_3d=466 if occ_88_4d==4662
replace occ_92_3d=466 if occ_88_4d==4663
replace occ_92_3d=466 if occ_88_4d==4664
replace occ_92_3d=466 if occ_88_4d==4667
replace occ_92_3d=466 if occ_88_4d==4669
replace occ_92_3d=471 if occ_88_4d==4711
replace occ_92_3d=471 if occ_88_4d==4717
replace occ_92_3d=480 if occ_88_4d==4721
replace occ_92_3d=480 if occ_88_4d==4722
replace occ_92_3d=480 if occ_88_4d==4727
replace occ_92_3d=481 if occ_88_4d==4810
replace occ_92_3d=481 if occ_88_4d==4811
replace occ_92_3d=481 if occ_88_4d==4813
replace occ_92_3d=481 if occ_88_4d==4817
replace occ_92_3d=481 if occ_88_4d==4819
replace occ_92_3d=482 if occ_88_4d==4820
replace occ_92_3d=482 if occ_88_4d==4821
replace occ_92_3d=482 if occ_88_4d==4822
replace occ_92_3d=482 if occ_88_4d==4823
replace occ_92_3d=482 if occ_88_4d==4824
replace occ_92_3d=482 if occ_88_4d==4825
replace occ_92_3d=482 if occ_88_4d==4827
replace occ_92_3d=482 if occ_88_4d==4829
replace occ_92_3d=483 if occ_88_4d==4830
replace occ_92_3d=483 if occ_88_4d==4831
replace occ_92_3d=483 if occ_88_4d==4832
replace occ_92_3d=483 if occ_88_4d==4837
replace occ_92_3d=484 if occ_88_4d==4840
replace occ_92_3d=484 if occ_88_4d==4841
replace occ_92_3d=484 if occ_88_4d==4842
replace occ_92_3d=484 if occ_88_4d==4847
replace occ_92_3d=485 if occ_88_4d==4850
replace occ_92_3d=485 if occ_88_4d==4851
replace occ_92_3d=485 if occ_88_4d==4852
replace occ_92_3d=485 if occ_88_4d==4854
replace occ_92_3d=485 if occ_88_4d==4855
replace occ_92_3d=485 if occ_88_4d==4857
replace occ_92_3d=485 if occ_88_4d==4859
replace occ_92_3d=486 if occ_88_4d==4860
replace occ_92_3d=486 if occ_88_4d==4861
replace occ_92_3d=486 if occ_88_4d==4862
replace occ_92_3d=486 if occ_88_4d==4863
replace occ_92_3d=486 if occ_88_4d==4867
replace occ_92_3d=486 if occ_88_4d==4869
replace occ_92_3d=491 if occ_88_4d==4910
replace occ_92_3d=491 if occ_88_4d==4911
replace occ_92_3d=491 if occ_88_4d==4912
replace occ_92_3d=491 if occ_88_4d==4913
replace occ_92_3d=491 if occ_88_4d==4914
replace occ_92_3d=491 if occ_88_4d==4917
replace occ_92_3d=491 if occ_88_4d==4919
replace occ_92_3d=492 if occ_88_4d==4920
replace occ_92_3d=492 if occ_88_4d==4921
replace occ_92_3d=492 if occ_88_4d==4922
replace occ_92_3d=492 if occ_88_4d==4923
replace occ_92_3d=492 if occ_88_4d==4924
replace occ_92_3d=492 if occ_88_4d==4927
replace occ_92_3d=492 if occ_88_4d==4929
replace occ_92_3d=501 if occ_88_4d==5010
replace occ_92_3d=501 if occ_88_4d==5011
replace occ_92_3d=501 if occ_88_4d==5012
replace occ_92_3d=501 if occ_88_4d==5013
replace occ_92_3d=501 if occ_88_4d==5014
replace occ_92_3d=501 if occ_88_4d==5017
replace occ_92_3d=501 if occ_88_4d==5019
replace occ_92_3d=502 if occ_88_4d==5020
replace occ_92_3d=502 if occ_88_4d==5021
replace occ_92_3d=502 if occ_88_4d==5022
replace occ_92_3d=502 if occ_88_4d==5027
replace occ_92_3d=502 if occ_88_4d==5029
replace occ_92_3d=506 if occ_88_4d==5031
replace occ_92_3d=506 if occ_88_4d==5033
replace occ_92_3d=506 if occ_88_4d==5037
replace occ_92_3d=506 if occ_88_4d==5039
replace occ_92_3d=506 if occ_88_4d==5041
replace occ_92_3d=506 if occ_88_4d==5042
replace occ_92_3d=506 if occ_88_4d==5044
replace occ_92_3d=506 if occ_88_4d==5045
replace occ_92_3d=506 if occ_88_4d==5046
replace occ_92_3d=506 if occ_88_4d==5047
replace occ_92_3d=506 if occ_88_4d==5049
replace occ_92_3d=511 if occ_88_4d==5110
replace occ_92_3d=511 if occ_88_4d==5112
replace occ_92_3d=511 if occ_88_4d==5113
replace occ_92_3d=511 if occ_88_4d==5114
replace occ_92_3d=511 if occ_88_4d==5115
replace occ_92_3d=511 if occ_88_4d==5116
replace occ_92_3d=511 if occ_88_4d==5117
replace occ_92_3d=511 if occ_88_4d==5119
replace occ_92_3d=512 if occ_88_4d==5120
replace occ_92_3d=512 if occ_88_4d==5122
replace occ_92_3d=512 if occ_88_4d==5123
replace occ_92_3d=512 if occ_88_4d==5125
replace occ_92_3d=512 if occ_88_4d==5127
replace occ_92_3d=512 if occ_88_4d==5128
replace occ_92_3d=512 if occ_88_4d==5129
replace occ_92_3d=512 if occ_88_4d==5130
replace occ_92_3d=512 if occ_88_4d==5131
replace occ_92_3d=512 if occ_88_4d==5132
replace occ_92_3d=512 if occ_88_4d==5133
replace occ_92_3d=512 if occ_88_4d==5137
replace occ_92_3d=512 if occ_88_4d==5139
replace occ_92_3d=514 if occ_88_4d==5140
replace occ_92_3d=514 if occ_88_4d==5141
replace occ_92_3d=514 if occ_88_4d==5142
replace occ_92_3d=514 if occ_88_4d==5143
replace occ_92_3d=514 if occ_88_4d==5144
replace occ_92_3d=514 if occ_88_4d==5145
replace occ_92_3d=514 if occ_88_4d==5146
replace occ_92_3d=514 if occ_88_4d==5147
replace occ_92_3d=514 if occ_88_4d==5149
replace occ_92_3d=521 if occ_88_4d==5211
replace occ_92_3d=521 if occ_88_4d==5212
replace occ_92_3d=523 if occ_88_4d==5213
replace occ_92_3d=522 if occ_88_4d==5220
replace occ_92_3d=522 if occ_88_4d==5221
replace occ_92_3d=522 if occ_88_4d==5222
replace occ_92_3d=522 if occ_88_4d==5224
replace occ_92_3d=522 if occ_88_4d==5225
replace occ_92_3d=522 if occ_88_4d==5226
replace occ_92_3d=522 if occ_88_4d==5229
replace occ_92_3d=531 if occ_88_4d==5317
replace occ_92_3d=541 if occ_88_4d==5410
replace occ_92_3d=541 if occ_88_4d==5411
replace occ_92_3d=541 if occ_88_4d==5412
replace occ_92_3d=541 if occ_88_4d==5413
replace occ_92_3d=541 if occ_88_4d==5419
replace occ_92_3d=549 if occ_88_4d==5421
replace occ_92_3d=549 if occ_88_4d==5422
replace occ_92_3d=549 if occ_88_4d==5430
replace occ_92_3d=549 if occ_88_4d==5431
replace occ_92_3d=549 if occ_88_4d==5432
replace occ_92_3d=549 if occ_88_4d==5433
replace occ_92_3d=549 if occ_88_4d==5435
replace occ_92_3d=549 if occ_88_4d==5436
replace occ_92_3d=549 if occ_88_4d==5438
replace occ_92_3d=549 if occ_88_4d==5439
replace occ_92_3d=544 if occ_88_4d==5440
replace occ_92_3d=544 if occ_88_4d==5441
replace occ_92_3d=544 if occ_88_4d==5442
replace occ_92_3d=544 if occ_88_4d==5443
replace occ_92_3d=544 if occ_88_4d==5444
replace occ_92_3d=544 if occ_88_4d==5445
replace occ_92_3d=544 if occ_88_4d==5449
replace occ_92_3d=545 if occ_88_4d==5451
replace occ_92_3d=545 if occ_88_4d==5452
replace occ_92_3d=546 if occ_88_4d==5460
replace occ_92_3d=546 if occ_88_4d==5461
replace occ_92_3d=546 if occ_88_4d==5462
replace occ_92_3d=546 if occ_88_4d==5463
replace occ_92_3d=546 if occ_88_4d==5464
replace occ_92_3d=546 if occ_88_4d==5465
replace occ_92_3d=549 if occ_88_4d==5470
replace occ_92_3d=549 if occ_88_4d==5471
replace occ_92_3d=549 if occ_88_4d==5472
replace occ_92_3d=549 if occ_88_4d==5473
replace occ_92_3d=549 if occ_88_4d==5474
replace occ_92_3d=549 if occ_88_4d==5475
replace occ_92_3d=549 if occ_88_4d==5476
replace occ_92_3d=549 if occ_88_4d==5477
replace occ_92_3d=549 if occ_88_4d==5478
replace occ_92_3d=549 if occ_88_4d==5479
replace occ_92_3d=549 if occ_88_4d==5481
replace occ_92_3d=549 if occ_88_4d==5487
replace occ_92_3d=550 if occ_88_4d==5490
replace occ_92_3d=550 if occ_88_4d==5491
replace occ_92_3d=550 if occ_88_4d==5499
replace occ_92_3d=601 if occ_88_4d==6010
replace occ_92_3d=601 if occ_88_4d==6011
replace occ_92_3d=601 if occ_88_4d==6012
replace occ_92_3d=601 if occ_88_4d==6013
replace occ_92_3d=601 if occ_88_4d==6014
replace occ_92_3d=601 if occ_88_4d==6015
replace occ_92_3d=601 if occ_88_4d==6016
replace occ_92_3d=601 if occ_88_4d==6018
replace occ_92_3d=601 if occ_88_4d==6019
replace occ_92_3d=602 if occ_88_4d==6020
replace occ_92_3d=602 if occ_88_4d==6021
replace occ_92_3d=602 if occ_88_4d==6022
replace occ_92_3d=602 if occ_88_4d==6023
replace occ_92_3d=602 if occ_88_4d==6024
replace occ_92_3d=602 if occ_88_4d==6025
replace occ_92_3d=602 if occ_88_4d==6028
replace occ_92_3d=602 if occ_88_4d==6029
replace occ_92_3d=603 if occ_88_4d==6030
replace occ_92_3d=603 if occ_88_4d==6031
replace occ_92_3d=603 if occ_88_4d==6032
replace occ_92_3d=603 if occ_88_4d==6033
replace occ_92_3d=603 if occ_88_4d==6034
replace occ_92_3d=603 if occ_88_4d==6035
replace occ_92_3d=603 if occ_88_4d==6036
replace occ_92_3d=603 if occ_88_4d==6038
replace occ_92_3d=603 if occ_88_4d==6039
replace occ_92_3d=604 if occ_88_4d==6040
replace occ_92_3d=604 if occ_88_4d==6041
replace occ_92_3d=604 if occ_88_4d==6042
replace occ_92_3d=604 if occ_88_4d==6043
replace occ_92_3d=604 if occ_88_4d==6049
replace occ_92_3d=605 if occ_88_4d==6050
replace occ_92_3d=605 if occ_88_4d==6051
replace occ_92_3d=605 if occ_88_4d==6052
replace occ_92_3d=605 if occ_88_4d==6053
replace occ_92_3d=605 if occ_88_4d==6054
replace occ_92_3d=605 if occ_88_4d==6055
replace occ_92_3d=605 if occ_88_4d==6058
replace occ_92_3d=605 if occ_88_4d==6059
replace occ_92_3d=606 if occ_88_4d==6060
replace occ_92_3d=606 if occ_88_4d==6061
replace occ_92_3d=606 if occ_88_4d==6062
replace occ_92_3d=606 if occ_88_4d==6063
replace occ_92_3d=606 if occ_88_4d==6064
replace occ_92_3d=606 if occ_88_4d==6065
replace occ_92_3d=606 if occ_88_4d==6066
replace occ_92_3d=606 if occ_88_4d==6068
replace occ_92_3d=606 if occ_88_4d==6069
replace occ_92_3d=600 if occ_88_4d==6070
replace occ_92_3d=607 if occ_88_4d==6071
replace occ_92_3d=607 if occ_88_4d==6072
replace occ_92_3d=600 if occ_88_4d==6073
replace occ_92_3d=600 if occ_88_4d==6074
replace occ_92_3d=600 if occ_88_4d==6075
replace occ_92_3d=600 if occ_88_4d==6076
replace occ_92_3d=600 if occ_88_4d==6079
replace occ_92_3d=611 if occ_88_4d==6110
replace occ_92_3d=611 if occ_88_4d==6111
replace occ_92_3d=611 if occ_88_4d==6112
replace occ_92_3d=611 if occ_88_4d==6113
replace occ_92_3d=611 if occ_88_4d==6114
replace occ_92_3d=611 if occ_88_4d==6115
replace occ_92_3d=611 if occ_88_4d==6116
replace occ_92_3d=611 if occ_88_4d==6118
replace occ_92_3d=611 if occ_88_4d==6119
replace occ_92_3d=612 if occ_88_4d==6121
replace occ_92_3d=612 if occ_88_4d==6122
replace occ_92_3d=612 if occ_88_4d==6123
replace occ_92_3d=612 if occ_88_4d==6124
replace occ_92_3d=612 if occ_88_4d==6125
replace occ_92_3d=612 if occ_88_4d==6129
replace occ_92_3d=621 if occ_88_4d==6210
replace occ_92_3d=621 if occ_88_4d==6211
replace occ_92_3d=621 if occ_88_4d==6212
replace occ_92_3d=621 if occ_88_4d==6213
replace occ_92_3d=621 if occ_88_4d==6214
replace occ_92_3d=621 if occ_88_4d==6215
replace occ_92_3d=621 if occ_88_4d==6216
replace occ_92_3d=621 if occ_88_4d==6218
replace occ_92_3d=621 if occ_88_4d==6219
replace occ_92_3d=622 if occ_88_4d==6220
replace occ_92_3d=622 if occ_88_4d==6221
replace occ_92_3d=622 if occ_88_4d==6222
replace occ_92_3d=622 if occ_88_4d==6223
replace occ_92_3d=622 if occ_88_4d==6224
replace occ_92_3d=622 if occ_88_4d==6225
replace occ_92_3d=622 if occ_88_4d==6226
replace occ_92_3d=622 if occ_88_4d==6228
replace occ_92_3d=622 if occ_88_4d==6229
replace occ_92_3d=623 if occ_88_4d==6230
replace occ_92_3d=623 if occ_88_4d==6231
replace occ_92_3d=623 if occ_88_4d==6232
replace occ_92_3d=623 if occ_88_4d==6233
replace occ_92_3d=623 if occ_88_4d==6234
replace occ_92_3d=623 if occ_88_4d==6235
replace occ_92_3d=623 if occ_88_4d==6236
replace occ_92_3d=623 if occ_88_4d==6239
replace occ_92_3d=624 if occ_88_4d==6240
replace occ_92_3d=624 if occ_88_4d==6241
replace occ_92_3d=624 if occ_88_4d==6242
replace occ_92_3d=624 if occ_88_4d==6243
replace occ_92_3d=624 if occ_88_4d==6244
replace occ_92_3d=624 if occ_88_4d==6245
replace occ_92_3d=624 if occ_88_4d==6249
replace occ_92_3d=625 if occ_88_4d==6250
replace occ_92_3d=625 if occ_88_4d==6251
replace occ_92_3d=625 if occ_88_4d==6252
replace occ_92_3d=625 if occ_88_4d==6253
replace occ_92_3d=625 if occ_88_4d==6254
replace occ_92_3d=625 if occ_88_4d==6255
replace occ_92_3d=625 if occ_88_4d==6256
replace occ_92_3d=625 if occ_88_4d==6258
replace occ_92_3d=625 if occ_88_4d==6259
replace occ_92_3d=626 if occ_88_4d==6260
replace occ_92_3d=626 if occ_88_4d==6261
replace occ_92_3d=626 if occ_88_4d==6262
replace occ_92_3d=626 if occ_88_4d==6263
replace occ_92_3d=626 if occ_88_4d==6264
replace occ_92_3d=626 if occ_88_4d==6265
replace occ_92_3d=626 if occ_88_4d==6266
replace occ_92_3d=626 if occ_88_4d==6268
replace occ_92_3d=626 if occ_88_4d==6269
replace occ_92_3d=627 if occ_88_4d==6270
replace occ_92_3d=627 if occ_88_4d==6271
replace occ_92_3d=627 if occ_88_4d==6272
replace occ_92_3d=627 if occ_88_4d==6273
replace occ_92_3d=627 if occ_88_4d==6274
replace occ_92_3d=627 if occ_88_4d==6275
replace occ_92_3d=627 if occ_88_4d==6276
replace occ_92_3d=627 if occ_88_4d==6278
replace occ_92_3d=627 if occ_88_4d==6279
replace occ_92_3d=620 if occ_88_4d==6280
replace occ_92_3d=628 if occ_88_4d==6281
replace occ_92_3d=628 if occ_88_4d==6282
replace occ_92_3d=629 if occ_88_4d==6283
replace occ_92_3d=620 if occ_88_4d==6284
replace occ_92_3d=629 if occ_88_4d==6285
replace occ_92_3d=629 if occ_88_4d==6288
replace occ_92_3d=629 if occ_88_4d==6289
replace occ_92_3d=651 if occ_88_4d==6290
replace occ_92_3d=652 if occ_88_4d==6291
replace occ_92_3d=651 if occ_88_4d==6292
replace occ_92_3d=651 if occ_88_4d==6293
replace occ_92_3d=651 if occ_88_4d==6294
replace occ_92_3d=651 if occ_88_4d==6295
replace occ_92_3d=651 if occ_88_4d==6296
replace occ_92_3d=651 if occ_88_4d==6298
replace occ_92_3d=651 if occ_88_4d==6299
replace occ_92_3d=631 if occ_88_4d==6310
replace occ_92_3d=631 if occ_88_4d==6311
replace occ_92_3d=631 if occ_88_4d==6312
replace occ_92_3d=631 if occ_88_4d==6313
replace occ_92_3d=631 if occ_88_4d==6314
replace occ_92_3d=631 if occ_88_4d==6315
replace occ_92_3d=631 if occ_88_4d==6316
replace occ_92_3d=631 if occ_88_4d==6319
replace occ_92_3d=632 if occ_88_4d==6321
replace occ_92_3d=632 if occ_88_4d==6322
replace occ_92_3d=632 if occ_88_4d==6323
replace occ_92_3d=632 if occ_88_4d==6324
replace occ_92_3d=632 if occ_88_4d==6325
replace occ_92_3d=632 if occ_88_4d==6326
replace occ_92_3d=632 if occ_88_4d==6328
replace occ_92_3d=632 if occ_88_4d==6329
replace occ_92_3d=633 if occ_88_4d==6330
replace occ_92_3d=633 if occ_88_4d==6331
replace occ_92_3d=633 if occ_88_4d==6332
replace occ_92_3d=633 if occ_88_4d==6333
replace occ_92_3d=633 if occ_88_4d==6334
replace occ_92_3d=633 if occ_88_4d==6335
replace occ_92_3d=633 if occ_88_4d==6336
replace occ_92_3d=633 if occ_88_4d==6339
replace occ_92_3d=634 if occ_88_4d==6340
replace occ_92_3d=634 if occ_88_4d==6341
replace occ_92_3d=634 if occ_88_4d==6349
replace occ_92_3d=641 if occ_88_4d==6350
replace occ_92_3d=641 if occ_88_4d==6351
replace occ_92_3d=642 if occ_88_4d==6352
replace occ_92_3d=641 if occ_88_4d==6353
replace occ_92_3d=642 if occ_88_4d==6354
replace occ_92_3d=641 if occ_88_4d==6355
replace occ_92_3d=642 if occ_88_4d==6356
replace occ_92_3d=642 if occ_88_4d==6358
replace occ_92_3d=641 if occ_88_4d==6359
replace occ_92_3d=670 if occ_88_4d==6810
replace occ_92_3d=671 if occ_88_4d==6811
replace occ_92_3d=672 if occ_88_4d==6812
replace occ_92_3d=677 if occ_88_4d==6813
replace occ_92_3d=676 if occ_88_4d==6814
replace occ_92_3d=676 if occ_88_4d==6815
replace occ_92_3d=678 if occ_88_4d==6816
replace occ_92_3d=662 if occ_88_4d==6818
replace occ_92_3d=670 if occ_88_4d==6819
replace occ_92_3d=660 if occ_88_4d==6820
replace occ_92_3d=661 if occ_88_4d==6821
replace occ_92_3d=662 if occ_88_4d==6822
replace occ_92_3d=662 if occ_88_4d==6823
replace occ_92_3d=660 if occ_88_4d==6824
replace occ_92_3d=663 if occ_88_4d==6825
replace occ_92_3d=661 if occ_88_4d==6826
replace occ_92_3d=660 if occ_88_4d==6827
replace occ_92_3d=662 if occ_88_4d==6828
replace occ_92_3d=660 if occ_88_4d==6829
replace occ_92_3d=683 if occ_88_4d==6830
replace occ_92_3d=683 if occ_88_4d==6831
replace occ_92_3d=683 if occ_88_4d==6832
replace occ_92_3d=683 if occ_88_4d==6833
replace occ_92_3d=683 if occ_88_4d==6834
replace occ_92_3d=683 if occ_88_4d==6835
replace occ_92_3d=683 if occ_88_4d==6836
replace occ_92_3d=683 if occ_88_4d==6838
replace occ_92_3d=683 if occ_88_4d==6839
replace occ_92_3d=675 if occ_88_4d==6841
replace occ_92_3d=685 if occ_88_4d==6851
replace occ_92_3d=686 if occ_88_4d==6861
replace occ_92_3d=687 if occ_88_4d==6871
replace occ_92_3d=689 if occ_88_4d==6872
replace occ_92_3d=689 if occ_88_4d==6873
replace occ_92_3d=689 if occ_88_4d==6874
replace occ_92_3d=689 if occ_88_4d==6881
replace occ_92_3d=691 if occ_88_4d==6910
replace occ_92_3d=691 if occ_88_4d==6911
replace occ_92_3d=691 if occ_88_4d==6912
replace occ_92_3d=691 if occ_88_4d==6913
replace occ_92_3d=691 if occ_88_4d==6914
replace occ_92_3d=691 if occ_88_4d==6915
replace occ_92_3d=691 if occ_88_4d==6916
replace occ_92_3d=691 if occ_88_4d==6918
replace occ_92_3d=691 if occ_88_4d==6919
replace occ_92_3d=692 if occ_88_4d==6920
replace occ_92_3d=692 if occ_88_4d==6921
replace occ_92_3d=692 if occ_88_4d==6922
replace occ_92_3d=692 if occ_88_4d==6925
replace occ_92_3d=695 if occ_88_4d==6930
replace occ_92_3d=695 if occ_88_4d==6931
replace occ_92_3d=695 if occ_88_4d==6932
replace occ_92_3d=695 if occ_88_4d==6935
replace occ_92_3d=695 if occ_88_4d==6940
replace occ_92_3d=695 if occ_88_4d==6941
replace occ_92_3d=695 if occ_88_4d==6942
replace occ_92_3d=695 if occ_88_4d==6945
replace occ_92_3d=695 if occ_88_4d==6949
replace occ_92_3d=701 if occ_88_4d==7010
replace occ_92_3d=701 if occ_88_4d==7011
replace occ_92_3d=701 if occ_88_4d==7012
replace occ_92_3d=701 if occ_88_4d==7013
replace occ_92_3d=701 if occ_88_4d==7014
replace occ_92_3d=701 if occ_88_4d==7016
replace occ_92_3d=701 if occ_88_4d==7019
replace occ_92_3d=702 if occ_88_4d==7020
replace occ_92_3d=702 if occ_88_4d==7021
replace occ_92_3d=702 if occ_88_4d==7022
replace occ_92_3d=702 if occ_88_4d==7025
replace occ_92_3d=702 if occ_88_4d==7026
replace occ_92_3d=702 if occ_88_4d==7029
replace occ_92_3d=703 if occ_88_4d==7030
replace occ_92_3d=703 if occ_88_4d==7031
replace occ_92_3d=703 if occ_88_4d==7032
replace occ_92_3d=703 if occ_88_4d==7033
replace occ_92_3d=703 if occ_88_4d==7034
replace occ_92_3d=703 if occ_88_4d==7035
replace occ_92_3d=703 if occ_88_4d==7036
replace occ_92_3d=703 if occ_88_4d==7038
replace occ_92_3d=703 if occ_88_4d==7039
replace occ_92_3d=704 if occ_88_4d==7040
replace occ_92_3d=704 if occ_88_4d==7041
replace occ_92_3d=704 if occ_88_4d==7042
replace occ_92_3d=704 if occ_88_4d==7043
replace occ_92_3d=704 if occ_88_4d==7044
replace occ_92_3d=704 if occ_88_4d==7045
replace occ_92_3d=704 if occ_88_4d==7048
replace occ_92_3d=704 if occ_88_4d==7049
replace occ_92_3d=705 if occ_88_4d==7051
replace occ_92_3d=705 if occ_88_4d==7052
replace occ_92_3d=705 if occ_88_4d==7053
replace occ_92_3d=705 if occ_88_4d==7054
replace occ_92_3d=705 if occ_88_4d==7055
replace occ_92_3d=705 if occ_88_4d==7056
replace occ_92_3d=705 if occ_88_4d==7058
replace occ_92_3d=705 if occ_88_4d==7059
replace occ_92_3d=706 if occ_88_4d==7061
replace occ_92_3d=706 if occ_88_4d==7063
replace occ_92_3d=706 if occ_88_4d==7064
replace occ_92_3d=706 if occ_88_4d==7065
replace occ_92_3d=711 if occ_88_4d==7110
replace occ_92_3d=711 if occ_88_4d==7111
replace occ_92_3d=711 if occ_88_4d==7112
replace occ_92_3d=711 if occ_88_4d==7119
replace occ_92_3d=712 if occ_88_4d==7121
replace occ_92_3d=712 if occ_88_4d==7122
replace occ_92_3d=712 if occ_88_4d==7123
replace occ_92_3d=712 if occ_88_4d==7127
replace occ_92_3d=713 if occ_88_4d==7130
replace occ_92_3d=713 if occ_88_4d==7131
replace occ_92_3d=713 if occ_88_4d==7132
replace occ_92_3d=713 if occ_88_4d==7133
replace occ_92_3d=713 if occ_88_4d==7134
replace occ_92_3d=713 if occ_88_4d==7139
replace occ_92_3d=714 if occ_88_4d==7140
replace occ_92_3d=715 if occ_88_4d==7141
replace occ_92_3d=714 if occ_88_4d==7142
replace occ_92_3d=714 if occ_88_4d==7143
replace occ_92_3d=714 if occ_88_4d==7144
replace occ_92_3d=714 if occ_88_4d==7145
replace occ_92_3d=714 if occ_88_4d==7146
replace occ_92_3d=714 if occ_88_4d==7149
replace occ_92_3d=714 if occ_88_4d==7151
replace occ_92_3d=716 if occ_88_4d==7161
replace occ_92_3d=716 if occ_88_4d==7162
replace occ_92_3d=716 if occ_88_4d==7169
replace occ_92_3d=721 if occ_88_4d==7210
replace occ_92_3d=721 if occ_88_4d==7211
replace occ_92_3d=721 if occ_88_4d==7212
replace occ_92_3d=721 if occ_88_4d==7213
replace occ_92_3d=721 if occ_88_4d==7214
replace occ_92_3d=721 if occ_88_4d==7215
replace occ_92_3d=721 if occ_88_4d==7216
replace occ_92_3d=721 if occ_88_4d==7218
replace occ_92_3d=721 if occ_88_4d==7219
replace occ_92_3d=721 if occ_88_4d==7221
replace occ_92_3d=721 if occ_88_4d==7222
replace occ_92_3d=721 if occ_88_4d==7223
replace occ_92_3d=723 if occ_88_4d==7224
replace occ_92_3d=721 if occ_88_4d==7225
replace occ_92_3d=721 if occ_88_4d==7229
replace occ_92_3d=723 if occ_88_4d==7230
replace occ_92_3d=723 if occ_88_4d==7231
replace occ_92_3d=723 if occ_88_4d==7232
replace occ_92_3d=723 if occ_88_4d==7233
replace occ_92_3d=723 if occ_88_4d==7237
replace occ_92_3d=724 if occ_88_4d==7240
replace occ_92_3d=724 if occ_88_4d==7241
replace occ_92_3d=724 if occ_88_4d==7242
replace occ_92_3d=724 if occ_88_4d==7243
replace occ_92_3d=724 if occ_88_4d==7244
replace occ_92_3d=724 if occ_88_4d==7245
replace occ_92_3d=724 if occ_88_4d==7249
replace occ_92_3d=724 if occ_88_4d==7251
replace occ_92_3d=724 if occ_88_4d==7252
replace occ_92_3d=724 if occ_88_4d==7253
replace occ_92_3d=724 if occ_88_4d==7254
replace occ_92_3d=724 if occ_88_4d==7257
replace occ_92_3d=724 if occ_88_4d==7259
replace occ_92_3d=726 if occ_88_4d==7261
replace occ_92_3d=726 if occ_88_4d==7262
replace occ_92_3d=726 if occ_88_4d==7263
replace occ_92_3d=726 if occ_88_4d==7264
replace occ_92_3d=726 if occ_88_4d==7265
replace occ_92_3d=726 if occ_88_4d==7269
replace occ_92_3d=731 if occ_88_4d==7311
replace occ_92_3d=732 if occ_88_4d==7321
replace occ_92_3d=732 if occ_88_4d==7327
replace occ_92_3d=735 if occ_88_4d==7330
replace occ_92_3d=735 if occ_88_4d==7331
replace occ_92_3d=735 if occ_88_4d==7332
replace occ_92_3d=735 if occ_88_4d==7333
replace occ_92_3d=735 if occ_88_4d==7341
replace occ_92_3d=741 if occ_88_4d==7410
replace occ_92_3d=741 if occ_88_4d==7411
replace occ_92_3d=741 if occ_88_4d==7412
replace occ_92_3d=741 if occ_88_4d==7413
replace occ_92_3d=741 if occ_88_4d==7414
replace occ_92_3d=741 if occ_88_4d==7415
replace occ_92_3d=741 if occ_88_4d==7416
replace occ_92_3d=741 if occ_88_4d==7417
replace occ_92_3d=741 if occ_88_4d==7418
replace occ_92_3d=741 if occ_88_4d==7419
replace occ_92_3d=742 if occ_88_4d==7420
replace occ_92_3d=742 if occ_88_4d==7421
replace occ_92_3d=742 if occ_88_4d==7422
replace occ_92_3d=742 if occ_88_4d==7423
replace occ_92_3d=742 if occ_88_4d==7429
replace occ_92_3d=743 if occ_88_4d==7431
replace occ_92_3d=743 if occ_88_4d==7432
replace occ_92_3d=744 if occ_88_4d==7440
replace occ_92_3d=744 if occ_88_4d==7442
replace occ_92_3d=744 if occ_88_4d==7443
replace occ_92_3d=744 if occ_88_4d==7444
replace occ_92_3d=744 if occ_88_4d==7445
replace occ_92_3d=744 if occ_88_4d==7446
replace occ_92_3d=744 if occ_88_4d==7447
replace occ_92_3d=744 if occ_88_4d==7449
replace occ_92_3d=750 if occ_88_4d==7511
replace occ_92_3d=751 if occ_88_4d==7512
replace occ_92_3d=751 if occ_88_4d==7513
replace occ_92_3d=751 if occ_88_4d==7514
replace occ_92_3d=751 if occ_88_4d==7515
replace occ_92_3d=751 if occ_88_4d==7516
replace occ_92_3d=751 if occ_88_4d==7518
replace occ_92_3d=751 if occ_88_4d==7519
replace occ_92_3d=757 if occ_88_4d==7520
replace occ_92_3d=757 if occ_88_4d==7521
replace occ_92_3d=757 if occ_88_4d==7522
replace occ_92_3d=757 if occ_88_4d==7523
replace occ_92_3d=757 if occ_88_4d==7524
replace occ_92_3d=757 if occ_88_4d==7528
replace occ_92_3d=757 if occ_88_4d==7529
replace occ_92_3d=753 if occ_88_4d==7531
replace occ_92_3d=753 if occ_88_4d==7532
replace occ_92_3d=753 if occ_88_4d==7533
replace occ_92_3d=753 if occ_88_4d==7534
replace occ_92_3d=753 if occ_88_4d==7539
replace occ_92_3d=761 if occ_88_4d==7611
replace occ_92_3d=761 if occ_88_4d==7612
replace occ_92_3d=761 if occ_88_4d==7613
replace occ_92_3d=764 if occ_88_4d==7621
replace occ_92_3d=763 if occ_88_4d==7631
replace occ_92_3d=763 if occ_88_4d==7632
replace occ_92_3d=771 if occ_88_4d==7711
replace occ_92_3d=771 if occ_88_4d==7712
replace occ_92_3d=771 if occ_88_4d==7713
replace occ_92_3d=772 if occ_88_4d==7720
replace occ_92_3d=772 if occ_88_4d==7721
replace occ_92_3d=772 if occ_88_4d==7722
replace occ_92_3d=772 if occ_88_4d==7723
replace occ_92_3d=772 if occ_88_4d==7726
replace occ_92_3d=772 if occ_88_4d==7728
replace occ_92_3d=772 if occ_88_4d==7729
replace occ_92_3d=773 if occ_88_4d==7730
replace occ_92_3d=773 if occ_88_4d==7731
replace occ_92_3d=773 if occ_88_4d==7732
replace occ_92_3d=773 if occ_88_4d==7734
replace occ_92_3d=773 if occ_88_4d==7739
replace occ_92_3d=774 if occ_88_4d==7740
replace occ_92_3d=776 if occ_88_4d==7741
replace occ_92_3d=775 if occ_88_4d==7742
replace occ_92_3d=775 if occ_88_4d==7743
replace occ_92_3d=778 if occ_88_4d==7744
replace occ_92_3d=777 if occ_88_4d==7745
replace occ_92_3d=779 if occ_88_4d==7746
replace occ_92_3d=774 if occ_88_4d==7748
replace occ_92_3d=779 if occ_88_4d==7749
replace occ_92_3d=780 if occ_88_4d==7810
replace occ_92_3d=787 if occ_88_4d==7811
replace occ_92_3d=786 if occ_88_4d==7812
replace occ_92_3d=785 if occ_88_4d==7813
replace occ_92_3d=788 if occ_88_4d==7814
replace occ_92_3d=789 if occ_88_4d==7815
replace occ_92_3d=788 if occ_88_4d==7816
replace occ_92_3d=788 if occ_88_4d==7818
replace occ_92_3d=788 if occ_88_4d==7819
replace occ_92_3d=782 if occ_88_4d==7821
replace occ_92_3d=782 if occ_88_4d==7822
replace occ_92_3d=782 if occ_88_4d==7823
replace occ_92_3d=782 if occ_88_4d==7824
replace occ_92_3d=789 if occ_88_4d==7825
replace occ_92_3d=782 if occ_88_4d==7826
replace occ_92_3d=782 if occ_88_4d==7828
replace occ_92_3d=783 if occ_88_4d==7831
replace occ_92_3d=783 if occ_88_4d==7832
replace occ_92_3d=783 if occ_88_4d==7833
replace occ_92_3d=784 if occ_88_4d==7840
replace occ_92_3d=784 if occ_88_4d==7841
replace occ_92_3d=784 if occ_88_4d==7842
replace occ_92_3d=784 if occ_88_4d==7843
replace occ_92_3d=784 if occ_88_4d==7844
replace occ_92_3d=784 if occ_88_4d==7845
replace occ_92_3d=784 if occ_88_4d==7849
replace occ_92_3d=791 if occ_88_4d==7911
replace occ_92_3d=791 if occ_88_4d==7912
replace occ_92_3d=791 if occ_88_4d==7913
replace occ_92_3d=792 if occ_88_4d==7920
replace occ_92_3d=792 if occ_88_4d==7921
replace occ_92_3d=792 if occ_88_4d==7922
replace occ_92_3d=792 if occ_88_4d==7923
replace occ_92_3d=792 if occ_88_4d==7924
replace occ_92_3d=792 if occ_88_4d==7925
replace occ_92_3d=792 if occ_88_4d==7926
replace occ_92_3d=792 if occ_88_4d==7928
replace occ_92_3d=792 if occ_88_4d==7929
replace occ_92_3d=793 if occ_88_4d==7931
replace occ_92_3d=793 if occ_88_4d==7932
replace occ_92_3d=796 if occ_88_4d==7933
replace occ_92_3d=796 if occ_88_4d==7934
replace occ_92_3d=794 if occ_88_4d==7941
replace occ_92_3d=794 if occ_88_4d==7942
replace occ_92_3d=794 if occ_88_4d==7943
replace occ_92_3d=794 if occ_88_4d==7944
replace occ_92_3d=794 if occ_88_4d==7945
replace occ_92_3d=794 if occ_88_4d==7949
replace occ_92_3d=801 if occ_88_4d==8011
replace occ_92_3d=802 if occ_88_4d==8021
replace occ_92_3d=803 if occ_88_4d==8030
replace occ_92_3d=803 if occ_88_4d==8031
replace occ_92_3d=803 if occ_88_4d==8032
replace occ_92_3d=803 if occ_88_4d==8033
replace occ_92_3d=803 if occ_88_4d==8034
replace occ_92_3d=803 if occ_88_4d==8035
replace occ_92_3d=803 if occ_88_4d==8037
replace occ_92_3d=804 if occ_88_4d==8041
replace occ_92_3d=804 if occ_88_4d==8042
replace occ_92_3d=805 if occ_88_4d==8051
replace occ_92_3d=805 if occ_88_4d==8052
replace occ_92_3d=805 if occ_88_4d==8053
replace occ_92_3d=805 if occ_88_4d==8054
replace occ_92_3d=805 if occ_88_4d==8055
replace occ_92_3d=805 if occ_88_4d==8059
replace occ_92_3d=811 if occ_88_4d==8111
replace occ_92_3d=812 if occ_88_4d==8121
replace occ_92_3d=813 if occ_88_4d==8130
replace occ_92_3d=813 if occ_88_4d==8131
replace occ_92_3d=813 if occ_88_4d==8132
replace occ_92_3d=813 if occ_88_4d==8133
replace occ_92_3d=813 if occ_88_4d==8134
replace occ_92_3d=813 if occ_88_4d==8135
replace occ_92_3d=813 if occ_88_4d==8136
replace occ_92_3d=813 if occ_88_4d==8138
replace occ_92_3d=813 if occ_88_4d==8139
replace occ_92_3d=814 if occ_88_4d==8141
replace occ_92_3d=814 if occ_88_4d==8142
replace occ_92_3d=821 if occ_88_4d==8211
replace occ_92_3d=821 if occ_88_4d==8212
replace occ_92_3d=821 if occ_88_4d==8213
replace occ_92_3d=821 if occ_88_4d==8214
replace occ_92_3d=821 if occ_88_4d==8215
replace occ_92_3d=821 if occ_88_4d==8216
replace occ_92_3d=821 if occ_88_4d==8219
replace occ_92_3d=822 if occ_88_4d==8221
replace occ_92_3d=822 if occ_88_4d==8222
replace occ_92_3d=822 if occ_88_4d==8223
replace occ_92_3d=823 if occ_88_4d==8231
replace occ_92_3d=823 if occ_88_4d==8232
replace occ_92_3d=823 if occ_88_4d==8233
replace occ_92_3d=823 if occ_88_4d==8234
replace occ_92_3d=823 if occ_88_4d==8235
replace occ_92_3d=823 if occ_88_4d==8237
replace occ_92_3d=831 if occ_88_4d==8311
replace occ_92_3d=831 if occ_88_4d==8312
replace occ_92_3d=831 if occ_88_4d==8313
replace occ_92_3d=831 if occ_88_4d==8314
replace occ_92_3d=831 if occ_88_4d==8319
replace occ_92_3d=832 if occ_88_4d==8321
replace occ_92_3d=832 if occ_88_4d==8322
replace occ_92_3d=832 if occ_88_4d==8323
replace occ_92_3d=832 if occ_88_4d==8324
replace occ_92_3d=832 if occ_88_4d==8325
replace occ_92_3d=832 if occ_88_4d==8326
replace occ_92_3d=832 if occ_88_4d==8327
replace occ_92_3d=832 if occ_88_4d==8328
replace occ_92_3d=832 if occ_88_4d==8329
replace occ_92_3d=833 if occ_88_4d==8331
replace occ_92_3d=833 if occ_88_4d==8332
replace occ_92_3d=833 if occ_88_4d==8333
replace occ_92_3d=833 if occ_88_4d==8334
replace occ_92_3d=833 if occ_88_4d==8335
replace occ_92_3d=833 if occ_88_4d==8336
replace occ_92_3d=833 if occ_88_4d==8338
replace occ_92_3d=833 if occ_88_4d==8339
replace occ_92_3d=839 if occ_88_4d==8341
replace occ_92_3d=839 if occ_88_4d==8342
replace occ_92_3d=839 if occ_88_4d==8347
replace occ_92_3d=835 if occ_88_4d==8351
replace occ_92_3d=835 if occ_88_4d==8352
replace occ_92_3d=835 if occ_88_4d==8353
replace occ_92_3d=835 if occ_88_4d==8354
replace occ_92_3d=835 if occ_88_4d==8355
replace occ_92_3d=835 if occ_88_4d==8356
replace occ_92_3d=835 if occ_88_4d==8357
replace occ_92_3d=835 if occ_88_4d==8358
replace occ_92_3d=835 if occ_88_4d==8359
replace occ_92_3d=836 if occ_88_4d==8361
replace occ_92_3d=836 if occ_88_4d==8362
replace occ_92_3d=836 if occ_88_4d==8369
replace occ_92_3d=837 if occ_88_4d==8370
replace occ_92_3d=837 if occ_88_4d==8371
replace occ_92_3d=837 if occ_88_4d==8372
replace occ_92_3d=837 if occ_88_4d==8373
replace occ_92_3d=837 if occ_88_4d==8374
replace occ_92_3d=837 if occ_88_4d==8375
replace occ_92_3d=837 if occ_88_4d==8376
replace occ_92_3d=837 if occ_88_4d==8379
replace occ_92_3d=838 if occ_88_4d==8381
replace occ_92_3d=838 if occ_88_4d==8382
replace occ_92_3d=838 if occ_88_4d==8383
replace occ_92_3d=838 if occ_88_4d==8384
replace occ_92_3d=838 if occ_88_4d==8385
replace occ_92_3d=838 if occ_88_4d==8386
replace occ_92_3d=838 if occ_88_4d==8388
replace occ_92_3d=838 if occ_88_4d==8389
replace occ_92_3d=841 if occ_88_4d==8410
replace occ_92_3d=841 if occ_88_4d==8411
replace occ_92_3d=841 if occ_88_4d==8412
replace occ_92_3d=841 if occ_88_4d==8413
replace occ_92_3d=841 if occ_88_4d==8414
replace occ_92_3d=841 if occ_88_4d==8415
replace occ_92_3d=841 if occ_88_4d==8416
replace occ_92_3d=841 if occ_88_4d==8418
replace occ_92_3d=841 if occ_88_4d==8419
replace occ_92_3d=842 if occ_88_4d==8421
replace occ_92_3d=842 if occ_88_4d==8422
replace occ_92_3d=843 if occ_88_4d==8431
replace occ_92_3d=844 if occ_88_4d==8441
replace occ_92_3d=851 if occ_88_4d==8511
replace occ_92_3d=886 if occ_88_4d==8512
replace occ_92_3d=852 if occ_88_4d==8520
replace occ_92_3d=852 if occ_88_4d==8521
replace occ_92_3d=852 if occ_88_4d==8522
replace occ_92_3d=852 if occ_88_4d==8523
replace occ_92_3d=852 if occ_88_4d==8524
replace occ_92_3d=859 if occ_88_4d==8525
replace occ_92_3d=859 if occ_88_4d==8526
replace occ_92_3d=859 if occ_88_4d==8528
replace occ_92_3d=859 if occ_88_4d==8529
replace occ_92_3d=853 if occ_88_4d==8530
replace occ_92_3d=853 if occ_88_4d==8531
replace occ_92_3d=853 if occ_88_4d==8532
replace occ_92_3d=853 if occ_88_4d==8533
replace occ_92_3d=853 if occ_88_4d==8534
replace occ_92_3d=853 if occ_88_4d==8535
replace occ_92_3d=853 if occ_88_4d==8536
replace occ_92_3d=853 if occ_88_4d==8538
replace occ_92_3d=853 if occ_88_4d==8539
replace occ_92_3d=854 if occ_88_4d==8541
replace occ_92_3d=854 if occ_88_4d==8542
replace occ_92_3d=854 if occ_88_4d==8543
replace occ_92_3d=855 if occ_88_4d==8551
replace occ_92_3d=855 if occ_88_4d==8552
replace occ_92_3d=855 if occ_88_4d==8553
replace occ_92_3d=856 if occ_88_4d==8560
replace occ_92_3d=856 if occ_88_4d==8561
replace occ_92_3d=856 if occ_88_4d==8562
replace occ_92_3d=856 if occ_88_4d==8563
replace occ_92_3d=856 if occ_88_4d==8564
replace occ_92_3d=857 if occ_88_4d==8571
replace occ_92_3d=857 if occ_88_4d==8572
replace occ_92_3d=857 if occ_88_4d==8573
replace occ_92_3d=857 if occ_88_4d==8574
replace occ_92_3d=857 if occ_88_4d==8575
replace occ_92_3d=857 if occ_88_4d==8579
replace occ_92_3d=861 if occ_88_4d==8610
replace occ_92_3d=861 if occ_88_4d==8611
replace occ_92_3d=861 if occ_88_4d==8612
replace occ_92_3d=861 if occ_88_4d==8613
replace occ_92_3d=864 if occ_88_4d==8614
replace occ_92_3d=865 if occ_88_4d==8615
replace occ_92_3d=861 if occ_88_4d==8616
replace occ_92_3d=861 if occ_88_4d==8619
replace occ_92_3d=861 if occ_88_4d==8621
replace occ_92_3d=861 if occ_88_4d==8622
replace occ_92_3d=863 if occ_88_4d==8623
replace occ_92_3d=861 if occ_88_4d==8624
replace occ_92_3d=863 if occ_88_4d==8625
replace occ_92_3d=863 if occ_88_4d==8627
replace occ_92_3d=891 if occ_88_4d==8628
replace occ_92_3d=861 if occ_88_4d==8629
replace occ_92_3d=868 if occ_88_4d==8631
replace occ_92_3d=868 if occ_88_4d==8632
replace occ_92_3d=868 if occ_88_4d==8633
replace occ_92_3d=868 if occ_88_4d==8634
replace occ_92_3d=863 if occ_88_4d==8641
replace occ_92_3d=863 if occ_88_4d==8642
replace occ_92_3d=867 if occ_88_4d==8643
replace occ_92_3d=867 if occ_88_4d==8647
replace occ_92_3d=871 if occ_88_4d==8710
replace occ_92_3d=871 if occ_88_4d==8711
replace occ_92_3d=871 if occ_88_4d==8712
replace occ_92_3d=871 if occ_88_4d==8713
replace occ_92_3d=871 if occ_88_4d==8714
replace occ_92_3d=872 if occ_88_4d==8721
replace occ_92_3d=873 if occ_88_4d==8730
replace occ_92_3d=873 if occ_88_4d==8731
replace occ_92_3d=873 if occ_88_4d==8732
replace occ_92_3d=873 if occ_88_4d==8733
replace occ_92_3d=873 if occ_88_4d==8734
replace occ_92_3d=873 if occ_88_4d==8735
replace occ_92_3d=874 if occ_88_4d==8740
replace occ_92_3d=874 if occ_88_4d==8741
replace occ_92_3d=874 if occ_88_4d==8742
replace occ_92_3d=874 if occ_88_4d==8743
replace occ_92_3d=874 if occ_88_4d==8744
replace occ_92_3d=874 if occ_88_4d==8745
replace occ_92_3d=874 if occ_88_4d==8746
replace occ_92_3d=874 if occ_88_4d==8748
replace occ_92_3d=874 if occ_88_4d==8749
replace occ_92_3d=875 if occ_88_4d==8751
replace occ_92_3d=875 if occ_88_4d==8752
replace occ_92_3d=876 if occ_88_4d==8760
replace occ_92_3d=876 if occ_88_4d==8761
replace occ_92_3d=876 if occ_88_4d==8762
replace occ_92_3d=876 if occ_88_4d==8763
replace occ_92_3d=876 if occ_88_4d==8764
replace occ_92_3d=876 if occ_88_4d==8765
replace occ_92_3d=876 if occ_88_4d==8766
replace occ_92_3d=876 if occ_88_4d==8768
replace occ_92_3d=876 if occ_88_4d==8769
replace occ_92_3d=878 if occ_88_4d==8771
replace occ_92_3d=879 if occ_88_4d==8772
replace occ_92_3d=879 if occ_88_4d==8773
replace occ_92_3d=879 if occ_88_4d==8774
replace occ_92_3d=879 if occ_88_4d==8775
replace occ_92_3d=879 if occ_88_4d==8776
replace occ_92_3d=879 if occ_88_4d==8778
replace occ_92_3d=879 if occ_88_4d==8779
replace occ_92_3d=881 if occ_88_4d==8811
replace occ_92_3d=881 if occ_88_4d==8812
replace occ_92_3d=881 if occ_88_4d==8813
replace occ_92_3d=887 if occ_88_4d==8814
replace occ_92_3d=886 if occ_88_4d==8815
replace occ_92_3d=884 if occ_88_4d==8816
replace occ_92_3d=884 if occ_88_4d==8818
replace occ_92_3d=884 if occ_88_4d==8819
replace occ_92_3d=882 if occ_88_4d==8821
replace occ_92_3d=882 if occ_88_4d==8822
replace occ_92_3d=882 if occ_88_4d==8823
replace occ_92_3d=882 if occ_88_4d==8824
replace occ_92_3d=882 if occ_88_4d==8825
replace occ_92_3d=882 if occ_88_4d==8826
replace occ_92_3d=885 if occ_88_4d==8828
replace occ_92_3d=882 if occ_88_4d==8829
replace occ_92_3d=883 if occ_88_4d==8831
replace occ_92_3d=883 if occ_88_4d==8832
replace occ_92_3d=883 if occ_88_4d==8833
replace occ_92_3d=883 if occ_88_4d==8834
replace occ_92_3d=883 if occ_88_4d==8835
replace occ_92_3d=883 if occ_88_4d==8836
replace occ_92_3d=883 if occ_88_4d==8838
replace occ_92_3d=883 if occ_88_4d==8839
replace occ_92_3d=891 if occ_88_4d==8911
replace occ_92_3d=891 if occ_88_4d==8921
replace occ_92_3d=894 if occ_88_4d==8931
replace occ_92_3d=901 if occ_88_4d==9010
replace occ_92_3d=901 if occ_88_4d==9011
replace occ_92_3d=901 if occ_88_4d==9012
replace occ_92_3d=901 if occ_88_4d==9013
replace occ_92_3d=901 if occ_88_4d==9014
replace occ_92_3d=902 if occ_88_4d==9021
replace occ_92_3d=902 if occ_88_4d==9022
replace occ_92_3d=902 if occ_88_4d==9023
replace occ_92_3d=902 if occ_88_4d==9029
replace occ_92_3d=911 if occ_88_4d==9111
replace occ_92_3d=911 if occ_88_4d==9112
replace occ_92_3d=914 if occ_88_4d==9113
replace occ_92_3d=914 if occ_88_4d==9114
replace occ_92_3d=911 if occ_88_4d==9115
replace occ_92_3d=911 if occ_88_4d==9119
replace occ_92_3d=912 if occ_88_4d==9121
replace occ_92_3d=912 if occ_88_4d==9122
replace occ_92_3d=912 if occ_88_4d==9123
replace occ_92_3d=912 if occ_88_4d==9124
replace occ_92_3d=912 if occ_88_4d==9127
replace occ_92_3d=912 if occ_88_4d==9129
replace occ_92_3d=915 if occ_88_4d==9130
replace occ_92_3d=915 if occ_88_4d==9131
replace occ_92_3d=915 if occ_88_4d==9132
replace occ_92_3d=915 if occ_88_4d==9133
replace occ_92_3d=915 if occ_88_4d==9134
replace occ_92_3d=915 if occ_88_4d==9135
replace occ_92_3d=915 if occ_88_4d==9136
replace occ_92_3d=915 if occ_88_4d==9139
replace occ_92_3d=921 if occ_88_4d==9210
replace occ_92_3d=921 if occ_88_4d==9211
replace occ_92_3d=921 if occ_88_4d==9212
replace occ_92_3d=921 if occ_88_4d==9213
replace occ_92_3d=921 if occ_88_4d==9214
replace occ_92_3d=921 if occ_88_4d==9215
replace occ_92_3d=921 if occ_88_4d==9219
replace occ_92_3d=921 if occ_88_4d==9220
replace occ_92_3d=921 if occ_88_4d==9221
replace occ_92_3d=921 if occ_88_4d==9222
replace occ_92_3d=921 if occ_88_4d==9229
replace occ_92_3d=923 if occ_88_4d==9230
replace occ_92_3d=923 if occ_88_4d==9231
replace occ_92_3d=923 if occ_88_4d==9232
replace occ_92_3d=923 if occ_88_4d==9233
replace occ_92_3d=923 if occ_88_4d==9234
replace occ_92_3d=923 if occ_88_4d==9235
replace occ_92_3d=923 if occ_88_4d==9236
replace occ_92_3d=923 if occ_88_4d==9237
replace occ_92_3d=923 if occ_88_4d==9238
replace occ_92_3d=923 if occ_88_4d==9239
replace occ_92_3d=931 if occ_88_4d==9310
replace occ_92_3d=931 if occ_88_4d==9311
replace occ_92_3d=931 if occ_88_4d==9312
replace occ_92_3d=931 if occ_88_4d==9313
replace occ_92_3d=931 if occ_88_4d==9317
replace occ_92_3d=931 if occ_88_4d==9319
replace occ_92_3d=931 if occ_88_4d==9320
replace occ_92_3d=931 if occ_88_4d==9321
replace occ_92_3d=931 if occ_88_4d==9322
replace occ_92_3d=931 if occ_88_4d==9327
replace occ_92_3d=931 if occ_88_4d==9329
replace occ_92_3d=934 if occ_88_4d==9331
replace occ_92_3d=934 if occ_88_4d==9332
replace occ_92_3d=934 if occ_88_4d==9339
replace occ_92_3d=934 if occ_88_4d==9341
replace occ_92_3d=934 if occ_88_4d==9342
replace occ_92_3d=934 if occ_88_4d==9343
replace occ_92_3d=934 if occ_88_4d==9349
replace occ_92_3d=935 if occ_88_4d==9350
replace occ_92_3d=935 if occ_88_4d==9351
replace occ_92_3d=935 if occ_88_4d==9352
replace occ_92_3d=935 if occ_88_4d==9353
replace occ_92_3d=935 if occ_88_4d==9354
replace occ_92_3d=935 if occ_88_4d==9359
replace occ_92_3d=936 if occ_88_4d==9360
replace occ_92_3d=936 if occ_88_4d==9361
replace occ_92_3d=936 if occ_88_4d==9362
replace occ_92_3d=936 if occ_88_4d==9363
replace occ_92_3d=936 if occ_88_4d==9369
replace occ_92_3d=937 if occ_88_4d==9371
replace occ_92_3d=937 if occ_88_4d==9372
replace occ_92_3d=937 if occ_88_4d==9373
replace occ_92_3d=937 if occ_88_4d==9379
replace occ_92_3d=971 if occ_88_4d==9711
replace occ_92_3d=981 if occ_88_4d==9811
replace occ_92_3d=982 if occ_88_4d==9821
replace occ_92_3d=983 if occ_88_4d==9831
replace occ_92_3d=983 if occ_88_4d==9832
replace occ_92_3d=990 if occ_88_4d==9911

* clean occupations
drop if occ_92_3d == .
drop if occ_92_3d == 990
drop if occ_92_3d == 971
drop if occ_92_3d == 981
drop if occ_92_3d == 982

* generate skill variables (1 = Yes)

	* Verbal
	gen verb = v55 // 1 = Yes
	
	* Quantitative
	gen quant = v77 // 1 = Yes
	
	* Analytic
	recode v186 (1 2 3 = 1) (4 5 = 0), gen(analyt)
	
	* Creative
	recode v187 (1 2 3 = 1) (4 5 = 0), gen(create)
	
	* Computer
	gen comp = . // 1 = Yes
	replace comp = 1 if v160 == 1 | v161 == 1 | v162 == 1 | v140 == 1
	replace comp = 0 if v160 == 0 & v161 == 0 & v162 == 0 & v140 == 0
	
	* Management
	gen manage = v86
	
	* Care
	gen care = v61
	
	* Routine
	recode v185 (1 2 3 = 1) (4 5 = 0), gen(routine) // 1 = Yes
	
* collapse
bysort occ_92_3d: gen cellsize = _N
collapse (mean) verb-routine (max) cellsize [pweight = v318], by(occ_92_3d)

* clean & save
foreach var of varlist verb-routine {
	replace `var' = round(`var', 0.01)*100
}
gen year = 1991

save "input/aux/etb_1991.dta", replace



// **************** //
// ***** 1998 ***** //
// **************** //

* load data
use "input/ZA3379_1999/ZA3379_v1-1-0.dta", clear
keep v214 v213 v267 v268 v53 v225 v201 v266 v143 v142 v782 v12 v789

* create KldB 88 3-digit
gen occ_92_3d = int(v12/10)
drop if occ_92_3d >= 971

* generate skill variables (1 = Yes)

	* Verbal
	gen verb = 1 if v214 == 1
	replace verb = 0 if v214 == 0
	
	* Quantitative
	gen quant = 1 if v213 == 1
	replace quant = 0 if v213 == 0
	
	* Analytic
	recode v267 (1 2 3 = 1) (4 5 = 0), gen(analyt)
	
	* Creative
	recode v268 (1 2 3 = 1) (4 5 = 0), gen(create)
	
	* Computer
	gen comp = .
	replace comp = 1 if v53 == 1
	replace comp = 0 if v53 == 2
	
	* Management
	gen manage = v225
	
	* Care
	recode v201 (1 2 = 1) (3 = 0), gen(care)
	
	* Routine
	recode v266 (1 2 3 = 1) (4 5 = 0), gen(routine)
	
* collapse
bysort occ_92_3d: gen cellsize = _N
collapse (mean) verb-routine (max) cellsize [pweight = v789], by(occ_92_3d)

* clean & save
foreach var of varlist verb-routine {
	replace `var' = round(`var', 0.01)*100
}
gen year = 1998

save "input/aux/etb_1998.dta", replace



// **************** //
// ***** 1998 ***** //
// **************** //


* load data
use "input/ZA4820_2006/ZA4820_v1-0-1.dta", clear
keep f403_09 f403_08 f411_04 f411_05 f318 f403_05 f316 f411_03 f224 f226 f210 bula f100stba gew3_05 f301

* create KldB 88 3-digit
gen occ_92_3d = int(f100stba/10)
drop if occ_92_3d >= 971

* generate skill variables (1 = Yes)

	* Verbal
	gen verb = 1 if f403_09 == 3
	replace verb = 0 if f403_09 == 1 | f403_09 == 2
	replace verb = . if f403_09 == 9
	
	* Quantitative
	recode f403_08 (3 = 1) (1 2 = 0) (9 = .), gen(quant)
	
	* Analytic
	recode f411_04 (1 2= 1) (3 4 = 0) (9=.), gen(analyt)
	
	* Creative
	recode f411_05 (1 2= 1) (3 4 = 0) (9=.), gen(create)
	
	* Computer
	recode f318 (1= 1) (2 3= 0) (9=.), gen(comp)
	
	* Management
	recode f403_05 (1 2 7 = 0) (3=1) (9=.), gen(manage)
	
	* Care
	recode f316 (1 = 1) (2 3 = 0) (9=.), gen(care)
	
	* Routine
	recode f411_03 (1 2 = 1) (3 4 = 0) (9=.), gen(routine)
	
* collapse
bysort occ_92_3d: gen cellsize = _N
collapse (mean) verb-routine (max) cellsize [pweight = gew3_05], by(occ_92_3d)

* clean & save
foreach var of varlist verb-routine {
	replace `var' = round(`var', 0.01)*100
}
gen year = 2006

save "input/aux/etb_2006.dta", replace



// **************** //
// ***** 2012 ***** //
// **************** //

* load data
use "input/ZA5657_2012/ZA5657_v4-0-0.dta", clear
keep F403_05 F403_04 F411_04 F411_05 F318 F403_02 F301 F316 F411_03 F210_02 F209 F209_01 Bula EB92o Gew2012

* clean KldB 88 3-digit
gen occ_92_3d = EB92o
drop if occ_92_3d == -111
drop if occ_92_3d == 0
drop if occ_92_3d >= 971

* generate skill variables (1 = Yes)

	* Verbal
	gen verb = 1 if F403_05 == 3
	replace verb = 0 if F403_05 == 1 | F403_05 == 2
	replace verb = . if F403_05 == 9
	
	* Quantitative
	recode F403_04 (3 = 1) (1 2 = 0) (9 = .), gen(quant)
	
	* Analytic
	recode F411_04 (1 2= 1) (3 4 = 0) (9=.), gen(analyt)
	
	* Creative
	recode F411_05 (1 2= 1) (3 4 = 0) (9=.), gen(create)
	
	* Computer
	recode F318 (1= 1) (2 3= 0) (9=.), gen(comp)
	
	* Management
	recode F403_02 (1 2 7 = 0) (3=1) (9=.), gen(manage)
	
	* Care
	recode F316 (1 = 1) (2 3 = 0) (9=.), gen(care)
	
	* Routine
	recode F411_03 (1 2 = 1) (3 4 = 0) (9=.), gen(routine)
	
* collapse
bysort occ_92_3d: gen cellsize = _N
collapse (mean) verb-routine (max) cellsize [pweight = Gew2012], by(occ_92_3d)

* clean & save
foreach var of varlist verb-routine {
	replace `var' = round(`var', 0.01)*100
}
gen year = 2012

save "input/aux/etb_2012.dta", replace



// ******************* //
// ***** Average ***** //
// ******************* //


* combine datasets
clear
use "input/aux/etb_1991.dta"
append using "input/aux/etb_1998.dta"
append using "input/aux/etb_2006.dta"
append using "input/aux/etb_2012.dta"

* into wide shape
reshape wide verb-cellsize, i(occ_92_3d) j(year)
order occ verb* quant* analyt* create* comp* manage* care* routine* cellsize*

* drop a few occs for which no merge found
drop if occ_92_3d == 721
drop if occ_92_3d == 723
drop if occ_92_3d == 724

* merge
// code as in "Variables.xlsx"
gen occ_92_3d_m = occ_92_3d
replace occ_92_3d_m =1007 if occ_92_3d==12
replace occ_92_3d_m =1007 if occ_92_3d==13
replace occ_92_3d_m =1007 if occ_92_3d==14
replace occ_92_3d_m =1007 if occ_92_3d==31
replace occ_92_3d_m =1007 if occ_92_3d==32
replace occ_92_3d_m =1008 if occ_92_3d==61
replace occ_92_3d_m =1000 if occ_92_3d==70
replace occ_92_3d_m =1000 if occ_92_3d==71
replace occ_92_3d_m =1000 if occ_92_3d==72
replace occ_92_3d_m =1000 if occ_92_3d==80
replace occ_92_3d_m =1001 if occ_92_3d==101
replace occ_92_3d_m =1001 if occ_92_3d==112
replace occ_92_3d_m =1002 if occ_92_3d==131
replace occ_92_3d_m =1002 if occ_92_3d==135
replace occ_92_3d_m =1003 if occ_92_3d==142
replace occ_92_3d_m =1003 if occ_92_3d==145
replace occ_92_3d_m =1004 if occ_92_3d==152
replace occ_92_3d_m =1004 if occ_92_3d==153
replace occ_92_3d_m =1005 if occ_92_3d==161
replace occ_92_3d_m =1005 if occ_92_3d==162
replace occ_92_3d_m =1005 if occ_92_3d==164
replace occ_92_3d_m =1009 if occ_92_3d==172
replace occ_92_3d_m =1009 if occ_92_3d==173
replace occ_92_3d_m =1009 if occ_92_3d==175
replace occ_92_3d_m =1009 if occ_92_3d==176
replace occ_92_3d_m =1006 if occ_92_3d==181
replace occ_92_3d_m =1006 if occ_92_3d==185
replace occ_92_3d_m =1010 if occ_92_3d==194
replace occ_92_3d_m =1011 if occ_92_3d==211
replace occ_92_3d_m =1011 if occ_92_3d==212
replace occ_92_3d_m =1011 if occ_92_3d==213
replace occ_92_3d_m =1012 if occ_92_3d==220
replace occ_92_3d_m =1012 if occ_92_3d==224
replace occ_92_3d_m =1012 if occ_92_3d==229
replace occ_92_3d_m =1013 if occ_92_3d==231
replace occ_92_3d_m =1013 if occ_92_3d==233
replace occ_92_3d_m =1013 if occ_92_3d==234
replace occ_92_3d_m =1013 if occ_92_3d==235
replace occ_92_3d_m =1014 if occ_92_3d==245
replace occ_92_3d_m =1015 if occ_92_3d==250
replace occ_92_3d_m =1015 if occ_92_3d==252
replace occ_92_3d_m =1015 if occ_92_3d==256
replace occ_92_3d_m =1015 if occ_92_3d==259
replace occ_92_3d_m =1016 if occ_92_3d==261
replace occ_92_3d_m =1016 if occ_92_3d==265
replace occ_92_3d_m =1016 if occ_92_3d==266
replace occ_92_3d_m =1016 if occ_92_3d==269
replace occ_92_3d_m =1017 if occ_92_3d==270
replace occ_92_3d_m =1017 if occ_92_3d==276
replace occ_92_3d_m =1017 if occ_92_3d==278
replace occ_92_3d_m =1018 if occ_92_3d==282
replace occ_92_3d_m =1018 if occ_92_3d==287
replace occ_92_3d_m =1019 if occ_92_3d==290
replace occ_92_3d_m =1019 if occ_92_3d==292
replace occ_92_3d_m =1019 if occ_92_3d==293
replace occ_92_3d_m =1019 if occ_92_3d==294
replace occ_92_3d_m =1019 if occ_92_3d==295
replace occ_92_3d_m =1020 if occ_92_3d==302
replace occ_92_3d_m =1020 if occ_92_3d==305
replace occ_92_3d_m =1020 if occ_92_3d==307
replace occ_92_3d_m =1020 if occ_92_3d==308
replace occ_92_3d_m =1020 if occ_92_3d==309
replace occ_92_3d_m =1021 if occ_92_3d==315
replace occ_92_3d_m =1022 if occ_92_3d==321
replace occ_92_3d_m =1023 if occ_92_3d==331
replace occ_92_3d_m =1023 if occ_92_3d==332
replace occ_92_3d_m =1023 if occ_92_3d==341
replace occ_92_3d_m =1023 if occ_92_3d==344
replace occ_92_3d_m =1023 if occ_92_3d==349
replace occ_92_3d_m =1024 if occ_92_3d==352
replace occ_92_3d_m =1024 if occ_92_3d==353
replace occ_92_3d_m =1024 if occ_92_3d==354
replace occ_92_3d_m =1024 if occ_92_3d==359
replace occ_92_3d_m =1023 if occ_92_3d==361
replace occ_92_3d_m =1025 if occ_92_3d==371
replace occ_92_3d_m =1025 if occ_92_3d==372
replace occ_92_3d_m =1025 if occ_92_3d==373
replace occ_92_3d_m =1025 if occ_92_3d==374
replace occ_92_3d_m =1025 if occ_92_3d==376
replace occ_92_3d_m =1025 if occ_92_3d==378
replace occ_92_3d_m =1026 if occ_92_3d==393
replace occ_92_3d_m =1027 if occ_92_3d==421
replace occ_92_3d_m =1027 if occ_92_3d==423
replace occ_92_3d_m =1027 if occ_92_3d==424
replace occ_92_3d_m =1028 if occ_92_3d==431
replace occ_92_3d_m =1029 if occ_92_3d==440
replace occ_92_3d_m =1029 if occ_92_3d==443
replace occ_92_3d_m =1030 if occ_92_3d==460
replace occ_92_3d_m =1030 if occ_92_3d==463
replace occ_92_3d_m =1030 if occ_92_3d==465
replace occ_92_3d_m =1030 if occ_92_3d==466
replace occ_92_3d_m =1031 if occ_92_3d==471
replace occ_92_3d_m =1031 if occ_92_3d==472
replace occ_92_3d_m =1032 if occ_92_3d==480
replace occ_92_3d_m =1032 if occ_92_3d==481
replace occ_92_3d_m =1032 if occ_92_3d==484
replace occ_92_3d_m =1032 if occ_92_3d==485
replace occ_92_3d_m =1032 if occ_92_3d==486
replace occ_92_3d_m =1033 if occ_92_3d==492
replace occ_92_3d_m =1034 if occ_92_3d==502
replace occ_92_3d_m =1034 if occ_92_3d==505
replace occ_92_3d_m =1034 if occ_92_3d==506
replace occ_92_3d_m =1035 if occ_92_3d==510
replace occ_92_3d_m =1035 if occ_92_3d==514
replace occ_92_3d_m =1036 if occ_92_3d==523
replace occ_92_3d_m =1037 if occ_92_3d==540
replace occ_92_3d_m =1037 if occ_92_3d==541
replace occ_92_3d_m =1038 if occ_92_3d==544
replace occ_92_3d_m =1038 if occ_92_3d==545
replace occ_92_3d_m =1039 if occ_92_3d==604
replace occ_92_3d_m =1039 if occ_92_3d==605
replace occ_92_3d_m =1039 if occ_92_3d==608
replace occ_92_3d_m =1039 if occ_92_3d==609
replace occ_92_3d_m =1040 if occ_92_3d==625
replace occ_92_3d_m =1041 if occ_92_3d==632
replace occ_92_3d_m =1041 if occ_92_3d==634
replace occ_92_3d_m =1042 if occ_92_3d==663
replace occ_92_3d_m =1043 if occ_92_3d==673
replace occ_92_3d_m =1043 if occ_92_3d==674
replace occ_92_3d_m =1043 if occ_92_3d==675
replace occ_92_3d_m =1044 if occ_92_3d==685
replace occ_92_3d_m =1044 if occ_92_3d==686
replace occ_92_3d_m =1045 if occ_92_3d==692
replace occ_92_3d_m =1046 if occ_92_3d==706
replace occ_92_3d_m =1047 if occ_92_3d==716
replace occ_92_3d_m =1048 if occ_92_3d==731
replace occ_92_3d_m =1049 if occ_92_3d==743
replace occ_92_3d_m =1050 if occ_92_3d==754
replace occ_92_3d_m =1051 if occ_92_3d==755
replace occ_92_3d_m =1051 if occ_92_3d==756
replace occ_92_3d_m =1052 if occ_92_3d==761
replace occ_92_3d_m =1053 if occ_92_3d==765
replace occ_92_3d_m =1054 if occ_92_3d==783
replace occ_92_3d_m =1055 if occ_92_3d==793
replace occ_92_3d_m =1056 if occ_92_3d==794
replace occ_92_3d_m =1057 if occ_92_3d==795
replace occ_92_3d_m =1058 if occ_92_3d==812
replace occ_92_3d_m =1059 if occ_92_3d==834
replace occ_92_3d_m =1060 if occ_92_3d==838
replace occ_92_3d_m =1061 if occ_92_3d==839
replace occ_92_3d_m =1062 if occ_92_3d==843
replace occ_92_3d_m =1063 if occ_92_3d==851
replace occ_92_3d_m =1063 if occ_92_3d==855
replace occ_92_3d_m =1064 if occ_92_3d==858
replace occ_92_3d_m =1065 if occ_92_3d==862
replace occ_92_3d_m =1065 if occ_92_3d==866
replace occ_92_3d_m =1065 if occ_92_3d==869
replace occ_92_3d_m =1066 if occ_92_3d==870
replace occ_92_3d_m =1066 if occ_92_3d==878
replace occ_92_3d_m =1067 if occ_92_3d==880
replace occ_92_3d_m =1067 if occ_92_3d==884
replace occ_92_3d_m =1067 if occ_92_3d==887
replace occ_92_3d_m =1068 if occ_92_3d==894
replace occ_92_3d_m =1069 if occ_92_3d==936
replace occ_92_3d_m =1069 if occ_92_3d==937
replace occ_92_3d_m =1007 if occ_92_3d==11
replace occ_92_3d_m =1008 if occ_92_3d==62
replace occ_92_3d_m =1009 if occ_92_3d==174
replace occ_92_3d_m =1010 if occ_92_3d==191
replace occ_92_3d_m =1014 if occ_92_3d==241
replace occ_92_3d_m =1017 if occ_92_3d==274
replace occ_92_3d_m =1021 if occ_92_3d==317
replace occ_92_3d_m =1022 if occ_92_3d==322
replace occ_92_3d_m =1023 if occ_92_3d==358
replace occ_92_3d_m =1024 if occ_92_3d==351
replace occ_92_3d_m =1026 if occ_92_3d==392
replace occ_92_3d_m =1028 if occ_92_3d==435
replace occ_92_3d_m =1033 if occ_92_3d==491
replace occ_92_3d_m =1036 if occ_92_3d==522
replace occ_92_3d_m =1040 if occ_92_3d==623
replace occ_92_3d_m =1041 if occ_92_3d==633
replace occ_92_3d_m =1042 if occ_92_3d==662
replace occ_92_3d_m =1045 if occ_92_3d==691
replace occ_92_3d_m =1046 if occ_92_3d==705
replace occ_92_3d_m =1047 if occ_92_3d==715
replace occ_92_3d_m =1048 if occ_92_3d==732
replace occ_92_3d_m =1049 if occ_92_3d==744
replace occ_92_3d_m =1050 if occ_92_3d==753
replace occ_92_3d_m =1051 if occ_92_3d==751
replace occ_92_3d_m =1052 if occ_92_3d==763
replace occ_92_3d_m =1053 if occ_92_3d==764
replace occ_92_3d_m =1054 if occ_92_3d==784
replace occ_92_3d_m =1055 if occ_92_3d==792
replace occ_92_3d_m =1056 if occ_92_3d==915
replace occ_92_3d_m =1057 if occ_92_3d==876
replace occ_92_3d_m =1058 if occ_92_3d==813
replace occ_92_3d_m =1059 if occ_92_3d==833
replace occ_92_3d_m =1060 if occ_92_3d==832
replace occ_92_3d_m =1061 if occ_92_3d==837
replace occ_92_3d_m =1062 if occ_92_3d==841
replace occ_92_3d_m =1064 if occ_92_3d==857
replace occ_92_3d_m =1065 if occ_92_3d==861
replace occ_92_3d_m =1066 if occ_92_3d==879
replace occ_92_3d_m =1067 if occ_92_3d==881
replace occ_92_3d_m =1068 if occ_92_3d==891
label var occ_92_3d_m "occ. classification KldB92, merged small cells"

* collapse into single value per wave
reshape long verb quant analyt create comp manage care routine cellsize, i(occ_92_3d) j(year)
replace cellsize = 0 if cellsize == .
drop occ_92_3d
collapse verb-routine [fweight = cellsize], by(occ_92_3d_m year)
order occ_92_3d_m year
replace comp = 0 if occ_92_3d_m == 1031 & year == 1991 // this is the only missing value
foreach var of varlist verb-routine {
	replace `var'= int(`var')
}

* collapse into average value over all 4 waves
collapse verb-routine, by(occ_92_3d_m)

save "input/aux/etb_averages.dta", replace
