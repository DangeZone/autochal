% BUILD_PW308_ENGINE Build PW308 Engine Model
% -------------------------- UNCLASSIFIED ---------------------------
% ------------------ ITAR Controlled Work Product -------------------
% -------------- Northrop Grumman Proprietary Level 1 ---------------
% Build_PW308_Engine.m	
%	This function builds an engine structure which is based on the PW308 
%   engine model.  It will save a PW308_Engine.mat file in the following
%   directory \CSA\ModelData\PW308.
%
% SYNTAX:
%   EngineData = Build_PW308_Engine()
%
% Engine Model Notes:
%  PW308A,  STD DAY                  12/02/03       
%  CCD NO. 1480-00.2           
%  T4Max=2960 R  Engine Life 10703 hours                  
%  Inlet Recovery as defined by T. Strasser 6/17/03             
%  Wbleed=0.025 lb/sec, Hpx = 4.5
%  ----------------------------------------------------------------------
%  Data for Single Engine Only    
%  ----------------------------------------------------------------------
%
% Engine Model Variables:
%   Independent Variables:
%   Name            Size        Units       Description
%   Throttle_perc   [1x9]       Percentage  Percentage of throttle being
%                                            used.
%   Mach_ND         [1x11]      [ND]        Mach number of the engine
%   Alt_ft          [1x16]      [ft]        Altitude of the engine
%
%   Dependent Variables:
%   Name            Size        Units       Description
%   NetThrust_lbf   [9x11x16]   [lbf]       Standard day net thrust
%   FuelFlow_lbPerHr[9x11x16]   [lb/hr]     Standard day fuel flow
%
% Hyperlinks:
%	Source function: <a href="matlab:edit Build_PW308_Engine.m">Build_PW308_Engine.m</a>
%
%
% VERIFICATION DETAILS:
% Verified: No
% Trac Page: http://vodka.ccc.northgrum.com/trac/CSA/ticket/<TicketNumber>
%
% Copyright Northrop Grumman Corp 2011
% Maintained by: GN&C Technology (Dept 9V21)
%                Aerospace Systems - Redondo Beach, CA
% http://vodka.ccc.northgrum.com/trac/CSA/

% Subversion Revision Information At Last Commit
% $URL: https://svn.ngst.northgrum.com/repos/CSA/trunk/CSA/ModelData/PW308/Build_PW308_Engine.m $
% $Rev: 1704 $
% $Date: 2011-05-10 18:51:22 -0500 (Tue, 10 May 2011) $
% $Author: healypa $

function EngineData = Build_PW308_Engine()

mat_name = 'PW308_EngineData';
fakezero = 1;

EngineData.PCODE=[10.0  9.00  8.00  7.00  6.50  6.00  5.50  5.00 ]'; %length 8
EngineData.PERTH=[50     60     70    80    85    90    95   100 ]'; %length 8
EngineData.MACH =[0.0  0.1  0.2  0.3  0.4  0.5  0.6  0.7  0.8  0.9  0.95]; %11
EngineData.ALT  =[...
		0.00      5E+03 10E+03  15E+03  20E+03  25E+03  30E+03  35E+03 ...
		36.1E+03 40E+03  45E+03  50E+03  55E+03  60E+03  65E+03  70E+03 ];%16
%  ======================================================================
%                  
%   STANDARD DAY NET THRUST (LBF)    
%                  
%  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
EngineData.THRNET    =[ ...
%ALTITUDE =   0.  Idx = 1                       PCODE/PERTH
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   361.20   2167.1   3611.7   4334.3   5056.6   5779.0   6501.4   7223.8 ;%M.0
   393.90   2054.9   3424.9   4109.9   4795.0   5479.9   6165.0   6849.9 ;%M.1
   426.80   1970.1   3283.4   3940.1   4596.8   5253.3   5910.1   6566.8 ;%M.2
   450.60   1851.8   3086.1   3703.3   4320.5   4937.7   5554.9   6172.1 ;%M.3
   562.60   1687.7   2812.9   3375.5   3938.0   4500.6   5063.1   5625.8 ;%M.4
   508.50   1525.4   2542.3   3050.8   3559.2   4067.7   4576.1   5084.6 ;%M.5
   459.20   1377.9   2296.5   2755.8   3215.1   3674.3   4133.7   4593.0 ;%M.6
   459.20   1377.9   2296.5   2755.8   3215.1   3674.3   4133.7   4593.0 ;%M.7
   459.20   1377.9   2296.5   2755.8   3215.1   3674.3   4133.7   4593.0 ;%M.8
   459.20   1377.9   2296.5   2755.8   3215.1   3674.3   4133.7   4593.0 ;%M.9
   459.20   1377.9   2296.5   2755.8   3215.1   3674.3   4133.7   4593.0 ;%M.95
%ALTITUDE =   5000.  Idx = 2
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
	530.70   1592.4   2654.0   3184.8   3715.5   4246.4   4777.4   5307.9 ;%M.0	   
	530.70   1592.4   2654.0   3184.8   3715.5   4246.4   4777.4   5307.9 ;%M.1	   
	530.70   1592.4   2654.0   3184.8   3715.5   4246.4   4777.4   5307.9 ;%M.2	   
	530.70   1592.4   2654.0   3184.8   3715.5   4246.4   4777.4   5307.9 ;%M.3	   
	530.70   1592.4   2654.0   3184.8   3715.5   4246.4   4777.4   5307.9 ;%M.4	   
	508.80   1526.5   2544.2   3053.1   3561.9   4070.8   4579.7   5088.4 ;%M.5	   
	487.00   1460.6   2434.4   2921.3   3408.2   3895.1   4382.0   4868.8 ;%M.6	   
	466.70   1400.0   2333.2   2799.7   3266.4   3733.2   4199.8   4666.4 ;%M.7	   
	466.70   1400.0   2333.2   2799.7   3266.4   3733.2   4199.8   4666.4 ;%M.8	   
	466.70   1400.0   2333.2   2799.7   3266.4   3733.2   4199.8   4666.4 ;%M.9	   
	466.70   1400.0   2333.2   2799.7   3266.4   3733.2   4199.8   4666.4 ;%M.95	   
%ALTITUDE =  10000.   Idx = 3 
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   340.10   1569.6   2615.9   3139.0   3662.2   4185.4   4708.6   5231.8 ;%M.0
   340.10   1569.6   2615.9   3139.0   3662.2   4185.4   4708.6   5231.8 ;%M.1
   340.10   1569.6   2615.9   3139.0   3662.2   4185.4   4708.6   5231.8 ;%M.2
   363.60   1494.1   2490.2   2988.3   3486.3   3984.4   4482.4   4980.4 ;%M.3
   476.10   1428.2   2380.5   2856.7   3332.8   3808.9   4284.9   4761.1 ;%M.4
   458.40   1375.0   2291.7   2750.0   3208.3   3666.7   4125.0   4583.3 ;%M.5
   444.50   1333.5   2222.3   2666.7   3111.2   3555.7   4000.1   4444.6 ;%M.6
   432.10   1296.6   2161.0   2593.1   3025.3   3457.5   3889.7   4321.9 ;%M.7
   432.10   1296.6   2161.0   2593.1   3025.3   3457.5   3889.7   4321.9 ;%M.8
   432.10   1296.6   2161.0   2593.1   3025.3   3457.5   3889.7   4321.9 ;%M.9
   432.10   1296.6   2161.0   2593.1   3025.3   3457.5   3889.7   4321.9 ;%M.95
%ALTITUDE =  15000.     Idx = 4  
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   55.300   1473.9   2456.3   2947.5   3438.8   3930.1   4421.3   4912.6 ;%M.0
   28.000   1415.2   2358.7   2830.5   3302.3   3774.0   4245.7   4717.5 ;%M.1
   298.20   1376.5   2294.1   2752.9   3211.7   3670.4   4129.3   4588.2 ;%M.2
   320.20   1315.6   2192.6   2631.2   3069.7   3508.2   3946.8   4385.3 ;%M.3
   421.40   1264.1   2106.9   2528.3   2949.6   3371.0   3792.4   4213.8 ;%M.4
   408.50   1225.4   2042.3   2450.7   2859.1   3267.6   3676.0   4084.5 ;%M.5
   399.20   1197.4   1995.8   2394.9   2794.1   3193.2   3592.3   3991.5 ;%M.6
   391.60   1174.7   1957.8   2349.3   2740.9   3132.4   3523.9   3915.5 ;%M.7
   385.30   1156.0   1926.6   2312.0   2697.3   3082.6   3468.0   3853.3 ;%M.8
   385.30   1156.0   1926.6   2312.0   2697.3   3082.6   3468.0   3853.3 ;%M.9
   385.30   1156.0   1926.6   2312.0   2697.3   3082.6   3468.0   3853.3 ;%M.95
%ALTITUDE =  20000.     Idx = 5 
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   399.10   1197.3   1995.5   2394.5   2793.6   3192.7   3591.8   3990.9 ;%M.0
   399.10   1197.3   1995.5   2394.5   2793.6   3192.7   3591.8   3990.9 ;%M.1
   389.20   1167.5   1945.8   2335.0   2724.1   3113.1   3502.4   3891.6 ;%M.2
   378.00   1133.8   1889.8   2267.8   2645.8   3023.7   3401.7   3779.7 ;%M.3
   369.40   1108.3   1847.1   2216.5   2585.9   2955.3   3324.7   3694.2 ;%M.4
   359.50   1078.5   1797.6   2157.1   2516.6   2875.9   3235.4   3595.1 ;%M.5
   353.50   1060.4   1767.3   2120.8   2474.2   2827.6   3181.2   3534.6 ;%M.6
   349.10   1047.6   1746.0   2095.1   2444.3   2793.5   3142.7   3491.9 ;%M.7
   346.50   1039.5   1732.5   2079.0   2425.5   2772.0   3118.5   3464.9 ;%M.8
   346.50   1039.5   1732.5   2079.0   2425.5   2772.0   3118.5   3464.9 ;%M.9
   346.50   1039.5   1732.5   2079.0   2425.5   2772.0   3118.5   3464.9 ;%M.95
%ALTITUDE =  25000.     Idx = 6 
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   322.50   967.40   1612.5   1935.0   2257.5   2580.0   2902.5   3225.0 ;%M.0
   322.50   967.40   1612.5   1935.0   2257.5   2580.0   2902.5   3225.0 ;%M.1
   314.60   943.70   1572.8   1887.4   2202.0   2516.5   2831.1   3145.7 ;%M.2
   305.60   917.00   1528.2   1833.9   2139.5   2445.1   2750.7   3056.4 ;%M.3
   301.50   904.50   1507.5   1809.0   2110.5   2412.0   2713.6   3015.0 ;%M.4
   302.80   908.50   1514.2   1817.0   2119.9   2422.7   2725.6   3028.4 ;%M.5
   309.50   928.40   1547.4   1856.9   2166.3   2475.8   2785.1   3094.8 ;%M.6
   307.20   921.50   1535.9   1843.1   2150.3   2457.4   2764.3   3071.8 ;%M.7
   306.90   920.70   1534.5   1841.3   2148.3   2455.1   2762.1   3068.9 ;%M.8
   307.10   921.20   1535.3   1842.4   2149.4   2456.5   2763.5   3070.6 ;%M.9
   307.10   921.20   1535.3   1842.4   2149.4   2456.5   2763.5   3070.6 ;%M.95
%ALTITUDE =  30000.     Idx = 7
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   336.30   756.80   1261.3   1513.5   1765.8   2018.1   2270.3   2522.5 ;%M.0
   336.30   756.80   1261.3   1513.5   1765.8   2018.1   2270.3   2522.5 ;%M.1
   336.30   756.80   1261.3   1513.5   1765.8   2018.1   2270.3   2522.5 ;%M.2
   326.70   735.20   1225.3   1470.4   1715.4   1960.5   2205.6   2450.6 ;%M.3
   322.40   725.40   1209.1   1450.9   1692.7   1934.5   2176.3   2418.1 ;%M.4
   323.70   728.50   1214.1   1456.9   1699.7   1942.5   2185.3   2428.2 ;%M.5
   331.50   746.00   1243.3   1492.0   1740.7   1989.3   2238.0   2486.7 ;%M.6
   346.10   778.60   1297.7   1557.2   1816.8   2076.3   2335.7   2595.4 ;%M.7
   357.50   804.30   1340.5   1608.6   1876.7   2144.8   2412.9   2681.0 ;%M.8
   359.50   808.90   1348.2   1617.9   1887.5   2157.2   2426.8   2696.5 ;%M.9
   360.80   811.90   1353.2   1623.8   1894.5   2165.1   2435.7   2706.4 ;%M.95
%ALTITUDE =  35000.     Idx = 8
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   324.50   583.90   973.30   1167.9   1362.6   1557.3   1751.9   1946.5 ;%M.0
   324.50   583.90   973.30   1167.9   1362.6   1557.3   1751.9   1946.5 ;%M.1
   324.50   583.90   973.30   1167.9   1362.6   1557.3   1751.9   1946.5 ;%M.2
   324.50   583.90   973.30   1167.9   1362.6   1557.3   1751.9   1946.5 ;%M.3
   320.20   576.30   960.60   1152.7   1344.8   1536.9   1728.9   1921.1 ;%M.4
   321.40   578.60   964.40   1157.2   1350.1   1543.0   1735.8   1928.7 ;%M.5
   329.20   592.60   987.70   1185.2   1382.7   1580.3   1777.7   1975.3 ;%M.6
   343.70   618.60   1031.0   1237.2   1443.4   1649.5   1855.8   2061.9 ;%M.7
   364.60   656.20   1093.7   1312.4   1531.1   1749.8   1968.6   2187.3 ;%M.8
   389.70   701.50   1169.1   1402.9   1636.8   1870.6   2104.4   2338.2 ;%M.9
   392.00   705.60   1176.0   1411.2   1646.4   1881.6   2116.6   2352.0 ;%M.95
%ALTITUDE =  36089.     Idx = 9
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   321.60   554.80   924.60   1109.5   1294.4   1479.4   1664.3   1849.2 ;%M.0
   321.60   554.80   924.60   1109.5   1294.4   1479.4   1664.3   1849.2 ;%M.1
   321.60   554.80   924.60   1109.5   1294.4   1479.4   1664.3   1849.2 ;%M.2
   321.60   554.80   924.60   1109.5   1294.4   1479.4   1664.3   1849.2 ;%M.3
   317.40   547.60   912.60   1095.1   1277.6   1460.2   1642.7   1825.2 ;%M.4
   318.60   549.60   916.00   1099.3   1282.5   1465.7   1648.9   1832.1 ;%M.5
   326.40   563.00   938.30   1125.9   1313.6   1501.2   1688.9   1876.5 ;%M.6
   340.70   587.60   979.40   1175.3   1371.2   1567.0   1762.9   1958.8 ;%M.7
   361.40   623.30   1038.9   1246.6   1454.4   1662.2   1870.0   2077.7 ;%M.8
   388.00   669.30   1115.4   1338.5   1561.6   1784.7   2007.8   2230.8 ;%M.9
   396.20   683.30   1138.9   1366.7   1594.5   1822.2   2050.0   2277.8 ;%M.95
%ALTITUDE =  40000.     Idx = 10
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   309.10   463.70   772.80   927.30   1081.9   1236.4   1391.0   1545.6 ;%M.0
   309.10   463.70   772.80   927.30   1081.9   1236.4   1391.0   1545.6 ;%M.1
   309.10   463.70   772.80   927.30   1081.9   1236.4   1391.0   1545.6 ;%M.2
   309.10   463.70   772.80   927.30   1081.9   1236.4   1391.0   1545.6 ;%M.3
   305.00   457.50   762.50   915.00   1067.5   1220.0   1372.5   1525.0 ;%M.4
   306.20   459.40   765.60   918.70   1071.8   1224.9   1378.0   1531.1 ;%M.5
   313.60   470.40   784.00   940.80   1097.5   1254.3   1411.1   1567.9 ;%M.6
   327.30   491.00   818.30   981.90   1145.6   1309.2   1472.9   1636.6 ;%M.7
   347.20   520.90   868.10   1041.7   1215.4   1389.0   1562.6   1736.2 ;%M.8
   369.90   554.80   924.70   1109.6   1294.6   1479.5   1664.4   1849.4 ;%M.9
   372.20   558.30   930.60   1116.7   1302.8   1488.9   1675.0   1861.1 ;%M.95
%ALTITUDE =  45000.     Idx = 11
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   289.20   371.80   619.60   743.60   867.50   991.40   1115.4   1239.3 ;%M.0
   289.20   371.80   619.60   743.60   867.50   991.40   1115.4   1239.3 ;%M.1
   289.20   371.80   619.60   743.60   867.50   991.40   1115.4   1239.3 ;%M.2
   289.20   371.80   619.60   743.60   867.50   991.40   1115.4   1239.3 ;%M.3
   285.30   366.80   611.40   733.70   855.90   978.20   1100.5   1222.8 ;%M.4
   286.30   368.10   613.40   736.10   858.80   981.60   1104.2   1226.9 ;%M.5
   293.00   376.70   627.90   753.40   879.00   1004.6   1130.1   1255.7 ;%M.6
   305.20   392.40   654.00   784.80   915.60   1046.4   1177.2   1308.0 ;%M.7
   323.10   415.50   692.40   830.90   969.40   1107.9   1246.4   1384.9 ;%M.8
   332.50   427.50   712.50   855.00   997.50   1139.9   1282.4   1424.9 ;%M.9
   334.60   430.20   717.00   860.40   1003.8   1147.2   1290.6   1434.1 ;%M.95
%ALTITUDE =  50000.     Idx = 12
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   267.60   301.00   501.80   602.10   702.40   802.80   1003.5   1003.5 ;%M.0
   267.60   301.00   501.80   602.10   702.40   802.80   1003.5   1003.5 ;%M.1
   267.60   301.00   501.80   602.10   702.40   802.80   1003.5   1003.5 ;%M.2
   267.60   301.00   501.80   602.10   702.40   802.80   1003.5   1003.5 ;%M.3
   263.90   296.90   494.90   593.80   692.80   791.70   890.80   989.70 ;%M.4
   264.80   298.00   496.60   595.90   695.30   794.60   893.90   993.20 ;%M.5
   271.10   305.00   508.40   610.00   711.70   813.40   915.00   1016.7 ;%M.6
   282.00   317.30   528.80   634.50   740.30   846.00   951.80   1057.5 ;%M.7
   287.00   322.90   538.10   645.70   753.30   860.90   968.50   1076.2 ;%M.8
   290.60   327.00   544.90   653.90   762.90   871.90   980.90   1089.9 ;%M.9
   292.90   329.50   549.10   658.90   768.80   878.60   988.40   1098.2 ;%M.95
%ALTITUDE =  55000.     Idx = 13
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   243.80   243.80   406.30   487.60   568.80   812.60   812.60   812.60 ;%M.0
   243.80   243.80   406.30   487.60   568.80   812.60   812.60   812.60 ;%M.1
   243.80   243.80   406.30   487.60   568.80   812.60   812.60   812.60 ;%M.2
   243.80   243.80   406.30   487.60   568.80   812.60   812.60   812.60 ;%M.3
   240.30   240.30   400.60   480.70   560.80   640.90   721.00   801.10 ;%M.4
   239.40   239.40   398.90   478.70   558.50   638.30   718.10   797.90 ;%M.5
   239.90   239.90   399.80   479.80   559.80   639.70   719.70   799.60 ;%M.6
   241.60   241.60   402.70   483.20   563.80   644.30   724.90   805.40 ;%M.7
   244.40   244.40   407.30   488.80   570.20   651.70   733.20   814.60 ;%M.8
   248.00   248.00   413.40   496.10   578.70   661.40   744.10   826.80 ;%M.9    
	250.10   250.10   416.80   500.20   583.50   666.90   750.20   833.60 %M.95;
%ALTITUDE =  60000.     Idx = 14
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   201.70   201.70   302.50   363.00   423.50   484.00   544.50   605.00 ;%M.0
   201.70   201.70   302.50   363.00   423.50   484.00   544.50   605.00 ;%M.1
   201.70   201.70   302.50   363.00   423.50   484.00   544.50   605.00 ;%M.2
   201.70   201.70   302.50   363.00   423.50   484.00   544.50   605.00 ;%M.3
   201.70   201.70   302.50   363.00   423.50   484.00   544.50   605.00 ;%M.4
   199.60   199.60   299.40   359.20   419.10   479.00   538.80   598.70 ;%M.5
   199.50   199.50   299.30   359.10   419.00   478.80   538.70   598.60 ;%M.6
   200.80   200.80   301.20   361.50   421.70   482.00   542.20   602.40 ;%M.7
   203.60   203.60   305.50   366.60   427.70   488.70   549.80   610.90 ;%M.8
   207.10   207.10   310.70   372.80   434.90   497.00   559.20   621.30 ;%M.9
   209.00   209.00   313.50   376.20   438.80   501.50   564.20   626.90 ;%M.95
%ALTITUDE =  65000.     Idx = 15
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   162.30   162.30   221.30   265.60   309.90   354.10   442.70   442.70 ;%M.0
   162.30   162.30   221.30   265.60   309.90   354.10   442.70   442.70 ;%M.1
   162.30   162.30   221.30   265.60   309.90   354.10   442.70   442.70 ;%M.2
   162.30   162.30   221.30   265.60   309.90   354.10   442.70   442.70 ;%M.3
   162.30   162.30   221.30   265.60   309.90   354.10   442.70   442.70 ;%M.4
   160.40   160.40   218.80   262.50   306.30   350.00   393.80   437.50 ;%M.5
   160.50   160.50   218.90   262.70   306.40   350.20   394.00   437.80 ;%M.6
   161.90   161.90   220.70   264.90   309.00   353.20   397.30   441.50 ;%M.7
   164.50   164.50   224.30   269.20   314.00   358.90   403.80   448.60 ;%M.8
   167.80   167.80   228.90   274.70   320.40   366.20   412.00   457.70 ;%M.9
   169.50   169.50   231.10   277.40   323.60   369.80   416.10   462.30 ;%M.95
%ALTITUDE =  70000.     Idx = 16
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   122.50   122.50   153.20   183.80   214.40   245.00   275.70   306.30 ;%M.0
   122.50   122.50   153.20   183.80   214.40   245.00   275.70   306.30 ;%M.1
   122.50   122.50   153.20   183.80   214.40   245.00   275.70   306.30 ;%M.2
   122.50   122.50   153.20   183.80   214.40   245.00   275.70   306.30 ;%M.3
   122.50   122.50   153.20   183.80   214.40   245.00   275.70   306.30 ;%M.4
   120.90   120.90   151.20   181.40   211.60   241.90   272.10   302.30 ;%M.5
   120.90   120.90   151.20   181.40   211.60   241.90   272.10   302.40 ;%M.6
   122.10   122.10   152.60   183.10   213.60   244.10   274.70   305.20 ;%M.7
   124.20   124.20   155.20   186.30   217.30   248.40   279.40   310.50 ;%M.8
   127.10   127.10   158.80   190.60   222.40   254.10   285.90   317.70 ;%M.9
   128.30   128.30   160.30   192.40   224.50   256.50   288.60  320.60]';%M.95
EngineData.THRNET    =reshape(EngineData.THRNET    ,[ 8 11 16  1]);
 
%  ======================================================================
%                  
%   STANDARD DAY FUEL FLOW  (LB/HR)  
%                  
%  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
EngineData.FUELFLOW  =[ ...
%ALTITUDE =   0.	Idx = 1
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   318.60   1016.9   1556.6   1807.0   2136.1   2470.0   2834.5   3186.6 ;%M.0
   395.50   1110.1   1638.6   1904.5   2230.6   2555.8   2910.4   3256.1 ;%M.1
   483.00   1197.1   1728.1   2002.5   2328.6   2654.5   2997.1   3344.9 ;%M.2
   573.40   1271.2   1807.0   2078.2   2401.7   2731.4   3059.1   3402.5 ;%M.3
   733.40   1341.5   1855.3   2104.9   2404.2   2726.9   3041.8   3356.2 ;%M.4
   821.10   1381.4   1900.6   2136.4   2393.9   2694.8   3000.5   3299.7 ;%M.5
   915.30   1420.0   1953.3   2177.2   2408.1   2660.4   2949.7   3236.4 ;%M.6
   915.30   1420.0   1953.3   2177.2   2408.1   2660.4   2949.7   3236.4 ;%M.7
   915.30   1420.0   1953.3   2177.2   2408.1   2660.4   2949.7   3236.4 ;%M.8
   915.30   1420.0   1953.3   2177.2   2408.1   2660.4   2949.7   3236.4 ;%M.9
   915.30   1420.0   1953.3   2177.2   2408.1   2660.4   2949.7   3236.4 ;%M.95
%ALTITUDE =   5000.	Idx = 2
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   643.00   1195.5   1651.6   1917.5   2214.5   2505.5   2796.5   3113.8 ;%M.0
   643.00   1195.5   1651.6   1917.5   2214.5   2505.5   2796.5   3113.8 ;%M.1
   643.00   1195.5   1651.6   1917.5   2214.5   2505.5   2796.5   3113.8 ;%M.2
   643.00   1195.5   1651.6   1917.5   2214.5   2505.5   2796.5   3113.8 ;%M.3
   643.00   1195.5   1651.6   1917.5   2214.5   2505.5   2796.5   3113.8 ;%M.4
   729.30   1271.2   1750.5   2007.3   2303.8   2598.3   2889.7   3193.5 ;%M.5
   815.60   1346.9   1849.4   2097.0   2393.0   2691.0   2982.9   3273.1 ;%M.6
   894.00   1420.6   1954.9   2197.5   2470.6   2770.4   3066.1   3357.8 ;%M.7
   894.00   1420.6   1954.9   2197.5   2470.6   2770.4   3066.1   3357.8 ;%M.8   
	894.00   1420.6   1954.9   2197.5   2470.6   2770.4   3066.1   3357.8 ;%M.9
   894.00   1420.6   1954.9   2197.5   2470.6   2770.4   3066.1   3357.8 ;%M.95
%ALTITUDE =  10000.	Idx = 3
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   357.20   899.60   1288.3   1537.4   1788.7   2051.2   2323.8   2657.3 ;%M.0
   357.20   899.60   1288.3   1537.4   1788.7   2051.2   2323.8   2657.3 ;%M.1
   357.20   899.60   1288.3   1537.4   1788.7   2051.2   2323.8   2657.3 ;%M.2
   420.30   958.20   1354.2   1605.7   1861.3   2117.9   2390.6   2711.7 ;%M.3
   549.00   1029.5   1425.5   1680.8   1941.4   2194.2   2463.8   2771.6 ;%M.4
   618.20   1095.0   1508.9   1763.9   2028.1   2283.8   2547.7   2842.3 ;%M.5
   685.70   1167.4   1604.5   1852.8   2120.8   2383.3   2640.7   2926.4 ;%M.6
   752.10   1240.6   1704.8   1940.1   2211.9   2480.5   2743.7   3017.9 ;%M.7
   752.10   1240.6   1704.8   1940.1   2211.9   2480.5   2743.7   3017.9 ;%M.8
   752.10   1240.6   1704.8   1940.1   2211.9   2480.5   2743.7   3017.9 ;%M.9
   752.10   1240.6   1704.8   1940.1   2211.9   2480.5   2743.7   3017.9 ;%M.95
%ALTITUDE =  15000.	Idx = 4 
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   143.80   652.80   976.20   1187.6   1407.2   1637.0   1891.7   2218.7 ;%M.0
   143.60   711.40   1040.7   1252.3   1470.9   1697.2   1955.6   2276.4 ;%M.1
   303.50   767.70   1107.8   1323.6   1542.5   1770.9   2033.0   2348.3 ;%M.2
   355.80   813.70   1165.3   1386.5   1605.3   1833.0   2091.8   2396.0 ;%M.3
   465.10   870.00   1228.9   1455.2   1677.3   1903.1   2156.8   2449.3 ;%M.4
   516.00   931.50   1302.0   1532.7   1760.5   1984.2   2233.3   2515.2 ;%M.5
   571.70   1000.5   1381.8   1617.1   1850.1   2075.3   2320.5   2593.5 ;%M.6
   625.20   1070.9   1468.1   1701.7   1940.4   2176.0   2415.1   2681.4 ;%M.7
   684.90   1139.3   1560.6   1782.9   2031.9   2278.7   2520.0   2779.3 ;%M.8
   684.90   1139.3   1560.6   1782.9   2031.9   2278.7   2520.0   2779.3 ;%M.9
   684.90   1139.3   1560.6   1782.9   2031.9   2278.7   2520.0   2779.3 ;%M.95
%ALTITUDE =  20000.	Idx = 5
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   282.80   590.60   866.80   1042.0   1228.1   1415.5   1649.2   1929.1 ;%M.0
   282.80   590.60   866.80   1042.0   1228.1   1415.5   1649.2   1929.1 ;%M.1
   315.30   630.70   923.30   1102.4   1288.5   1480.0   1715.6   1992.5 ;%M.2
   349.20   675.10   984.00   1170.9   1357.8   1557.5   1795.6   2072.0 ;%M.3
   387.80   727.00   1051.7   1246.9   1436.5   1642.6   1881.4   2156.8 ;%M.4
   428.40   779.30   1115.5   1315.3   1507.6   1712.5   1945.5   2212.4 ;%M.5
   472.90   841.00   1186.4   1391.6   1590.2   1793.9   2023.8   2282.7 ;%M.6
   516.50   910.30   1258.7   1470.2   1677.7   1882.4   2110.1   2362.2 ;%M.7
   567.90   974.10   1334.0   1550.7   1768.4   1981.7   2206.5   2453.6 ;%M.8
   567.90   974.10   1334.0   1550.7   1768.4   1981.7   2206.5   2453.6 ;%M.9
   567.90   974.10   1334.0   1550.7   1768.4   1981.7   2206.5   2453.6 ;%M.95
%ALTITUDE =  25000.	Idx = 6
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   230.30   470.40   690.40   828.40   975.20   1124.2   1309.3   1530.4 ;%M.0
   230.30   470.40   690.40   828.40   975.20   1124.2   1309.3   1530.4 ;%M.1
   255.80   501.60   735.00   876.20   1023.2   1175.8   1362.2   1581.1 ;%M.2
   282.60   536.70   783.10   930.50   1078.5   1237.7   1425.9   1645.0 ;%M.3
   313.80   581.30   843.70   999.00   1150.8   1317.7   1510.8   1733.5 ;%M.4
   349.70   635.20   919.90   1083.4   1242.5   1418.8   1620.4   1851.2 ;%M.5
   389.30   700.00   1010.2   1184.1   1353.4   1542.1   1755.9   1998.8 ;%M.6
   424.60   757.80   1073.8   1254.1   1429.7   1618.7   1829.7   2067.1 ;%M.7
   467.30   820.00   1139.2   1329.8   1517.0   1705.9   1916.5   2148.3 ;%M.8
   512.80   875.70   1206.6   1406.7   1605.8   1800.7   2010.4   2241.3 ;%M.9
   512.80   875.70   1206.6   1406.7   1605.8   1800.7   2010.4   2241.3 ;%M.95
%ALTITUDE =  30000.	Idx = 7
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   238.00   397.90   580.90   691.60   806.80   926.40   1073.9   1246.1 ;%M.0
   238.00   397.90   580.90   691.60   806.80   926.40   1073.9   1246.1 ;%M.1
   238.00   397.90   580.90   691.60   806.80   926.40   1073.9   1246.1 ;%M.2
   256.40   424.60   618.60   733.90   849.70   974.70   1123.5   1295.5 ;%M.3
   285.50   458.70   666.20   787.50   906.40   1038.1   1190.2   1365.3 ;%M.4
   318.30   500.40   725.40   853.30   977.90   1117.2   1275.5   1456.7 ;%M.5
   351.00   552.70   797.50   933.70   1067.1   1216.6   1385.2   1576.7 ;%M.6
   389.80   615.60   883.70   1032.1   1178.7   1342.6   1526.8   1734.3 ;%M.7
   430.50   677.40   963.80   1125.6   1284.1   1458.6   1652.1   1869.4 ;%M.8
   468.50   730.40   1023.5   1196.0   1365.3   1539.3   1734.5   1949.7 ;%M.9
   487.80   756.60   1054.4   1232.5   1408.0   1584.6   1780.9   1994.8 ;%M.95
%ALTITUDE =  35000.	Idx = 8
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   231.10   334.50   483.80   574.10   663.90   760.90   876.90   1010.9 ;%M.0
   231.10   334.50   483.80   574.10   663.90   760.90   876.90   1010.9 ;%M.1
   231.10   334.50   483.80   574.10   663.90   760.90   876.90   1010.9 ;%M.2
   231.10   334.50   483.80   574.10   663.90   760.90   876.90   1010.9 ;%M.3
   258.60   360.70   521.20   615.60   707.70   810.00   928.80   1065.4 ;%M.4
   282.90   392.20   567.30   666.30   762.90   871.10   995.00   1135.9 ;%M.5
   310.30   431.70   623.10   728.60   832.00   948.50   1080.1   1229.1 ;%M.6
   343.20   480.60   689.80   804.70   918.60   1046.8   1190.1   1351.5 ;%M.7
   382.80   537.20   768.80   897.20   1025.1   1167.7   1326.2   1504.7 ;%M.8
   425.80   598.80   859.30   1004.7   1148.1   1308.6   1487.5   1686.0 ;%M.9
   441.50   622.10   886.90   1037.3   1185.3   1347.5   1526.0   1723.9 ;%M.95
%ALTITUDE =  36089.	Idx = 9
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   225.60   317.40   458.10   543.60   628.50   720.20   829.80   956.70 ;%M.0
   225.60   317.40   458.10   543.60   628.50   720.20   829.80   956.70 ;%M.1
   225.60   317.40   458.10   543.60   628.50   720.20   829.80   956.70 ;%M.2
   225.60   317.40   458.10   543.60   628.50   720.20   829.80   956.70 ;%M.3
   251.90   342.10   493.50   582.90   669.90   766.60   879.10   1008.4 ;%M.4
   274.90   371.80   537.10   630.70   721.90   824.20   941.40   1074.6 ;%M.5
   301.30   409.00   589.90   689.50   787.20   897.30   1022.0   1162.9 ;%M.6
   332.80   454.80   652.90   761.40   869.00   990.20   1125.8   1278.6 ;%M.7
   370.90   508.30   727.40   848.70   969.50   1104.6   1254.4   1423.2 ;%M.8
   413.30   568.10   815.90   953.80   1090.4   1243.4   1413.9   1603.2 ;%M.9
   431.60   595.20   852.90   997.60   1140.9   1299.7   1474.8   1668.9 ;%M.95
%ALTITUDE =  40000.	Idx = 10
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   210.10   269.60   388.10   459.40   531.00   608.50   701.70   808.90 ;%M.0
   210.10   269.60   388.10   459.40   531.00   608.50   701.70   808.90 ;%M.1
   210.10   269.60   388.10   459.40   531.00   608.50   701.70   808.90 ;%M.2
   210.10   269.60   388.10   459.40   531.00   608.50   701.70   808.90 ;%M.3
   231.90   290.00   417.20   491.90   565.20   646.80   742.10   851.00 ;%M.4
   252.00   314.60   453.20   531.70   608.50   694.80   793.90   906.40 ;%M.5
   275.80   345.40   497.00   580.60   662.80   755.70   860.60   979.50 ;%M.6
   303.60   383.30   549.50   640.50   731.20   833.10   947.50   1076.1 ;%M.7
   337.50   427.80   611.80   713.70   815.40   928.90   1055.3   1197.5 ;%M.8
   374.30   475.40   681.30   796.20   909.70   1036.5   1178.0   1334.9 ;%M.9
   387.20   493.90   703.20   822.00   939.20   1067.5   1208.9   1365.4 ;%M.95
%ALTITUDE =  45000.	Idx = 11
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   191.10   223.30   317.50   374.60   433.20   497.50   575.00   664.10 ;%M.0
   191.10   223.30   317.50   374.60   433.20   497.50   575.00   664.10 ;%M.1
   191.10   223.30   317.50   374.60   433.20   497.50   575.00   664.10 ;%M.2
   191.10   223.30   317.50   374.60   433.20   497.50   575.00   664.10 ;%M.3
   208.50   240.00   340.50   400.50   460.50   527.80   606.70   697.00 ;%M.4
   225.60   259.50   368.60   432.10   494.60   565.50   647.10   740.00 ;%M.5
   246.30   284.00   403.40   470.80   537.50   613.50   699.70   797.50 ;%M.6
   271.10   313.40   444.40   517.60   590.90   673.60   767.00   871.70 ;%M.7
   299.80   347.60   493.10   574.70   656.70   748.30   850.90   966.10 ;%M.8
   323.60   377.00   532.50   621.60   709.00   805.10   912.20   1030.9 ;%M.9
   334.00   390.60   549.40   641.50   732.10   829.30   936.50   1054.9 ;%M.95
%ALTITUDE =  50000.	Idx = 12
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   174.00   188.00   263.50   310.00   358.30   413.20   556.30   556.30 ;%M.0
   174.00   188.00   263.50   310.00   358.30   413.20   556.30   556.30 ;%M.1
   174.00   188.00   263.50   310.00   358.30   413.20   556.30   556.30 ;%M.2
   174.00   188.00   263.50   310.00   358.30   413.20   556.30   556.30 ;%M.3
   187.80   200.80   281.80   330.40   380.10   437.10   504.50   581.40 ;%M.4
   202.50   216.40   304.40   355.70   407.60   467.40   536.80   615.60 ;%M.5
   220.60   236.10   332.10   386.80   442.30   505.90   579.10   661.80 ;%M.6
   242.50   259.50   364.50   424.10   484.70   553.60   632.20   720.10 ;%M.7
   261.20   281.00   390.60   454.80   518.30   589.20   668.40   757.70 ;%M.8
   278.00   300.00   415.80   484.40   551.60   623.30   703.60   792.60 ;%M.9
   286.60   309.30   430.00   500.00   570.20   642.90   723.50   812.30 ;%M.95
%ALTITUDE =  55000.	Idx = 13
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   157.40   157.40   220.30   257.90   298.10   470.40   470.40   470.40 ;%M.0
   157.40   157.40   220.30   257.90   298.10   470.40   470.40   470.40 ;%M.1
   157.40   157.40   220.30   257.90   298.10   470.40   470.40   470.40 ;%M.2
   157.40   157.40   220.30   257.90   298.10   470.40   470.40   470.40 ;%M.3
   167.80   167.80   234.80   274.10   315.40   364.10   422.10   488.70 ;%M.4
   179.60   179.60   251.40   292.50   335.10   384.70   443.20   509.70 ;%M.5
   193.10   193.10   269.10   311.90   355.70   406.10   464.60   531.50 ;%M.6
   207.90   207.90   287.60   332.20   377.60   429.00   487.60   553.90 ;%M.7
   222.70   222.70   306.60   353.80   401.50   453.80   512.30   578.00 ;%M.8
   237.00   237.00   327.00   377.10   428.40   481.20   540.50   606.30 ;%M.9
   244.20   244.20   338.50   389.50   442.40   496.40   556.40   622.00 ;%M.95
%ALTITUDE =  60000.	Idx = 14
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   145.00   145.00   186.90   215.70   246.50   281.80   324.10   373.90 ;%M.0
   145.00   145.00   186.90   215.70   246.50   281.80   324.10   373.90 ;%M.1
   145.00   145.00   186.90   215.70   246.50   281.80   324.10   373.90 ;%M.2
   145.00   145.00   186.90   215.70   246.50   281.80   324.10   373.90 ;%M.3
   145.00   145.00   186.90   215.70   246.50   281.80   324.10   373.90 ;%M.4
   154.20   154.20   198.60   228.60   259.90   295.70   337.70   387.00 ;%M.5
   164.70   164.70   212.00   243.00   275.00   311.50   353.30   401.90 ;%M.6
   176.10   176.10   226.20   258.20   291.90   328.80   370.80   418.60 ;%M.7
   188.40   188.40   241.50   275.50   311.30   348.70   391.10   438.30 ;%M.8
   200.50   200.50   258.50   294.30   331.80   370.50   413.50   461.30 ;%M.9
   206.40   206.40   267.70   304.00   342.40   382.60   426.00   473.90 ;%M.95
%ALTITUDE =  65000.	Idx = 15
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   122.20   122.20   148.70   168.50   189.50   213.30   275.60   275.60 ;%M.0
   122.20   122.20   148.70   168.50   189.50   213.30   275.60   275.60 ;%M.1
   122.20   122.20   148.70   168.50   189.50   213.30   275.60   275.60 ;%M.2
   122.20   122.20   148.70   168.50   189.50   213.30   275.60   275.60 ;%M.3
   122.20   122.20   148.70   168.50   189.50   213.30   275.60   275.60 ;%M.4
   129.30   129.30   157.30   178.10   199.80   223.90   252.20   285.40 ;%M.5
   137.80   137.80   167.40   189.30   211.80   236.20   264.70   297.40 ;%M.6
   147.20   147.20   178.50   201.40   225.10   249.80   278.80   311.40 ;%M.7
   157.30   157.30   190.40   214.70   240.00   265.60   295.00   327.70 ;%M.8
   167.30   167.30   203.20   229.10   256.20   283.90   313.00   346.40 ;%M.9
   172.20   172.20   209.90   236.70   264.70   293.30   322.80   356.50 ;%M.95
%ALTITUDE =  70000.	Idx = 16
%  10/50    9/60      8/70		 7/80		6.5/85    6/90    5.5/95   5/100
   100.40   100.40   115.50   130.30   144.20   158.50   176.30   194.00 ;%M.0
   100.40   100.40   115.50   130.30   144.20   158.50   176.30   194.00 ;%M.1
   100.40   100.40   115.50   130.30   144.20   158.50   176.30   194.00 ;%M.2
   100.40   100.40   115.50   130.30   144.20   158.50   176.30   194.00 ;%M.3
   100.40   100.40   115.50   130.30   144.20   158.50   176.30   194.00 ;%M.4
   105.70   105.70   121.50   137.10   151.70   166.40   182.80   201.90 ;%M.5
   112.10   112.10   128.70   145.20   160.60   175.80   192.20   211.60 ;%M.6
   119.60   119.60   136.80   154.40   170.50   186.60   203.10   222.90 ;%M.7
   127.70   127.70   145.50   164.00   181.40   198.80   216.00   235.80 ;%M.8
   135.60   135.60   154.70   174.40   193.40   212.40   231.00   250.30 ;%M.9
   139.40   139.40   159.30   179.40   199.60   219.10   238.50  257.90 ]';%M.95
EngineData.FUELFLOW = reshape(EngineData.FUELFLOW ,[ 8 11 16  1]);
EngineData.notes = [...
	   '  >PW308A Engine 12/2/03' sprintf('\n')...
       '  >NetThrust(lbf) Fuel(slug/hr)' sprintf('\n') ...
       '  >T4Max =2960R; Life=10703hrs; Wbleed=0.025(Slug/s); Hpx=4.5;' sprintf('\n')...
       '  >InletRecovery as defined by T. strasser 6/17/03' sprintf('\n')...
       '  >Indep: PCODE/PERTH MACH ALT' sprintf('\n')...
       '  >Dep : THRNET - Standard Day Net Thrust(lbf)' sprintf('\n')...
       '  >    : FUELFLOW - Stand Day Fuel Flow(slugs/hr)'];
       
if fakezero == 1
	EngineData.PCODE = [11; EngineData.PCODE]'; % length now = 9
	EngineData.PERTH = [0; EngineData.PERTH]'; % Length now = 9;
	% EngineData.MACH -> No Change 
	% EngineData.ALT -> No Change
	
	% Modify for zero thrust 
	temp = zeros(size(EngineData.THRNET));
	temp(2:9,:,:,:) = EngineData.THRNET;
	EngineData.THRNET = temp;
	clear temp
	
	% Modify fuel flow
	temp = zeros(size(EngineData.FUELFLOW));
	temp(2:9,:,:,:) = EngineData.FUELFLOW;
	EngineData.FUELFLOW = temp;
end

% Format for CSA
endl = sprintf('\n');
EngineData = struct('Title', 'PW308 Engine Model', ...
    'Notes', ['PW308A Engine 12/2/03'  endl...
        'T4Max =2960R; Life=10703hrs; Wbleed=0.025(Slug/s); Hpx=4.5;' endl...
        'InletRecovery as defined by T. strasser 6/17/03' endl], ...
    'Description', ['[ NetThrust, FuelFlow ] = fcn( Throttle' ...
        ', Mach, Alt );'], ...
    'Throttle_perc', EngineData.PERTH, ...
    'Mach_ND', EngineData.MACH, ...
    'Alt_ft', EngineData.ALT, ...
    'NetThrust_lbf', EngineData.THRNET, ...
    'FuelFlow_lbPerHr', EngineData.FUELFLOW);
PW308_EngineData = EngineData;

hd = pwd;
[mfpath,mfnam] = fileparts(mfilename('fullpath'));
cd(mfpath);
save(mat_name, 'PW308_EngineData')
disp([mfnam ' >> Success! Saved the PW308 model this directory:' endl pwd])
cd(hd);

end

%% << End of PW308.m >>

%% REVISION HISTORY
% YYMMDD INI: note
% 101202 JPG: Ported the function to the CSA format, rearranged the
%              structure for clarity, and added the save to .mat.
% 101202 CNS: Created script created using CreateNewScript
% 070124 TKV: Made a function out of it, Augmented to zero thrust & Fuel 
%             Dot in simplist and most basic way.. (added a zero column)
%**Add New Revision notes to TOP of list**

% Initials Identification: 
% INI:  FullName        :   Email                   :   NGGN Username 
% TKV:  Travis Vetter   :   travis.vetter@ngc.com   :   vettetr
% JPG:  James Gray      :   James.Gray2@ngc.com     :   G61720

%% FOOTER
% WARNING - This document contains technical data whose export is
%   restricted by the Arms Export Control Act (Title 22, U.S.C. 2751 et 
%   seq.) or the Export Administration Act of 1979, as amended, Title 50,
%   U.S.C., App.2401et seq. Violation of these export-control laws is 
%   subject to severe civil and/or criminal penalties.
%
% -------------- Northrop Grumman Proprietary Level 1 ---------------
% ------------------ ITAR Controlled Work Product -------------------
% -------------------------- UNCLASSIFIED ---------------------------
