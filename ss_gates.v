/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Thu May  9 22:01:43 2019
/////////////////////////////////////////////////////////////


module ss ( clk, reset, din, dout, addr, strobe, samp, push_samp, sync, 
        push_corr, corr );
  input [31:0] din;
  output [31:0] dout;
  input [3:0] addr;
  input [11:0] samp;
  output [31:0] corr;
  input clk, reset, strobe, push_samp, sync;
  output push_corr;
  wire   push2_d, push3_d, push4_d, push5_d, strobe_1, sync2_d, sync3_d,
         gout_d, flag1_d, gout1_d, sync4_d, sync5_d, cflag_d, cflag, sync_5,
         push5, gout1, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         \C1/DATA1_0 , n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n709, n710,
         n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n723, n724, n725, n726, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, n743,
         n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765,
         n766, n767, n768, n769, n770, n771, n772, n773, n774, n775, n776,
         n777, n778, n779, n780, n781, n782, n783, n784, n785, n786, n787,
         n788, n789, n790, n791, n792, n793, n794, n795, n796, n797, n798,
         n799, n800, n801, n802, n803, n804, n805, n806, n807, n808, n809,
         n810, n811, n812, n813, n814, n815, n816, n817, n818, n819, n820,
         n821, n822, n823, n824, n825, n826, n827, n828, n829, n830, n831,
         n832, n833, n834, n835, n836, n837, n838, n839, n840, n841, n842,
         n843, n844, n845, n846, n847, n848, n849, n850, n851, n852, n853,
         n854, n855, n856, n857, n858, n859, n860, n861, n862, n863, n864,
         n865, n866, n867, n868, n869, n870, n871, n872, n873, n874, n875,
         n876, n877, n878, n879, n880, n881, n882, n883, n884, n885, n886,
         n887, n888, n889, n890, n891, n892, n893, n894, n895, n896, n897,
         n898, n899, n900, n901, n902, n903, n904, n905, n906, n907, n908,
         n909, n910, n911, n912, n913, n914, n915, n916, n917, n918, n919,
         n920, n921, n922, n923, n924, n925, n926, n927, n928, n929, n930,
         n931, n932, n933, n934, n935, n936, n937, n938, n939, n940, n941,
         n942, n943, n944, n945, n946, n947, n948, n949, n950, n951, n952,
         n953, n954, n955, n956, n957, n959, n960, n961, n962, n963, n964,
         n965, n966, n967, n968, n969, n970, n971, n972, n973, n974, n975,
         n976, n977, n978, n979, n980, n981, n982, n983, n984, n985, n986,
         n987, n988, n989, n990, n991, n992, n993, n994, n995, n996, n997,
         n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007,
         n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017,
         n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027,
         n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037,
         n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047,
         n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057,
         n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067,
         n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077,
         n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087,
         n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097,
         n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107,
         n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117,
         n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127,
         n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137,
         n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146, n1147,
         n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1157,
         n1158, n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166, n1167,
         n1168, n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176, n1177,
         n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186, n1187,
         n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196, n1197,
         n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206, n1207,
         n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216, n1217,
         n1218, n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226, n1227,
         n1228, n1229, n1230, n1231, n1232, n1233, n1234, n1235, n1236, n1237,
         n1238, n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246, n1247,
         n1248, n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256, n1257,
         n1258, n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266, n1267,
         n1268, n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277,
         n1278, n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286, n1287,
         n1288, n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296, n1297,
         n1298, n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306, n1307,
         n1308, n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316, n1317,
         n1318, n1319, n1320, n1321, n1322, n1323, n1324, n1325, n1326, n1327,
         n1328, n1329, n1330, n1331, n1332, n1333, n1334, n1335, n1336, n1337,
         n1338, n1339, n1340, n1341, n1342, n1343, n1344, n1345, n1346, n1347,
         n1348, n1349, n1350, n1351, n1352, n1353, n1354, n1355, n1356, n1357,
         n1358, n1359, n1360, n1361, n1362, n1363, n1364, n1365, n1366, n1367,
         n1368, n1369, n1370, n1371, n1372, n1373, n1374, n1375, n1376, n1377,
         n1378, n1379, n1380, n1381, n1382, n1383, n1384, n1385, n1386, n1387,
         n1388, n1389, n1390, n1391, n1392, n1393, n1394, n1395, n1396, n1397,
         n1398, n1399, n1400, n1401, n1402, n1403, n1404, n1405, n1406, n1407,
         n1408, n1409, n1410, n1411, n1412, n1413, n1414, n1415, n1416, n1417,
         n1418, n1419, n1420, n1421, n1422, n1423, n1424, n1425, n1426, n1427,
         n1428, n1429, n1430, n1431, n1432, n1433, n1434, n1435, n1436, n1437,
         n1438, n1439, n1440, n1441, n1442, n1443, n1444, n1445, n1446, n1447,
         n1448, n1449, n1450, n1451, n1452, n1453, n1454, n1455, n1456, n1457,
         n1458, n1459, n1460, n1461, n1462, n1463, n1464, n1465, n1466, n1467,
         n1468, n1469, n1470, n1471, n1472, n1473, n1474, n1475, n1476, n1477,
         n1478, n1479, n1480, n1481, n1482, n1483, n1484, n1485, n1486, n1487,
         n1488, n1489, n1490, n1491, n1492, n1493, n1494, n1495, n1496, n1497,
         n1498, n1499, n1500, n1501, n1502, n1503, n1504, n1505, n1506, n1507,
         n1508, n1509, n1510, n1511, n1512, n1513, n1514, n1515, n1516, n1517,
         n1518, n1519, n1520, n1521, n1522, n1523, n1524, n1525, n1526, n1527,
         n1528, n1529, n1530, n1531, n1532, n1533, n1534, n1535, n1536, n1537,
         n1538, n1539, n1540, n1541, n1542, n1543, n1544, n1545, n1546, n1547,
         n1548, n1549, n1550, n1551, n1552, n1553, n1554, n1555, n1556, n1557,
         n1558, n1559, n1560, n1561, n1562, n1563, n1564, n1565, n1566, n1567,
         n1568, n1569, n1570, n1571, n1572, n1573, n1574, n1575, n1576, n1577,
         n1578, n1579, n1580, n1581, n1582, n1583, n1584, n1585, n1586, n1587,
         n1588, n1589, n1590, n1591, n1592, n1593, n1594, n1595, n1596, n1597,
         n1598, n1599, n1600, n1601, n1602, n1603, n1604, n1605, n1606, n1607,
         n1608, n1609, n1610, n1611, n1612, n1613, n1614, n1615, n1616, n1617,
         n1618, n1619, n1620, n1621, n1622, n1623, n1624, n1625, n1626, n1627,
         n1628, n1629, n1630, n1631, n1632, n1633, n1634, n1635, n1636, n1637,
         n1638, n1639, n1640, n1641, n1642, n1643, n1644, n1645, n1646, n1647,
         n1648, n1649, n1650, n1651, n1652, n1653, n1654, n1655, n1656, n1657,
         n1658, n1659, n1660, n1661, n1662, n1663, n1664, n1665, n1666, n1667,
         n1668, n1669, n1670, n1671, n1672, n1673, n1674, n1675, n1676, n1677,
         n1678, n1679, n1680, n1681, n1682, n1683, n1684, n1685, n1686, n1687,
         n1688, n1689, n1690, n1691, n1692, n1693, n1694, n1695, n1696, n1697,
         n1698, n1699, n1700, n1701, n1702, n1703, n1704, n1705, n1706, n1707,
         n1708, n1709, n1710, n1711, n1712, n1713, n1714, n1715, n1716, n1717,
         n1718, n1719, n1720, n1721, n1722, n1723, n1724, n1725, n1726, n1727,
         n1728, n1729, n1730, n1731, n1732, n1733, n1734, n1735, n1736, n1737,
         n1738, n1739, n1740, n1741, n1742, n1743, n1744, n1745, n1746, n1747,
         n1748, n1749, n1750, n1751, n1752, n1753, n1754, n1755, n1756, n1757,
         n1758, n1759, n1760, n1761, n1762, n1763, n1764, n1765, n1766, n1767,
         n1768, n1769, n1770, n1771, n1772, n1773, n1774, n1775, n1776, n1777,
         n1778, n1779, n1780, n1781, n1782, n1783, n1784, n1785, n1786, n1787,
         n1788, n1789, n1790, n1791, n1792, n1793, n1794, n1795, n1796, n1797,
         n1798, n1799, n1800, n1801, n1802, n1803, n1804, n1805, n1806, n1807,
         n1808, n1809, n1810, n1811, n1812, n1813, n1814, n1815, n1816, n1817,
         n1818, n1819, n1820, n1821, n1822, n1823, n1824, n1825, n1826, n1827,
         n1828, n1829, n1830, n1831, n1832, n1833, n1834, n1835, n1836, n1837,
         n1838, n1839, n1840, n1841, n1842, n1843, n1844, n1845, n1846, n1847,
         n1848, n1849, n1850, n1851, n1852, n1853, n1854, n1855, n1856, n1857,
         n1858, n1859, n1860, n1861, n1862, n1863, n1864, n1865, n1866, n1867,
         n1868, n1869, n1870, n1871, n1872, n1873, n1874, n1875, n1876, n1877,
         n1878, n1879, n1880, n1881, n1882, n1883, n1884, n1885, n1886, n1887,
         n1888, n1889, n1890, n1891, n1892, n1893, n1894, n1895, n1896, n1897,
         n1898, n1899, n1900, n1901, n1902, n1903, n1904, n1905, n1906, n1907,
         n1908, n1909, n1910, n1911, n1912, n1913, n1914, n1915, n1916, n1917,
         n1918, n1919, n1920, n1921, n1922, n1923, n1924, n1925, n1926, n1927,
         n1928, n1929, n1930, n1931, n1932, n1933, n1934, n1935, n1936, n1937,
         n1938, n1939, n1940, n1941, n1942, n1943, n1944, n1945, n1946, n1947,
         n1948, n1949, n1950, n1951, n1952, n1953, n1954, n1955, n1956, n1957,
         n1958, n1959, n1960, n1961, n1962, n1963, n1964, n1965, n1966, n1967,
         n1968, n1969, n1970, n1971, n1972, n1973, n1974, n1975, n1976, n1977,
         n1978, n1979, n1980, n1981, n1982, n1983, n1984, n1985, n1986, n1987,
         n1988, n1989, n1990, n1991, n1992, n1993, n1994, n1995, n1996, n1997,
         n1998, n1999, n2000, n2001, n2002, n2003, n2004, n2005, n2006, n2007,
         n2008, n2009, n2010, n2011, n2012, n2013, n2014, n2015, n2016, n2017,
         n2018, n2019, n2020, n2021, n2022, n2023, n2024, n2025, n2026, n2027,
         n2028, n2029, n2030, n2031, n2032, n2033, n2034, n2035, n2036, n2037,
         n2038, n2039, n2040, n2041, n2042, n2043, n2044, n2045, n2046, n2047,
         n2048, n2049, n2050, n2051, n2052, n2053, n2054, n2055, n2056, n2057,
         n2058, n2059, n2060, n2061, n2062, n2063, n2064, n2065, n2066, n2067,
         n2068, n2069, n2070, n2071, n2072, n2073, n2074, n2075, n2076, n2077,
         n2078, n2079, n2080, n2081, n2082, n2083, n2084, n2085, n2086, n2087,
         n2088, n2089, n2090, n2091, n2092, n2093, n2094, n2095, n2096, n2097,
         n2098, n2099, n2100, n2101, n2102, n2103, n2104, n2105, n2106, n2107,
         n2108, n2109, n2110, n2111, n2112, n2113, n2114, n2115, n2116, n2117,
         n2118, n2119, n2120, n2121, n2122, n2123, n2124, n2125, n2126, n2127,
         n2128, n2129, n2130, n2131, n2132, n2133, n2134, n2135, n2136, n2137,
         n2138, n2139, n2140, n2141, n2142, n2143, n2144, n2145, n2146, n2147,
         n2148, n2149, n2150, n2151, n2152, n2153, n2154, n2155, n2156, n2157,
         n2158, n2159, n2160, n2161, n2162, n2163, n2164, n2165, n2166, n2167,
         n2168, n2169, n2170, n2171, n2172, n2173, n2174, n2175, n2176, n2177,
         n2178, n2179, n2180, n2181;
  wire   [11:0] samp2_d;
  wire   [11:0] samp3_d;
  wire   [11:0] samp4_d;
  wire   [11:0] samp5_d;
  wire   [31:0] freq_d;
  wire   [31:0] freq;
  wire   [31:0] phase_d;
  wire   [31:0] phase;
  wire   [3:0] s1_d;
  wire   [3:0] s2_d;
  wire   [3:0] addr_1;
  wire   [31:0] din_1;
  wire   [31:0] acc;
  wire   [3:0] s1t_d;
  wire   [3:0] s2t_d;
  wire   [9:0] g1;
  wire   [9:0] g2;
  wire   [3:0] s1t2;
  wire   [3:0] s2t2;
  wire   [3:0] s1t2_d;
  wire   [3:0] s2t2_d;
  wire   [10:0] count1_d;
  wire   [10:0] count2_d;
  wire   [10:0] count3_d;
  wire   [10:0] count4_d;
  wire   [10:0] count4;
  wire   [31:0] sum_d;
  wire   [11:0] samp_5;
  wire   [31:0] corr_d;

  CFD2QXL push1_reg ( .D(push_samp), .CP(clk), .CD(n384), .Q(push2_d) );
  CFD2QXL \din_1_reg[31]  ( .D(din[31]), .CP(clk), .CD(n384), .Q(din_1[31]) );
  CFD2QXL \din_1_reg[30]  ( .D(din[30]), .CP(clk), .CD(n384), .Q(din_1[30]) );
  CFD2QXL \din_1_reg[29]  ( .D(din[29]), .CP(clk), .CD(n2177), .Q(din_1[29])
         );
  CFD2QXL \din_1_reg[28]  ( .D(din[28]), .CP(clk), .CD(n2177), .Q(din_1[28])
         );
  CFD2QXL \din_1_reg[27]  ( .D(din[27]), .CP(clk), .CD(n384), .Q(din_1[27]) );
  CFD2QXL \din_1_reg[26]  ( .D(din[26]), .CP(clk), .CD(n2176), .Q(din_1[26])
         );
  CFD2QXL \din_1_reg[25]  ( .D(din[25]), .CP(clk), .CD(n384), .Q(din_1[25]) );
  CFD2QXL \din_1_reg[24]  ( .D(din[24]), .CP(clk), .CD(n2176), .Q(din_1[24])
         );
  CFD2QXL \din_1_reg[23]  ( .D(din[23]), .CP(clk), .CD(n384), .Q(din_1[23]) );
  CFD2QXL \din_1_reg[22]  ( .D(din[22]), .CP(clk), .CD(n2178), .Q(din_1[22])
         );
  CFD2QXL \din_1_reg[21]  ( .D(din[21]), .CP(clk), .CD(n2179), .Q(din_1[21])
         );
  CFD2QXL \din_1_reg[20]  ( .D(din[20]), .CP(clk), .CD(n2178), .Q(din_1[20])
         );
  CFD2QXL \din_1_reg[19]  ( .D(din[19]), .CP(clk), .CD(n2177), .Q(din_1[19])
         );
  CFD2QXL \din_1_reg[18]  ( .D(din[18]), .CP(clk), .CD(n2177), .Q(din_1[18])
         );
  CFD2QXL \din_1_reg[17]  ( .D(din[17]), .CP(clk), .CD(n2179), .Q(din_1[17])
         );
  CFD2QXL \din_1_reg[16]  ( .D(din[16]), .CP(clk), .CD(n2179), .Q(din_1[16])
         );
  CFD2QXL \din_1_reg[15]  ( .D(din[15]), .CP(clk), .CD(n2179), .Q(din_1[15])
         );
  CFD2QXL \din_1_reg[14]  ( .D(din[14]), .CP(clk), .CD(n2179), .Q(din_1[14])
         );
  CFD2QXL \din_1_reg[13]  ( .D(din[13]), .CP(clk), .CD(n2178), .Q(din_1[13])
         );
  CFD2QXL \din_1_reg[12]  ( .D(din[12]), .CP(clk), .CD(n2178), .Q(din_1[12])
         );
  CFD2QXL \din_1_reg[11]  ( .D(din[11]), .CP(clk), .CD(n2178), .Q(din_1[11])
         );
  CFD2QXL \din_1_reg[10]  ( .D(din[10]), .CP(clk), .CD(n2178), .Q(din_1[10])
         );
  CFD2QXL \din_1_reg[9]  ( .D(din[9]), .CP(clk), .CD(n384), .Q(din_1[9]) );
  CFD2QXL \din_1_reg[8]  ( .D(din[8]), .CP(clk), .CD(n384), .Q(din_1[8]) );
  CFD2QXL \din_1_reg[7]  ( .D(din[7]), .CP(clk), .CD(n2176), .Q(din_1[7]) );
  CFD2QXL \din_1_reg[6]  ( .D(din[6]), .CP(clk), .CD(n2176), .Q(din_1[6]) );
  CFD2QXL \din_1_reg[5]  ( .D(din[5]), .CP(clk), .CD(n384), .Q(din_1[5]) );
  CFD2QXL \din_1_reg[4]  ( .D(din[4]), .CP(clk), .CD(n2179), .Q(din_1[4]) );
  CFD2QXL \din_1_reg[3]  ( .D(din[3]), .CP(clk), .CD(n384), .Q(din_1[3]) );
  CFD2QXL \din_1_reg[2]  ( .D(din[2]), .CP(clk), .CD(n384), .Q(din_1[2]) );
  CFD2QXL \din_1_reg[1]  ( .D(din[1]), .CP(clk), .CD(n2179), .Q(din_1[1]) );
  CFD2QXL \din_1_reg[0]  ( .D(din[0]), .CP(clk), .CD(n2176), .Q(din_1[0]) );
  CFD2QXL \samp_1_reg[11]  ( .D(samp[11]), .CP(clk), .CD(n2176), .Q(
        samp2_d[11]) );
  CFD2QXL \samp_1_reg[10]  ( .D(samp[10]), .CP(clk), .CD(n2176), .Q(
        samp2_d[10]) );
  CFD2QXL \samp_1_reg[9]  ( .D(samp[9]), .CP(clk), .CD(n2176), .Q(samp2_d[9])
         );
  CFD2QXL \samp_1_reg[8]  ( .D(samp[8]), .CP(clk), .CD(n2178), .Q(samp2_d[8])
         );
  CFD2QXL \samp_1_reg[7]  ( .D(samp[7]), .CP(clk), .CD(n2176), .Q(samp2_d[7])
         );
  CFD2QXL \samp_1_reg[6]  ( .D(samp[6]), .CP(clk), .CD(n384), .Q(samp2_d[6])
         );
  CFD2QXL \samp_1_reg[5]  ( .D(samp[5]), .CP(clk), .CD(n2178), .Q(samp2_d[5])
         );
  CFD2QXL \samp_1_reg[4]  ( .D(samp[4]), .CP(clk), .CD(n2179), .Q(samp2_d[4])
         );
  CFD2QXL \samp_1_reg[3]  ( .D(samp[3]), .CP(clk), .CD(n2179), .Q(samp2_d[3])
         );
  CFD2QXL \samp_1_reg[2]  ( .D(samp[2]), .CP(clk), .CD(n2177), .Q(samp2_d[2])
         );
  CFD2QXL \samp_1_reg[1]  ( .D(samp[1]), .CP(clk), .CD(n384), .Q(samp2_d[1])
         );
  CFD2QXL \samp_1_reg[0]  ( .D(samp[0]), .CP(clk), .CD(n384), .Q(samp2_d[0])
         );
  CFD2QXL sync_1_reg ( .D(sync), .CP(clk), .CD(n384), .Q(sync2_d) );
  CFD2QXL strobe_1_reg ( .D(strobe), .CP(clk), .CD(n384), .Q(strobe_1) );
  CFD2QXL \addr_1_reg[3]  ( .D(addr[3]), .CP(clk), .CD(n384), .Q(addr_1[3]) );
  CFD2QXL \addr_1_reg[2]  ( .D(addr[2]), .CP(clk), .CD(n384), .Q(addr_1[2]) );
  CFD2QXL push2_reg ( .D(push2_d), .CP(clk), .CD(n384), .Q(push3_d) );
  CFD2QXL \freq_reg[31]  ( .D(freq_d[31]), .CP(clk), .CD(n2176), .Q(freq[31])
         );
  CFD2QXL \freq_reg[30]  ( .D(freq_d[30]), .CP(clk), .CD(n2178), .Q(freq[30])
         );
  CFD2QXL \freq_reg[29]  ( .D(freq_d[29]), .CP(clk), .CD(n2178), .Q(freq[29])
         );
  CFD2QXL \freq_reg[28]  ( .D(freq_d[28]), .CP(clk), .CD(n2177), .Q(freq[28])
         );
  CFD2QX1 \freq_reg[25]  ( .D(freq_d[25]), .CP(clk), .CD(n2176), .Q(freq[25])
         );
  CFD2QX1 \freq_reg[23]  ( .D(freq_d[23]), .CP(clk), .CD(n384), .Q(freq[23])
         );
  CFD2QX1 \freq_reg[21]  ( .D(freq_d[21]), .CP(clk), .CD(n384), .Q(freq[21])
         );
  CFD2QX1 \freq_reg[20]  ( .D(freq_d[20]), .CP(clk), .CD(n384), .Q(freq[20])
         );
  CFD2QX1 \freq_reg[18]  ( .D(freq_d[18]), .CP(clk), .CD(n2177), .Q(freq[18])
         );
  CFD2QX1 \freq_reg[17]  ( .D(freq_d[17]), .CP(clk), .CD(n2176), .Q(freq[17])
         );
  CFD2QX1 \freq_reg[16]  ( .D(freq_d[16]), .CP(clk), .CD(n2176), .Q(freq[16])
         );
  CFD2QX1 \freq_reg[14]  ( .D(freq_d[14]), .CP(clk), .CD(n2177), .Q(freq[14])
         );
  CFD2QX1 \freq_reg[11]  ( .D(freq_d[11]), .CP(clk), .CD(n2179), .Q(freq[11])
         );
  CFD2QX1 \freq_reg[6]  ( .D(freq_d[6]), .CP(clk), .CD(n384), .Q(freq[6]) );
  CFD2QX1 \freq_reg[5]  ( .D(freq_d[5]), .CP(clk), .CD(n384), .Q(freq[5]) );
  CFD2QX1 \freq_reg[4]  ( .D(freq_d[4]), .CP(clk), .CD(n384), .Q(freq[4]) );
  CFD2QX1 \freq_reg[3]  ( .D(freq_d[3]), .CP(clk), .CD(n2179), .Q(freq[3]) );
  CFD2QXL \phase_reg[31]  ( .D(phase_d[31]), .CP(clk), .CD(n384), .Q(phase[31]) );
  CFD2QXL \phase_reg[30]  ( .D(phase_d[30]), .CP(clk), .CD(n2179), .Q(
        phase[30]) );
  CFD2QXL \phase_reg[29]  ( .D(phase_d[29]), .CP(clk), .CD(n2179), .Q(
        phase[29]) );
  CFD2QXL \phase_reg[28]  ( .D(phase_d[28]), .CP(clk), .CD(n384), .Q(phase[28]) );
  CFD2QXL \phase_reg[27]  ( .D(phase_d[27]), .CP(clk), .CD(n384), .Q(phase[27]) );
  CFD2QXL \phase_reg[26]  ( .D(phase_d[26]), .CP(clk), .CD(n2178), .Q(
        phase[26]) );
  CFD2QXL \phase_reg[25]  ( .D(phase_d[25]), .CP(clk), .CD(n384), .Q(phase[25]) );
  CFD2QXL \phase_reg[24]  ( .D(phase_d[24]), .CP(clk), .CD(n384), .Q(phase[24]) );
  CFD2QXL \phase_reg[23]  ( .D(phase_d[23]), .CP(clk), .CD(n2176), .Q(
        phase[23]) );
  CFD2QXL \phase_reg[22]  ( .D(phase_d[22]), .CP(clk), .CD(n2179), .Q(
        phase[22]) );
  CFD2QXL \phase_reg[21]  ( .D(phase_d[21]), .CP(clk), .CD(n384), .Q(phase[21]) );
  CFD2QXL \phase_reg[20]  ( .D(phase_d[20]), .CP(clk), .CD(n384), .Q(phase[20]) );
  CFD2QXL \phase_reg[19]  ( .D(phase_d[19]), .CP(clk), .CD(n384), .Q(phase[19]) );
  CFD2QXL \phase_reg[18]  ( .D(phase_d[18]), .CP(clk), .CD(n2179), .Q(
        phase[18]) );
  CFD2QXL \phase_reg[17]  ( .D(phase_d[17]), .CP(clk), .CD(n2179), .Q(
        phase[17]) );
  CFD2QXL \phase_reg[16]  ( .D(phase_d[16]), .CP(clk), .CD(n2179), .Q(
        phase[16]) );
  CFD2QXL \phase_reg[15]  ( .D(phase_d[15]), .CP(clk), .CD(n2179), .Q(
        phase[15]) );
  CFD2QXL \phase_reg[14]  ( .D(phase_d[14]), .CP(clk), .CD(n2178), .Q(
        phase[14]) );
  CFD2QXL \phase_reg[13]  ( .D(phase_d[13]), .CP(clk), .CD(n2178), .Q(
        phase[13]) );
  CFD2QXL \phase_reg[12]  ( .D(phase_d[12]), .CP(clk), .CD(n2178), .Q(
        phase[12]) );
  CFD2QXL \phase_reg[11]  ( .D(phase_d[11]), .CP(clk), .CD(n2178), .Q(
        phase[11]) );
  CFD2QXL \phase_reg[10]  ( .D(phase_d[10]), .CP(clk), .CD(n2178), .Q(
        phase[10]) );
  CFD2QXL \phase_reg[9]  ( .D(phase_d[9]), .CP(clk), .CD(n384), .Q(phase[9])
         );
  CFD2QXL \phase_reg[8]  ( .D(phase_d[8]), .CP(clk), .CD(n2177), .Q(phase[8])
         );
  CFD2QXL \phase_reg[7]  ( .D(phase_d[7]), .CP(clk), .CD(n2176), .Q(phase[7])
         );
  CFD2QXL \phase_reg[6]  ( .D(phase_d[6]), .CP(clk), .CD(n2176), .Q(phase[6])
         );
  CFD2QXL \phase_reg[5]  ( .D(phase_d[5]), .CP(clk), .CD(n2177), .Q(phase[5])
         );
  CFD2QXL \phase_reg[4]  ( .D(phase_d[4]), .CP(clk), .CD(n384), .Q(phase[4])
         );
  CFD2QXL \phase_reg[3]  ( .D(phase_d[3]), .CP(clk), .CD(n384), .Q(phase[3])
         );
  CFD2QXL \phase_reg[2]  ( .D(phase_d[2]), .CP(clk), .CD(n2179), .Q(phase[2])
         );
  CFD2QXL \phase_reg[1]  ( .D(phase_d[1]), .CP(clk), .CD(n2178), .Q(phase[1])
         );
  CFD2QXL \phase_reg[0]  ( .D(phase_d[0]), .CP(clk), .CD(n2178), .Q(phase[0])
         );
  CFD2QXL \s1_reg[3]  ( .D(s1_d[3]), .CP(clk), .CD(n2178), .Q(s1t_d[3]) );
  CFD2QXL \s1_reg[2]  ( .D(s1_d[2]), .CP(clk), .CD(n384), .Q(s1t_d[2]) );
  CFD2QXL \s1_reg[1]  ( .D(s1_d[1]), .CP(clk), .CD(n384), .Q(s1t_d[1]) );
  CFD2QXL \s1_reg[0]  ( .D(s1_d[0]), .CP(clk), .CD(n2179), .Q(s1t_d[0]) );
  CFD2QXL \s2_reg[3]  ( .D(s2_d[3]), .CP(clk), .CD(n2177), .Q(s2t_d[3]) );
  CFD2QXL \s2_reg[2]  ( .D(s2_d[2]), .CP(clk), .CD(n2179), .Q(s2t_d[2]) );
  CFD2QXL \s2_reg[1]  ( .D(s2_d[1]), .CP(clk), .CD(n2176), .Q(s2t_d[1]) );
  CFD2QXL \s2_reg[0]  ( .D(s2_d[0]), .CP(clk), .CD(n2177), .Q(s2t_d[0]) );
  CFD2QXL \samp_2_reg[11]  ( .D(samp2_d[11]), .CP(clk), .CD(n384), .Q(
        samp3_d[11]) );
  CFD2QXL \samp_2_reg[10]  ( .D(samp2_d[10]), .CP(clk), .CD(n384), .Q(
        samp3_d[10]) );
  CFD2QXL \samp_2_reg[9]  ( .D(samp2_d[9]), .CP(clk), .CD(n2177), .Q(
        samp3_d[9]) );
  CFD2QXL \samp_2_reg[8]  ( .D(samp2_d[8]), .CP(clk), .CD(n384), .Q(samp3_d[8]) );
  CFD2QXL \samp_2_reg[7]  ( .D(samp2_d[7]), .CP(clk), .CD(n384), .Q(samp3_d[7]) );
  CFD2QXL \samp_2_reg[6]  ( .D(samp2_d[6]), .CP(clk), .CD(n2177), .Q(
        samp3_d[6]) );
  CFD2QXL \samp_2_reg[5]  ( .D(samp2_d[5]), .CP(clk), .CD(n2179), .Q(
        samp3_d[5]) );
  CFD2QXL \samp_2_reg[4]  ( .D(samp2_d[4]), .CP(clk), .CD(n2179), .Q(
        samp3_d[4]) );
  CFD2QXL \samp_2_reg[3]  ( .D(samp2_d[3]), .CP(clk), .CD(n384), .Q(samp3_d[3]) );
  CFD2QXL \samp_2_reg[2]  ( .D(samp2_d[2]), .CP(clk), .CD(n384), .Q(samp3_d[2]) );
  CFD2QXL \samp_2_reg[1]  ( .D(samp2_d[1]), .CP(clk), .CD(n2177), .Q(
        samp3_d[1]) );
  CFD2QXL \samp_2_reg[0]  ( .D(samp2_d[0]), .CP(clk), .CD(n384), .Q(samp3_d[0]) );
  CFD2QXL push3_reg ( .D(push3_d), .CP(clk), .CD(n2179), .Q(push4_d) );
  CFD2QX1 \acc_reg[16]  ( .D(n364), .CP(clk), .CD(n2179), .Q(acc[16]) );
  CFD2QX1 \acc_reg[14]  ( .D(n366), .CP(clk), .CD(n2178), .Q(acc[14]) );
  CFD2QX1 \acc_reg[6]  ( .D(n374), .CP(clk), .CD(n2178), .Q(acc[6]) );
  CFD2QX1 \acc_reg[5]  ( .D(n375), .CP(clk), .CD(n2176), .Q(acc[5]) );
  CFD2QX1 \acc_reg[4]  ( .D(n376), .CP(clk), .CD(n384), .Q(acc[4]) );
  CFD2QX1 \acc_reg[3]  ( .D(n377), .CP(clk), .CD(n384), .Q(acc[3]) );
  CFD2QXL \count_reg[9]  ( .D(n339), .CP(clk), .CD(n2179), .Q(count1_d[9]) );
  CFD2QXL \count_reg[8]  ( .D(n340), .CP(clk), .CD(n384), .Q(count1_d[8]) );
  CFD2QXL \count_reg[7]  ( .D(n341), .CP(clk), .CD(n2178), .Q(count1_d[7]) );
  CFD2QXL \count_reg[6]  ( .D(n342), .CP(clk), .CD(n384), .Q(count1_d[6]) );
  CFD2QXL \count_reg[5]  ( .D(n343), .CP(clk), .CD(n2177), .Q(count1_d[5]) );
  CFD2QXL \count_reg[4]  ( .D(n344), .CP(clk), .CD(n384), .Q(count1_d[4]) );
  CFD2QXL \count_reg[3]  ( .D(n345), .CP(clk), .CD(n2176), .Q(count1_d[3]) );
  CFD2QXL \count_reg[2]  ( .D(n346), .CP(clk), .CD(n384), .Q(count1_d[2]) );
  CFD2QXL \count_reg[1]  ( .D(n347), .CP(clk), .CD(n2178), .Q(count1_d[1]) );
  CFD2QXL sync_3_reg ( .D(n2175), .CP(clk), .CD(n384), .Q(sync4_d) );
  CFD2QXL \samp_3_reg[11]  ( .D(samp3_d[11]), .CP(clk), .CD(n384), .Q(
        samp4_d[11]) );
  CFD2QXL \samp_3_reg[10]  ( .D(samp3_d[10]), .CP(clk), .CD(n384), .Q(
        samp4_d[10]) );
  CFD2QXL \samp_3_reg[9]  ( .D(samp3_d[9]), .CP(clk), .CD(n2178), .Q(
        samp4_d[9]) );
  CFD2QXL \samp_3_reg[8]  ( .D(samp3_d[8]), .CP(clk), .CD(n384), .Q(samp4_d[8]) );
  CFD2QXL \samp_3_reg[7]  ( .D(samp3_d[7]), .CP(clk), .CD(n384), .Q(samp4_d[7]) );
  CFD2QXL \samp_3_reg[6]  ( .D(samp3_d[6]), .CP(clk), .CD(n384), .Q(samp4_d[6]) );
  CFD2QXL \samp_3_reg[5]  ( .D(samp3_d[5]), .CP(clk), .CD(n384), .Q(samp4_d[5]) );
  CFD2QXL \samp_3_reg[4]  ( .D(samp3_d[4]), .CP(clk), .CD(n2176), .Q(
        samp4_d[4]) );
  CFD2QXL \samp_3_reg[3]  ( .D(samp3_d[3]), .CP(clk), .CD(n2177), .Q(
        samp4_d[3]) );
  CFD2QXL \samp_3_reg[2]  ( .D(samp3_d[2]), .CP(clk), .CD(n384), .Q(samp4_d[2]) );
  CFD2QXL \samp_3_reg[1]  ( .D(samp3_d[1]), .CP(clk), .CD(n2178), .Q(
        samp4_d[1]) );
  CFD2QXL \samp_3_reg[0]  ( .D(samp3_d[0]), .CP(clk), .CD(n2176), .Q(
        samp4_d[0]) );
  CFD2QXL \s1t_reg[3]  ( .D(s1t_d[3]), .CP(clk), .CD(n384), .Q(s1t2_d[3]) );
  CFD2QXL \s1t_reg[2]  ( .D(s1t_d[2]), .CP(clk), .CD(n384), .Q(s1t2_d[2]) );
  CFD2QXL \s1t_reg[1]  ( .D(s1t_d[1]), .CP(clk), .CD(n2177), .Q(s1t2_d[1]) );
  CFD2QXL \s1t_reg[0]  ( .D(s1t_d[0]), .CP(clk), .CD(n2176), .Q(s1t2_d[0]) );
  CFD2QXL \s2t_reg[3]  ( .D(s2t_d[3]), .CP(clk), .CD(n384), .Q(s2t2_d[3]) );
  CFD2QXL \s2t_reg[2]  ( .D(s2t_d[2]), .CP(clk), .CD(n384), .Q(s2t2_d[2]) );
  CFD2QXL \s2t_reg[1]  ( .D(s2t_d[1]), .CP(clk), .CD(n2178), .Q(s2t2_d[1]) );
  CFD2QXL \s2t_reg[0]  ( .D(s2t_d[0]), .CP(clk), .CD(n2176), .Q(s2t2_d[0]) );
  CFD2QXL push4_reg ( .D(push4_d), .CP(clk), .CD(n384), .Q(push5_d) );
  CFD2QXL \samp_4_reg[11]  ( .D(samp4_d[11]), .CP(clk), .CD(n2176), .Q(
        samp5_d[11]) );
  CFD2QXL \samp_4_reg[10]  ( .D(samp4_d[10]), .CP(clk), .CD(n384), .Q(
        samp5_d[10]) );
  CFD2QXL \samp_4_reg[9]  ( .D(samp4_d[9]), .CP(clk), .CD(n384), .Q(samp5_d[9]) );
  CFD2QXL \samp_4_reg[8]  ( .D(samp4_d[8]), .CP(clk), .CD(n384), .Q(samp5_d[8]) );
  CFD2QXL \samp_4_reg[7]  ( .D(samp4_d[7]), .CP(clk), .CD(n384), .Q(samp5_d[7]) );
  CFD2QXL \samp_4_reg[6]  ( .D(samp4_d[6]), .CP(clk), .CD(n384), .Q(samp5_d[6]) );
  CFD2QXL \samp_4_reg[5]  ( .D(samp4_d[5]), .CP(clk), .CD(n384), .Q(samp5_d[5]) );
  CFD2QXL \samp_4_reg[4]  ( .D(samp4_d[4]), .CP(clk), .CD(n2178), .Q(
        samp5_d[4]) );
  CFD2QXL \samp_4_reg[3]  ( .D(samp4_d[3]), .CP(clk), .CD(n2179), .Q(
        samp5_d[3]) );
  CFD2QXL \samp_4_reg[2]  ( .D(samp4_d[2]), .CP(clk), .CD(n384), .Q(samp5_d[2]) );
  CFD2QXL \samp_4_reg[1]  ( .D(samp4_d[1]), .CP(clk), .CD(n384), .Q(samp5_d[1]) );
  CFD2QXL \samp_4_reg[0]  ( .D(samp4_d[0]), .CP(clk), .CD(n384), .Q(samp5_d[0]) );
  CFD2QXL \g1_reg[0]  ( .D(n327), .CP(clk), .CD(n384), .Q(g1[0]) );
  CFD2QXL \g1_reg[9]  ( .D(n318), .CP(clk), .CD(n384), .Q(g1[9]) );
  CFD2QXL \g1_reg[8]  ( .D(n319), .CP(clk), .CD(n384), .Q(g1[8]) );
  CFD2QXL \g1_reg[7]  ( .D(n320), .CP(clk), .CD(n2176), .Q(g1[7]) );
  CFD2QXL \g1_reg[6]  ( .D(n321), .CP(clk), .CD(n384), .Q(g1[6]) );
  CFD2QXL \g1_reg[5]  ( .D(n322), .CP(clk), .CD(n384), .Q(g1[5]) );
  CFD2QXL \g1_reg[4]  ( .D(n323), .CP(clk), .CD(n384), .Q(g1[4]) );
  CFD2QXL \g1_reg[3]  ( .D(n324), .CP(clk), .CD(n2176), .Q(g1[3]) );
  CFD2QXL \g1_reg[2]  ( .D(n325), .CP(clk), .CD(n2177), .Q(g1[2]) );
  CFD2QXL \g1_reg[1]  ( .D(n326), .CP(clk), .CD(n384), .Q(g1[1]) );
  CFD2QXL \g2_reg[0]  ( .D(n337), .CP(clk), .CD(n2176), .Q(g2[0]) );
  CFD2QXL \g2_reg[9]  ( .D(n328), .CP(clk), .CD(n2179), .Q(g2[9]) );
  CFD2QXL \g2_reg[8]  ( .D(n329), .CP(clk), .CD(n2178), .Q(g2[8]) );
  CFD2QXL \g2_reg[7]  ( .D(n330), .CP(clk), .CD(n384), .Q(g2[7]) );
  CFD2QXL \g2_reg[6]  ( .D(n331), .CP(clk), .CD(n2176), .Q(g2[6]) );
  CFD2QXL \g2_reg[5]  ( .D(n332), .CP(clk), .CD(n2179), .Q(g2[5]) );
  CFD2QXL \g2_reg[4]  ( .D(n333), .CP(clk), .CD(n2177), .Q(g2[4]) );
  CFD2QXL \g2_reg[3]  ( .D(n334), .CP(clk), .CD(n2178), .Q(g2[3]) );
  CFD2QXL \g2_reg[2]  ( .D(n335), .CP(clk), .CD(n2178), .Q(g2[2]) );
  CFD2QXL \g2_reg[1]  ( .D(n336), .CP(clk), .CD(n2176), .Q(g2[1]) );
  CFD2QXL \s1t2_reg[3]  ( .D(s1t2_d[3]), .CP(clk), .CD(n2179), .Q(s1t2[3]) );
  CFD2QXL \s1t2_reg[2]  ( .D(s1t2_d[2]), .CP(clk), .CD(n2178), .Q(s1t2[2]) );
  CFD2QXL \s1t2_reg[1]  ( .D(s1t2_d[1]), .CP(clk), .CD(n2177), .Q(s1t2[1]) );
  CFD2QXL \s2t2_reg[3]  ( .D(s2t2_d[3]), .CP(clk), .CD(n2179), .Q(s2t2[3]) );
  CFD2QXL \s2t2_reg[2]  ( .D(s2t2_d[2]), .CP(clk), .CD(n2176), .Q(s2t2[2]) );
  CFD2QXL \s2t2_reg[1]  ( .D(s2t2_d[1]), .CP(clk), .CD(n2178), .Q(s2t2[1]) );
  CFD2QXL \s2t2_reg[0]  ( .D(s2t2_d[0]), .CP(clk), .CD(n384), .Q(s2t2[0]) );
  CFD2QXL \count1_reg[10]  ( .D(count1_d[10]), .CP(clk), .CD(n384), .Q(
        count2_d[10]) );
  CFD2QXL \count1_reg[9]  ( .D(count1_d[9]), .CP(clk), .CD(n2177), .Q(
        count2_d[9]) );
  CFD2QXL \count1_reg[8]  ( .D(count1_d[8]), .CP(clk), .CD(n384), .Q(
        count2_d[8]) );
  CFD2QXL \count1_reg[7]  ( .D(count1_d[7]), .CP(clk), .CD(n2176), .Q(
        count2_d[7]) );
  CFD2QXL \count1_reg[6]  ( .D(count1_d[6]), .CP(clk), .CD(n384), .Q(
        count2_d[6]) );
  CFD2QXL \count1_reg[5]  ( .D(count1_d[5]), .CP(clk), .CD(n384), .Q(
        count2_d[5]) );
  CFD2QXL \count1_reg[4]  ( .D(count1_d[4]), .CP(clk), .CD(n384), .Q(
        count2_d[4]) );
  CFD2QXL \count1_reg[3]  ( .D(count1_d[3]), .CP(clk), .CD(n2176), .Q(
        count2_d[3]) );
  CFD2QXL \count1_reg[2]  ( .D(count1_d[2]), .CP(clk), .CD(n2179), .Q(
        count2_d[2]) );
  CFD2QXL \count1_reg[1]  ( .D(count1_d[1]), .CP(clk), .CD(n384), .Q(
        count2_d[1]) );
  CFD2QXL \count1_reg[0]  ( .D(count1_d[0]), .CP(clk), .CD(n2177), .Q(
        count2_d[0]) );
  CFD2QXL \count2_reg[10]  ( .D(count2_d[10]), .CP(clk), .CD(n2178), .Q(
        count3_d[10]) );
  CFD2QXL \count2_reg[9]  ( .D(count2_d[9]), .CP(clk), .CD(n384), .Q(
        count3_d[9]) );
  CFD2QXL \count2_reg[8]  ( .D(count2_d[8]), .CP(clk), .CD(n2176), .Q(
        count3_d[8]) );
  CFD2QXL \count2_reg[7]  ( .D(count2_d[7]), .CP(clk), .CD(n2177), .Q(
        count3_d[7]) );
  CFD2QXL \count2_reg[6]  ( .D(count2_d[6]), .CP(clk), .CD(n384), .Q(
        count3_d[6]) );
  CFD2QXL \count2_reg[5]  ( .D(count2_d[5]), .CP(clk), .CD(n384), .Q(
        count3_d[5]) );
  CFD2QXL \count2_reg[4]  ( .D(count2_d[4]), .CP(clk), .CD(n384), .Q(
        count3_d[4]) );
  CFD2QXL \count2_reg[3]  ( .D(count2_d[3]), .CP(clk), .CD(n384), .Q(
        count3_d[3]) );
  CFD2QXL \count2_reg[2]  ( .D(count2_d[2]), .CP(clk), .CD(n2178), .Q(
        count3_d[2]) );
  CFD2QXL \count2_reg[1]  ( .D(count2_d[1]), .CP(clk), .CD(n384), .Q(
        count3_d[1]) );
  CFD2QXL \count2_reg[0]  ( .D(count2_d[0]), .CP(clk), .CD(n384), .Q(
        count3_d[0]) );
  CFD2QXL sync_4_reg ( .D(sync4_d), .CP(clk), .CD(n2176), .Q(sync5_d) );
  CFD2QXL push5_reg ( .D(push5_d), .CP(clk), .CD(n384), .Q(push5) );
  CFD2QXL gout_reg ( .D(gout_d), .CP(clk), .CD(n384), .Q(gout1_d) );
  CFD2QXL \samp_5_reg[10]  ( .D(samp5_d[10]), .CP(clk), .CD(n2179), .Q(
        samp_5[10]) );
  CFD2QXL \samp_5_reg[9]  ( .D(samp5_d[9]), .CP(clk), .CD(n384), .Q(samp_5[9])
         );
  CFD2QXL \samp_5_reg[8]  ( .D(samp5_d[8]), .CP(clk), .CD(n384), .Q(samp_5[8])
         );
  CFD2QXL \samp_5_reg[7]  ( .D(samp5_d[7]), .CP(clk), .CD(n384), .Q(samp_5[7])
         );
  CFD2QXL \samp_5_reg[4]  ( .D(samp5_d[4]), .CP(clk), .CD(n384), .Q(samp_5[4])
         );
  CFD2QXL \samp_5_reg[3]  ( .D(samp5_d[3]), .CP(clk), .CD(n2176), .Q(samp_5[3]) );
  CFD2QX1 \samp_5_reg[0]  ( .D(samp5_d[0]), .CP(clk), .CD(n384), .Q(
        \C1/DATA1_0 ) );
  CFD2QXL cflag_reg ( .D(cflag_d), .CP(clk), .CD(n2177), .Q(cflag) );
  CFD2QXL gout1_reg ( .D(gout1_d), .CP(clk), .CD(n2179), .Q(gout1) );
  CFD2QXL \sum_reg[0]  ( .D(sum_d[0]), .CP(clk), .CD(n384), .Q(corr_d[0]) );
  CFD2QXL \sum_reg[1]  ( .D(sum_d[1]), .CP(clk), .CD(n384), .Q(corr_d[1]) );
  CFD2QXL \sum_reg[2]  ( .D(sum_d[2]), .CP(clk), .CD(n384), .Q(corr_d[2]) );
  CFD2QXL \sum_reg[3]  ( .D(sum_d[3]), .CP(clk), .CD(n384), .Q(corr_d[3]) );
  CFD2QXL \sum_reg[4]  ( .D(sum_d[4]), .CP(clk), .CD(n384), .Q(corr_d[4]) );
  CFD2QXL \sum_reg[5]  ( .D(sum_d[5]), .CP(clk), .CD(n384), .Q(corr_d[5]) );
  CFD2QXL \sum_reg[6]  ( .D(sum_d[6]), .CP(clk), .CD(n384), .Q(corr_d[6]) );
  CFD2QXL \sum_reg[7]  ( .D(sum_d[7]), .CP(clk), .CD(n384), .Q(corr_d[7]) );
  CFD2QXL \sum_reg[8]  ( .D(sum_d[8]), .CP(clk), .CD(n2177), .Q(corr_d[8]) );
  CFD2QXL \sum_reg[9]  ( .D(sum_d[9]), .CP(clk), .CD(n2177), .Q(corr_d[9]) );
  CFD2QXL \sum_reg[10]  ( .D(sum_d[10]), .CP(clk), .CD(n2177), .Q(corr_d[10])
         );
  CFD2QXL \sum_reg[11]  ( .D(sum_d[11]), .CP(clk), .CD(n2177), .Q(corr_d[11])
         );
  CFD2QXL \sum_reg[12]  ( .D(sum_d[12]), .CP(clk), .CD(n2177), .Q(corr_d[12])
         );
  CFD2QXL \sum_reg[13]  ( .D(sum_d[13]), .CP(clk), .CD(n2177), .Q(corr_d[13])
         );
  CFD2QXL \sum_reg[14]  ( .D(sum_d[14]), .CP(clk), .CD(n2177), .Q(corr_d[14])
         );
  CFD2QXL \sum_reg[15]  ( .D(sum_d[15]), .CP(clk), .CD(n2177), .Q(corr_d[15])
         );
  CFD2QXL \sum_reg[16]  ( .D(sum_d[16]), .CP(clk), .CD(n2177), .Q(corr_d[16])
         );
  CFD2QXL \sum_reg[17]  ( .D(sum_d[17]), .CP(clk), .CD(n2177), .Q(corr_d[17])
         );
  CFD2QXL \sum_reg[18]  ( .D(sum_d[18]), .CP(clk), .CD(n2177), .Q(corr_d[18])
         );
  CFD2QXL \sum_reg[19]  ( .D(sum_d[19]), .CP(clk), .CD(n2177), .Q(corr_d[19])
         );
  CFD2QXL \sum_reg[20]  ( .D(sum_d[20]), .CP(clk), .CD(n384), .Q(corr_d[20])
         );
  CFD2QXL \sum_reg[21]  ( .D(sum_d[21]), .CP(clk), .CD(n384), .Q(corr_d[21])
         );
  CFD2QXL \sum_reg[22]  ( .D(sum_d[22]), .CP(clk), .CD(n2179), .Q(corr_d[22])
         );
  CFD2QXL \sum_reg[23]  ( .D(sum_d[23]), .CP(clk), .CD(n384), .Q(corr_d[23])
         );
  CFD2QXL \sum_reg[24]  ( .D(sum_d[24]), .CP(clk), .CD(n2178), .Q(corr_d[24])
         );
  CFD2QXL \sum_reg[25]  ( .D(sum_d[25]), .CP(clk), .CD(n2178), .Q(corr_d[25])
         );
  CFD2QXL \sum_reg[26]  ( .D(sum_d[26]), .CP(clk), .CD(n2179), .Q(corr_d[26])
         );
  CFD2QXL \sum_reg[27]  ( .D(sum_d[27]), .CP(clk), .CD(n384), .Q(corr_d[27])
         );
  CFD2QXL \sum_reg[28]  ( .D(sum_d[28]), .CP(clk), .CD(n384), .Q(corr_d[28])
         );
  CFD2QXL \sum_reg[29]  ( .D(sum_d[29]), .CP(clk), .CD(n2177), .Q(corr_d[29])
         );
  CFD2QXL \sum_reg[30]  ( .D(sum_d[30]), .CP(clk), .CD(n2178), .Q(corr_d[30])
         );
  CFD2QXL \sum_reg[31]  ( .D(sum_d[31]), .CP(clk), .CD(n384), .Q(corr_d[31])
         );
  CFD2QXL \corr_1_reg[31]  ( .D(corr_d[31]), .CP(clk), .CD(n2176), .Q(corr[31]) );
  CFD2QXL \corr_1_reg[30]  ( .D(corr_d[30]), .CP(clk), .CD(n2176), .Q(corr[30]) );
  CFD2QXL \corr_1_reg[29]  ( .D(corr_d[29]), .CP(clk), .CD(n2176), .Q(corr[29]) );
  CFD2QXL \corr_1_reg[28]  ( .D(corr_d[28]), .CP(clk), .CD(n2176), .Q(corr[28]) );
  CFD2QXL \corr_1_reg[27]  ( .D(corr_d[27]), .CP(clk), .CD(n2176), .Q(corr[27]) );
  CFD2QXL \corr_1_reg[26]  ( .D(corr_d[26]), .CP(clk), .CD(n2179), .Q(corr[26]) );
  CFD2QXL \corr_1_reg[25]  ( .D(corr_d[25]), .CP(clk), .CD(n2176), .Q(corr[25]) );
  CFD2QXL \corr_1_reg[24]  ( .D(corr_d[24]), .CP(clk), .CD(n2178), .Q(corr[24]) );
  CFD2QXL \corr_1_reg[23]  ( .D(corr_d[23]), .CP(clk), .CD(n2177), .Q(corr[23]) );
  CFD2QXL \corr_1_reg[22]  ( .D(corr_d[22]), .CP(clk), .CD(n384), .Q(corr[22])
         );
  CFD2QXL \corr_1_reg[21]  ( .D(corr_d[21]), .CP(clk), .CD(n384), .Q(corr[21])
         );
  CFD2QXL \corr_1_reg[20]  ( .D(corr_d[20]), .CP(clk), .CD(n2179), .Q(corr[20]) );
  CFD2QXL \corr_1_reg[19]  ( .D(corr_d[19]), .CP(clk), .CD(n384), .Q(corr[19])
         );
  CFD2QXL \corr_1_reg[18]  ( .D(corr_d[18]), .CP(clk), .CD(n384), .Q(corr[18])
         );
  CFD2QXL \corr_1_reg[17]  ( .D(corr_d[17]), .CP(clk), .CD(n2177), .Q(corr[17]) );
  CFD2QXL \corr_1_reg[16]  ( .D(corr_d[16]), .CP(clk), .CD(n384), .Q(corr[16])
         );
  CFD2QXL \corr_1_reg[15]  ( .D(corr_d[15]), .CP(clk), .CD(n2179), .Q(corr[15]) );
  CFD2QXL \corr_1_reg[14]  ( .D(corr_d[14]), .CP(clk), .CD(n384), .Q(corr[14])
         );
  CFD2QXL \corr_1_reg[13]  ( .D(corr_d[13]), .CP(clk), .CD(n384), .Q(corr[13])
         );
  CFD2QXL \corr_1_reg[12]  ( .D(corr_d[12]), .CP(clk), .CD(n2179), .Q(corr[12]) );
  CFD2QXL \corr_1_reg[11]  ( .D(corr_d[11]), .CP(clk), .CD(n2179), .Q(corr[11]) );
  CFD2QXL \corr_1_reg[10]  ( .D(corr_d[10]), .CP(clk), .CD(n2177), .Q(corr[10]) );
  CFD2QXL \corr_1_reg[9]  ( .D(corr_d[9]), .CP(clk), .CD(n2176), .Q(corr[9])
         );
  CFD2QXL \corr_1_reg[8]  ( .D(corr_d[8]), .CP(clk), .CD(n2176), .Q(corr[8])
         );
  CFD2QXL \corr_1_reg[7]  ( .D(corr_d[7]), .CP(clk), .CD(n2178), .Q(corr[7])
         );
  CFD2QXL \corr_1_reg[6]  ( .D(corr_d[6]), .CP(clk), .CD(n2178), .Q(corr[6])
         );
  CFD2QXL \corr_1_reg[5]  ( .D(corr_d[5]), .CP(clk), .CD(n384), .Q(corr[5]) );
  CFD2QXL \corr_1_reg[4]  ( .D(corr_d[4]), .CP(clk), .CD(n2176), .Q(corr[4])
         );
  CFD2QXL \corr_1_reg[3]  ( .D(corr_d[3]), .CP(clk), .CD(n2179), .Q(corr[3])
         );
  CFD2QXL \corr_1_reg[2]  ( .D(corr_d[2]), .CP(clk), .CD(n384), .Q(corr[2]) );
  CFD2QXL \corr_1_reg[1]  ( .D(corr_d[1]), .CP(clk), .CD(n384), .Q(corr[1]) );
  CFD2QXL \corr_1_reg[0]  ( .D(corr_d[0]), .CP(clk), .CD(n384), .Q(corr[0]) );
  CFD2QXL sync_2_reg ( .D(sync2_d), .CP(clk), .CD(n384), .Q(sync3_d) );
  CFD2QXL flag_reg ( .D(n2181), .CP(clk), .CD(n2176), .Q(flag1_d) );
  CFD2QX1 \freq_reg[13]  ( .D(freq_d[13]), .CP(clk), .CD(n384), .Q(freq[13])
         );
  CFD2QX1 \freq_reg[15]  ( .D(freq_d[15]), .CP(clk), .CD(n2178), .Q(freq[15])
         );
  CFD2QX1 \freq_reg[7]  ( .D(freq_d[7]), .CP(clk), .CD(n384), .Q(freq[7]) );
  CFD2QX1 \freq_reg[9]  ( .D(freq_d[9]), .CP(clk), .CD(n2177), .Q(freq[9]) );
  CFD2QX1 \acc_reg[7]  ( .D(n373), .CP(clk), .CD(n2176), .Q(acc[7]) );
  CFD2QX1 \freq_reg[19]  ( .D(freq_d[19]), .CP(clk), .CD(n384), .Q(freq[19])
         );
  CFD2QX1 \acc_reg[11]  ( .D(n369), .CP(clk), .CD(n2178), .Q(acc[11]) );
  CFD2QX1 \acc_reg[9]  ( .D(n371), .CP(clk), .CD(n2177), .Q(acc[9]) );
  CFD2QX1 \acc_reg[15]  ( .D(n365), .CP(clk), .CD(n2179), .Q(acc[15]) );
  CFD2QX4 \samp_5_reg[11]  ( .D(samp5_d[11]), .CP(clk), .CD(n384), .Q(
        samp_5[11]) );
  CFD2QXL \dout_1_reg[31]  ( .D(n316), .CP(clk), .CD(n384), .Q(dout[31]) );
  CFD2QXL \dout_1_reg[30]  ( .D(n315), .CP(clk), .CD(n384), .Q(dout[30]) );
  CFD2QXL \dout_1_reg[29]  ( .D(n314), .CP(clk), .CD(n384), .Q(dout[29]) );
  CFD2QXL \dout_1_reg[28]  ( .D(n313), .CP(clk), .CD(n2176), .Q(dout[28]) );
  CFD2QXL \dout_1_reg[27]  ( .D(n312), .CP(clk), .CD(n2178), .Q(dout[27]) );
  CFD2QXL \dout_1_reg[26]  ( .D(n311), .CP(clk), .CD(n384), .Q(dout[26]) );
  CFD2QXL \dout_1_reg[25]  ( .D(n310), .CP(clk), .CD(n2177), .Q(dout[25]) );
  CFD2QXL \dout_1_reg[24]  ( .D(n309), .CP(clk), .CD(n2177), .Q(dout[24]) );
  CFD2QXL \dout_1_reg[23]  ( .D(n308), .CP(clk), .CD(n384), .Q(dout[23]) );
  CFD2QXL \dout_1_reg[22]  ( .D(n307), .CP(clk), .CD(n384), .Q(dout[22]) );
  CFD2QXL \dout_1_reg[21]  ( .D(n306), .CP(clk), .CD(n2176), .Q(dout[21]) );
  CFD2QXL \dout_1_reg[20]  ( .D(n305), .CP(clk), .CD(n2179), .Q(dout[20]) );
  CFD2QXL \dout_1_reg[19]  ( .D(n304), .CP(clk), .CD(n384), .Q(dout[19]) );
  CFD2QXL \dout_1_reg[18]  ( .D(n303), .CP(clk), .CD(n384), .Q(dout[18]) );
  CFD2QXL \dout_1_reg[17]  ( .D(n302), .CP(clk), .CD(n384), .Q(dout[17]) );
  CFD2QXL \dout_1_reg[16]  ( .D(n301), .CP(clk), .CD(n2179), .Q(dout[16]) );
  CFD2QXL \dout_1_reg[15]  ( .D(n300), .CP(clk), .CD(n2177), .Q(dout[15]) );
  CFD2QXL \dout_1_reg[14]  ( .D(n299), .CP(clk), .CD(n2179), .Q(dout[14]) );
  CFD2QXL \dout_1_reg[13]  ( .D(n298), .CP(clk), .CD(n2178), .Q(dout[13]) );
  CFD2QXL \dout_1_reg[12]  ( .D(n297), .CP(clk), .CD(n2179), .Q(dout[12]) );
  CFD2QXL \dout_1_reg[11]  ( .D(n296), .CP(clk), .CD(n384), .Q(dout[11]) );
  CFD2QXL \dout_1_reg[10]  ( .D(n295), .CP(clk), .CD(n2176), .Q(dout[10]) );
  CFD2QXL \dout_1_reg[9]  ( .D(n294), .CP(clk), .CD(n384), .Q(dout[9]) );
  CFD2QXL \dout_1_reg[8]  ( .D(n293), .CP(clk), .CD(n2177), .Q(dout[8]) );
  CFD2QXL \dout_1_reg[7]  ( .D(n292), .CP(clk), .CD(n2179), .Q(dout[7]) );
  CFD2QXL \dout_1_reg[6]  ( .D(n291), .CP(clk), .CD(n2177), .Q(dout[6]) );
  CFD2QXL \dout_1_reg[5]  ( .D(n290), .CP(clk), .CD(n2176), .Q(dout[5]) );
  CFD2QXL \dout_1_reg[4]  ( .D(n289), .CP(clk), .CD(n2176), .Q(dout[4]) );
  CFD2QXL \dout_1_reg[3]  ( .D(n288), .CP(clk), .CD(n2176), .Q(dout[3]) );
  CFD2QXL \dout_1_reg[2]  ( .D(n287), .CP(clk), .CD(n2176), .Q(dout[2]) );
  CFD2QXL \dout_1_reg[1]  ( .D(n286), .CP(clk), .CD(n2176), .Q(dout[1]) );
  CFD2QXL \dout_1_reg[0]  ( .D(n285), .CP(clk), .CD(n2176), .Q(dout[0]) );
  CFD2QXL push7_reg ( .D(n317), .CP(clk), .CD(n2176), .Q(push_corr) );
  CFD2QXL \count4_reg[9]  ( .D(count4_d[9]), .CP(clk), .CD(n2178), .Q(
        count4[9]) );
  CFD2QXL \count4_reg[5]  ( .D(count4_d[5]), .CP(clk), .CD(n2177), .Q(
        count4[5]) );
  CFD2QXL \count4_reg[8]  ( .D(count4_d[8]), .CP(clk), .CD(n2179), .Q(
        count4[8]) );
  CFD2QXL \count4_reg[4]  ( .D(count4_d[4]), .CP(clk), .CD(n2177), .Q(
        count4[4]) );
  CFD2QXL \count4_reg[3]  ( .D(count4_d[3]), .CP(clk), .CD(n2177), .Q(
        count4[3]) );
  CFD2QXL \count4_reg[2]  ( .D(count4_d[2]), .CP(clk), .CD(n2177), .Q(
        count4[2]) );
  CFD2QXL \count4_reg[1]  ( .D(count4_d[1]), .CP(clk), .CD(n2178), .Q(
        count4[1]) );
  CFD2QXL \count4_reg[6]  ( .D(count4_d[6]), .CP(clk), .CD(n2179), .Q(
        count4[6]) );
  CFD2QXL \count3_reg[2]  ( .D(count3_d[2]), .CP(clk), .CD(n2178), .Q(
        count4_d[2]) );
  CFD2QXL \count3_reg[3]  ( .D(count3_d[3]), .CP(clk), .CD(n384), .Q(
        count4_d[3]) );
  CFD2QXL \count3_reg[7]  ( .D(count3_d[7]), .CP(clk), .CD(n2178), .Q(
        count4_d[7]) );
  CFD2QXL \count3_reg[9]  ( .D(count3_d[9]), .CP(clk), .CD(n384), .Q(
        count4_d[9]) );
  CFD2QXL \count3_reg[5]  ( .D(count3_d[5]), .CP(clk), .CD(n2179), .Q(
        count4_d[5]) );
  CFD2QXL \count3_reg[1]  ( .D(count3_d[1]), .CP(clk), .CD(n384), .Q(
        count4_d[1]) );
  CFD2QXL \count3_reg[0]  ( .D(count3_d[0]), .CP(clk), .CD(n2178), .Q(
        count4_d[0]) );
  CFD2QXL \count3_reg[10]  ( .D(count3_d[10]), .CP(clk), .CD(n2177), .Q(
        count4_d[10]) );
  CFD2QXL \count3_reg[6]  ( .D(count3_d[6]), .CP(clk), .CD(n384), .Q(
        count4_d[6]) );
  CFD2QXL \count3_reg[8]  ( .D(count3_d[8]), .CP(clk), .CD(n2177), .Q(
        count4_d[8]) );
  CFD2QXL \count3_reg[4]  ( .D(count3_d[4]), .CP(clk), .CD(n384), .Q(
        count4_d[4]) );
  CFD2QXL \count4_reg[10]  ( .D(count4_d[10]), .CP(clk), .CD(n384), .Q(
        count4[10]) );
  CFD2QXL \addr_1_reg[1]  ( .D(addr[1]), .CP(clk), .CD(n2179), .Q(addr_1[1])
         );
  CFD2QXL \count4_reg[7]  ( .D(count4_d[7]), .CP(clk), .CD(n2176), .Q(
        count4[7]) );
  CFD2QXL \acc_reg[27]  ( .D(n353), .CP(clk), .CD(n384), .Q(acc[27]) );
  CFD2QXL \acc_reg[29]  ( .D(n351), .CP(clk), .CD(n2179), .Q(acc[29]) );
  CFD2QXL \count_reg[10]  ( .D(n338), .CP(clk), .CD(n2177), .Q(count1_d[10])
         );
  CFD2QXL \addr_1_reg[0]  ( .D(addr[0]), .CP(clk), .CD(n384), .Q(addr_1[0]) );
  CFD2QXL \acc_reg[28]  ( .D(n352), .CP(clk), .CD(n384), .Q(acc[28]) );
  CFD2QXL \count4_reg[0]  ( .D(count4_d[0]), .CP(clk), .CD(n384), .Q(count4[0]) );
  CFD2QXL \acc_reg[30]  ( .D(n350), .CP(clk), .CD(n2178), .Q(acc[30]) );
  CFD2QXL \count_reg[0]  ( .D(n348), .CP(clk), .CD(n2178), .Q(count1_d[0]) );
  CFD2QXL \samp_5_reg[1]  ( .D(samp5_d[1]), .CP(clk), .CD(n384), .Q(samp_5[1])
         );
  CFD2QXL \samp_5_reg[5]  ( .D(samp5_d[5]), .CP(clk), .CD(n384), .Q(samp_5[5])
         );
  CFD2QXL \samp_5_reg[6]  ( .D(samp5_d[6]), .CP(clk), .CD(n384), .Q(samp_5[6])
         );
  CFD2QXL \samp_5_reg[2]  ( .D(samp5_d[2]), .CP(clk), .CD(n2179), .Q(samp_5[2]) );
  CFD2QX1 \acc_reg[17]  ( .D(n363), .CP(clk), .CD(n2179), .Q(acc[17]) );
  CFD2QX1 \acc_reg[19]  ( .D(n361), .CP(clk), .CD(n384), .Q(acc[19]) );
  CFD2QX1 \acc_reg[24]  ( .D(n356), .CP(clk), .CD(n384), .Q(acc[24]) );
  CFD2QX1 \acc_reg[13]  ( .D(n367), .CP(clk), .CD(n2178), .Q(acc[13]) );
  CFD2QX2 \freq_reg[12]  ( .D(freq_d[12]), .CP(clk), .CD(n2177), .Q(freq[12])
         );
  CFD2QX2 \freq_reg[10]  ( .D(freq_d[10]), .CP(clk), .CD(n2176), .Q(freq[10])
         );
  CFD2QX1 \acc_reg[23]  ( .D(n357), .CP(clk), .CD(n384), .Q(acc[23]) );
  CFD2QX2 \acc_reg[12]  ( .D(n368), .CP(clk), .CD(n2178), .Q(acc[12]) );
  CFD2XL sync_5_reg ( .D(sync5_d), .CP(clk), .CD(n384), .Q(sync_5), .QN(n2180)
         );
  CFD4XL \s1t2_reg[0]  ( .D(n2174), .CP(clk), .SD(n384), .QN(s1t2[0]) );
  CFD2QX2 \acc_reg[1]  ( .D(n379), .CP(clk), .CD(n384), .Q(acc[1]) );
  CFD2QX2 \freq_reg[24]  ( .D(freq_d[24]), .CP(clk), .CD(n2178), .Q(freq[24])
         );
  CFD2QX1 \acc_reg[26]  ( .D(n354), .CP(clk), .CD(n2177), .Q(acc[26]) );
  CFD2QX1 \acc_reg[10]  ( .D(n370), .CP(clk), .CD(n384), .Q(acc[10]) );
  CFD2X2 \acc_reg[25]  ( .D(n355), .CP(clk), .CD(n2179), .Q(n465) );
  CFD2X1 \acc_reg[18]  ( .D(n362), .CP(clk), .CD(n2179), .Q(n456), .QN(n455)
         );
  CFD2XL \acc_reg[31]  ( .D(n349), .CP(clk), .CD(n384), .Q(n443) );
  CFD2QX2 \acc_reg[2]  ( .D(n378), .CP(clk), .CD(n2177), .Q(acc[2]) );
  CFD2QX2 \freq_reg[2]  ( .D(freq_d[2]), .CP(clk), .CD(n2178), .Q(freq[2]) );
  CFD2QX1 \acc_reg[8]  ( .D(n372), .CP(clk), .CD(n2176), .Q(acc[8]) );
  CFD2QX2 \acc_reg[0]  ( .D(n380), .CP(clk), .CD(n384), .Q(acc[0]) );
  CFD2QX2 \freq_reg[0]  ( .D(freq_d[0]), .CP(clk), .CD(n384), .Q(freq[0]) );
  CFD2QX2 \freq_reg[1]  ( .D(freq_d[1]), .CP(clk), .CD(n2178), .Q(freq[1]) );
  CFD2QX1 \acc_reg[21]  ( .D(n359), .CP(clk), .CD(n384), .Q(acc[21]) );
  CFD2QX4 \acc_reg[20]  ( .D(n360), .CP(clk), .CD(n384), .Q(acc[20]) );
  CFD2QX1 \acc_reg[22]  ( .D(n358), .CP(clk), .CD(n2178), .Q(acc[22]) );
  CFD2QX1 \freq_reg[8]  ( .D(freq_d[8]), .CP(clk), .CD(n384), .Q(freq[8]) );
  CFD4X1 \freq_reg[26]  ( .D(n2173), .CP(clk), .SD(n384), .QN(freq[26]) );
  CFD2QX1 \freq_reg[22]  ( .D(freq_d[22]), .CP(clk), .CD(n384), .Q(freq[22])
         );
  CFD2QXL \freq_reg[27]  ( .D(freq_d[27]), .CP(clk), .CD(n2179), .Q(freq[27])
         );
  CND2XL U495 ( .A(n2180), .B(push5), .Z(n1849) );
  CNIVXL U496 ( .A(n1891), .Z(n2169) );
  CNR2IX1 U497 ( .B(gout1), .A(cflag_d), .Z(n1845) );
  CNR2IX1 U498 ( .B(samp_5[11]), .A(n1093), .Z(n1846) );
  CENX1 U499 ( .A(n1048), .B(n1047), .Z(n1052) );
  CENX1 U500 ( .A(n1186), .B(n1185), .Z(n1187) );
  CENX1 U501 ( .A(n1132), .B(n1131), .Z(n1133) );
  CENX1 U502 ( .A(n1151), .B(n1150), .Z(n1152) );
  CENX1 U503 ( .A(n1167), .B(n1166), .Z(n1168) );
  CENX1 U504 ( .A(n1214), .B(n1213), .Z(n1215) );
  CENX1 U505 ( .A(n1258), .B(n1257), .Z(n1259) );
  CENX1 U506 ( .A(n1327), .B(n1326), .Z(n1328) );
  CENX1 U507 ( .A(n1350), .B(n1349), .Z(n1351) );
  CENX1 U508 ( .A(n1373), .B(n1372), .Z(n1374) );
  CENX1 U509 ( .A(n1393), .B(n1392), .Z(n1394) );
  CENX1 U510 ( .A(n1441), .B(n1440), .Z(n1442) );
  CENX1 U511 ( .A(n1463), .B(n1462), .Z(n1464) );
  CENX1 U512 ( .A(n1499), .B(n1498), .Z(n1500) );
  COND1XL U513 ( .A(n1088), .B(n1830), .C(n1087), .Z(n1091) );
  CANR1XL U514 ( .A(n2103), .B(n2102), .C(n477), .Z(n506) );
  CNR2X1 U515 ( .A(push3_d), .B(n2175), .Z(n2129) );
  CANR1XL U516 ( .A(n454), .B(n2102), .C(n2087), .Z(n2088) );
  CND3XL U517 ( .A(n2153), .B(n932), .C(n931), .Z(n2155) );
  CNR3X1 U518 ( .A(addr_1[2]), .B(addr_1[3]), .C(n2168), .Z(n1892) );
  CNIVX1 U519 ( .A(sync3_d), .Z(n2175) );
  CNR2X1 U520 ( .A(n825), .B(n824), .Z(n2124) );
  CIVX2 U521 ( .A(n899), .Z(n2168) );
  CIVX2 U522 ( .A(n408), .Z(n819) );
  CAN2X1 U523 ( .A(n458), .B(n464), .Z(n514) );
  CND2X1 U524 ( .A(n507), .B(n815), .Z(n479) );
  CND2X1 U525 ( .A(n515), .B(n401), .Z(n406) );
  CNIVXL U526 ( .A(freq[7]), .Z(n1589) );
  CENX1 U527 ( .A(n2046), .B(n1670), .Z(n543) );
  CNIVXL U528 ( .A(acc[26]), .Z(n470) );
  CNR2X1 U529 ( .A(n664), .B(n663), .Z(n742) );
  CND3X1 U530 ( .A(n671), .B(n689), .C(n610), .Z(n609) );
  CNR2X1 U531 ( .A(n750), .B(n773), .Z(n494) );
  CENX1 U532 ( .A(n796), .B(n568), .Z(n736) );
  CNIVX1 U533 ( .A(freq[15]), .Z(n1639) );
  CNIVX1 U534 ( .A(acc[15]), .Z(n778) );
  CENX1 U535 ( .A(n636), .B(n640), .Z(n641) );
  CND3X1 U536 ( .A(n504), .B(n593), .C(n389), .Z(n418) );
  CNR2X1 U537 ( .A(n763), .B(n390), .Z(n764) );
  CND2X1 U538 ( .A(n627), .B(n631), .Z(n763) );
  CNR2X1 U539 ( .A(n402), .B(n706), .Z(n613) );
  CNR2X1 U540 ( .A(n655), .B(n629), .Z(n631) );
  CND2X1 U541 ( .A(n710), .B(n513), .Z(n512) );
  COND1X1 U542 ( .A(n707), .B(n702), .C(n703), .Z(n509) );
  CND2X1 U543 ( .A(acc[10]), .B(freq[10]), .Z(n521) );
  CANR1XL U544 ( .A(n2058), .B(n461), .C(n2057), .Z(n2059) );
  COND1XL U545 ( .A(n1541), .B(n550), .C(n2107), .Z(n357) );
  CENX1 U546 ( .A(n2127), .B(n427), .Z(n426) );
  COND1X1 U547 ( .A(n2123), .B(n468), .C(n2121), .Z(n427) );
  CENXL U548 ( .A(n397), .B(n505), .Z(n550) );
  CND2X1 U549 ( .A(n606), .B(n2128), .Z(n605) );
  COND1X1 U550 ( .A(n2104), .B(n2110), .C(n506), .Z(n505) );
  CIVX1 U551 ( .A(n383), .Z(n467) );
  CND2X1 U552 ( .A(n460), .B(n574), .Z(n383) );
  CND2X2 U553 ( .A(n597), .B(n595), .Z(n460) );
  CANR1X2 U554 ( .A(n416), .B(n418), .C(n415), .Z(n414) );
  CANR1X2 U555 ( .A(n389), .B(n591), .C(n417), .Z(n416) );
  CIVXL U556 ( .A(n646), .Z(n647) );
  CND2XL U557 ( .A(n476), .B(freq[20]), .Z(n473) );
  CND4X1 U558 ( .A(n387), .B(n754), .C(n500), .D(n771), .Z(n748) );
  CENX1 U559 ( .A(n634), .B(n760), .Z(n558) );
  CAN2XL U560 ( .A(n2126), .B(n2125), .Z(n2127) );
  CNIVX1 U561 ( .A(n1892), .Z(n2167) );
  CENX1 U562 ( .A(n1416), .B(n1415), .Z(n1417) );
  CENX1 U563 ( .A(n1039), .B(n1021), .Z(n1022) );
  CNR2IX1 U564 ( .B(n974), .A(cflag_d), .Z(n1847) );
  CNIVX1 U565 ( .A(acc[14]), .Z(n2046) );
  CND2X1 U566 ( .A(n2155), .B(n933), .Z(cflag_d) );
  CIVX4 U567 ( .A(reset), .Z(n384) );
  CAN2XL U568 ( .A(n387), .B(n754), .Z(n385) );
  CAN2XL U569 ( .A(n718), .B(n717), .Z(n386) );
  CAN2X1 U570 ( .A(n743), .B(n752), .Z(n387) );
  CAN2X1 U571 ( .A(n752), .B(n754), .Z(n388) );
  CIVX2 U572 ( .A(n745), .Z(n754) );
  CND2X1 U573 ( .A(n1892), .B(strobe_1), .Z(n1629) );
  CAN2X1 U574 ( .A(strobe_1), .B(n1891), .Z(n1566) );
  CNIVX1 U575 ( .A(n739), .Z(n389) );
  CNR2IX2 U576 ( .B(push3_d), .A(n2175), .Z(n2128) );
  COR2XL U577 ( .A(n762), .B(n761), .Z(n390) );
  CIVXL U578 ( .A(n761), .Z(n652) );
  CND2X1 U579 ( .A(freq[12]), .B(acc[12]), .Z(n675) );
  CAN2XL U580 ( .A(n788), .B(n516), .Z(n391) );
  CNR2XL U581 ( .A(freq[0]), .B(acc[0]), .Z(n392) );
  CIVDXL U582 ( .A(n875), .Z0(n393), .Z1(n394) );
  CND2X1 U583 ( .A(n764), .B(n633), .Z(n765) );
  CEOXL U584 ( .A(n386), .B(n428), .Z(n395) );
  CAOR1X1 U585 ( .A(n887), .B(n888), .C(n838), .Z(n396) );
  CAN2XL U586 ( .A(n2106), .B(n2105), .Z(n397) );
  CAN2XL U587 ( .A(n2055), .B(n2054), .Z(n398) );
  CNIVX1 U588 ( .A(n450), .Z(n399) );
  CAN2XL U589 ( .A(n459), .B(n449), .Z(n400) );
  CIVX1 U590 ( .A(n1994), .Z(n2034) );
  CND2X1 U591 ( .A(n589), .B(n588), .Z(n535) );
  CIVX1 U592 ( .A(n1084), .Z(n1223) );
  CNR2XL U593 ( .A(n1379), .B(n1274), .Z(n1446) );
  CND2XL U594 ( .A(n1081), .B(n1224), .Z(n1083) );
  CIVXL U595 ( .A(n1379), .Z(n1470) );
  CND2X1 U596 ( .A(n1402), .B(n1399), .Z(n1243) );
  CNR2XL U597 ( .A(n1122), .B(n1765), .Z(n1124) );
  CENXL U598 ( .A(n1756), .B(samp_5[3]), .Z(n1757) );
  CND2XL U599 ( .A(n1816), .B(n1815), .Z(n1817) );
  CND2XL U600 ( .A(n1451), .B(n1450), .Z(n1452) );
  CND2XL U601 ( .A(n1468), .B(n1272), .Z(n1274) );
  CIVX1 U602 ( .A(n2129), .Z(n1539) );
  CIVXL U603 ( .A(n2128), .Z(n1541) );
  CND2XL U604 ( .A(n1026), .B(n963), .Z(n965) );
  CNIVX1 U605 ( .A(n686), .Z(n676) );
  CND2XL U606 ( .A(n1497), .B(n1496), .Z(n1498) );
  CND2XL U607 ( .A(n1461), .B(n1460), .Z(n1462) );
  CND2XL U608 ( .A(n1060), .B(n1058), .Z(n1765) );
  CNR2XL U609 ( .A(n1474), .B(n1481), .Z(n1272) );
  CND2XL U610 ( .A(n1789), .B(n1788), .Z(n1790) );
  CND2XL U611 ( .A(n1808), .B(n1807), .Z(n1809) );
  CNR2XL U612 ( .A(n1333), .B(n1334), .Z(n1398) );
  CND2XL U613 ( .A(n978), .B(n999), .Z(n1074) );
  CIVXL U614 ( .A(n1323), .Z(n1325) );
  CNR2XL U615 ( .A(n1079), .B(corr_d[11]), .Z(n1773) );
  CNR2XL U616 ( .A(n1268), .B(corr_d[25]), .Z(n1359) );
  CNR2XL U617 ( .A(n1085), .B(corr_d[12]), .Z(n1813) );
  CIVXL U618 ( .A(n1459), .Z(n1461) );
  CNR2XL U619 ( .A(n1270), .B(corr_d[27]), .Z(n1481) );
  CNR2XL U620 ( .A(n1552), .B(corr_d[0]), .Z(n1703) );
  CNR2XL U621 ( .A(n1004), .B(n1005), .Z(n1058) );
  CIVXL U622 ( .A(n1247), .Z(n1184) );
  CNR2XL U623 ( .A(n1247), .B(n1246), .Z(n1340) );
  COR2XL U624 ( .A(n981), .B(corr_d[9]), .Z(n999) );
  CND2XL U625 ( .A(n1390), .B(n1413), .Z(n1366) );
  CNR2XL U626 ( .A(n1239), .B(corr_d[21]), .Z(n1334) );
  CIVXL U627 ( .A(n1369), .Z(n1371) );
  CNR2XL U628 ( .A(n1752), .B(n1741), .Z(n961) );
  CNR2XL U629 ( .A(samp_5[11]), .B(corr_d[25]), .Z(n1389) );
  CND2XL U630 ( .A(samp_5[11]), .B(corr_d[24]), .Z(n1413) );
  CNR2XL U631 ( .A(samp_5[11]), .B(corr_d[27]), .Z(n1323) );
  CNR2XL U632 ( .A(samp_5[11]), .B(corr_d[29]), .Z(n1459) );
  CND2XL U633 ( .A(samp_5[11]), .B(corr_d[14]), .Z(n1807) );
  CND2XL U634 ( .A(samp_5[11]), .B(corr_d[13]), .Z(n1788) );
  CNR2XL U635 ( .A(corr_d[6]), .B(samp_5[6]), .Z(n1046) );
  CNR2XL U636 ( .A(samp_5[11]), .B(corr_d[18]), .Z(n1149) );
  CNR2XL U637 ( .A(samp_5[11]), .B(corr_d[21]), .Z(n1246) );
  COND1X1 U638 ( .A(n1541), .B(n426), .C(n2130), .Z(n355) );
  CND2IXL U639 ( .B(n863), .A(n518), .Z(n517) );
  CND2X1 U640 ( .A(n1548), .B(n394), .Z(n518) );
  COND1X1 U641 ( .A(n1541), .B(n1540), .C(n1539), .Z(n2149) );
  COND1X1 U642 ( .A(freq[24]), .B(n535), .C(acc[24]), .Z(n534) );
  CENXL U643 ( .A(n1338), .B(n1337), .Z(n1339) );
  CENXL U644 ( .A(n1244), .B(n1243), .Z(n1245) );
  CEOXL U645 ( .A(n1794), .B(n1830), .Z(n1795) );
  CANR1XL U646 ( .A(n984), .B(n1223), .C(n983), .Z(n985) );
  CIVDX1 U647 ( .A(n1553), .Z1(n1819) );
  CANR1XL U648 ( .A(n978), .B(n1223), .C(n980), .Z(n1000) );
  COND1X1 U649 ( .A(freq[16]), .B(n539), .C(acc[16]), .Z(n538) );
  CAN2X1 U650 ( .A(n690), .B(n672), .Z(n610) );
  CIVXL U651 ( .A(n1157), .Z(n1191) );
  CAN2X1 U652 ( .A(n618), .B(n623), .Z(n624) );
  CIVXL U653 ( .A(n1916), .Z(n1926) );
  CIVXL U654 ( .A(n1290), .Z(n1341) );
  CIVXL U655 ( .A(n1297), .Z(n1343) );
  CNR2XL U656 ( .A(n1074), .B(n1077), .Z(n1224) );
  CND2X1 U657 ( .A(n474), .B(n473), .Z(n781) );
  CIVXL U658 ( .A(n1765), .Z(n1799) );
  CND2XL U659 ( .A(n2071), .B(n2081), .Z(n2082) );
  CND2X1 U660 ( .A(n1381), .B(n1380), .Z(n1382) );
  CNR2XL U661 ( .A(n1487), .B(n1293), .Z(n1294) );
  CND2XL U662 ( .A(n1180), .B(n1179), .Z(n1181) );
  CIVXL U663 ( .A(n1020), .Z(n1038) );
  CIVXL U664 ( .A(n1681), .Z(n947) );
  CND2XL U665 ( .A(n999), .B(n998), .Z(n1001) );
  CIVXL U666 ( .A(n1679), .Z(n948) );
  CND2XL U667 ( .A(n1688), .B(n1687), .Z(n1692) );
  CIVXL U668 ( .A(n1716), .Z(n1744) );
  CND2XL U669 ( .A(n1746), .B(n1716), .Z(n1717) );
  CNR2XL U670 ( .A(n1772), .B(n1773), .Z(n1081) );
  CND2XL U671 ( .A(n1371), .B(n1370), .Z(n1372) );
  CND2XL U672 ( .A(n1325), .B(n1324), .Z(n1326) );
  COND1X1 U673 ( .A(n1670), .B(n785), .C(n2046), .Z(n542) );
  CIVXL U674 ( .A(n1425), .Z(n1427) );
  CIVXL U675 ( .A(n1421), .Z(n1451) );
  CIVX2 U676 ( .A(n618), .Z(n632) );
  CND2X1 U677 ( .A(n647), .B(n652), .Z(n648) );
  CND2XL U678 ( .A(n1414), .B(n1413), .Z(n1415) );
  CND2XL U679 ( .A(n1029), .B(n968), .Z(n970) );
  CIVXL U680 ( .A(n1219), .Z(n1221) );
  CNR2XL U681 ( .A(n1046), .B(n1035), .Z(n963) );
  CNR2XL U682 ( .A(n1515), .B(n1505), .Z(n1507) );
  CIVX1 U683 ( .A(n805), .Z(n601) );
  CIVX1 U684 ( .A(n1004), .Z(n956) );
  CNR2XL U685 ( .A(n1219), .B(n1057), .Z(n1060) );
  CIVXL U686 ( .A(n1149), .Z(n1203) );
  CND2XL U687 ( .A(n1211), .B(n1205), .Z(n1126) );
  CIVXL U688 ( .A(n1389), .Z(n1391) );
  CND2XL U689 ( .A(n938), .B(corr_d[2]), .Z(n1716) );
  CIVXL U690 ( .A(n1689), .Z(n1729) );
  CIVXL U691 ( .A(n1246), .Z(n1130) );
  CND2XL U692 ( .A(n1242), .B(corr_d[22]), .Z(n1399) );
  CNR2XL U693 ( .A(n1276), .B(corr_d[29]), .Z(n1425) );
  CNR2XL U694 ( .A(n1495), .B(n1459), .Z(n1431) );
  CNR2XL U695 ( .A(n1275), .B(corr_d[28]), .Z(n1421) );
  CND2XL U696 ( .A(n1292), .B(n1439), .Z(n1440) );
  CND2XL U697 ( .A(samp_5[11]), .B(corr_d[16]), .Z(n1839) );
  CNR2XL U698 ( .A(samp_5[4]), .B(samp_5[5]), .Z(n1029) );
  CNR2XL U699 ( .A(samp_5[11]), .B(corr_d[15]), .Z(n1117) );
  CNR2XL U700 ( .A(samp_5[1]), .B(\C1/DATA1_0 ), .Z(n1722) );
  CNR2XL U701 ( .A(corr_d[2]), .B(samp_5[2]), .Z(n1752) );
  CNR2XL U702 ( .A(corr_d[4]), .B(samp_5[4]), .Z(n1689) );
  CND2XL U703 ( .A(samp_5[11]), .B(corr_d[20]), .Z(n1250) );
  CND2XL U704 ( .A(samp_5[11]), .B(corr_d[19]), .Z(n1211) );
  COR2X1 U705 ( .A(freq[16]), .B(acc[16]), .Z(n739) );
  CND2XL U706 ( .A(samp_5[11]), .B(corr_d[22]), .Z(n1347) );
  CND2XL U707 ( .A(samp_5[11]), .B(corr_d[18]), .Z(n1205) );
  CND2XL U708 ( .A(count1_d[4]), .B(count1_d[5]), .Z(n1515) );
  CNR2XL U709 ( .A(samp_5[11]), .B(corr_d[17]), .Z(n1163) );
  CND2XL U710 ( .A(samp_5[11]), .B(corr_d[26]), .Z(n1370) );
  CND2XL U711 ( .A(n2053), .B(n2052), .Z(n363) );
  CND2XL U712 ( .A(n1999), .B(n1998), .Z(n371) );
  CND2XL U713 ( .A(n2051), .B(n2128), .Z(n2053) );
  CND2XL U714 ( .A(n2062), .B(n2061), .Z(n365) );
  CND2XL U715 ( .A(n2060), .B(n2128), .Z(n2062) );
  CND2XL U716 ( .A(n1992), .B(n1991), .Z(n372) );
  CND2XL U717 ( .A(n2048), .B(n2047), .Z(n366) );
  CND2XL U718 ( .A(n1996), .B(n2128), .Z(n1999) );
  CND2XL U719 ( .A(n2045), .B(n2128), .Z(n2048) );
  CND2XL U720 ( .A(n1990), .B(n2128), .Z(n1992) );
  CIVXL U721 ( .A(n866), .Z(n867) );
  CND2XL U722 ( .A(n517), .B(n864), .Z(n854) );
  CND2XL U723 ( .A(n466), .B(n454), .Z(n2113) );
  CAN2XL U724 ( .A(n1549), .B(n1548), .Z(n1550) );
  CND2XL U725 ( .A(n2149), .B(count1_d[10]), .Z(n1542) );
  CND2XL U726 ( .A(n2149), .B(count1_d[2]), .Z(n1972) );
  CND2XL U727 ( .A(n2149), .B(count1_d[3]), .Z(n1978) );
  CND2XL U728 ( .A(n2149), .B(count1_d[7]), .Z(n2143) );
  CIVXL U729 ( .A(n2043), .Z(n2058) );
  CND2XL U730 ( .A(n2149), .B(count1_d[6]), .Z(n1969) );
  CND2XL U731 ( .A(n2149), .B(count1_d[9]), .Z(n2150) );
  CND2XL U732 ( .A(n2149), .B(count1_d[4]), .Z(n1981) );
  CND2XL U733 ( .A(n2149), .B(count1_d[8]), .Z(n1975) );
  CND2XL U734 ( .A(n2149), .B(count1_d[5]), .Z(n1984) );
  CNIVXL U735 ( .A(n578), .Z(n2054) );
  CIVX1 U736 ( .A(n582), .Z(n853) );
  CND2X1 U737 ( .A(n534), .B(n533), .Z(n825) );
  COND4CXL U738 ( .A(n1851), .B(n1850), .C(n1849), .D(n1848), .Z(sum_d[16]) );
  COND4CXL U739 ( .A(n1823), .B(n1822), .C(n1849), .D(n1821), .Z(sum_d[14]) );
  COND4CXL U740 ( .A(n1781), .B(n1780), .C(n1849), .D(n1779), .Z(sum_d[12]) );
  CND2XL U741 ( .A(n1364), .B(n1819), .Z(n1377) );
  COND4CXL U742 ( .A(n1798), .B(n1797), .C(n1849), .D(n1796), .Z(sum_d[13]) );
  CND2X1 U743 ( .A(n535), .B(freq[24]), .Z(n533) );
  CND2XL U744 ( .A(n1162), .B(n1819), .Z(n1171) );
  CND2XL U745 ( .A(n1454), .B(n1819), .Z(n1467) );
  CND2XL U746 ( .A(n1778), .B(n1819), .Z(n1780) );
  CND2XL U747 ( .A(n1410), .B(n1553), .Z(n1420) );
  CENX1 U748 ( .A(n536), .B(n535), .Z(n823) );
  CND2XL U749 ( .A(n1486), .B(n1553), .Z(n1503) );
  CND2XL U750 ( .A(n1316), .B(n1819), .Z(n1331) );
  CND2XL U751 ( .A(n1286), .B(n1819), .Z(n1310) );
  CND2XL U752 ( .A(n1183), .B(n1819), .Z(n1190) );
  CND2XL U753 ( .A(n1430), .B(n1819), .Z(n1445) );
  CND2XL U754 ( .A(n1384), .B(n1819), .Z(n1397) );
  CND2XL U755 ( .A(n1837), .B(n1553), .Z(n1851) );
  CND2XL U756 ( .A(n1820), .B(n1819), .Z(n1822) );
  CND2XL U757 ( .A(n1202), .B(n1553), .Z(n1218) );
  CND2XL U758 ( .A(n1146), .B(n1819), .Z(n1155) );
  CENX1 U759 ( .A(n1836), .B(n1835), .Z(n1837) );
  CND2XL U760 ( .A(n959), .B(n1553), .Z(n977) );
  COND4CXL U761 ( .A(n1714), .B(n1713), .C(n1849), .D(n1712), .Z(sum_d[1]) );
  CENXL U762 ( .A(n1383), .B(n1382), .Z(n1384) );
  CENX1 U763 ( .A(n1161), .B(n1160), .Z(n1162) );
  COND4CXL U764 ( .A(n1740), .B(n1739), .C(n1849), .D(n1738), .Z(sum_d[4]) );
  CND2XL U765 ( .A(n1685), .B(n1553), .Z(n1699) );
  CND2XL U766 ( .A(n1928), .B(n1927), .Z(n290) );
  CND2XL U767 ( .A(n1906), .B(n1905), .Z(n291) );
  CENX1 U768 ( .A(n1145), .B(n1144), .Z(n1146) );
  CND2XL U769 ( .A(n1902), .B(n1901), .Z(n289) );
  CND2XL U770 ( .A(n1930), .B(n1929), .Z(n308) );
  CND2XL U771 ( .A(n1908), .B(n1907), .Z(n292) );
  CND2XL U772 ( .A(n1959), .B(n1958), .Z(n296) );
  CND2XL U773 ( .A(n1945), .B(n1944), .Z(n301) );
  CND2XL U774 ( .A(n1943), .B(n1942), .Z(n303) );
  CND2XL U775 ( .A(n1963), .B(n1962), .Z(n309) );
  CND2XL U776 ( .A(n1957), .B(n1956), .Z(n297) );
  CND2XL U777 ( .A(n1949), .B(n1948), .Z(n293) );
  CND2XL U778 ( .A(n1953), .B(n1952), .Z(n307) );
  CND2XL U779 ( .A(n1934), .B(n1933), .Z(n306) );
  CND2XL U780 ( .A(n1043), .B(n1819), .Z(n1055) );
  CND2XL U781 ( .A(n1894), .B(n1893), .Z(n315) );
  CND2XL U782 ( .A(n1951), .B(n1950), .Z(n300) );
  CND2XL U783 ( .A(n1936), .B(n1935), .Z(n304) );
  CND2XL U784 ( .A(n1955), .B(n1954), .Z(n294) );
  CND2XL U785 ( .A(n1896), .B(n1895), .Z(n314) );
  COND4CXL U786 ( .A(n1727), .B(n1726), .C(n1849), .D(n1725), .Z(sum_d[2]) );
  CND2XL U787 ( .A(n1795), .B(n1819), .Z(n1797) );
  CND2XL U788 ( .A(n1961), .B(n1960), .Z(n295) );
  CND2XL U789 ( .A(n1941), .B(n1940), .Z(n311) );
  CND2XL U790 ( .A(n1932), .B(n1931), .Z(n310) );
  CND2XL U791 ( .A(n1965), .B(n1964), .Z(n299) );
  CND2XL U792 ( .A(n1904), .B(n1903), .Z(n313) );
  CND2XL U793 ( .A(n1938), .B(n1937), .Z(n305) );
  CND2XL U794 ( .A(n1898), .B(n1897), .Z(n312) );
  CND2XL U795 ( .A(n1900), .B(n1899), .Z(n316) );
  CND2XL U796 ( .A(n1967), .B(n1966), .Z(n298) );
  CND2XL U797 ( .A(n1226), .B(n1819), .Z(n1238) );
  COND4CXL U798 ( .A(n1557), .B(n1556), .C(n1849), .D(n1555), .Z(sum_d[0]) );
  CND2XL U799 ( .A(n1947), .B(n1946), .Z(n302) );
  CIVXL U800 ( .A(n2011), .Z(n464) );
  CND2XL U801 ( .A(n1887), .B(n1886), .Z(n377) );
  CND2XL U802 ( .A(n1704), .B(n1819), .Z(n1714) );
  CND2XL U803 ( .A(n1022), .B(n1819), .Z(n1034) );
  CEOXL U804 ( .A(n986), .B(n985), .Z(n987) );
  CEOXL U805 ( .A(n1042), .B(n1041), .Z(n1043) );
  CND2XL U806 ( .A(n1749), .B(n1819), .Z(n1763) );
  CND2XL U807 ( .A(n1871), .B(n1870), .Z(n376) );
  CNR2XL U808 ( .A(n2146), .B(n2145), .Z(n2148) );
  CIVXL U809 ( .A(n2146), .Z(n1537) );
  CND2XL U810 ( .A(n1718), .B(n1819), .Z(n1727) );
  CEOXL U811 ( .A(n1001), .B(n1000), .Z(n1002) );
  CIVX1 U812 ( .A(n1988), .Z(n797) );
  CND2XL U813 ( .A(n1605), .B(n1604), .Z(phase_d[21]) );
  CND2XL U814 ( .A(n1593), .B(n1592), .Z(phase_d[5]) );
  CND2XL U815 ( .A(n1618), .B(n1617), .Z(phase_d[26]) );
  CND2XL U816 ( .A(n1643), .B(n1642), .Z(phase_d[22]) );
  CND2XL U817 ( .A(n1568), .B(n1567), .Z(phase_d[27]) );
  CND2XL U818 ( .A(n1669), .B(n1668), .Z(phase_d[14]) );
  CND2XL U819 ( .A(n1647), .B(n1646), .Z(phase_d[9]) );
  CND2XL U820 ( .A(n1628), .B(n1627), .Z(phase_d[17]) );
  CND2XL U821 ( .A(n1652), .B(n1651), .Z(phase_d[12]) );
  CND2XL U822 ( .A(n1601), .B(n1600), .Z(phase_d[25]) );
  CND2XL U823 ( .A(n1665), .B(n1664), .Z(phase_d[24]) );
  CND2XL U824 ( .A(n1661), .B(n1660), .Z(phase_d[10]) );
  CND2XL U825 ( .A(n1609), .B(n1608), .Z(phase_d[19]) );
  CND2XL U826 ( .A(n1584), .B(n1583), .Z(phase_d[6]) );
  CND2XL U827 ( .A(n1559), .B(n1558), .Z(phase_d[30]) );
  CND2XL U828 ( .A(n1638), .B(n1637), .Z(phase_d[15]) );
  CND2XL U829 ( .A(n1624), .B(n1623), .Z(phase_d[16]) );
  CND2XL U830 ( .A(n1580), .B(n1579), .Z(phase_d[28]) );
  CND2XL U831 ( .A(n1576), .B(n1575), .Z(phase_d[4]) );
  CND2XL U832 ( .A(n1633), .B(n1632), .Z(phase_d[8]) );
  CND2XL U833 ( .A(n1614), .B(n1613), .Z(phase_d[20]) );
  CIVX1 U834 ( .A(n1093), .Z(n1760) );
  CND2XL U835 ( .A(n1620), .B(n1619), .Z(phase_d[18]) );
  CND2XL U836 ( .A(n1572), .B(n1571), .Z(phase_d[31]) );
  CND2XL U837 ( .A(n1884), .B(n1883), .Z(n373) );
  CND2XL U838 ( .A(n1588), .B(n1587), .Z(phase_d[7]) );
  CND2XL U839 ( .A(n1656), .B(n1655), .Z(phase_d[11]) );
  CND2XL U840 ( .A(n1675), .B(n1674), .Z(phase_d[13]) );
  CND2XL U841 ( .A(n1597), .B(n1596), .Z(phase_d[23]) );
  CND2XL U842 ( .A(n1563), .B(n1562), .Z(phase_d[29]) );
  CND2X1 U843 ( .A(n538), .B(n537), .Z(n814) );
  CAN2X1 U844 ( .A(n1072), .B(n1758), .Z(n1843) );
  CND2XL U845 ( .A(n2128), .B(n395), .Z(n1871) );
  CIVX1 U846 ( .A(n1112), .Z(n1830) );
  CND2XL U847 ( .A(n911), .B(n910), .Z(s1_d[0]) );
  CND2XL U848 ( .A(phase[18]), .B(n1673), .Z(n1619) );
  CND2XL U849 ( .A(phase[13]), .B(n1673), .Z(n1674) );
  CND2XL U850 ( .A(phase[5]), .B(n1673), .Z(n1592) );
  CENX1 U851 ( .A(n540), .B(n539), .Z(n811) );
  CND2XL U852 ( .A(phase[6]), .B(n1673), .Z(n1583) );
  CND2XL U853 ( .A(n1874), .B(n1873), .Z(n375) );
  CND2XL U854 ( .A(phase[19]), .B(n1673), .Z(n1608) );
  CND2XL U855 ( .A(phase[23]), .B(n1673), .Z(n1596) );
  CND2XL U856 ( .A(phase[16]), .B(n1673), .Z(n1623) );
  CND2XL U857 ( .A(phase[7]), .B(n1673), .Z(n1587) );
  CENX1 U858 ( .A(n816), .B(n649), .Z(n419) );
  CND2XL U859 ( .A(n1890), .B(n1889), .Z(n374) );
  CND2XL U860 ( .A(phase[20]), .B(n1673), .Z(n1613) );
  CND2XL U861 ( .A(phase[24]), .B(n1673), .Z(n1664) );
  CND2X1 U862 ( .A(n539), .B(freq[16]), .Z(n537) );
  CIVXL U863 ( .A(n1939), .Z(n2173) );
  CND2XL U864 ( .A(phase[25]), .B(n1673), .Z(n1600) );
  CEOXL U865 ( .A(n1748), .B(n1747), .Z(n1749) );
  CND2XL U866 ( .A(phase[21]), .B(n1673), .Z(n1604) );
  CND2XL U867 ( .A(phase[17]), .B(n1673), .Z(n1627) );
  CND2XL U868 ( .A(phase[31]), .B(n1673), .Z(n1571) );
  CND2XL U869 ( .A(phase[22]), .B(n1673), .Z(n1642) );
  CENX1 U870 ( .A(n1229), .B(n990), .Z(n994) );
  CND2XL U871 ( .A(phase[12]), .B(n1673), .Z(n1651) );
  CND2XL U872 ( .A(phase[26]), .B(n1673), .Z(n1617) );
  CIVXL U873 ( .A(n820), .Z(n576) );
  CND2XL U874 ( .A(n907), .B(n906), .Z(s1_d[3]) );
  CND2XL U875 ( .A(n917), .B(n916), .Z(s1_d[1]) );
  CND2XL U876 ( .A(phase[9]), .B(n1673), .Z(n1646) );
  CND2XL U877 ( .A(phase[27]), .B(n1673), .Z(n1567) );
  CND2XL U878 ( .A(phase[28]), .B(n1673), .Z(n1579) );
  CND2XL U879 ( .A(phase[4]), .B(n1673), .Z(n1575) );
  CND2XL U880 ( .A(phase[30]), .B(n1673), .Z(n1558) );
  CND2XL U881 ( .A(phase[11]), .B(n1673), .Z(n1655) );
  CND2XL U882 ( .A(phase[8]), .B(n1673), .Z(n1632) );
  CENX1 U883 ( .A(n601), .B(n600), .Z(n599) );
  CNR2IX1 U884 ( .B(n967), .A(cflag_d), .Z(n1553) );
  CND2XL U885 ( .A(phase[14]), .B(n1673), .Z(n1668) );
  CND2XL U886 ( .A(n901), .B(n900), .Z(s1_d[2]) );
  CND2XL U887 ( .A(phase[15]), .B(n1673), .Z(n1637) );
  CND2XL U888 ( .A(phase[10]), .B(n1673), .Z(n1660) );
  CND2XL U889 ( .A(phase[29]), .B(n1673), .Z(n1562) );
  CIVXL U890 ( .A(n809), .Z(n579) );
  CND2X1 U891 ( .A(n424), .B(n502), .Z(n501) );
  CND2XL U892 ( .A(din_1[31]), .B(n1566), .Z(n1572) );
  CANR1XL U893 ( .A(n1222), .B(n1081), .C(n1080), .Z(n1082) );
  CNR2XL U894 ( .A(n1983), .B(n1968), .Z(n1520) );
  CND2XL U895 ( .A(n1470), .B(n1381), .Z(n1358) );
  CND2XL U896 ( .A(n1175), .B(n1191), .Z(n1177) );
  CIVX1 U897 ( .A(n688), .Z(n434) );
  CEOXL U898 ( .A(n1692), .B(n1691), .Z(n1696) );
  CND2XL U899 ( .A(din_1[6]), .B(n1566), .Z(n1584) );
  CEOXL U900 ( .A(n1926), .B(n1925), .Z(gout_d) );
  CND2XL U901 ( .A(din_1[7]), .B(n1566), .Z(n1588) );
  CAN2XL U902 ( .A(n643), .B(n641), .Z(n559) );
  CND2XL U903 ( .A(din_1[19]), .B(n1566), .Z(n1609) );
  CND2XL U904 ( .A(din_1[20]), .B(n1566), .Z(n1614) );
  CND2XL U905 ( .A(n1876), .B(n1875), .Z(n379) );
  CND2XL U906 ( .A(din_1[21]), .B(n1566), .Z(n1605) );
  CND2XL U907 ( .A(din_1[17]), .B(n1566), .Z(n1628) );
  CND2XL U908 ( .A(din_1[22]), .B(n1566), .Z(n1643) );
  CND2XL U909 ( .A(din_1[5]), .B(n1566), .Z(n1593) );
  CND2XL U910 ( .A(din_1[23]), .B(n1566), .Z(n1597) );
  CND2XL U911 ( .A(din_1[24]), .B(n1566), .Z(n1665) );
  CND2XL U912 ( .A(din_1[18]), .B(n1566), .Z(n1620) );
  CND2XL U913 ( .A(din_1[25]), .B(n1566), .Z(n1601) );
  CND2XL U914 ( .A(din_1[26]), .B(n1566), .Z(n1618) );
  CND2XL U915 ( .A(din_1[4]), .B(n1566), .Z(n1576) );
  CND2XL U916 ( .A(din_1[27]), .B(n1566), .Z(n1568) );
  CND2XL U917 ( .A(n1191), .B(n1159), .Z(n1140) );
  CIVX1 U918 ( .A(n821), .Z(n577) );
  CND2XL U919 ( .A(din_1[16]), .B(n1566), .Z(n1624) );
  CND2XL U920 ( .A(n1882), .B(n1881), .Z(n378) );
  CIVX1 U921 ( .A(n567), .Z(n568) );
  CND2XL U922 ( .A(n1476), .B(n1470), .Z(n1480) );
  CENX1 U923 ( .A(n711), .B(n584), .Z(n1888) );
  CIVX2 U924 ( .A(n1125), .Z(n1805) );
  CENX1 U925 ( .A(n565), .B(n786), .Z(n809) );
  CNR2XL U926 ( .A(n1019), .B(n953), .Z(n955) );
  CNR2XL U927 ( .A(n1343), .B(n1342), .Z(n1344) );
  CNR2XL U928 ( .A(n1343), .B(n1127), .Z(n1128) );
  CND2XL U929 ( .A(n1341), .B(n1184), .Z(n1129) );
  CND2XL U930 ( .A(n1489), .B(n1414), .Z(n1388) );
  CNR2XL U931 ( .A(n1492), .B(n1386), .Z(n1387) );
  CNR2XL U932 ( .A(n1492), .B(n1491), .Z(n1493) );
  CENX1 U933 ( .A(n650), .B(n653), .Z(n662) );
  CNR2XL U934 ( .A(n1974), .B(n1980), .Z(n1533) );
  CNR2XL U935 ( .A(n1469), .B(n1474), .Z(n1476) );
  CNR2XL U936 ( .A(n1492), .B(n1456), .Z(n1457) );
  CND2X1 U937 ( .A(n786), .B(n1639), .Z(n563) );
  CEOXL U938 ( .A(count1_d[10]), .B(n1509), .Z(n1538) );
  CND2XL U939 ( .A(n1064), .B(n1799), .Z(n1066) );
  COND1XL U940 ( .A(n942), .B(n1715), .C(n941), .Z(n1017) );
  CIVXL U941 ( .A(n1492), .Z(n1411) );
  CND2XL U942 ( .A(n1879), .B(n1878), .Z(n380) );
  CNR2XL U943 ( .A(n1492), .B(n1320), .Z(n1321) );
  CNR2XL U944 ( .A(n1492), .B(n1436), .Z(n1437) );
  CND2XL U945 ( .A(n1249), .B(n1341), .Z(n1255) );
  CND2XL U946 ( .A(n1489), .B(n1294), .Z(n1304) );
  CNR2XL U947 ( .A(n1343), .B(n1253), .Z(n1254) );
  CND2XL U948 ( .A(n1799), .B(n1784), .Z(n1786) );
  CNR2XL U949 ( .A(n1492), .B(n1366), .Z(n1367) );
  CNR2XL U950 ( .A(n1492), .B(n1302), .Z(n1303) );
  CIVXL U951 ( .A(n1487), .Z(n1488) );
  CND2XL U952 ( .A(n805), .B(n804), .Z(n2004) );
  CIVXL U953 ( .A(n810), .Z(n581) );
  CND2XL U954 ( .A(n1301), .B(n1490), .Z(n1302) );
  CNR2XL U955 ( .A(n1248), .B(n1346), .Z(n1249) );
  CEOXL U956 ( .A(n1525), .B(n1524), .Z(n1977) );
  CANR1XL U957 ( .A(n980), .B(n999), .C(n982), .Z(n1076) );
  CNR2XL U958 ( .A(n1487), .B(n1432), .Z(n1433) );
  CND2XL U959 ( .A(n1775), .B(n1774), .Z(n1776) );
  CIVX1 U960 ( .A(n990), .Z(n986) );
  CND2XL U961 ( .A(n1435), .B(n1490), .Z(n1436) );
  COR2X1 U962 ( .A(n799), .B(n523), .Z(n790) );
  CIVX1 U963 ( .A(n1733), .Z(n1731) );
  COAN1X1 U964 ( .A(n769), .B(n768), .C(n767), .Z(n770) );
  CENXL U965 ( .A(n1735), .B(samp_5[4]), .Z(n1736) );
  COR2X1 U966 ( .A(n805), .B(n804), .Z(n792) );
  CIVXL U967 ( .A(n1468), .Z(n1469) );
  CND2XL U968 ( .A(n1828), .B(n1825), .Z(n1090) );
  CNR2XL U969 ( .A(n1056), .B(n1806), .Z(n1064) );
  CND2XL U970 ( .A(n1807), .B(n1062), .Z(n1063) );
  CND2XL U971 ( .A(n1496), .B(n1490), .Z(n1456) );
  CIVX1 U972 ( .A(n1232), .Z(n1225) );
  CNR2XL U973 ( .A(n1487), .B(n1495), .Z(n1455) );
  CND2XL U974 ( .A(n876), .B(n875), .Z(n881) );
  CANR1XL U975 ( .A(n937), .B(n1701), .C(n936), .Z(n1715) );
  CND2X1 U976 ( .A(n1199), .B(n1198), .Z(n1200) );
  CIVX1 U977 ( .A(n966), .Z(n957) );
  CIVX1 U978 ( .A(n1047), .Z(n1042) );
  CND2XL U979 ( .A(n1370), .B(n1319), .Z(n1320) );
  CIVX1 U980 ( .A(n886), .Z(n838) );
  CND2XL U981 ( .A(n1040), .B(n944), .Z(n953) );
  CEOXL U982 ( .A(n1721), .B(n1751), .Z(n1724) );
  CNR2XL U983 ( .A(n1317), .B(n1369), .Z(n1318) );
  CND2XL U984 ( .A(n1098), .B(n1332), .Z(n1114) );
  CND2XL U985 ( .A(n1347), .B(n1252), .Z(n1253) );
  CND2XL U986 ( .A(n1336), .B(n1335), .Z(n1337) );
  CIVX1 U987 ( .A(n1753), .Z(n1748) );
  CANR1XL U988 ( .A(n1827), .B(n1102), .C(n1101), .Z(n1156) );
  CND2XL U989 ( .A(n1735), .B(n1029), .Z(n1049) );
  CIVXL U990 ( .A(n1490), .Z(n1491) );
  COND1X1 U991 ( .A(n680), .B(n431), .C(n675), .Z(n669) );
  CND2XL U992 ( .A(n1212), .B(n1211), .Z(n1213) );
  CNR2XL U993 ( .A(n1434), .B(n1299), .Z(n1301) );
  CIVX1 U994 ( .A(n1355), .Z(n1381) );
  CIVX1 U995 ( .A(n1263), .Z(n1402) );
  CIVX1 U996 ( .A(n1028), .Z(n1735) );
  CIVX1 U997 ( .A(n807), .Z(n572) );
  CND2XL U998 ( .A(n1391), .B(n1390), .Z(n1392) );
  COR2X1 U999 ( .A(n817), .B(n816), .Z(n2071) );
  CIVXL U1000 ( .A(n1450), .Z(n1422) );
  CND2XL U1001 ( .A(n956), .B(n1003), .Z(n966) );
  CNR2XL U1002 ( .A(n1207), .B(n1206), .Z(n1208) );
  CIVXL U1003 ( .A(n1474), .Z(n1313) );
  CIVXL U1004 ( .A(n1399), .Z(n1400) );
  CND2XL U1005 ( .A(n1256), .B(n1295), .Z(n1257) );
  CIVXL U1006 ( .A(n1405), .Z(n1407) );
  CIVXL U1007 ( .A(n1431), .Z(n1432) );
  CND2XL U1008 ( .A(n1184), .B(n1250), .Z(n1185) );
  CIVXL U1009 ( .A(n1434), .Z(n1435) );
  CND2XL U1010 ( .A(n1707), .B(n1706), .Z(n1708) );
  CND2XL U1011 ( .A(n829), .B(n828), .Z(n864) );
  CIVXL U1012 ( .A(n1342), .Z(n1252) );
  CND2XL U1013 ( .A(n1340), .B(n1288), .Z(n1289) );
  CND2XL U1014 ( .A(n1682), .B(n1681), .Z(n1683) );
  CND2XL U1015 ( .A(n1348), .B(n1347), .Z(n1349) );
  CND2XL U1016 ( .A(n837), .B(n836), .Z(n886) );
  CIVX1 U1017 ( .A(n815), .Z(n573) );
  CIVXL U1018 ( .A(n1700), .Z(n936) );
  CND2XL U1019 ( .A(n1130), .B(n1251), .Z(n1131) );
  CIVXL U1020 ( .A(n1340), .Z(n1248) );
  CIVXL U1021 ( .A(n1481), .Z(n1483) );
  CIVX1 U1022 ( .A(n2081), .Z(n401) );
  CIVXL U1023 ( .A(n1366), .Z(n1319) );
  CND2XL U1024 ( .A(n827), .B(n826), .Z(n875) );
  CIVXL U1025 ( .A(n1365), .Z(n1317) );
  CIVX1 U1026 ( .A(n1099), .Z(n1828) );
  CAOR2XL U1027 ( .A(n2129), .B(n443), .C(sync3_d), .D(phase[31]), .Z(n616) );
  CIVXL U1028 ( .A(n766), .Z(n768) );
  CIVXL U1029 ( .A(n1800), .Z(n1062) );
  CND2XL U1030 ( .A(n1221), .B(n1220), .Z(n1232) );
  CNR2XL U1031 ( .A(n1800), .B(n1120), .Z(n1121) );
  CND2XL U1032 ( .A(n845), .B(n844), .Z(n846) );
  CND2XL U1033 ( .A(n1840), .B(n1839), .Z(n1842) );
  CIVXL U1034 ( .A(n998), .Z(n982) );
  CIVXL U1035 ( .A(n1058), .Z(n989) );
  CANR1XL U1036 ( .A(n1061), .B(n1060), .C(n1059), .Z(n1764) );
  CND2X1 U1037 ( .A(n1230), .B(n1227), .Z(n990) );
  CNR2XL U1038 ( .A(n1421), .B(n1425), .Z(n1278) );
  CAOR2XL U1039 ( .A(n2129), .B(acc[22]), .C(sync3_d), .D(phase[22]), .Z(n2094) );
  CND2X1 U1040 ( .A(n785), .B(n1670), .Z(n541) );
  CIVX1 U1041 ( .A(n718), .Z(n570) );
  CND2XL U1042 ( .A(n1516), .B(count1_d[6]), .Z(n1517) );
  CND2XL U1043 ( .A(n1165), .B(n1164), .Z(n1166) );
  CND2XL U1044 ( .A(n1527), .B(count1_d[2]), .Z(n1524) );
  CND2XL U1045 ( .A(n1431), .B(n1292), .Z(n1293) );
  CIVXL U1046 ( .A(n1207), .Z(n1147) );
  CND2XL U1047 ( .A(n1203), .B(n1205), .Z(n1150) );
  COND1XL U1048 ( .A(n1812), .B(n1814), .C(n1815), .Z(n1827) );
  CAN2X1 U1049 ( .A(n704), .B(n703), .Z(n705) );
  CND2XL U1050 ( .A(n981), .B(corr_d[9]), .Z(n998) );
  CND2XL U1051 ( .A(n2140), .B(n1869), .Z(n335) );
  CND2XL U1052 ( .A(n2140), .B(n1861), .Z(n324) );
  CND2XL U1053 ( .A(n2140), .B(n1866), .Z(n325) );
  CND2XL U1054 ( .A(n1085), .B(corr_d[12]), .Z(n1812) );
  COR2XL U1055 ( .A(n1281), .B(corr_d[30]), .Z(n1283) );
  CIVXL U1056 ( .A(n1782), .Z(n1783) );
  CND2XL U1057 ( .A(n2140), .B(n1854), .Z(n336) );
  CND2XL U1058 ( .A(n1086), .B(corr_d[13]), .Z(n1815) );
  CND2XL U1059 ( .A(n2140), .B(n1856), .Z(n333) );
  CAN2XL U1060 ( .A(n979), .B(corr_d[8]), .Z(n980) );
  CIVX2 U1061 ( .A(n710), .Z(n402) );
  CND2XL U1062 ( .A(n2140), .B(n1852), .Z(n334) );
  CND2XL U1063 ( .A(n2140), .B(n1858), .Z(n332) );
  COR2XL U1064 ( .A(n979), .B(corr_d[8]), .Z(n978) );
  CIVXL U1065 ( .A(n1515), .Z(n1516) );
  CND2XL U1066 ( .A(n2140), .B(n1868), .Z(n326) );
  CND2XL U1067 ( .A(n2140), .B(n1857), .Z(n323) );
  CND2XL U1068 ( .A(n2140), .B(n1867), .Z(n337) );
  CND2XL U1069 ( .A(n2140), .B(n1860), .Z(n331) );
  CIVXL U1070 ( .A(n1806), .Z(n1808) );
  CNR2XL U1071 ( .A(n1806), .B(n1117), .Z(n1118) );
  CNR2XL U1072 ( .A(samp_5[11]), .B(n1078), .Z(n1772) );
  CIVXL U1073 ( .A(n1117), .Z(n1067) );
  CND2XL U1074 ( .A(n1071), .B(corr_d[10]), .Z(n1075) );
  CNR2XL U1075 ( .A(n1071), .B(corr_d[10]), .Z(n1077) );
  CND2XL U1076 ( .A(n2140), .B(n1862), .Z(n330) );
  CND2XL U1077 ( .A(n2140), .B(n1863), .Z(n329) );
  CND2XL U1078 ( .A(n1119), .B(n1807), .Z(n1120) );
  CND2XL U1079 ( .A(n2137), .B(g1[9]), .Z(n2141) );
  CIVXL U1080 ( .A(n1250), .Z(n1127) );
  CND2XL U1081 ( .A(n1275), .B(corr_d[28]), .Z(n1450) );
  CNR2XL U1082 ( .A(n1097), .B(corr_d[20]), .Z(n1333) );
  CND2XL U1083 ( .A(n2140), .B(n1853), .Z(n327) );
  COR2XL U1084 ( .A(n949), .B(corr_d[6]), .Z(n1040) );
  CND2XL U1085 ( .A(n949), .B(corr_d[6]), .Z(n1020) );
  CND2XL U1086 ( .A(n1270), .B(corr_d[27]), .Z(n1482) );
  CNR2XL U1087 ( .A(n1369), .B(n1323), .Z(n1291) );
  COR2X1 U1088 ( .A(freq[27]), .B(n883), .Z(n828) );
  CND2XL U1089 ( .A(n1324), .B(n1370), .Z(n1300) );
  CIVX1 U1090 ( .A(n1495), .Z(n1497) );
  CND2XL U1091 ( .A(n935), .B(corr_d[1]), .Z(n1700) );
  CND2XL U1092 ( .A(n1239), .B(corr_d[21]), .Z(n1335) );
  COR2XL U1093 ( .A(n935), .B(corr_d[1]), .Z(n1701) );
  CND2XL U1094 ( .A(n945), .B(corr_d[4]), .Z(n1679) );
  CIVXL U1095 ( .A(n1722), .Z(n1755) );
  COR2XL U1096 ( .A(n946), .B(corr_d[5]), .Z(n1682) );
  CND2XL U1097 ( .A(n946), .B(corr_d[5]), .Z(n1681) );
  CND2XL U1098 ( .A(n1269), .B(corr_d[26]), .Z(n1472) );
  CIVXL U1099 ( .A(n1752), .Z(n1719) );
  COR2XL U1100 ( .A(n938), .B(corr_d[2]), .Z(n1746) );
  CIVX1 U1101 ( .A(n1385), .Z(n1414) );
  CND2XL U1102 ( .A(n1295), .B(n1347), .Z(n1296) );
  CND2XL U1103 ( .A(n1268), .B(corr_d[25]), .Z(n1360) );
  CND2XL U1104 ( .A(n1264), .B(corr_d[23]), .Z(n1406) );
  COR2XL U1105 ( .A(n939), .B(corr_d[3]), .Z(n934) );
  CIVX1 U1106 ( .A(n1741), .Z(n1743) );
  CAN2XL U1107 ( .A(n939), .B(corr_d[3]), .Z(n940) );
  CND2XL U1108 ( .A(n1267), .B(corr_d[24]), .Z(n1380) );
  CIVXL U1109 ( .A(n1413), .Z(n1386) );
  CNR2XL U1110 ( .A(n1346), .B(n1287), .Z(n1288) );
  CIVXL U1111 ( .A(n1439), .Z(n1299) );
  CND3XL U1112 ( .A(n919), .B(count4[7]), .C(count4[0]), .Z(n920) );
  COR2XL U1113 ( .A(n950), .B(corr_d[7]), .Z(n944) );
  CND2XL U1114 ( .A(n1281), .B(corr_d[30]), .Z(n1282) );
  CND2XL U1115 ( .A(n2140), .B(n1865), .Z(n320) );
  CAN2XL U1116 ( .A(n950), .B(corr_d[7]), .Z(n951) );
  CNR2XL U1117 ( .A(n1149), .B(n1210), .Z(n1116) );
  CIVXL U1118 ( .A(n1205), .Z(n1206) );
  CND2XL U1119 ( .A(n1460), .B(n1496), .Z(n1434) );
  CND2XL U1120 ( .A(n2140), .B(n1855), .Z(n321) );
  CND2XL U1121 ( .A(n2140), .B(n1864), .Z(n319) );
  CND2XL U1122 ( .A(n2140), .B(n1859), .Z(n322) );
  CIVXL U1123 ( .A(n1523), .Z(n1527) );
  CND2XL U1124 ( .A(n1276), .B(corr_d[29]), .Z(n1426) );
  CIVX2 U1125 ( .A(n769), .Z(n403) );
  CIVX1 U1126 ( .A(acc[28]), .Z(n752) );
  CNIVX1 U1127 ( .A(freq[13]), .Z(n1676) );
  CIVXL U1128 ( .A(din_1[4]), .Z(n1578) );
  CIVXL U1129 ( .A(din_1[5]), .Z(n1595) );
  CIVXL U1130 ( .A(din_1[6]), .Z(n1586) );
  CIVXL U1131 ( .A(din_1[11]), .Z(n1659) );
  CIVX2 U1132 ( .A(n788), .Z(n404) );
  CIVXL U1133 ( .A(din_1[14]), .Z(n1672) );
  CNIVX1 U1134 ( .A(freq[14]), .Z(n1670) );
  CIVXL U1135 ( .A(din_1[16]), .Z(n1626) );
  CIVXL U1136 ( .A(din_1[17]), .Z(n1631) );
  CIVXL U1137 ( .A(din_1[18]), .Z(n1622) );
  CIVXL U1138 ( .A(din_1[20]), .Z(n1616) );
  CIVXL U1139 ( .A(din_1[21]), .Z(n1607) );
  CIVXL U1140 ( .A(din_1[23]), .Z(n1599) );
  CIVXL U1141 ( .A(din_1[25]), .Z(n1603) );
  CIVXL U1142 ( .A(din_1[28]), .Z(n1582) );
  CIVXL U1143 ( .A(din_1[29]), .Z(n1565) );
  CIVXL U1144 ( .A(din_1[30]), .Z(n1561) );
  CIVXL U1145 ( .A(din_1[31]), .Z(n1574) );
  CNR2X1 U1146 ( .A(addr_1[1]), .B(addr_1[0]), .Z(n899) );
  COR2X1 U1147 ( .A(freq[24]), .B(acc[24]), .Z(n633) );
  CIVXL U1148 ( .A(count4_d[10]), .Z(n928) );
  CND2XL U1149 ( .A(count4_d[9]), .B(count4_d[8]), .Z(n926) );
  CND2XL U1150 ( .A(count4_d[5]), .B(count4_d[4]), .Z(n927) );
  CIVXL U1151 ( .A(corr_d[16]), .Z(n1100) );
  CIVXL U1152 ( .A(corr_d[15]), .Z(n1089) );
  CIVX2 U1153 ( .A(sync4_d), .Z(n2140) );
  CIVX1 U1154 ( .A(\C1/DATA1_0 ), .Z(n1552) );
  CIVXL U1155 ( .A(corr_d[22]), .Z(n1239) );
  CIVXL U1156 ( .A(corr_d[14]), .Z(n1086) );
  CND2XL U1157 ( .A(corr_d[0]), .B(\C1/DATA1_0 ), .Z(n1709) );
  CIVXL U1158 ( .A(corr_d[20]), .Z(n1106) );
  CIVXL U1159 ( .A(count4[10]), .Z(n919) );
  CIVXL U1160 ( .A(din_1[19]), .Z(n1612) );
  CIVXL U1161 ( .A(din_1[27]), .Z(n1570) );
  CIVXL U1162 ( .A(corr_d[19]), .Z(n1105) );
  CIVXL U1163 ( .A(din_1[26]), .Z(n615) );
  CIVXL U1164 ( .A(din_1[9]), .Z(n1650) );
  CIVXL U1165 ( .A(din_1[24]), .Z(n1667) );
  CIVXL U1166 ( .A(din_1[7]), .Z(n1591) );
  CIVXL U1167 ( .A(din_1[22]), .Z(n1645) );
  CIVXL U1168 ( .A(corr_d[18]), .Z(n1104) );
  CIVXL U1169 ( .A(din_1[15]), .Z(n1641) );
  CIVXL U1170 ( .A(din_1[13]), .Z(n1678) );
  CIVXL U1171 ( .A(din_1[12]), .Z(n1654) );
  CIVXL U1172 ( .A(corr_d[17]), .Z(n1103) );
  CIVXL U1173 ( .A(din_1[10]), .Z(n1663) );
  CIVXL U1174 ( .A(din_1[8]), .Z(n1636) );
  CEOXL U1175 ( .A(g2[8]), .B(g2[4]), .Z(n2132) );
  CND2XL U1176 ( .A(samp_5[11]), .B(corr_d[17]), .Z(n1164) );
  CND4XL U1177 ( .A(count4_d[3]), .B(count4_d[2]), .C(count4_d[1]), .D(
        count4_d[6]), .Z(n929) );
  CEOXL U1178 ( .A(g2[7]), .B(g2[1]), .Z(n2133) );
  CIVXL U1179 ( .A(corr_d[21]), .Z(n1097) );
  CIVXL U1180 ( .A(corr_d[24]), .Z(n1264) );
  CNR2XL U1181 ( .A(corr_d[10]), .B(samp_5[10]), .Z(n1057) );
  CIVXL U1182 ( .A(corr_d[30]), .Z(n1276) );
  CIVXL U1183 ( .A(s1t2_d[0]), .Z(n2174) );
  CND2XL U1184 ( .A(corr_d[10]), .B(samp_5[10]), .Z(n1227) );
  CEOXL U1185 ( .A(s2t2[0]), .B(s2t2[1]), .Z(n1909) );
  CIVX1 U1186 ( .A(samp_5[10]), .Z(n1071) );
  COR2XL U1187 ( .A(samp_5[11]), .B(corr_d[30]), .Z(n1292) );
  CIVXL U1188 ( .A(samp_5[9]), .Z(n981) );
  CIVXL U1189 ( .A(samp_5[8]), .Z(n979) );
  CND2XL U1190 ( .A(count1_d[8]), .B(count1_d[9]), .Z(n1508) );
  CIVXL U1191 ( .A(corr_d[29]), .Z(n1275) );
  CIVXL U1192 ( .A(count1_d[1]), .Z(n1528) );
  CIVXL U1193 ( .A(count1_d[2]), .Z(n1526) );
  CIVXL U1194 ( .A(count1_d[3]), .Z(n1525) );
  CIVXL U1195 ( .A(samp_5[5]), .Z(n946) );
  CIVXL U1196 ( .A(count1_d[4]), .Z(n1532) );
  CIVXL U1197 ( .A(corr_d[25]), .Z(n1267) );
  CIVXL U1198 ( .A(count1_d[5]), .Z(n1511) );
  CIVXL U1199 ( .A(samp_5[4]), .Z(n945) );
  CIVXL U1200 ( .A(count1_d[6]), .Z(n1513) );
  CIVXL U1201 ( .A(count1_d[7]), .Z(n1518) );
  CIVXL U1202 ( .A(samp_5[7]), .Z(n950) );
  CIVXL U1203 ( .A(corr_d[28]), .Z(n1270) );
  CND2XL U1204 ( .A(count1_d[6]), .B(count1_d[7]), .Z(n1505) );
  CND2XL U1205 ( .A(count1_d[2]), .B(count1_d[3]), .Z(n1506) );
  CIVXL U1206 ( .A(corr_d[26]), .Z(n1268) );
  CND2XL U1207 ( .A(count1_d[1]), .B(count1_d[0]), .Z(n1523) );
  CIVXL U1208 ( .A(corr_d[27]), .Z(n1269) );
  CIVXL U1209 ( .A(count1_d[8]), .Z(n1530) );
  CIVXL U1210 ( .A(count1_d[9]), .Z(n1521) );
  CIVXL U1211 ( .A(samp_5[6]), .Z(n949) );
  CIVXL U1212 ( .A(samp_5[1]), .Z(n935) );
  CIVXL U1213 ( .A(corr_d[13]), .Z(n1085) );
  CIVXL U1214 ( .A(corr_d[23]), .Z(n1242) );
  CIVXL U1215 ( .A(samp_5[2]), .Z(n938) );
  CIVXL U1216 ( .A(corr_d[12]), .Z(n1079) );
  CND2XL U1217 ( .A(samp_5[11]), .B(corr_d[11]), .Z(n1220) );
  CIVXL U1218 ( .A(corr_d[31]), .Z(n1281) );
  CND2X1 U1219 ( .A(n605), .B(n2099), .Z(n362) );
  CNR2X2 U1220 ( .A(freq[4]), .B(acc[4]), .Z(n715) );
  CIVX2 U1221 ( .A(n2102), .Z(n2109) );
  CND2X2 U1222 ( .A(n407), .B(n405), .Z(n2102) );
  CIVX2 U1223 ( .A(n548), .Z(n405) );
  CND2X2 U1224 ( .A(n406), .B(n2074), .Z(n548) );
  CND2X1 U1225 ( .A(n507), .B(n818), .Z(n2074) );
  CND2X1 U1226 ( .A(n2080), .B(n819), .Z(n407) );
  CND2X2 U1227 ( .A(n515), .B(n2071), .Z(n408) );
  CND2X2 U1228 ( .A(n409), .B(n479), .Z(n2080) );
  CND2X2 U1229 ( .A(n450), .B(n410), .Z(n409) );
  CIVX2 U1230 ( .A(n2096), .Z(n410) );
  CNR2X2 U1231 ( .A(n411), .B(n419), .Z(n741) );
  CND2X2 U1232 ( .A(n413), .B(n412), .Z(n411) );
  CND3X2 U1233 ( .A(n416), .B(n418), .C(n415), .Z(n412) );
  CIVX2 U1234 ( .A(n414), .Z(n413) );
  CIVX2 U1235 ( .A(n813), .Z(n415) );
  CIVX2 U1236 ( .A(n591), .Z(n471) );
  CIVX1 U1237 ( .A(n738), .Z(n417) );
  CND2X2 U1238 ( .A(n422), .B(n420), .Z(n649) );
  CIVX2 U1239 ( .A(n421), .Z(n420) );
  CND2IX1 U1240 ( .B(n645), .A(n648), .Z(n421) );
  CND2IX1 U1241 ( .B(n761), .A(n650), .Z(n422) );
  CNIVX2 U1242 ( .A(acc[9]), .Z(n1997) );
  CND2X2 U1243 ( .A(n423), .B(n435), .Z(n689) );
  CND2X2 U1244 ( .A(n433), .B(n434), .Z(n423) );
  CENXL U1245 ( .A(n398), .B(n2059), .Z(n2060) );
  CIVX2 U1246 ( .A(n425), .Z(n424) );
  CND2XL U1247 ( .A(n2128), .B(n425), .Z(n1876) );
  CENX2 U1248 ( .A(n493), .B(n491), .Z(n425) );
  CND2X2 U1249 ( .A(acc[2]), .B(freq[2]), .Z(n725) );
  CNR2X2 U1250 ( .A(acc[3]), .B(freq[3]), .Z(n444) );
  COND1X2 U1251 ( .A(n725), .B(n444), .C(n555), .Z(n510) );
  CND2X1 U1252 ( .A(freq[3]), .B(acc[3]), .Z(n555) );
  COND1XL U1253 ( .A(n1541), .B(n551), .C(n1551), .Z(n354) );
  CNIVXL U1254 ( .A(n503), .Z(n428) );
  CNR2XL U1255 ( .A(n392), .B(n493), .Z(n1877) );
  CENX1 U1256 ( .A(n716), .B(n569), .Z(n1872) );
  CIVXL U1257 ( .A(n723), .Z(n724) );
  CNR2X1 U1258 ( .A(freq[7]), .B(acc[7]), .Z(n429) );
  CNR2X1 U1259 ( .A(freq[7]), .B(acc[7]), .Z(n702) );
  CENXL U1260 ( .A(n430), .B(n468), .Z(n2118) );
  CAN2XL U1261 ( .A(n2117), .B(n2121), .Z(n430) );
  CANR1XL U1262 ( .A(n490), .B(n695), .C(n519), .Z(n431) );
  CNR2X1 U1263 ( .A(freq[15]), .B(acc[15]), .Z(n432) );
  CNR2X1 U1264 ( .A(freq[15]), .B(acc[15]), .Z(n683) );
  CANR1X1 U1265 ( .A(n490), .B(n695), .C(n519), .Z(n560) );
  CENX1 U1266 ( .A(n499), .B(n824), .Z(n498) );
  COND1X1 U1267 ( .A(n2124), .B(n2121), .C(n2125), .Z(n1545) );
  CND2XL U1268 ( .A(n696), .B(n490), .Z(n694) );
  COND1X1 U1269 ( .A(n521), .B(n791), .C(n520), .Z(n519) );
  CND2X1 U1270 ( .A(n472), .B(n688), .Z(n435) );
  CIVX2 U1271 ( .A(n472), .Z(n433) );
  CND2X1 U1272 ( .A(n504), .B(n593), .Z(n436) );
  CIVX2 U1273 ( .A(n594), .Z(n437) );
  CNR2IX2 U1274 ( .B(n696), .A(n438), .Z(n593) );
  CND2X1 U1275 ( .A(n490), .B(n437), .Z(n438) );
  CNIVX1 U1276 ( .A(acc[8]), .Z(n439) );
  CNR2X2 U1277 ( .A(freq[8]), .B(acc[8]), .Z(n788) );
  CNR2X1 U1278 ( .A(n723), .B(n444), .Z(n440) );
  CNR2XL U1279 ( .A(n444), .B(n723), .Z(n511) );
  CND3X1 U1280 ( .A(n642), .B(n559), .C(n558), .Z(n664) );
  CENX1 U1281 ( .A(n624), .B(n626), .Z(n642) );
  COND1X1 U1282 ( .A(n594), .B(n560), .C(n592), .Z(n591) );
  CANR1X1 U1283 ( .A(n687), .B(n686), .C(n685), .Z(n592) );
  CND2X1 U1284 ( .A(n798), .B(n404), .Z(n2033) );
  COND2XL U1285 ( .A(n391), .B(n604), .C(n798), .D(n525), .Z(n524) );
  CNR2X1 U1286 ( .A(n604), .B(n525), .Z(n528) );
  CENX2 U1287 ( .A(n1648), .B(n1997), .Z(n798) );
  CND2X1 U1288 ( .A(freq[9]), .B(acc[9]), .Z(n562) );
  CNIVX2 U1289 ( .A(freq[9]), .Z(n1648) );
  CND3X2 U1290 ( .A(n732), .B(n731), .C(n730), .Z(n733) );
  CIVXL U1291 ( .A(n731), .Z(n441) );
  COND1X1 U1292 ( .A(n480), .B(n728), .C(n729), .Z(n442) );
  COND1X1 U1293 ( .A(n480), .B(n728), .C(n729), .Z(n719) );
  CANR1X2 U1294 ( .A(n440), .B(n719), .C(n510), .Z(n463) );
  CANR1X1 U1295 ( .A(n511), .B(n719), .C(n510), .Z(n462) );
  CND2X2 U1296 ( .A(n488), .B(n548), .Z(n483) );
  COND1XL U1297 ( .A(n512), .B(n462), .C(n508), .Z(n445) );
  COND1XL U1298 ( .A(n512), .B(n462), .C(n508), .Z(n446) );
  COND1X1 U1299 ( .A(n512), .B(n462), .C(n508), .Z(n504) );
  CNR2X2 U1300 ( .A(n549), .B(n784), .Z(n447) );
  CNR2X1 U1301 ( .A(n549), .B(n784), .Z(n488) );
  CNIVX1 U1302 ( .A(n469), .Z(n448) );
  CIVXL U1303 ( .A(n811), .Z(n449) );
  CND2X1 U1304 ( .A(n469), .B(n809), .Z(n2055) );
  CND2X1 U1305 ( .A(n469), .B(n822), .Z(n2105) );
  CND2X2 U1306 ( .A(n469), .B(n820), .Z(n2090) );
  CIVX2 U1307 ( .A(n459), .Z(n469) );
  CNR2IX2 U1308 ( .B(n450), .A(n2097), .Z(n2079) );
  CND2X2 U1309 ( .A(n459), .B(n573), .Z(n450) );
  CIVX2 U1310 ( .A(n451), .Z(n2110) );
  COND1X1 U1311 ( .A(n486), .B(n2042), .C(n485), .Z(n451) );
  COND1X1 U1312 ( .A(n453), .B(n2110), .C(n452), .Z(n2083) );
  CIVXL U1313 ( .A(n2080), .Z(n452) );
  CIVX1 U1314 ( .A(n2079), .Z(n453) );
  CND2X2 U1315 ( .A(n575), .B(n454), .Z(n549) );
  CND2X2 U1316 ( .A(n460), .B(n577), .Z(n454) );
  CND2X2 U1317 ( .A(n460), .B(n779), .Z(n515) );
  CIVX2 U1318 ( .A(n596), .Z(n595) );
  CND2X2 U1319 ( .A(n598), .B(n742), .Z(n597) );
  CIVX2 U1320 ( .A(n455), .Z(n457) );
  CND2XL U1321 ( .A(n460), .B(n572), .Z(n458) );
  CND2XL U1322 ( .A(n860), .B(n2128), .Z(n862) );
  CENXL U1323 ( .A(n858), .B(n859), .Z(n860) );
  CND2XL U1324 ( .A(n894), .B(n2128), .Z(n896) );
  CENXL U1325 ( .A(n892), .B(n893), .Z(n894) );
  CND2XL U1326 ( .A(n872), .B(n2128), .Z(n874) );
  CENXL U1327 ( .A(n870), .B(n871), .Z(n872) );
  CND2XL U1328 ( .A(n882), .B(n2128), .Z(n885) );
  CENXL U1329 ( .A(n880), .B(n881), .Z(n882) );
  COND1X1 U1330 ( .A(n2097), .B(n2110), .C(n2096), .Z(n607) );
  CEOX2 U1331 ( .A(n727), .B(n726), .Z(n1880) );
  CND2X2 U1332 ( .A(n597), .B(n595), .Z(n459) );
  CND2X2 U1333 ( .A(n597), .B(n595), .Z(n1504) );
  CENX1 U1334 ( .A(n2098), .B(n607), .Z(n606) );
  CAOR1XL U1335 ( .A(n514), .B(n1994), .C(n808), .Z(n461) );
  CND2XL U1336 ( .A(n2056), .B(n2058), .Z(n2044) );
  CNR2X2 U1337 ( .A(n2123), .B(n2124), .Z(n1544) );
  CND2X2 U1338 ( .A(n507), .B(n834), .Z(n1548) );
  CIVXL U1339 ( .A(n2087), .Z(n466) );
  CNR2IX2 U1340 ( .B(n447), .A(n2108), .Z(n487) );
  COND1X1 U1341 ( .A(freq[22]), .B(n782), .C(acc[22]), .Z(n530) );
  CND2X1 U1342 ( .A(n782), .B(freq[22]), .Z(n529) );
  CENX1 U1343 ( .A(n531), .B(n782), .Z(n820) );
  COND1X1 U1344 ( .A(freq[23]), .B(n783), .C(acc[23]), .Z(n589) );
  CENX1 U1345 ( .A(n590), .B(n783), .Z(n822) );
  CANR1X1 U1346 ( .A(n2065), .B(n461), .C(n2064), .Z(n2066) );
  CAN2X2 U1347 ( .A(n578), .B(n580), .Z(n2065) );
  CND2IX2 U1348 ( .B(n400), .A(n2065), .Z(n486) );
  CENX1 U1349 ( .A(n705), .B(n794), .Z(n489) );
  CENXL U1350 ( .A(n461), .B(n2044), .Z(n2045) );
  CNIVXL U1351 ( .A(n794), .Z(n545) );
  CANR1X2 U1352 ( .A(n487), .B(n553), .C(n481), .Z(n468) );
  CND3X2 U1353 ( .A(n447), .B(n2080), .C(n819), .Z(n484) );
  CNR2X2 U1354 ( .A(n678), .B(n683), .Z(n687) );
  CANR1X2 U1355 ( .A(n487), .B(n553), .C(n481), .Z(n2122) );
  CND3X1 U1356 ( .A(n526), .B(n527), .C(n524), .Z(n603) );
  CNR2X2 U1357 ( .A(n757), .B(n756), .Z(n775) );
  COND1X2 U1358 ( .A(n2010), .B(n2013), .C(n2012), .Z(n808) );
  CIVXL U1359 ( .A(n445), .Z(n567) );
  CND2IX1 U1360 ( .B(n446), .A(n528), .Z(n527) );
  CND2X2 U1361 ( .A(freq[6]), .B(acc[6]), .Z(n707) );
  CNR2X2 U1362 ( .A(acc[6]), .B(freq[6]), .Z(n706) );
  CND2X2 U1363 ( .A(n436), .B(n471), .Z(n472) );
  CIVXL U1364 ( .A(n580), .Z(n2043) );
  COND1X2 U1365 ( .A(freq[20]), .B(n476), .C(acc[20]), .Z(n474) );
  CENX1 U1366 ( .A(n476), .B(n475), .Z(n818) );
  CENXL U1367 ( .A(freq[20]), .B(acc[20]), .Z(n475) );
  CND2X2 U1368 ( .A(n587), .B(n586), .Z(n476) );
  CND3X2 U1369 ( .A(n483), .B(n482), .C(n484), .Z(n481) );
  CNIVXL U1370 ( .A(n2101), .Z(n477) );
  CIVX1 U1371 ( .A(n2063), .Z(n812) );
  CNIVX1 U1372 ( .A(acc[10]), .Z(n478) );
  CIVX2 U1373 ( .A(n571), .Z(n2013) );
  CND2X2 U1374 ( .A(freq[0]), .B(acc[0]), .Z(n480) );
  CND2X1 U1375 ( .A(n459), .B(n576), .Z(n575) );
  CND2X2 U1376 ( .A(n2056), .B(n2055), .Z(n2064) );
  CIVXL U1377 ( .A(n479), .Z(n561) );
  CIVX1 U1378 ( .A(n480), .Z(n493) );
  CIVXL U1379 ( .A(n784), .Z(n2106) );
  CIVXL U1380 ( .A(n549), .Z(n2103) );
  CNR2IX2 U1381 ( .B(n2105), .A(n2101), .Z(n482) );
  COND1X2 U1382 ( .A(n486), .B(n2042), .C(n485), .Z(n553) );
  CNR2X2 U1383 ( .A(n2064), .B(n812), .Z(n485) );
  CANR1X2 U1384 ( .A(n514), .B(n1994), .C(n808), .Z(n2042) );
  CNR2X2 U1385 ( .A(n489), .B(n1888), .Z(n735) );
  CND2XL U1386 ( .A(n489), .B(n2128), .Z(n1884) );
  CNR2X1 U1387 ( .A(n522), .B(n791), .Z(n490) );
  CND2X2 U1388 ( .A(n492), .B(n729), .Z(n491) );
  CND2X2 U1389 ( .A(acc[1]), .B(freq[1]), .Z(n729) );
  CIVX1 U1390 ( .A(n728), .Z(n492) );
  CND3X2 U1391 ( .A(n497), .B(n495), .C(n494), .Z(n596) );
  CNR2X2 U1392 ( .A(n496), .B(n751), .Z(n495) );
  CIVX2 U1393 ( .A(n775), .Z(n496) );
  CND2X2 U1394 ( .A(n498), .B(n774), .Z(n497) );
  CND2X2 U1395 ( .A(n556), .B(n765), .Z(n499) );
  CIVXL U1396 ( .A(acc[30]), .Z(n500) );
  CNR2X2 U1397 ( .A(n501), .B(n1880), .Z(n730) );
  CIVXL U1398 ( .A(n1877), .Z(n502) );
  CANR1X2 U1399 ( .A(n613), .B(n503), .C(n611), .Z(n794) );
  CENX1 U1400 ( .A(n386), .B(n503), .Z(n732) );
  CIVX2 U1401 ( .A(n463), .Z(n503) );
  CND3XL U1402 ( .A(n404), .B(n604), .C(n445), .Z(n526) );
  CND2X2 U1403 ( .A(n507), .B(n807), .Z(n2012) );
  CNR2X2 U1404 ( .A(n507), .B(n822), .Z(n784) );
  CND2X2 U1405 ( .A(n507), .B(n796), .Z(n1986) );
  CND2X1 U1406 ( .A(n507), .B(n810), .Z(n2056) );
  CND2XL U1407 ( .A(n507), .B(n811), .Z(n2063) );
  CND2X1 U1408 ( .A(n507), .B(n821), .Z(n2112) );
  CIVX4 U1409 ( .A(n1504), .Z(n507) );
  CANR1X2 U1410 ( .A(n513), .B(n709), .C(n509), .Z(n508) );
  COND1X2 U1411 ( .A(n717), .B(n712), .C(n713), .Z(n709) );
  CNR2X2 U1412 ( .A(n706), .B(n429), .Z(n513) );
  CNR2X2 U1413 ( .A(n715), .B(n712), .Z(n710) );
  CND2X2 U1414 ( .A(n2079), .B(n819), .Z(n2108) );
  CND2XL U1415 ( .A(n2074), .B(n515), .Z(n2075) );
  CIVX1 U1416 ( .A(n516), .Z(n525) );
  COND1X2 U1417 ( .A(n516), .B(n789), .C(n562), .Z(n695) );
  CND2X2 U1418 ( .A(freq[8]), .B(acc[8]), .Z(n516) );
  COND1X1 U1419 ( .A(n891), .B(n2122), .C(n890), .Z(n892) );
  CNR2X2 U1420 ( .A(acc[9]), .B(freq[9]), .Z(n789) );
  CIVXL U1421 ( .A(n1548), .Z(n877) );
  CND2X1 U1422 ( .A(freq[11]), .B(acc[11]), .Z(n520) );
  CNR2X2 U1423 ( .A(acc[10]), .B(freq[10]), .Z(n522) );
  CNR2X2 U1424 ( .A(freq[11]), .B(acc[11]), .Z(n791) );
  CND2X1 U1425 ( .A(n560), .B(n694), .Z(n600) );
  CND2IX1 U1426 ( .B(n696), .A(n698), .Z(n699) );
  CIVX2 U1427 ( .A(n697), .Z(n696) );
  CND2X2 U1428 ( .A(n404), .B(n523), .Z(n697) );
  CIVX2 U1429 ( .A(n789), .Z(n523) );
  CENX1 U1430 ( .A(n772), .B(n826), .Z(n773) );
  CND2X2 U1431 ( .A(n530), .B(n529), .Z(n783) );
  CENXL U1432 ( .A(freq[22]), .B(acc[22]), .Z(n531) );
  CNIVX1 U1433 ( .A(acc[19]), .Z(n532) );
  CENX1 U1434 ( .A(freq[24]), .B(acc[24]), .Z(n536) );
  CND2X2 U1435 ( .A(n564), .B(n563), .Z(n539) );
  CENX1 U1436 ( .A(acc[16]), .B(freq[16]), .Z(n540) );
  CND2X2 U1437 ( .A(n542), .B(n541), .Z(n786) );
  CENXL U1438 ( .A(n543), .B(n785), .Z(n810) );
  COND1X1 U1439 ( .A(n402), .B(n463), .C(n585), .Z(n584) );
  CND2X1 U1440 ( .A(n460), .B(n572), .Z(n571) );
  CNIVX1 U1441 ( .A(freq[10]), .Z(n544) );
  CND2XL U1442 ( .A(n546), .B(n2128), .Z(n2078) );
  CENXL U1443 ( .A(n2076), .B(n2075), .Z(n546) );
  CND2IXL U1444 ( .B(n2094), .A(n2095), .Z(n358) );
  CND2XL U1445 ( .A(n547), .B(n2128), .Z(n2116) );
  CENXL U1446 ( .A(n2114), .B(n2113), .Z(n547) );
  CND2X2 U1447 ( .A(n2112), .B(n2090), .Z(n2101) );
  CND2X2 U1448 ( .A(n814), .B(n813), .Z(n2096) );
  CENXL U1449 ( .A(n552), .B(n1550), .Z(n551) );
  COND1X1 U1450 ( .A(n1547), .B(n468), .C(n1546), .Z(n552) );
  CND2IX1 U1451 ( .B(n554), .A(n720), .Z(n721) );
  CIVXL U1452 ( .A(n555), .Z(n554) );
  CANR1X2 U1453 ( .A(n633), .B(n760), .C(n759), .Z(n556) );
  COND1X2 U1454 ( .A(n632), .B(n763), .C(n557), .Z(n760) );
  CANR1X2 U1455 ( .A(n654), .B(n631), .C(n630), .Z(n557) );
  CNR2X2 U1456 ( .A(freq[23]), .B(acc[23]), .Z(n629) );
  CNR2X2 U1457 ( .A(freq[22]), .B(acc[22]), .Z(n655) );
  CNR2X2 U1458 ( .A(freq[1]), .B(acc[1]), .Z(n728) );
  CNR2X2 U1459 ( .A(freq[2]), .B(acc[2]), .Z(n723) );
  CND2IX1 U1460 ( .B(n561), .A(n399), .Z(n2098) );
  CND2IXL U1461 ( .B(n400), .A(n2063), .Z(n2067) );
  COND1X2 U1462 ( .A(n1639), .B(n786), .C(n778), .Z(n564) );
  CENX1 U1463 ( .A(n778), .B(n1639), .Z(n565) );
  CIVX2 U1464 ( .A(n442), .Z(n726) );
  CND2X1 U1465 ( .A(n566), .B(n725), .Z(n722) );
  CND2IX1 U1466 ( .B(n723), .A(n442), .Z(n566) );
  COND1X1 U1467 ( .A(n570), .B(n463), .C(n717), .Z(n569) );
  CIVXL U1468 ( .A(n796), .Z(n574) );
  CND2XL U1469 ( .A(n459), .B(n579), .Z(n578) );
  CND2XL U1470 ( .A(n459), .B(n581), .Z(n580) );
  CND2XL U1471 ( .A(n460), .B(n583), .Z(n582) );
  CIVXL U1472 ( .A(n834), .Z(n583) );
  CIVX2 U1473 ( .A(n709), .Z(n585) );
  CIVX2 U1474 ( .A(freq[19]), .Z(n586) );
  CIVX2 U1475 ( .A(acc[19]), .Z(n587) );
  CND2X1 U1476 ( .A(n783), .B(freq[23]), .Z(n588) );
  CENXL U1477 ( .A(freq[23]), .B(acc[23]), .Z(n590) );
  CND2X2 U1478 ( .A(n681), .B(n687), .Z(n594) );
  COND1X2 U1479 ( .A(n609), .B(n608), .C(n741), .Z(n598) );
  CND3X2 U1480 ( .A(n603), .B(n602), .C(n599), .Z(n701) );
  CNR2X2 U1481 ( .A(n700), .B(n693), .Z(n602) );
  CIVX2 U1482 ( .A(n798), .Z(n604) );
  CANR1X2 U1483 ( .A(n736), .B(n737), .C(n701), .Z(n608) );
  CND2X2 U1484 ( .A(n612), .B(n707), .Z(n611) );
  CND2IX1 U1485 ( .B(n706), .A(n709), .Z(n612) );
  CND2XL U1486 ( .A(n2116), .B(n2115), .Z(n359) );
  CND2XL U1487 ( .A(n2086), .B(n2085), .Z(n361) );
  CND2XL U1488 ( .A(n2078), .B(n2077), .Z(n360) );
  CND2XL U1489 ( .A(n2103), .B(n2100), .Z(n2104) );
  CND2XL U1490 ( .A(n2100), .B(n454), .Z(n2089) );
  CEOXL U1491 ( .A(n2050), .B(n2110), .Z(n2051) );
  CND2XL U1492 ( .A(n1872), .B(n2128), .Z(n1874) );
  CNR2X2 U1493 ( .A(n733), .B(n1872), .Z(n734) );
  CND2XL U1494 ( .A(n2093), .B(n2128), .Z(n2095) );
  CND2XL U1495 ( .A(n2084), .B(n2128), .Z(n2086) );
  CENXL U1496 ( .A(n2092), .B(n2091), .Z(n2093) );
  CENXL U1497 ( .A(n2083), .B(n2082), .Z(n2084) );
  CND2XL U1498 ( .A(n2120), .B(n2119), .Z(n356) );
  CND2XL U1499 ( .A(n2070), .B(n2069), .Z(n364) );
  CANR1XL U1500 ( .A(n839), .B(n1545), .C(n396), .Z(n840) );
  CIVXL U1501 ( .A(acc[27]), .Z(n744) );
  CIVXL U1502 ( .A(acc[29]), .Z(n743) );
  CIVXL U1503 ( .A(n746), .Z(n747) );
  CND2XL U1504 ( .A(n1629), .B(freq[26]), .Z(n614) );
  COND1XL U1505 ( .A(n1629), .B(n615), .C(n614), .Z(n1939) );
  CND2X1 U1506 ( .A(freq[18]), .B(n456), .Z(n651) );
  CNR2X1 U1507 ( .A(freq[19]), .B(acc[19]), .Z(n762) );
  CND2X1 U1508 ( .A(freq[19]), .B(acc[19]), .Z(n617) );
  COND1X1 U1509 ( .A(n651), .B(n762), .C(n617), .Z(n618) );
  CNR2X1 U1510 ( .A(freq[20]), .B(acc[20]), .Z(n621) );
  CIVXL U1511 ( .A(n621), .Z(n619) );
  CND2X1 U1512 ( .A(freq[20]), .B(acc[20]), .Z(n635) );
  CND2XL U1513 ( .A(n619), .B(n635), .Z(n620) );
  CENXL U1514 ( .A(n618), .B(n620), .Z(n643) );
  CNR2X2 U1515 ( .A(freq[21]), .B(acc[21]), .Z(n637) );
  CNR2X1 U1516 ( .A(n621), .B(n637), .Z(n627) );
  CIVXL U1517 ( .A(n627), .Z(n622) );
  CNR2X1 U1518 ( .A(n622), .B(n655), .Z(n623) );
  CIVXL U1519 ( .A(n629), .Z(n625) );
  CND2X1 U1520 ( .A(freq[23]), .B(acc[23]), .Z(n628) );
  CND2XL U1521 ( .A(n625), .B(n628), .Z(n626) );
  CND2X1 U1522 ( .A(freq[21]), .B(acc[21]), .Z(n638) );
  COND1X1 U1523 ( .A(n635), .B(n637), .C(n638), .Z(n654) );
  CND2X1 U1524 ( .A(freq[22]), .B(acc[22]), .Z(n656) );
  COND1X1 U1525 ( .A(n656), .B(n629), .C(n628), .Z(n630) );
  CND2X1 U1526 ( .A(freq[24]), .B(acc[24]), .Z(n758) );
  CND2X1 U1527 ( .A(n633), .B(n758), .Z(n634) );
  CIVXL U1528 ( .A(n635), .Z(n636) );
  CIVXL U1529 ( .A(n637), .Z(n639) );
  CND2XL U1530 ( .A(n639), .B(n638), .Z(n640) );
  CNR2X1 U1531 ( .A(freq[18]), .B(n456), .Z(n761) );
  CND2X1 U1532 ( .A(freq[16]), .B(acc[16]), .Z(n738) );
  CNR2X1 U1533 ( .A(freq[17]), .B(acc[17]), .Z(n646) );
  CND2XL U1534 ( .A(freq[17]), .B(acc[17]), .Z(n644) );
  COND1X1 U1535 ( .A(n738), .B(n646), .C(n644), .Z(n650) );
  CIVXL U1536 ( .A(n651), .Z(n645) );
  CNIVX1 U1537 ( .A(freq[19]), .Z(n1610) );
  CENX1 U1538 ( .A(n1610), .B(n532), .Z(n816) );
  CENX1 U1539 ( .A(n649), .B(n816), .Z(n740) );
  CND2XL U1540 ( .A(n652), .B(n651), .Z(n653) );
  CIVXL U1541 ( .A(n655), .Z(n657) );
  CND2XL U1542 ( .A(n657), .B(n656), .Z(n658) );
  CENXL U1543 ( .A(n654), .B(n658), .Z(n661) );
  CNR2X1 U1544 ( .A(freq[25]), .B(n465), .Z(n746) );
  CND2X1 U1545 ( .A(freq[25]), .B(n465), .Z(n659) );
  COND1X1 U1546 ( .A(n758), .B(n746), .C(n659), .Z(n766) );
  CNR2X2 U1547 ( .A(freq[26]), .B(acc[26]), .Z(n769) );
  CND2X1 U1548 ( .A(freq[26]), .B(acc[26]), .Z(n767) );
  CND2X1 U1549 ( .A(n403), .B(n767), .Z(n660) );
  CENX1 U1550 ( .A(n766), .B(n660), .Z(n774) );
  COND3X1 U1551 ( .A(n740), .B(n662), .C(n661), .D(n774), .Z(n663) );
  CND2X1 U1552 ( .A(freq[15]), .B(acc[15]), .Z(n682) );
  CIVXL U1553 ( .A(n432), .Z(n665) );
  CND2X1 U1554 ( .A(n682), .B(n665), .Z(n667) );
  CND2X1 U1555 ( .A(freq[14]), .B(acc[14]), .Z(n684) );
  CIVXL U1556 ( .A(n684), .Z(n666) );
  CENX1 U1557 ( .A(n667), .B(n666), .Z(n672) );
  CNR2X2 U1558 ( .A(freq[13]), .B(acc[13]), .Z(n679) );
  CIVXL U1559 ( .A(n679), .Z(n668) );
  CND2X1 U1560 ( .A(freq[13]), .B(acc[13]), .Z(n674) );
  CND2XL U1561 ( .A(n668), .B(n674), .Z(n670) );
  CNR2X1 U1562 ( .A(freq[12]), .B(acc[12]), .Z(n680) );
  CENX1 U1563 ( .A(n670), .B(n669), .Z(n671) );
  CNR2X1 U1564 ( .A(freq[14]), .B(acc[14]), .Z(n678) );
  CIVXL U1565 ( .A(n678), .Z(n673) );
  CND2XL U1566 ( .A(n684), .B(n673), .Z(n677) );
  COND1X1 U1567 ( .A(n675), .B(n679), .C(n674), .Z(n686) );
  CENX1 U1568 ( .A(n677), .B(n676), .Z(n690) );
  CND2X1 U1569 ( .A(n739), .B(n738), .Z(n688) );
  CNR2X2 U1570 ( .A(n680), .B(n679), .Z(n681) );
  CNR2X2 U1571 ( .A(freq[5]), .B(acc[5]), .Z(n712) );
  CND2X2 U1572 ( .A(freq[4]), .B(acc[4]), .Z(n717) );
  CND2X1 U1573 ( .A(freq[5]), .B(acc[5]), .Z(n713) );
  CND2X1 U1574 ( .A(freq[7]), .B(acc[7]), .Z(n703) );
  COND1X1 U1575 ( .A(n684), .B(n432), .C(n682), .Z(n685) );
  CIVXL U1576 ( .A(n695), .Z(n691) );
  CND2X1 U1577 ( .A(n691), .B(n697), .Z(n692) );
  CENX1 U1578 ( .A(n544), .B(n478), .Z(n799) );
  CENX1 U1579 ( .A(n692), .B(n799), .Z(n693) );
  CENX1 U1580 ( .A(freq[12]), .B(acc[12]), .Z(n805) );
  CNR2X1 U1581 ( .A(n478), .B(n695), .Z(n698) );
  CNIVXL U1582 ( .A(freq[11]), .Z(n1657) );
  CNIVXL U1583 ( .A(acc[11]), .Z(n2030) );
  CENX1 U1584 ( .A(n1657), .B(n2030), .Z(n803) );
  CENX1 U1585 ( .A(n699), .B(n803), .Z(n700) );
  CIVXL U1586 ( .A(n429), .Z(n704) );
  CIVXL U1587 ( .A(n706), .Z(n708) );
  CND2XL U1588 ( .A(n708), .B(n707), .Z(n711) );
  CIVXL U1589 ( .A(n712), .Z(n714) );
  CND2XL U1590 ( .A(n714), .B(n713), .Z(n716) );
  CIVX2 U1591 ( .A(n715), .Z(n718) );
  CIVXL U1592 ( .A(n444), .Z(n720) );
  CENX1 U1593 ( .A(n722), .B(n721), .Z(n1885) );
  CIVX2 U1594 ( .A(n1885), .Z(n731) );
  CND2X1 U1595 ( .A(n725), .B(n724), .Z(n727) );
  CND2X2 U1596 ( .A(n735), .B(n734), .Z(n737) );
  CNIVX1 U1597 ( .A(freq[8]), .Z(n1634) );
  CENX1 U1598 ( .A(n1634), .B(n439), .Z(n796) );
  CENX1 U1599 ( .A(freq[17]), .B(acc[17]), .Z(n813) );
  CENX1 U1600 ( .A(n443), .B(freq[31]), .Z(n842) );
  CND2X1 U1601 ( .A(n744), .B(n767), .Z(n745) );
  CND2X1 U1602 ( .A(n747), .B(n403), .Z(n771) );
  CENX1 U1603 ( .A(n842), .B(n748), .Z(n751) );
  CND2X1 U1604 ( .A(n385), .B(n771), .Z(n749) );
  CENX1 U1605 ( .A(freq[30]), .B(acc[30]), .Z(n837) );
  CENX1 U1606 ( .A(n749), .B(n837), .Z(n750) );
  CND2X1 U1607 ( .A(n388), .B(n771), .Z(n753) );
  CENX1 U1608 ( .A(freq[29]), .B(acc[29]), .Z(n831) );
  CENX1 U1609 ( .A(n753), .B(n831), .Z(n757) );
  CND2X1 U1610 ( .A(n754), .B(n771), .Z(n755) );
  CENX1 U1611 ( .A(freq[28]), .B(acc[28]), .Z(n829) );
  CENX1 U1612 ( .A(n755), .B(n829), .Z(n756) );
  CIVXL U1613 ( .A(n758), .Z(n759) );
  CENX1 U1614 ( .A(freq[25]), .B(n465), .Z(n824) );
  CND2X1 U1615 ( .A(n770), .B(n771), .Z(n772) );
  CNIVX1 U1616 ( .A(acc[27]), .Z(n883) );
  CENX1 U1617 ( .A(freq[27]), .B(n883), .Z(n826) );
  CNR2X1 U1618 ( .A(n823), .B(n448), .Z(n2123) );
  COR2X1 U1619 ( .A(freq[25]), .B(n465), .Z(n776) );
  CFA1X1 U1620 ( .A(freq[26]), .B(n776), .CI(n470), .CO(n827), .S(n834) );
  COR2X1 U1621 ( .A(n827), .B(n826), .Z(n876) );
  CNR2X1 U1622 ( .A(n829), .B(n828), .Z(n863) );
  COR2XL U1623 ( .A(freq[28]), .B(acc[28]), .Z(n830) );
  CNR2XL U1624 ( .A(n831), .B(n830), .Z(n850) );
  CNR2XL U1625 ( .A(n863), .B(n850), .Z(n833) );
  CND2XL U1626 ( .A(n876), .B(n833), .Z(n777) );
  CNR2X1 U1627 ( .A(n853), .B(n777), .Z(n889) );
  COR2XL U1628 ( .A(freq[29]), .B(acc[29]), .Z(n836) );
  COR2X1 U1629 ( .A(n837), .B(n836), .Z(n887) );
  CAN2X1 U1630 ( .A(n889), .B(n887), .Z(n839) );
  CND2XL U1631 ( .A(n1544), .B(n839), .Z(n841) );
  COR2X1 U1632 ( .A(freq[17]), .B(acc[17]), .Z(n780) );
  COR2X1 U1633 ( .A(freq[12]), .B(acc[12]), .Z(n787) );
  CNIVXL U1634 ( .A(acc[13]), .Z(n2019) );
  CNR2X1 U1635 ( .A(n814), .B(n813), .Z(n2097) );
  CIVX1 U1636 ( .A(n818), .Z(n779) );
  CFA1X1 U1637 ( .A(freq[18]), .B(n780), .CI(n457), .CO(n817), .S(n815) );
  CFA1X1 U1638 ( .A(freq[21]), .B(n781), .CI(acc[21]), .CO(n782), .S(n821) );
  CFA1X1 U1639 ( .A(n1676), .B(n787), .CI(n2019), .CO(n785), .S(n807) );
  CNR2X1 U1640 ( .A(n798), .B(n404), .Z(n2035) );
  CIVX1 U1641 ( .A(n2035), .Z(n1993) );
  CND2X1 U1642 ( .A(n1993), .B(n790), .Z(n2023) );
  COR2X1 U1643 ( .A(n544), .B(n478), .Z(n802) );
  CNR2X1 U1644 ( .A(n803), .B(n802), .Z(n2024) );
  CNR2X1 U1645 ( .A(n2023), .B(n2024), .Z(n2000) );
  CIVXL U1646 ( .A(n791), .Z(n804) );
  CND2X1 U1647 ( .A(n2000), .B(n792), .Z(n2011) );
  CNIVX1 U1648 ( .A(acc[7]), .Z(n793) );
  CIVX1 U1649 ( .A(n545), .Z(n795) );
  CFA1X1 U1650 ( .A(n793), .B(n795), .CI(n1589), .CO(n1988) );
  COND1X2 U1651 ( .A(n797), .B(n467), .C(n1986), .Z(n1994) );
  CIVXL U1652 ( .A(n2033), .Z(n801) );
  CND2X1 U1653 ( .A(n799), .B(n523), .Z(n2036) );
  CIVXL U1654 ( .A(n2036), .Z(n800) );
  CANR1XL U1655 ( .A(n801), .B(n790), .C(n800), .Z(n2022) );
  CND2XL U1656 ( .A(n803), .B(n802), .Z(n2025) );
  COND1XL U1657 ( .A(n2024), .B(n2022), .C(n2025), .Z(n2001) );
  CIVXL U1658 ( .A(n2004), .Z(n806) );
  CANR1XL U1659 ( .A(n792), .B(n2001), .C(n806), .Z(n2010) );
  CND2XL U1660 ( .A(n817), .B(n816), .Z(n2081) );
  CND2X1 U1661 ( .A(n823), .B(n448), .Z(n2121) );
  CND2X1 U1662 ( .A(n825), .B(n824), .Z(n2125) );
  CND2XL U1663 ( .A(n831), .B(n830), .Z(n851) );
  COND1XL U1664 ( .A(n864), .B(n850), .C(n851), .Z(n832) );
  CANR1XL U1665 ( .A(n393), .B(n833), .C(n832), .Z(n835) );
  CND2X1 U1666 ( .A(n835), .B(n1548), .Z(n888) );
  COND1X1 U1667 ( .A(n841), .B(n468), .C(n840), .Z(n847) );
  COR2XL U1668 ( .A(freq[30]), .B(acc[30]), .Z(n843) );
  COR2XL U1669 ( .A(n843), .B(n842), .Z(n845) );
  CND2XL U1670 ( .A(n843), .B(n842), .Z(n844) );
  CENXL U1671 ( .A(n847), .B(n846), .Z(n848) );
  CND2IXL U1672 ( .B(n1541), .A(n848), .Z(n849) );
  CND2IXL U1673 ( .B(n616), .A(n849), .Z(n349) );
  CIVXL U1674 ( .A(n850), .Z(n852) );
  CND2XL U1675 ( .A(n852), .B(n851), .Z(n859) );
  CIVX2 U1676 ( .A(n853), .Z(n1549) );
  CND2X1 U1677 ( .A(n1549), .B(n876), .Z(n866) );
  CNR2X1 U1678 ( .A(n866), .B(n863), .Z(n855) );
  CND2XL U1679 ( .A(n1544), .B(n855), .Z(n857) );
  CANR1XL U1680 ( .A(n855), .B(n1545), .C(n854), .Z(n856) );
  COND1X1 U1681 ( .A(n857), .B(n2122), .C(n856), .Z(n858) );
  CANR2XL U1682 ( .A(n2129), .B(acc[29]), .C(sync3_d), .D(phase[29]), .Z(n861)
         );
  CND2XL U1683 ( .A(n862), .B(n861), .Z(n351) );
  CIVXL U1684 ( .A(n863), .Z(n865) );
  CND2XL U1685 ( .A(n865), .B(n864), .Z(n871) );
  CND2XL U1686 ( .A(n1544), .B(n867), .Z(n869) );
  CANR1XL U1687 ( .A(n867), .B(n1545), .C(n518), .Z(n868) );
  COND1X1 U1688 ( .A(n869), .B(n2122), .C(n868), .Z(n870) );
  CANR2XL U1689 ( .A(n2129), .B(acc[28]), .C(sync3_d), .D(phase[28]), .Z(n873)
         );
  CND2XL U1690 ( .A(n874), .B(n873), .Z(n352) );
  CND2XL U1691 ( .A(n1544), .B(n1549), .Z(n879) );
  CANR1XL U1692 ( .A(n1549), .B(n1545), .C(n877), .Z(n878) );
  COND1X1 U1693 ( .A(n879), .B(n2122), .C(n878), .Z(n880) );
  CANR2XL U1694 ( .A(n2129), .B(n883), .C(sync3_d), .D(phase[27]), .Z(n884) );
  CND2XL U1695 ( .A(n885), .B(n884), .Z(n353) );
  CND2X1 U1696 ( .A(n887), .B(n886), .Z(n893) );
  CND2XL U1697 ( .A(n1544), .B(n889), .Z(n891) );
  CANR1XL U1698 ( .A(n889), .B(n1545), .C(n888), .Z(n890) );
  CANR2XL U1699 ( .A(n2129), .B(acc[30]), .C(sync3_d), .D(phase[30]), .Z(n895)
         );
  CND2XL U1700 ( .A(n896), .B(n895), .Z(n350) );
  CIVXL U1701 ( .A(addr_1[2]), .Z(n903) );
  CNR3X1 U1702 ( .A(addr_1[3]), .B(n903), .C(n2168), .Z(n1891) );
  CMX2XL U1703 ( .A0(din_1[2]), .A1(phase[2]), .S(n1673), .Z(phase_d[2]) );
  CIVXL U1704 ( .A(din_1[2]), .Z(n898) );
  CND2XL U1705 ( .A(n1629), .B(freq[2]), .Z(n897) );
  COND1XL U1706 ( .A(n1629), .B(n898), .C(n897), .Z(freq_d[2]) );
  CND2XL U1707 ( .A(addr_1[3]), .B(n899), .Z(n902) );
  CNR2XL U1708 ( .A(addr_1[2]), .B(n902), .Z(n2166) );
  CND2XL U1709 ( .A(strobe_1), .B(n2166), .Z(n915) );
  CIVXL U1710 ( .A(n915), .Z(n914) );
  CND2XL U1711 ( .A(din_1[2]), .B(n914), .Z(n901) );
  CND2XL U1712 ( .A(s1t_d[2]), .B(n915), .Z(n900) );
  CNR2XL U1713 ( .A(n903), .B(n902), .Z(n2165) );
  CND2XL U1714 ( .A(n2165), .B(strobe_1), .Z(n918) );
  CMX2XL U1715 ( .A0(din_1[2]), .A1(s2t_d[2]), .S(n918), .Z(s2_d[2]) );
  CMX2XL U1716 ( .A0(din_1[3]), .A1(phase[3]), .S(n1673), .Z(phase_d[3]) );
  CIVXL U1717 ( .A(din_1[3]), .Z(n905) );
  CND2XL U1718 ( .A(freq[3]), .B(n1629), .Z(n904) );
  COND1XL U1719 ( .A(n1629), .B(n905), .C(n904), .Z(freq_d[3]) );
  CND2XL U1720 ( .A(din_1[3]), .B(n914), .Z(n907) );
  CND2XL U1721 ( .A(s1t_d[3]), .B(n915), .Z(n906) );
  CMX2XL U1722 ( .A0(din_1[3]), .A1(s2t_d[3]), .S(n918), .Z(s2_d[3]) );
  CIVX2 U1723 ( .A(n1566), .Z(n1673) );
  CMX2XL U1724 ( .A0(din_1[0]), .A1(phase[0]), .S(n1673), .Z(phase_d[0]) );
  CIVXL U1725 ( .A(din_1[0]), .Z(n909) );
  CND2XL U1726 ( .A(n1629), .B(freq[0]), .Z(n908) );
  COND1XL U1727 ( .A(n1629), .B(n909), .C(n908), .Z(freq_d[0]) );
  CND2XL U1728 ( .A(din_1[0]), .B(n914), .Z(n911) );
  CND2XL U1729 ( .A(s1t_d[0]), .B(n915), .Z(n910) );
  CMX2XL U1730 ( .A0(din_1[0]), .A1(s2t_d[0]), .S(n918), .Z(s2_d[0]) );
  CMX2XL U1731 ( .A0(din_1[1]), .A1(phase[1]), .S(n1673), .Z(phase_d[1]) );
  CIVXL U1732 ( .A(din_1[1]), .Z(n913) );
  CND2XL U1733 ( .A(n1629), .B(freq[1]), .Z(n912) );
  COND1XL U1734 ( .A(n1629), .B(n913), .C(n912), .Z(freq_d[1]) );
  CND2XL U1735 ( .A(din_1[1]), .B(n914), .Z(n917) );
  CND2XL U1736 ( .A(s1t_d[1]), .B(n915), .Z(n916) );
  CMX2XL U1737 ( .A0(din_1[1]), .A1(s2t_d[1]), .S(n918), .Z(s2_d[1]) );
  CND4X1 U1738 ( .A(count4[3]), .B(count4[2]), .C(count4[1]), .D(count4[6]), 
        .Z(n921) );
  CNR2X1 U1739 ( .A(n921), .B(n920), .Z(n925) );
  CND2X1 U1740 ( .A(count4[5]), .B(count4[4]), .Z(n923) );
  CND2X1 U1741 ( .A(count4[9]), .B(count4[8]), .Z(n922) );
  CNR2X1 U1742 ( .A(n923), .B(n922), .Z(n924) );
  CND2X1 U1743 ( .A(n925), .B(n924), .Z(n2153) );
  CNR2X1 U1744 ( .A(n927), .B(n926), .Z(n932) );
  CND3XL U1745 ( .A(n928), .B(count4_d[7]), .C(count4_d[0]), .Z(n930) );
  CNR2X1 U1746 ( .A(n930), .B(n929), .Z(n931) );
  CND2X1 U1747 ( .A(n2153), .B(cflag), .Z(n933) );
  CIVXL U1748 ( .A(samp_5[3]), .Z(n939) );
  CND2XL U1749 ( .A(n1746), .B(n934), .Z(n942) );
  CIVXL U1750 ( .A(n1703), .Z(n937) );
  CANR1XL U1751 ( .A(n1744), .B(n934), .C(n940), .Z(n941) );
  CNR2XL U1752 ( .A(n945), .B(corr_d[4]), .Z(n1680) );
  CIVXL U1753 ( .A(n1680), .Z(n943) );
  CND2XL U1754 ( .A(n943), .B(n1682), .Z(n1019) );
  CANR1XL U1755 ( .A(n948), .B(n1682), .C(n947), .Z(n1018) );
  CANR1XL U1756 ( .A(n1038), .B(n944), .C(n951), .Z(n952) );
  COND1XL U1757 ( .A(n953), .B(n1018), .C(n952), .Z(n954) );
  CANR1X1 U1758 ( .A(n1017), .B(n955), .C(n954), .Z(n1084) );
  CNR2X1 U1759 ( .A(corr_d[8]), .B(samp_5[8]), .Z(n1004) );
  CND2XL U1760 ( .A(corr_d[8]), .B(samp_5[8]), .Z(n1003) );
  CENX1 U1761 ( .A(n1223), .B(n957), .Z(n959) );
  CIVXL U1762 ( .A(gout1), .Z(n967) );
  CNR2XL U1763 ( .A(corr_d[5]), .B(samp_5[5]), .Z(n1686) );
  CNR2XL U1764 ( .A(n1689), .B(n1686), .Z(n1026) );
  CNR2XL U1765 ( .A(corr_d[7]), .B(samp_5[7]), .Z(n1035) );
  CNR2XL U1766 ( .A(corr_d[1]), .B(samp_5[1]), .Z(n1705) );
  CND2XL U1767 ( .A(corr_d[1]), .B(samp_5[1]), .Z(n1706) );
  COND1XL U1768 ( .A(n1709), .B(n1705), .C(n1706), .Z(n1720) );
  CNR2X1 U1769 ( .A(corr_d[3]), .B(samp_5[3]), .Z(n1741) );
  CND2XL U1770 ( .A(corr_d[2]), .B(samp_5[2]), .Z(n1750) );
  CND2XL U1771 ( .A(corr_d[3]), .B(samp_5[3]), .Z(n1742) );
  COND1XL U1772 ( .A(n1750), .B(n1741), .C(n1742), .Z(n960) );
  CANR1X1 U1773 ( .A(n1720), .B(n961), .C(n960), .Z(n1024) );
  CND2XL U1774 ( .A(corr_d[4]), .B(samp_5[4]), .Z(n1728) );
  CND2XL U1775 ( .A(corr_d[5]), .B(samp_5[5]), .Z(n1687) );
  COND1XL U1776 ( .A(n1728), .B(n1686), .C(n1687), .Z(n1025) );
  CND2XL U1777 ( .A(corr_d[6]), .B(samp_5[6]), .Z(n1044) );
  CND2XL U1778 ( .A(corr_d[7]), .B(samp_5[7]), .Z(n1036) );
  COND1XL U1779 ( .A(n1044), .B(n1035), .C(n1036), .Z(n962) );
  CANR1XL U1780 ( .A(n1025), .B(n963), .C(n962), .Z(n964) );
  COND1X1 U1781 ( .A(n965), .B(n1024), .C(n964), .Z(n1125) );
  CEOXL U1782 ( .A(n966), .B(n1805), .Z(n972) );
  CAN2X1 U1783 ( .A(cflag_d), .B(n967), .Z(n1758) );
  CNR2XL U1784 ( .A(samp_5[6]), .B(samp_5[7]), .Z(n968) );
  CNR2XL U1785 ( .A(samp_5[2]), .B(samp_5[3]), .Z(n969) );
  CND2X1 U1786 ( .A(n969), .B(n1722), .Z(n1028) );
  CNR2X1 U1787 ( .A(n970), .B(n1028), .Z(n992) );
  CIVXL U1788 ( .A(n992), .Z(n1010) );
  CEOXL U1789 ( .A(samp_5[8]), .B(n1010), .Z(n971) );
  CANR2XL U1790 ( .A(n972), .B(n1845), .C(n1758), .D(n971), .Z(n976) );
  CAN3XL U1791 ( .A(n2180), .B(push5), .C(gout1), .Z(n973) );
  CND2X1 U1792 ( .A(cflag_d), .B(n973), .Z(n1093) );
  CNR2XL U1793 ( .A(sync_5), .B(push5), .Z(n974) );
  CANR2XL U1794 ( .A(n1760), .B(samp_5[8]), .C(corr_d[8]), .D(n1847), .Z(n975)
         );
  COND4CXL U1795 ( .A(n977), .B(n976), .C(n1849), .D(n975), .Z(sum_d[8]) );
  CIVXL U1796 ( .A(n1057), .Z(n1230) );
  CIVXL U1797 ( .A(n1074), .Z(n984) );
  CIVXL U1798 ( .A(n1076), .Z(n983) );
  CND2XL U1799 ( .A(n987), .B(n1553), .Z(n997) );
  CNR2XL U1800 ( .A(corr_d[9]), .B(samp_5[9]), .Z(n1005) );
  CND2XL U1801 ( .A(corr_d[9]), .B(samp_5[9]), .Z(n1006) );
  COND1XL U1802 ( .A(n1003), .B(n1005), .C(n1006), .Z(n1061) );
  CIVXL U1803 ( .A(n1061), .Z(n988) );
  COND1X1 U1804 ( .A(n989), .B(n1805), .C(n988), .Z(n1229) );
  CNR2XL U1805 ( .A(samp_5[8]), .B(samp_5[9]), .Z(n991) );
  CAN2X1 U1806 ( .A(n992), .B(n991), .Z(n1070) );
  CANR2XL U1807 ( .A(n994), .B(n1845), .C(n1758), .D(n993), .Z(n996) );
  CANR2XL U1808 ( .A(n1760), .B(samp_5[10]), .C(corr_d[10]), .D(n1847), .Z(
        n995) );
  COND4CXL U1809 ( .A(n997), .B(n996), .C(n1849), .D(n995), .Z(sum_d[10]) );
  CND2XL U1810 ( .A(n1002), .B(n1819), .Z(n1016) );
  COND1XL U1811 ( .A(n1004), .B(n1805), .C(n1003), .Z(n1009) );
  CIVXL U1812 ( .A(n1005), .Z(n1007) );
  CND2XL U1813 ( .A(n1007), .B(n1006), .Z(n1008) );
  CENX1 U1814 ( .A(n1009), .B(n1008), .Z(n1013) );
  CNR2XL U1815 ( .A(n1010), .B(samp_5[8]), .Z(n1011) );
  CENXL U1816 ( .A(n1011), .B(samp_5[9]), .Z(n1012) );
  CANR2XL U1817 ( .A(n1013), .B(n1845), .C(n1758), .D(n1012), .Z(n1015) );
  CANR2XL U1818 ( .A(n1760), .B(samp_5[9]), .C(corr_d[9]), .D(n1847), .Z(n1014) );
  COND4CXL U1819 ( .A(n1016), .B(n1015), .C(n1849), .D(n1014), .Z(sum_d[9]) );
  CIVXL U1820 ( .A(n1017), .Z(n1730) );
  COND1XL U1821 ( .A(n1019), .B(n1730), .C(n1018), .Z(n1039) );
  CND2XL U1822 ( .A(n1040), .B(n1020), .Z(n1021) );
  CIVXL U1823 ( .A(n1046), .Z(n1023) );
  CND2XL U1824 ( .A(n1023), .B(n1044), .Z(n1027) );
  CIVX1 U1825 ( .A(n1024), .Z(n1734) );
  CANR1XL U1826 ( .A(n1026), .B(n1734), .C(n1025), .Z(n1045) );
  CEOXL U1827 ( .A(n1027), .B(n1045), .Z(n1031) );
  CEOXL U1828 ( .A(samp_5[6]), .B(n1049), .Z(n1030) );
  CANR2XL U1829 ( .A(n1031), .B(n1845), .C(n1758), .D(n1030), .Z(n1033) );
  CANR2XL U1830 ( .A(n1760), .B(samp_5[6]), .C(corr_d[6]), .D(n1847), .Z(n1032) );
  COND4CXL U1831 ( .A(n1034), .B(n1033), .C(n1849), .D(n1032), .Z(sum_d[6]) );
  CIVXL U1832 ( .A(n1035), .Z(n1037) );
  CND2X1 U1833 ( .A(n1037), .B(n1036), .Z(n1047) );
  CANR1XL U1834 ( .A(n1040), .B(n1039), .C(n1038), .Z(n1041) );
  COND1XL U1835 ( .A(n1046), .B(n1045), .C(n1044), .Z(n1048) );
  CNR2XL U1836 ( .A(n1049), .B(samp_5[6]), .Z(n1050) );
  CENXL U1837 ( .A(n1050), .B(samp_5[7]), .Z(n1051) );
  CANR2XL U1838 ( .A(n1052), .B(n1845), .C(n1758), .D(n1051), .Z(n1054) );
  CANR2XL U1839 ( .A(n1760), .B(samp_5[7]), .C(corr_d[7]), .D(n1847), .Z(n1053) );
  COND4CXL U1840 ( .A(n1055), .B(n1054), .C(n1849), .D(n1053), .Z(sum_d[7]) );
  CNR2X1 U1841 ( .A(samp_5[11]), .B(corr_d[12]), .Z(n1766) );
  CNR2X1 U1842 ( .A(samp_5[11]), .B(corr_d[13]), .Z(n1787) );
  CNR2X1 U1843 ( .A(n1766), .B(n1787), .Z(n1802) );
  CIVXL U1844 ( .A(n1802), .Z(n1056) );
  CNR2X1 U1845 ( .A(samp_5[11]), .B(corr_d[14]), .Z(n1806) );
  CNR2X1 U1846 ( .A(samp_5[11]), .B(corr_d[11]), .Z(n1219) );
  COND1XL U1847 ( .A(n1227), .B(n1219), .C(n1220), .Z(n1059) );
  CIVXL U1848 ( .A(n1764), .Z(n1801) );
  CND2X1 U1849 ( .A(samp_5[11]), .B(corr_d[12]), .Z(n1782) );
  CND2X1 U1850 ( .A(n1788), .B(n1782), .Z(n1800) );
  CANR1XL U1851 ( .A(n1801), .B(n1064), .C(n1063), .Z(n1065) );
  COND1XL U1852 ( .A(n1805), .B(n1066), .C(n1065), .Z(n1069) );
  CND2XL U1853 ( .A(samp_5[11]), .B(corr_d[15]), .Z(n1119) );
  CND2X1 U1854 ( .A(n1067), .B(n1119), .Z(n1068) );
  CENX1 U1855 ( .A(n1069), .B(n1068), .Z(n1073) );
  CHA1X1 U1856 ( .A(n1071), .B(n1070), .CO(n1233), .S(n993) );
  CNR2X1 U1857 ( .A(samp_5[11]), .B(n1233), .Z(n1072) );
  CANR1XL U1858 ( .A(n1845), .B(n1073), .C(n1843), .Z(n1096) );
  CNR2X1 U1859 ( .A(n1086), .B(corr_d[13]), .Z(n1814) );
  CNR2X1 U1860 ( .A(n1813), .B(n1814), .Z(n1824) );
  CIVXL U1861 ( .A(n1824), .Z(n1088) );
  CIVXL U1862 ( .A(corr_d[11]), .Z(n1078) );
  COND1XL U1863 ( .A(n1077), .B(n1076), .C(n1075), .Z(n1222) );
  CND2XL U1864 ( .A(samp_5[11]), .B(n1078), .Z(n1770) );
  CND2XL U1865 ( .A(n1079), .B(corr_d[11]), .Z(n1774) );
  COND1XL U1866 ( .A(n1773), .B(n1770), .C(n1774), .Z(n1080) );
  COND1X1 U1867 ( .A(n1084), .B(n1083), .C(n1082), .Z(n1112) );
  CIVXL U1868 ( .A(n1827), .Z(n1087) );
  CNR2XL U1869 ( .A(n1089), .B(corr_d[14]), .Z(n1099) );
  CND2XL U1870 ( .A(n1089), .B(corr_d[14]), .Z(n1825) );
  CENX1 U1871 ( .A(n1091), .B(n1090), .Z(n1092) );
  CND2XL U1872 ( .A(n1092), .B(n1553), .Z(n1095) );
  CANR1XL U1873 ( .A(n1847), .B(corr_d[15]), .C(n1846), .Z(n1094) );
  COND4CXL U1874 ( .A(n1096), .B(n1095), .C(n1849), .D(n1094), .Z(sum_d[15])
         );
  CIVXL U1875 ( .A(n1333), .Z(n1098) );
  CND2XL U1876 ( .A(n1097), .B(corr_d[20]), .Z(n1332) );
  CNR2X1 U1877 ( .A(n1100), .B(corr_d[15]), .Z(n1832) );
  CNR2X1 U1878 ( .A(n1099), .B(n1832), .Z(n1102) );
  CND2X1 U1879 ( .A(n1824), .B(n1102), .Z(n1157) );
  CNR2XL U1880 ( .A(n1103), .B(corr_d[16]), .Z(n1137) );
  CNR2X1 U1881 ( .A(n1104), .B(corr_d[17]), .Z(n1141) );
  CNR2X1 U1882 ( .A(n1137), .B(n1141), .Z(n1194) );
  CNR2X1 U1883 ( .A(n1105), .B(corr_d[18]), .Z(n1197) );
  CNR2X1 U1884 ( .A(n1106), .B(corr_d[19]), .Z(n1178) );
  CNR2X1 U1885 ( .A(n1197), .B(n1178), .Z(n1108) );
  CND2X1 U1886 ( .A(n1194), .B(n1108), .Z(n1110) );
  CNR2X1 U1887 ( .A(n1157), .B(n1110), .Z(n1113) );
  CND2XL U1888 ( .A(n1100), .B(corr_d[15]), .Z(n1833) );
  COND1XL U1889 ( .A(n1825), .B(n1832), .C(n1833), .Z(n1101) );
  CND2XL U1890 ( .A(n1103), .B(corr_d[16]), .Z(n1158) );
  CND2XL U1891 ( .A(n1104), .B(corr_d[17]), .Z(n1142) );
  COND1XL U1892 ( .A(n1158), .B(n1141), .C(n1142), .Z(n1192) );
  CND2XL U1893 ( .A(n1105), .B(corr_d[18]), .Z(n1198) );
  CND2XL U1894 ( .A(n1106), .B(corr_d[19]), .Z(n1179) );
  COND1XL U1895 ( .A(n1198), .B(n1178), .C(n1179), .Z(n1107) );
  CANR1XL U1896 ( .A(n1192), .B(n1108), .C(n1107), .Z(n1109) );
  COND1XL U1897 ( .A(n1110), .B(n1156), .C(n1109), .Z(n1111) );
  CANR1X1 U1898 ( .A(n1113), .B(n1112), .C(n1111), .Z(n1479) );
  CEOXL U1899 ( .A(n1114), .B(n1479), .Z(n1115) );
  CND2XL U1900 ( .A(n1115), .B(n1819), .Z(n1136) );
  CNR2X1 U1901 ( .A(samp_5[11]), .B(corr_d[16]), .Z(n1838) );
  CNR2X1 U1902 ( .A(n1838), .B(n1163), .Z(n1204) );
  CNR2XL U1903 ( .A(samp_5[11]), .B(corr_d[19]), .Z(n1210) );
  CND2X1 U1904 ( .A(n1204), .B(n1116), .Z(n1290) );
  CNR2X1 U1905 ( .A(samp_5[11]), .B(corr_d[20]), .Z(n1247) );
  CND2X1 U1906 ( .A(n1802), .B(n1118), .Z(n1122) );
  COND1XL U1907 ( .A(n1122), .B(n1764), .C(n1121), .Z(n1123) );
  CANR1X1 U1908 ( .A(n1125), .B(n1124), .C(n1123), .Z(n1841) );
  CND2X1 U1909 ( .A(n1164), .B(n1839), .Z(n1207) );
  CNR2X1 U1910 ( .A(n1207), .B(n1126), .Z(n1297) );
  COND1XL U1911 ( .A(n1129), .B(n1841), .C(n1128), .Z(n1132) );
  CND2XL U1912 ( .A(samp_5[11]), .B(corr_d[21]), .Z(n1251) );
  CANR1XL U1913 ( .A(n1845), .B(n1133), .C(n1843), .Z(n1135) );
  CANR1XL U1914 ( .A(n1847), .B(corr_d[21]), .C(n1846), .Z(n1134) );
  COND4CXL U1915 ( .A(n1136), .B(n1135), .C(n1849), .D(n1134), .Z(sum_d[21])
         );
  CIVXL U1916 ( .A(n1137), .Z(n1159) );
  CIVXL U1917 ( .A(n1156), .Z(n1193) );
  CIVXL U1918 ( .A(n1158), .Z(n1138) );
  CANR1XL U1919 ( .A(n1159), .B(n1193), .C(n1138), .Z(n1139) );
  COND1XL U1920 ( .A(n1140), .B(n1830), .C(n1139), .Z(n1145) );
  CIVXL U1921 ( .A(n1141), .Z(n1143) );
  CND2XL U1922 ( .A(n1143), .B(n1142), .Z(n1144) );
  CIVXL U1923 ( .A(n1204), .Z(n1148) );
  COND1XL U1924 ( .A(n1148), .B(n1841), .C(n1147), .Z(n1151) );
  CANR1XL U1925 ( .A(n1845), .B(n1152), .C(n1843), .Z(n1154) );
  CANR1XL U1926 ( .A(n1847), .B(corr_d[18]), .C(n1846), .Z(n1153) );
  COND4CXL U1927 ( .A(n1155), .B(n1154), .C(n1849), .D(n1153), .Z(sum_d[18])
         );
  COND1XL U1928 ( .A(n1157), .B(n1830), .C(n1156), .Z(n1161) );
  CND2XL U1929 ( .A(n1159), .B(n1158), .Z(n1160) );
  COND1XL U1930 ( .A(n1838), .B(n1841), .C(n1839), .Z(n1167) );
  CIVXL U1931 ( .A(n1163), .Z(n1165) );
  CANR1XL U1932 ( .A(n1845), .B(n1168), .C(n1843), .Z(n1170) );
  CANR1XL U1933 ( .A(n1847), .B(corr_d[17]), .C(n1846), .Z(n1169) );
  COND4CXL U1934 ( .A(n1171), .B(n1170), .C(n1849), .D(n1169), .Z(sum_d[17])
         );
  CIVXL U1935 ( .A(n1194), .Z(n1172) );
  CNR2XL U1936 ( .A(n1172), .B(n1197), .Z(n1175) );
  CIVXL U1937 ( .A(n1192), .Z(n1173) );
  COND1XL U1938 ( .A(n1197), .B(n1173), .C(n1198), .Z(n1174) );
  CANR1XL U1939 ( .A(n1193), .B(n1175), .C(n1174), .Z(n1176) );
  COND1XL U1940 ( .A(n1177), .B(n1830), .C(n1176), .Z(n1182) );
  CIVXL U1941 ( .A(n1178), .Z(n1180) );
  CENX1 U1942 ( .A(n1182), .B(n1181), .Z(n1183) );
  COND1XL U1943 ( .A(n1290), .B(n1841), .C(n1297), .Z(n1186) );
  CANR1XL U1944 ( .A(n1845), .B(n1187), .C(n1843), .Z(n1189) );
  CANR1XL U1945 ( .A(n1847), .B(corr_d[20]), .C(n1846), .Z(n1188) );
  COND4CXL U1946 ( .A(n1190), .B(n1189), .C(n1849), .D(n1188), .Z(sum_d[20])
         );
  CND2XL U1947 ( .A(n1191), .B(n1194), .Z(n1196) );
  CANR1XL U1948 ( .A(n1194), .B(n1193), .C(n1192), .Z(n1195) );
  COND1XL U1949 ( .A(n1196), .B(n1830), .C(n1195), .Z(n1201) );
  CIVXL U1950 ( .A(n1197), .Z(n1199) );
  CENX1 U1951 ( .A(n1201), .B(n1200), .Z(n1202) );
  CND2XL U1952 ( .A(n1204), .B(n1203), .Z(n1209) );
  COND1XL U1953 ( .A(n1209), .B(n1841), .C(n1208), .Z(n1214) );
  CIVXL U1954 ( .A(n1210), .Z(n1212) );
  CANR1XL U1955 ( .A(n1845), .B(n1215), .C(n1843), .Z(n1217) );
  CANR1XL U1956 ( .A(n1847), .B(corr_d[19]), .C(n1846), .Z(n1216) );
  COND4CXL U1957 ( .A(n1218), .B(n1217), .C(n1849), .D(n1216), .Z(sum_d[19])
         );
  CANR1XL U1958 ( .A(n1224), .B(n1223), .C(n1222), .Z(n1771) );
  CEOXL U1959 ( .A(n1225), .B(n1771), .Z(n1226) );
  CIVXL U1960 ( .A(n1227), .Z(n1228) );
  CANR1XL U1961 ( .A(n1230), .B(n1229), .C(n1228), .Z(n1231) );
  CEOXL U1962 ( .A(n1232), .B(n1231), .Z(n1235) );
  CENX1 U1963 ( .A(samp_5[11]), .B(n1233), .Z(n1234) );
  CANR2XL U1964 ( .A(n1235), .B(n1845), .C(n1758), .D(n1234), .Z(n1237) );
  CANR1XL U1965 ( .A(n1847), .B(corr_d[11]), .C(n1846), .Z(n1236) );
  COND4CXL U1966 ( .A(n1238), .B(n1237), .C(n1849), .D(n1236), .Z(sum_d[11])
         );
  CIVXL U1967 ( .A(n1398), .Z(n1241) );
  COND1XL U1968 ( .A(n1332), .B(n1334), .C(n1335), .Z(n1401) );
  CIVXL U1969 ( .A(n1401), .Z(n1240) );
  COND1XL U1970 ( .A(n1241), .B(n1479), .C(n1240), .Z(n1244) );
  CNR2X1 U1971 ( .A(n1242), .B(corr_d[22]), .Z(n1263) );
  CND2XL U1972 ( .A(n1245), .B(n1553), .Z(n1262) );
  CNR2XL U1973 ( .A(samp_5[11]), .B(corr_d[22]), .Z(n1346) );
  CND2X1 U1974 ( .A(n1251), .B(n1250), .Z(n1342) );
  COND1XL U1975 ( .A(n1255), .B(n1841), .C(n1254), .Z(n1258) );
  CNR2XL U1976 ( .A(samp_5[11]), .B(corr_d[23]), .Z(n1287) );
  CIVXL U1977 ( .A(n1287), .Z(n1256) );
  CND2XL U1978 ( .A(samp_5[11]), .B(corr_d[23]), .Z(n1295) );
  CANR1XL U1979 ( .A(n1845), .B(n1259), .C(n1843), .Z(n1261) );
  CANR1XL U1980 ( .A(n1847), .B(corr_d[23]), .C(n1846), .Z(n1260) );
  COND4CXL U1981 ( .A(n1262), .B(n1261), .C(n1849), .D(n1260), .Z(sum_d[23])
         );
  CNR2X1 U1982 ( .A(n1264), .B(corr_d[23]), .Z(n1405) );
  CNR2X1 U1983 ( .A(n1263), .B(n1405), .Z(n1266) );
  CND2X1 U1984 ( .A(n1398), .B(n1266), .Z(n1379) );
  CNR2X1 U1985 ( .A(n1267), .B(corr_d[24]), .Z(n1355) );
  CNR2X1 U1986 ( .A(n1355), .B(n1359), .Z(n1468) );
  CNR2X1 U1987 ( .A(n1269), .B(corr_d[26]), .Z(n1474) );
  CND2XL U1988 ( .A(n1446), .B(n1278), .Z(n1280) );
  COND1XL U1989 ( .A(n1399), .B(n1405), .C(n1406), .Z(n1265) );
  CANR1XL U1990 ( .A(n1401), .B(n1266), .C(n1265), .Z(n1378) );
  COND1XL U1991 ( .A(n1380), .B(n1359), .C(n1360), .Z(n1471) );
  COND1XL U1992 ( .A(n1472), .B(n1481), .C(n1482), .Z(n1271) );
  CANR1XL U1993 ( .A(n1471), .B(n1272), .C(n1271), .Z(n1273) );
  COND1XL U1994 ( .A(n1274), .B(n1378), .C(n1273), .Z(n1447) );
  COND1XL U1995 ( .A(n1450), .B(n1425), .C(n1426), .Z(n1277) );
  CANR1XL U1996 ( .A(n1278), .B(n1447), .C(n1277), .Z(n1279) );
  COND1XL U1997 ( .A(n1280), .B(n1479), .C(n1279), .Z(n1285) );
  CND2X1 U1998 ( .A(n1283), .B(n1282), .Z(n1284) );
  CENXL U1999 ( .A(n1285), .B(n1284), .Z(n1286) );
  CEOXL U2000 ( .A(corr_d[31]), .B(samp_5[11]), .Z(n1306) );
  CNR2X1 U2001 ( .A(n1290), .B(n1289), .Z(n1489) );
  CNR2X1 U2002 ( .A(samp_5[11]), .B(corr_d[24]), .Z(n1385) );
  CNR2X1 U2003 ( .A(n1385), .B(n1389), .Z(n1365) );
  CNR2X1 U2004 ( .A(samp_5[11]), .B(corr_d[26]), .Z(n1369) );
  CND2X1 U2005 ( .A(n1365), .B(n1291), .Z(n1487) );
  CNR2X1 U2006 ( .A(samp_5[11]), .B(corr_d[28]), .Z(n1495) );
  CNR2X1 U2007 ( .A(n1342), .B(n1296), .Z(n1298) );
  CND2X1 U2008 ( .A(n1298), .B(n1297), .Z(n1492) );
  CND2XL U2009 ( .A(samp_5[11]), .B(corr_d[29]), .Z(n1460) );
  CND2XL U2010 ( .A(samp_5[11]), .B(corr_d[28]), .Z(n1496) );
  CND2XL U2011 ( .A(samp_5[11]), .B(corr_d[30]), .Z(n1439) );
  CND2XL U2012 ( .A(samp_5[11]), .B(corr_d[25]), .Z(n1390) );
  CND2XL U2013 ( .A(samp_5[11]), .B(corr_d[27]), .Z(n1324) );
  CNR2X1 U2014 ( .A(n1366), .B(n1300), .Z(n1490) );
  COND1XL U2015 ( .A(n1304), .B(n1841), .C(n1303), .Z(n1305) );
  CEOXL U2016 ( .A(n1306), .B(n1305), .Z(n1307) );
  CANR1XL U2017 ( .A(n1845), .B(n1307), .C(n1843), .Z(n1309) );
  CANR1XL U2018 ( .A(n1847), .B(corr_d[31]), .C(n1846), .Z(n1308) );
  COND4CXL U2019 ( .A(n1310), .B(n1309), .C(n1849), .D(n1308), .Z(sum_d[31])
         );
  CND2XL U2020 ( .A(n1470), .B(n1468), .Z(n1312) );
  CIVXL U2021 ( .A(n1378), .Z(n1477) );
  CANR1XL U2022 ( .A(n1468), .B(n1477), .C(n1471), .Z(n1311) );
  COND1XL U2023 ( .A(n1312), .B(n1479), .C(n1311), .Z(n1315) );
  CND2X1 U2024 ( .A(n1313), .B(n1472), .Z(n1314) );
  CENXL U2025 ( .A(n1315), .B(n1314), .Z(n1316) );
  CND2XL U2026 ( .A(n1489), .B(n1318), .Z(n1322) );
  COND1XL U2027 ( .A(n1322), .B(n1841), .C(n1321), .Z(n1327) );
  CANR1XL U2028 ( .A(n1845), .B(n1328), .C(n1843), .Z(n1330) );
  CANR1XL U2029 ( .A(n1847), .B(corr_d[27]), .C(n1846), .Z(n1329) );
  COND4CXL U2030 ( .A(n1331), .B(n1330), .C(n1849), .D(n1329), .Z(sum_d[27])
         );
  COND1XL U2031 ( .A(n1333), .B(n1479), .C(n1332), .Z(n1338) );
  CIVXL U2032 ( .A(n1334), .Z(n1336) );
  CND2XL U2033 ( .A(n1339), .B(n1553), .Z(n1354) );
  CND2XL U2034 ( .A(n1341), .B(n1340), .Z(n1345) );
  COND1XL U2035 ( .A(n1345), .B(n1841), .C(n1344), .Z(n1350) );
  CIVXL U2036 ( .A(n1346), .Z(n1348) );
  CANR1XL U2037 ( .A(n1845), .B(n1351), .C(n1843), .Z(n1353) );
  CANR1XL U2038 ( .A(n1847), .B(corr_d[22]), .C(n1846), .Z(n1352) );
  COND4CXL U2039 ( .A(n1354), .B(n1353), .C(n1849), .D(n1352), .Z(sum_d[22])
         );
  CIVXL U2040 ( .A(n1380), .Z(n1356) );
  CANR1XL U2041 ( .A(n1381), .B(n1477), .C(n1356), .Z(n1357) );
  COND1XL U2042 ( .A(n1358), .B(n1479), .C(n1357), .Z(n1363) );
  CIVXL U2043 ( .A(n1359), .Z(n1361) );
  CND2X1 U2044 ( .A(n1361), .B(n1360), .Z(n1362) );
  CENXL U2045 ( .A(n1363), .B(n1362), .Z(n1364) );
  CND2XL U2046 ( .A(n1489), .B(n1365), .Z(n1368) );
  COND1XL U2047 ( .A(n1368), .B(n1841), .C(n1367), .Z(n1373) );
  CANR1XL U2048 ( .A(n1845), .B(n1374), .C(n1843), .Z(n1376) );
  CANR1XL U2049 ( .A(n1847), .B(corr_d[26]), .C(n1846), .Z(n1375) );
  COND4CXL U2050 ( .A(n1377), .B(n1376), .C(n1849), .D(n1375), .Z(sum_d[26])
         );
  COND1XL U2051 ( .A(n1379), .B(n1479), .C(n1378), .Z(n1383) );
  COND1XL U2052 ( .A(n1388), .B(n1841), .C(n1387), .Z(n1393) );
  CANR1XL U2053 ( .A(n1845), .B(n1394), .C(n1843), .Z(n1396) );
  CANR1XL U2054 ( .A(n1847), .B(corr_d[25]), .C(n1846), .Z(n1395) );
  COND4CXL U2055 ( .A(n1397), .B(n1396), .C(n1849), .D(n1395), .Z(sum_d[25])
         );
  CND2XL U2056 ( .A(n1398), .B(n1402), .Z(n1404) );
  CANR1XL U2057 ( .A(n1402), .B(n1401), .C(n1400), .Z(n1403) );
  COND1XL U2058 ( .A(n1404), .B(n1479), .C(n1403), .Z(n1409) );
  CND2X1 U2059 ( .A(n1407), .B(n1406), .Z(n1408) );
  CENXL U2060 ( .A(n1409), .B(n1408), .Z(n1410) );
  CIVXL U2061 ( .A(n1489), .Z(n1412) );
  COND1XL U2062 ( .A(n1412), .B(n1841), .C(n1411), .Z(n1416) );
  CANR1XL U2063 ( .A(n1845), .B(n1417), .C(n1843), .Z(n1419) );
  CANR1XL U2064 ( .A(n1847), .B(corr_d[24]), .C(n1846), .Z(n1418) );
  COND4CXL U2065 ( .A(n1420), .B(n1419), .C(n1849), .D(n1418), .Z(sum_d[24])
         );
  CND2XL U2066 ( .A(n1446), .B(n1451), .Z(n1424) );
  CANR1XL U2067 ( .A(n1451), .B(n1447), .C(n1422), .Z(n1423) );
  COND1XL U2068 ( .A(n1424), .B(n1479), .C(n1423), .Z(n1429) );
  CND2X1 U2069 ( .A(n1427), .B(n1426), .Z(n1428) );
  CENXL U2070 ( .A(n1429), .B(n1428), .Z(n1430) );
  CND2XL U2071 ( .A(n1489), .B(n1433), .Z(n1438) );
  COND1XL U2072 ( .A(n1438), .B(n1841), .C(n1437), .Z(n1441) );
  CANR1XL U2073 ( .A(n1845), .B(n1442), .C(n1843), .Z(n1444) );
  CANR1XL U2074 ( .A(n1847), .B(corr_d[30]), .C(n1846), .Z(n1443) );
  COND4CXL U2075 ( .A(n1445), .B(n1444), .C(n1849), .D(n1443), .Z(sum_d[30])
         );
  CIVXL U2076 ( .A(n1446), .Z(n1449) );
  CIVXL U2077 ( .A(n1447), .Z(n1448) );
  COND1XL U2078 ( .A(n1449), .B(n1479), .C(n1448), .Z(n1453) );
  CENXL U2079 ( .A(n1453), .B(n1452), .Z(n1454) );
  CND2XL U2080 ( .A(n1489), .B(n1455), .Z(n1458) );
  COND1XL U2081 ( .A(n1458), .B(n1841), .C(n1457), .Z(n1463) );
  CANR1XL U2082 ( .A(n1845), .B(n1464), .C(n1843), .Z(n1466) );
  CANR1XL U2083 ( .A(n1847), .B(corr_d[29]), .C(n1846), .Z(n1465) );
  COND4CXL U2084 ( .A(n1467), .B(n1466), .C(n1849), .D(n1465), .Z(sum_d[29])
         );
  CIVXL U2085 ( .A(n1471), .Z(n1473) );
  COND1XL U2086 ( .A(n1474), .B(n1473), .C(n1472), .Z(n1475) );
  CANR1XL U2087 ( .A(n1477), .B(n1476), .C(n1475), .Z(n1478) );
  COND1XL U2088 ( .A(n1480), .B(n1479), .C(n1478), .Z(n1485) );
  CND2X1 U2089 ( .A(n1483), .B(n1482), .Z(n1484) );
  CENXL U2090 ( .A(n1485), .B(n1484), .Z(n1486) );
  CND2XL U2091 ( .A(n1489), .B(n1488), .Z(n1494) );
  COND1XL U2092 ( .A(n1494), .B(n1841), .C(n1493), .Z(n1499) );
  CANR1XL U2093 ( .A(n1845), .B(n1500), .C(n1843), .Z(n1502) );
  CANR1XL U2094 ( .A(n1847), .B(corr_d[28]), .C(n1846), .Z(n1501) );
  COND4CXL U2095 ( .A(n1503), .B(n1502), .C(n1849), .D(n1501), .Z(sum_d[28])
         );
  CNIVXL U2096 ( .A(n459), .Z(n1540) );
  CND2X1 U2097 ( .A(n1540), .B(n2128), .Z(n2151) );
  CIVX2 U2098 ( .A(n2151), .Z(n2181) );
  CNR2X1 U2099 ( .A(n1506), .B(n1523), .Z(n1510) );
  CND2X1 U2100 ( .A(n1507), .B(n1510), .Z(n1529) );
  CNR2X1 U2101 ( .A(n1529), .B(n1508), .Z(n1509) );
  CIVX2 U2102 ( .A(n1510), .Z(n1531) );
  CNR2X1 U2103 ( .A(n1531), .B(n1532), .Z(n1512) );
  CENX1 U2104 ( .A(n1512), .B(n1511), .Z(n1983) );
  CNR2X1 U2105 ( .A(n1531), .B(n1515), .Z(n1514) );
  CENX1 U2106 ( .A(n1514), .B(n1513), .Z(n1968) );
  CNR2X1 U2107 ( .A(n1517), .B(n1531), .Z(n1519) );
  CEOX1 U2108 ( .A(n1519), .B(n1518), .Z(n2144) );
  CND3XL U2109 ( .A(n1520), .B(n1538), .C(n2144), .Z(n1536) );
  CNR2X1 U2110 ( .A(n1529), .B(n1530), .Z(n1522) );
  CEOX1 U2111 ( .A(n1522), .B(n1521), .Z(n2152) );
  CENX1 U2112 ( .A(n1527), .B(n1526), .Z(n1971) );
  CENX1 U2113 ( .A(n1528), .B(count1_d[0]), .Z(n2145) );
  CNR4XL U2114 ( .A(n1977), .B(n1971), .C(count1_d[0]), .D(n2145), .Z(n1534)
         );
  CEOX1 U2115 ( .A(n1530), .B(n1529), .Z(n1974) );
  CEOX1 U2116 ( .A(n1532), .B(n1531), .Z(n1980) );
  CND3XL U2117 ( .A(n2152), .B(n1534), .C(n1533), .Z(n1535) );
  CNR2X1 U2118 ( .A(n1536), .B(n1535), .Z(n2146) );
  CND3XL U2119 ( .A(n2181), .B(n1538), .C(n1537), .Z(n1543) );
  CND2XL U2120 ( .A(n1543), .B(n1542), .Z(n338) );
  CIVXL U2121 ( .A(n1544), .Z(n1547) );
  CIVXL U2122 ( .A(n1545), .Z(n1546) );
  CANR2XL U2123 ( .A(n2129), .B(n470), .C(sync3_d), .D(phase[26]), .Z(n1551)
         );
  CENX1 U2124 ( .A(n1552), .B(corr_d[0]), .Z(n1554) );
  CND2XL U2125 ( .A(n1553), .B(n1554), .Z(n1557) );
  CANR2XL U2126 ( .A(n1758), .B(\C1/DATA1_0 ), .C(n1554), .D(n1845), .Z(n1556)
         );
  CANR2XL U2127 ( .A(n1760), .B(\C1/DATA1_0 ), .C(corr_d[0]), .D(n1847), .Z(
        n1555) );
  CND2XL U2128 ( .A(din_1[30]), .B(n1566), .Z(n1559) );
  CND2XL U2129 ( .A(n1629), .B(freq[30]), .Z(n1560) );
  COND1XL U2130 ( .A(n1629), .B(n1561), .C(n1560), .Z(freq_d[30]) );
  CND2XL U2131 ( .A(din_1[29]), .B(n1566), .Z(n1563) );
  CND2XL U2132 ( .A(n1629), .B(freq[29]), .Z(n1564) );
  COND1XL U2133 ( .A(n1629), .B(n1565), .C(n1564), .Z(freq_d[29]) );
  CND2XL U2134 ( .A(n1629), .B(freq[27]), .Z(n1569) );
  COND1XL U2135 ( .A(n1629), .B(n1570), .C(n1569), .Z(freq_d[27]) );
  CND2XL U2136 ( .A(n1629), .B(freq[31]), .Z(n1573) );
  COND1XL U2137 ( .A(n1629), .B(n1574), .C(n1573), .Z(freq_d[31]) );
  CND2XL U2138 ( .A(n1629), .B(freq[4]), .Z(n1577) );
  COND1XL U2139 ( .A(n1629), .B(n1578), .C(n1577), .Z(freq_d[4]) );
  CND2XL U2140 ( .A(din_1[28]), .B(n1566), .Z(n1580) );
  CND2XL U2141 ( .A(n1629), .B(freq[28]), .Z(n1581) );
  COND1XL U2142 ( .A(n1629), .B(n1582), .C(n1581), .Z(freq_d[28]) );
  CND2XL U2143 ( .A(n1629), .B(freq[6]), .Z(n1585) );
  COND1XL U2144 ( .A(n1629), .B(n1586), .C(n1585), .Z(freq_d[6]) );
  CND2XL U2145 ( .A(n1629), .B(n1589), .Z(n1590) );
  COND1XL U2146 ( .A(n1629), .B(n1591), .C(n1590), .Z(freq_d[7]) );
  CND2XL U2147 ( .A(n1629), .B(freq[5]), .Z(n1594) );
  COND1XL U2148 ( .A(n1629), .B(n1595), .C(n1594), .Z(freq_d[5]) );
  CND2XL U2149 ( .A(n1629), .B(freq[23]), .Z(n1598) );
  COND1XL U2150 ( .A(n1629), .B(n1599), .C(n1598), .Z(freq_d[23]) );
  CND2XL U2151 ( .A(n1629), .B(freq[25]), .Z(n1602) );
  COND1XL U2152 ( .A(n1629), .B(n1603), .C(n1602), .Z(freq_d[25]) );
  CND2XL U2153 ( .A(n1629), .B(freq[21]), .Z(n1606) );
  COND1XL U2154 ( .A(n1629), .B(n1607), .C(n1606), .Z(freq_d[21]) );
  CND2XL U2155 ( .A(n1629), .B(n1610), .Z(n1611) );
  COND1XL U2156 ( .A(n1629), .B(n1612), .C(n1611), .Z(freq_d[19]) );
  CND2XL U2157 ( .A(n1629), .B(freq[20]), .Z(n1615) );
  COND1XL U2158 ( .A(n1629), .B(n1616), .C(n1615), .Z(freq_d[20]) );
  CND2XL U2159 ( .A(n1629), .B(freq[18]), .Z(n1621) );
  COND1XL U2160 ( .A(n1629), .B(n1622), .C(n1621), .Z(freq_d[18]) );
  CND2XL U2161 ( .A(n1629), .B(freq[16]), .Z(n1625) );
  COND1XL U2162 ( .A(n1629), .B(n1626), .C(n1625), .Z(freq_d[16]) );
  CND2XL U2163 ( .A(n1629), .B(freq[17]), .Z(n1630) );
  COND1XL U2164 ( .A(n1629), .B(n1631), .C(n1630), .Z(freq_d[17]) );
  CND2XL U2165 ( .A(din_1[8]), .B(n1566), .Z(n1633) );
  CND2XL U2166 ( .A(n1629), .B(n1634), .Z(n1635) );
  COND1XL U2167 ( .A(n1629), .B(n1636), .C(n1635), .Z(freq_d[8]) );
  CND2XL U2168 ( .A(din_1[15]), .B(n1566), .Z(n1638) );
  CND2XL U2169 ( .A(n1629), .B(n1639), .Z(n1640) );
  COND1XL U2170 ( .A(n1629), .B(n1641), .C(n1640), .Z(freq_d[15]) );
  CND2XL U2171 ( .A(n1629), .B(freq[22]), .Z(n1644) );
  COND1XL U2172 ( .A(n1629), .B(n1645), .C(n1644), .Z(freq_d[22]) );
  CND2XL U2173 ( .A(din_1[9]), .B(n1566), .Z(n1647) );
  CND2XL U2174 ( .A(n1629), .B(n1648), .Z(n1649) );
  COND1XL U2175 ( .A(n1629), .B(n1650), .C(n1649), .Z(freq_d[9]) );
  CND2XL U2176 ( .A(din_1[12]), .B(n1566), .Z(n1652) );
  CND2XL U2177 ( .A(n1629), .B(freq[12]), .Z(n1653) );
  COND1XL U2178 ( .A(n1629), .B(n1654), .C(n1653), .Z(freq_d[12]) );
  CND2XL U2179 ( .A(din_1[11]), .B(n1566), .Z(n1656) );
  CND2XL U2180 ( .A(n1629), .B(n1657), .Z(n1658) );
  COND1XL U2181 ( .A(n1629), .B(n1659), .C(n1658), .Z(freq_d[11]) );
  CND2XL U2182 ( .A(din_1[10]), .B(n1566), .Z(n1661) );
  CND2XL U2183 ( .A(n1629), .B(n544), .Z(n1662) );
  COND1XL U2184 ( .A(n1629), .B(n1663), .C(n1662), .Z(freq_d[10]) );
  CND2XL U2185 ( .A(n1629), .B(freq[24]), .Z(n1666) );
  COND1XL U2186 ( .A(n1629), .B(n1667), .C(n1666), .Z(freq_d[24]) );
  CND2XL U2187 ( .A(din_1[14]), .B(n1566), .Z(n1669) );
  CND2XL U2188 ( .A(n1629), .B(n1670), .Z(n1671) );
  COND1XL U2189 ( .A(n1629), .B(n1672), .C(n1671), .Z(freq_d[14]) );
  CND2XL U2190 ( .A(din_1[13]), .B(n1566), .Z(n1675) );
  CND2XL U2191 ( .A(n1629), .B(n1676), .Z(n1677) );
  COND1XL U2192 ( .A(n1629), .B(n1678), .C(n1677), .Z(freq_d[13]) );
  COND1XL U2193 ( .A(n1680), .B(n1730), .C(n1679), .Z(n1684) );
  CENX1 U2194 ( .A(n1684), .B(n1683), .Z(n1685) );
  CIVXL U2195 ( .A(n1686), .Z(n1688) );
  CIVXL U2196 ( .A(n1728), .Z(n1690) );
  CANR1XL U2197 ( .A(n1729), .B(n1734), .C(n1690), .Z(n1691) );
  CIVXL U2198 ( .A(samp_5[4]), .Z(n1693) );
  CND2X1 U2199 ( .A(n1735), .B(n1693), .Z(n1694) );
  CEOXL U2200 ( .A(samp_5[5]), .B(n1694), .Z(n1695) );
  CANR2XL U2201 ( .A(n1696), .B(n1845), .C(n1758), .D(n1695), .Z(n1698) );
  CANR2XL U2202 ( .A(n1760), .B(samp_5[5]), .C(corr_d[5]), .D(n1847), .Z(n1697) );
  COND4CXL U2203 ( .A(n1699), .B(n1698), .C(n1849), .D(n1697), .Z(sum_d[5]) );
  CND2XL U2204 ( .A(n1701), .B(n1700), .Z(n1702) );
  CEOXL U2205 ( .A(n1703), .B(n1702), .Z(n1704) );
  CEOXL U2206 ( .A(\C1/DATA1_0 ), .B(samp_5[1]), .Z(n1711) );
  CIVXL U2207 ( .A(n1705), .Z(n1707) );
  CEOXL U2208 ( .A(n1709), .B(n1708), .Z(n1710) );
  CANR2XL U2209 ( .A(n1758), .B(n1711), .C(n1710), .D(n1845), .Z(n1713) );
  CANR2XL U2210 ( .A(n1760), .B(samp_5[1]), .C(corr_d[1]), .D(n1847), .Z(n1712) );
  CIVXL U2211 ( .A(n1715), .Z(n1745) );
  CENX1 U2212 ( .A(n1745), .B(n1717), .Z(n1718) );
  CND2XL U2213 ( .A(n1719), .B(n1750), .Z(n1721) );
  CIVXL U2214 ( .A(n1720), .Z(n1751) );
  CEOXL U2215 ( .A(samp_5[2]), .B(n1755), .Z(n1723) );
  CANR2XL U2216 ( .A(n1845), .B(n1724), .C(n1723), .D(n1758), .Z(n1726) );
  CANR2XL U2217 ( .A(n1760), .B(samp_5[2]), .C(corr_d[2]), .D(n1847), .Z(n1725) );
  CND2X1 U2218 ( .A(n1729), .B(n1728), .Z(n1733) );
  CEOXL U2219 ( .A(n1731), .B(n1730), .Z(n1732) );
  CND2XL U2220 ( .A(n1732), .B(n1819), .Z(n1740) );
  CENX1 U2221 ( .A(n1734), .B(n1733), .Z(n1737) );
  CANR2XL U2222 ( .A(n1737), .B(n1845), .C(n1758), .D(n1736), .Z(n1739) );
  CANR2XL U2223 ( .A(n1760), .B(samp_5[4]), .C(corr_d[4]), .D(n1847), .Z(n1738) );
  CND2X1 U2224 ( .A(n1743), .B(n1742), .Z(n1753) );
  CANR1XL U2225 ( .A(n1746), .B(n1745), .C(n1744), .Z(n1747) );
  COND1XL U2226 ( .A(n1752), .B(n1751), .C(n1750), .Z(n1754) );
  CENX1 U2227 ( .A(n1754), .B(n1753), .Z(n1759) );
  CNR2XL U2228 ( .A(n1755), .B(samp_5[2]), .Z(n1756) );
  CANR2XL U2229 ( .A(n1759), .B(n1845), .C(n1758), .D(n1757), .Z(n1762) );
  CANR2XL U2230 ( .A(n1760), .B(samp_5[3]), .C(corr_d[3]), .D(n1847), .Z(n1761) );
  COND4CXL U2231 ( .A(n1763), .B(n1762), .C(n1849), .D(n1761), .Z(sum_d[3]) );
  COND1XL U2232 ( .A(n1765), .B(n1805), .C(n1764), .Z(n1768) );
  CIVX1 U2233 ( .A(n1766), .Z(n1784) );
  CND2X1 U2234 ( .A(n1784), .B(n1782), .Z(n1767) );
  CENX1 U2235 ( .A(n1768), .B(n1767), .Z(n1769) );
  CANR1XL U2236 ( .A(n1845), .B(n1769), .C(n1843), .Z(n1781) );
  COND1XL U2237 ( .A(n1772), .B(n1771), .C(n1770), .Z(n1777) );
  CIVXL U2238 ( .A(n1773), .Z(n1775) );
  CENXL U2239 ( .A(n1777), .B(n1776), .Z(n1778) );
  CANR1XL U2240 ( .A(n1847), .B(corr_d[12]), .C(n1846), .Z(n1779) );
  CANR1XL U2241 ( .A(n1784), .B(n1801), .C(n1783), .Z(n1785) );
  COND1XL U2242 ( .A(n1805), .B(n1786), .C(n1785), .Z(n1791) );
  CIVXL U2243 ( .A(n1787), .Z(n1789) );
  CENX1 U2244 ( .A(n1791), .B(n1790), .Z(n1792) );
  CANR1XL U2245 ( .A(n1845), .B(n1792), .C(n1843), .Z(n1798) );
  CIVXL U2246 ( .A(n1813), .Z(n1793) );
  CND2XL U2247 ( .A(n1793), .B(n1812), .Z(n1794) );
  CANR1XL U2248 ( .A(n1847), .B(corr_d[13]), .C(n1846), .Z(n1796) );
  CND2XL U2249 ( .A(n1799), .B(n1802), .Z(n1804) );
  CANR1XL U2250 ( .A(n1802), .B(n1801), .C(n1800), .Z(n1803) );
  COND1XL U2251 ( .A(n1805), .B(n1804), .C(n1803), .Z(n1810) );
  CENX1 U2252 ( .A(n1810), .B(n1809), .Z(n1811) );
  CANR1XL U2253 ( .A(n1845), .B(n1811), .C(n1843), .Z(n1823) );
  COND1XL U2254 ( .A(n1813), .B(n1830), .C(n1812), .Z(n1818) );
  CIVXL U2255 ( .A(n1814), .Z(n1816) );
  CENX1 U2256 ( .A(n1818), .B(n1817), .Z(n1820) );
  CANR1XL U2257 ( .A(n1847), .B(corr_d[14]), .C(n1846), .Z(n1821) );
  CND2XL U2258 ( .A(n1824), .B(n1828), .Z(n1831) );
  CIVXL U2259 ( .A(n1825), .Z(n1826) );
  CANR1XL U2260 ( .A(n1828), .B(n1827), .C(n1826), .Z(n1829) );
  COND1XL U2261 ( .A(n1831), .B(n1830), .C(n1829), .Z(n1836) );
  CIVXL U2262 ( .A(n1832), .Z(n1834) );
  CND2XL U2263 ( .A(n1834), .B(n1833), .Z(n1835) );
  CIVXL U2264 ( .A(n1838), .Z(n1840) );
  CEOXL U2265 ( .A(n1842), .B(n1841), .Z(n1844) );
  CANR1XL U2266 ( .A(n1845), .B(n1844), .C(n1843), .Z(n1850) );
  CANR1XL U2267 ( .A(n1847), .B(corr_d[16]), .C(n1846), .Z(n1848) );
  CMXI2XL U2268 ( .A0(g2[3]), .A1(g2[4]), .S(flag1_d), .Z(n1852) );
  CMXI2XL U2269 ( .A0(g1[0]), .A1(g1[1]), .S(flag1_d), .Z(n1853) );
  CMXI2XL U2270 ( .A0(g2[1]), .A1(g2[2]), .S(flag1_d), .Z(n1854) );
  CMXI2XL U2271 ( .A0(g1[6]), .A1(g1[7]), .S(flag1_d), .Z(n1855) );
  CMXI2XL U2272 ( .A0(g2[4]), .A1(g2[5]), .S(flag1_d), .Z(n1856) );
  CMXI2XL U2273 ( .A0(g1[4]), .A1(g1[5]), .S(flag1_d), .Z(n1857) );
  CMXI2XL U2274 ( .A0(g2[5]), .A1(g2[6]), .S(flag1_d), .Z(n1858) );
  CMXI2XL U2275 ( .A0(g1[5]), .A1(g1[6]), .S(flag1_d), .Z(n1859) );
  CMXI2XL U2276 ( .A0(g2[6]), .A1(g2[7]), .S(flag1_d), .Z(n1860) );
  CMXI2XL U2277 ( .A0(g1[3]), .A1(g1[4]), .S(flag1_d), .Z(n1861) );
  CMXI2XL U2278 ( .A0(g2[7]), .A1(g2[8]), .S(flag1_d), .Z(n1862) );
  CMXI2XL U2279 ( .A0(g2[8]), .A1(g2[9]), .S(flag1_d), .Z(n1863) );
  CMXI2XL U2280 ( .A0(g1[8]), .A1(g1[9]), .S(flag1_d), .Z(n1864) );
  CMXI2XL U2281 ( .A0(g1[7]), .A1(g1[8]), .S(flag1_d), .Z(n1865) );
  CMXI2XL U2282 ( .A0(g1[2]), .A1(g1[3]), .S(flag1_d), .Z(n1866) );
  CMXI2XL U2283 ( .A0(g2[0]), .A1(g2[1]), .S(flag1_d), .Z(n1867) );
  CMXI2XL U2284 ( .A0(g1[1]), .A1(g1[2]), .S(flag1_d), .Z(n1868) );
  CMXI2XL U2285 ( .A0(g2[2]), .A1(g2[3]), .S(flag1_d), .Z(n1869) );
  CNIVX1 U2286 ( .A(n384), .Z(n2176) );
  CNIVX1 U2287 ( .A(n384), .Z(n2178) );
  CNIVX1 U2288 ( .A(n384), .Z(n2179) );
  CNIVX1 U2289 ( .A(n384), .Z(n2177) );
  CANR2XL U2290 ( .A(n2129), .B(acc[4]), .C(sync3_d), .D(phase[4]), .Z(n1870)
         );
  CANR2XL U2291 ( .A(n2129), .B(acc[5]), .C(n2175), .D(phase[5]), .Z(n1873) );
  CANR2XL U2292 ( .A(n2129), .B(acc[1]), .C(sync3_d), .D(phase[1]), .Z(n1875)
         );
  CND2XL U2293 ( .A(n1877), .B(n2128), .Z(n1879) );
  CANR2XL U2294 ( .A(n2129), .B(acc[0]), .C(n2175), .D(phase[0]), .Z(n1878) );
  CND2XL U2295 ( .A(n1880), .B(n2128), .Z(n1882) );
  CANR2XL U2296 ( .A(n2129), .B(acc[2]), .C(sync3_d), .D(phase[2]), .Z(n1881)
         );
  CANR2XL U2297 ( .A(n2129), .B(n793), .C(n2175), .D(phase[7]), .Z(n1883) );
  CND2XL U2298 ( .A(n441), .B(n2128), .Z(n1887) );
  CANR2XL U2299 ( .A(n2129), .B(acc[3]), .C(sync3_d), .D(phase[3]), .Z(n1886)
         );
  CND2XL U2300 ( .A(n1888), .B(n2128), .Z(n1890) );
  CANR2XL U2301 ( .A(n2129), .B(acc[6]), .C(n2175), .D(phase[6]), .Z(n1889) );
  CND2XL U2302 ( .A(dout[30]), .B(n2168), .Z(n1894) );
  CANR2XL U2303 ( .A(n2169), .B(phase_d[30]), .C(n2167), .D(freq_d[30]), .Z(
        n1893) );
  CND2XL U2304 ( .A(dout[29]), .B(n2168), .Z(n1896) );
  CANR2XL U2305 ( .A(n2169), .B(phase_d[29]), .C(n2167), .D(freq_d[29]), .Z(
        n1895) );
  CND2XL U2306 ( .A(dout[27]), .B(n2168), .Z(n1898) );
  CANR2XL U2307 ( .A(n2169), .B(phase_d[27]), .C(n2167), .D(freq_d[27]), .Z(
        n1897) );
  CND2XL U2308 ( .A(dout[31]), .B(n2168), .Z(n1900) );
  CANR2XL U2309 ( .A(n2169), .B(phase_d[31]), .C(n2167), .D(freq_d[31]), .Z(
        n1899) );
  CND2XL U2310 ( .A(dout[4]), .B(n2168), .Z(n1902) );
  CANR2XL U2311 ( .A(n2169), .B(phase_d[4]), .C(n2167), .D(freq_d[4]), .Z(
        n1901) );
  CND2XL U2312 ( .A(dout[28]), .B(n2168), .Z(n1904) );
  CANR2XL U2313 ( .A(n2169), .B(phase_d[28]), .C(n2167), .D(freq_d[28]), .Z(
        n1903) );
  CND2XL U2314 ( .A(dout[6]), .B(n2168), .Z(n1906) );
  CANR2XL U2315 ( .A(n2169), .B(phase_d[6]), .C(n2167), .D(freq_d[6]), .Z(
        n1905) );
  CND2XL U2316 ( .A(dout[7]), .B(n2168), .Z(n1908) );
  CANR2XL U2317 ( .A(n2169), .B(phase_d[7]), .C(n2167), .D(freq_d[7]), .Z(
        n1907) );
  CAN2X1 U2318 ( .A(s2t2[0]), .B(s2t2[1]), .Z(n1911) );
  CEOX1 U2319 ( .A(s2t2[2]), .B(n1911), .Z(n1910) );
  CMX4XL U2320 ( .A0(g2[2]), .A1(g2[6]), .A2(g2[0]), .A3(g2[4]), .S0(n1910), 
        .S1(n1909), .Z(n1915) );
  CMX4XL U2321 ( .A0(g2[3]), .A1(g2[7]), .A2(g2[1]), .A3(g2[5]), .S0(n1910), 
        .S1(n1909), .Z(n1914) );
  CNR2X1 U2322 ( .A(n1911), .B(s2t2[2]), .Z(n1912) );
  CEOX1 U2323 ( .A(n1912), .B(s2t2[3]), .Z(n1913) );
  CMX4XL U2324 ( .A0(n1915), .A1(g2[8]), .A2(n1914), .A3(g2[9]), .S0(n1913), 
        .S1(s2t2[0]), .Z(n1916) );
  CEOX1 U2325 ( .A(s1t2[0]), .B(s1t2[1]), .Z(n1918) );
  CAN2X1 U2326 ( .A(s1t2[0]), .B(s1t2[1]), .Z(n1919) );
  CEOX1 U2327 ( .A(s1t2[2]), .B(n1919), .Z(n1917) );
  CMX4XL U2328 ( .A0(g2[2]), .A1(g2[0]), .A2(g2[6]), .A3(g2[4]), .S0(n1918), 
        .S1(n1917), .Z(n1923) );
  CMX4XL U2329 ( .A0(g2[3]), .A1(g2[1]), .A2(g2[7]), .A3(g2[5]), .S0(n1918), 
        .S1(n1917), .Z(n1922) );
  CNR2X1 U2330 ( .A(n1919), .B(s1t2[2]), .Z(n1920) );
  CEOX1 U2331 ( .A(n1920), .B(s1t2[3]), .Z(n1921) );
  CMX4XL U2332 ( .A0(n1923), .A1(n1922), .A2(g2[8]), .A3(g2[9]), .S0(s1t2[0]), 
        .S1(n1921), .Z(n1924) );
  CENX1 U2333 ( .A(g1[0]), .B(n1924), .Z(n1925) );
  CND2XL U2334 ( .A(dout[5]), .B(n2168), .Z(n1928) );
  CANR2XL U2335 ( .A(n2169), .B(phase_d[5]), .C(n2167), .D(freq_d[5]), .Z(
        n1927) );
  CND2XL U2336 ( .A(dout[23]), .B(n2168), .Z(n1930) );
  CANR2XL U2337 ( .A(n2169), .B(phase_d[23]), .C(n2167), .D(freq_d[23]), .Z(
        n1929) );
  CND2XL U2338 ( .A(dout[25]), .B(n2168), .Z(n1932) );
  CANR2XL U2339 ( .A(n2169), .B(phase_d[25]), .C(n2167), .D(freq_d[25]), .Z(
        n1931) );
  CND2XL U2340 ( .A(dout[21]), .B(n2168), .Z(n1934) );
  CANR2XL U2341 ( .A(n2169), .B(phase_d[21]), .C(n2167), .D(freq_d[21]), .Z(
        n1933) );
  CND2XL U2342 ( .A(dout[19]), .B(n2168), .Z(n1936) );
  CANR2XL U2343 ( .A(n2169), .B(phase_d[19]), .C(n2167), .D(freq_d[19]), .Z(
        n1935) );
  CND2XL U2344 ( .A(dout[20]), .B(n2168), .Z(n1938) );
  CANR2XL U2345 ( .A(n2169), .B(phase_d[20]), .C(n2167), .D(freq_d[20]), .Z(
        n1937) );
  CND2XL U2346 ( .A(dout[26]), .B(n2168), .Z(n1941) );
  CANR2XL U2347 ( .A(n2169), .B(phase_d[26]), .C(n2167), .D(n1939), .Z(n1940)
         );
  CND2XL U2348 ( .A(dout[18]), .B(n2168), .Z(n1943) );
  CANR2XL U2349 ( .A(n2169), .B(phase_d[18]), .C(n2167), .D(freq_d[18]), .Z(
        n1942) );
  CND2XL U2350 ( .A(dout[16]), .B(n2168), .Z(n1945) );
  CANR2XL U2351 ( .A(n2169), .B(phase_d[16]), .C(n2167), .D(freq_d[16]), .Z(
        n1944) );
  CND2XL U2352 ( .A(dout[17]), .B(n2168), .Z(n1947) );
  CANR2XL U2353 ( .A(n2169), .B(phase_d[17]), .C(n2167), .D(freq_d[17]), .Z(
        n1946) );
  CND2XL U2354 ( .A(dout[8]), .B(n2168), .Z(n1949) );
  CANR2XL U2355 ( .A(n2169), .B(phase_d[8]), .C(n2167), .D(freq_d[8]), .Z(
        n1948) );
  CND2XL U2356 ( .A(dout[15]), .B(n2168), .Z(n1951) );
  CANR2XL U2357 ( .A(n2169), .B(phase_d[15]), .C(n2167), .D(freq_d[15]), .Z(
        n1950) );
  CND2XL U2358 ( .A(dout[22]), .B(n2168), .Z(n1953) );
  CANR2XL U2359 ( .A(n2169), .B(phase_d[22]), .C(n2167), .D(freq_d[22]), .Z(
        n1952) );
  CND2XL U2360 ( .A(dout[9]), .B(n2168), .Z(n1955) );
  CANR2XL U2361 ( .A(n2169), .B(phase_d[9]), .C(n2167), .D(freq_d[9]), .Z(
        n1954) );
  CND2XL U2362 ( .A(dout[12]), .B(n2168), .Z(n1957) );
  CANR2XL U2363 ( .A(n2169), .B(phase_d[12]), .C(n2167), .D(freq_d[12]), .Z(
        n1956) );
  CND2XL U2364 ( .A(dout[11]), .B(n2168), .Z(n1959) );
  CANR2XL U2365 ( .A(n2169), .B(phase_d[11]), .C(n2167), .D(freq_d[11]), .Z(
        n1958) );
  CND2XL U2366 ( .A(dout[10]), .B(n2168), .Z(n1961) );
  CANR2XL U2367 ( .A(n2169), .B(phase_d[10]), .C(n2167), .D(freq_d[10]), .Z(
        n1960) );
  CND2XL U2368 ( .A(dout[24]), .B(n2168), .Z(n1963) );
  CANR2XL U2369 ( .A(n2169), .B(phase_d[24]), .C(n2167), .D(freq_d[24]), .Z(
        n1962) );
  CND2XL U2370 ( .A(dout[14]), .B(n2168), .Z(n1965) );
  CANR2XL U2371 ( .A(n2169), .B(phase_d[14]), .C(n2167), .D(freq_d[14]), .Z(
        n1964) );
  CND2XL U2372 ( .A(dout[13]), .B(n2168), .Z(n1967) );
  CANR2XL U2373 ( .A(n2169), .B(phase_d[13]), .C(n2167), .D(freq_d[13]), .Z(
        n1966) );
  CND2XL U2374 ( .A(n2181), .B(n1968), .Z(n1970) );
  CND2XL U2375 ( .A(n1970), .B(n1969), .Z(n342) );
  CND2XL U2376 ( .A(n2181), .B(n1971), .Z(n1973) );
  CND2XL U2377 ( .A(n1973), .B(n1972), .Z(n346) );
  CND2XL U2378 ( .A(n2181), .B(n1974), .Z(n1976) );
  CND2XL U2379 ( .A(n1976), .B(n1975), .Z(n340) );
  CND2XL U2380 ( .A(n2181), .B(n1977), .Z(n1979) );
  CND2XL U2381 ( .A(n1979), .B(n1978), .Z(n345) );
  CND2XL U2382 ( .A(n2181), .B(n1980), .Z(n1982) );
  CND2XL U2383 ( .A(n1982), .B(n1981), .Z(n344) );
  CND2XL U2384 ( .A(n2181), .B(n1983), .Z(n1985) );
  CND2XL U2385 ( .A(n1985), .B(n1984), .Z(n343) );
  CIVXL U2386 ( .A(n467), .Z(n1987) );
  CND2XL U2387 ( .A(n1986), .B(n1987), .Z(n1989) );
  CENXL U2388 ( .A(n1989), .B(n1988), .Z(n1990) );
  CANR2XL U2389 ( .A(n2129), .B(n439), .C(sync3_d), .D(phase[8]), .Z(n1991) );
  CND2XL U2390 ( .A(n1993), .B(n2033), .Z(n1995) );
  CEOXL U2391 ( .A(n1995), .B(n2034), .Z(n1996) );
  CANR2XL U2392 ( .A(n2129), .B(n1997), .C(n2175), .D(phase[9]), .Z(n1998) );
  CIVXL U2393 ( .A(n2000), .Z(n2003) );
  CIVXL U2394 ( .A(n2001), .Z(n2002) );
  COND1X1 U2395 ( .A(n2003), .B(n2034), .C(n2002), .Z(n2006) );
  CND2X1 U2396 ( .A(n792), .B(n2004), .Z(n2005) );
  CENX1 U2397 ( .A(n2006), .B(n2005), .Z(n2007) );
  CND2X1 U2398 ( .A(n2007), .B(n2128), .Z(n2009) );
  CANR2XL U2399 ( .A(n2129), .B(acc[12]), .C(sync3_d), .D(phase[12]), .Z(n2008) );
  CND2X1 U2400 ( .A(n2009), .B(n2008), .Z(n368) );
  COND1X1 U2401 ( .A(n2011), .B(n2034), .C(n2010), .Z(n2017) );
  CNIVX1 U2402 ( .A(n2012), .Z(n2015) );
  CIVXL U2403 ( .A(n2013), .Z(n2014) );
  CND2X1 U2404 ( .A(n2015), .B(n2014), .Z(n2016) );
  CENX1 U2405 ( .A(n2017), .B(n2016), .Z(n2018) );
  CND2X1 U2406 ( .A(n2018), .B(n2128), .Z(n2021) );
  CANR2XL U2407 ( .A(n2129), .B(n2019), .C(sync3_d), .D(phase[13]), .Z(n2020)
         );
  CND2X1 U2408 ( .A(n2021), .B(n2020), .Z(n367) );
  COND1X1 U2409 ( .A(n2023), .B(n2034), .C(n2022), .Z(n2028) );
  CIVXL U2410 ( .A(n2024), .Z(n2026) );
  CND2XL U2411 ( .A(n2026), .B(n2025), .Z(n2027) );
  CENX1 U2412 ( .A(n2028), .B(n2027), .Z(n2029) );
  CND2X1 U2413 ( .A(n2029), .B(n2128), .Z(n2032) );
  CANR2XL U2414 ( .A(n2129), .B(n2030), .C(sync3_d), .D(phase[11]), .Z(n2031)
         );
  CND2X1 U2415 ( .A(n2032), .B(n2031), .Z(n369) );
  COND1X1 U2416 ( .A(n2035), .B(n2034), .C(n2033), .Z(n2038) );
  CND2X1 U2417 ( .A(n790), .B(n2036), .Z(n2037) );
  CENX1 U2418 ( .A(n2038), .B(n2037), .Z(n2039) );
  CND2X1 U2419 ( .A(n2039), .B(n2128), .Z(n2041) );
  CANR2XL U2420 ( .A(n2129), .B(n478), .C(sync3_d), .D(phase[10]), .Z(n2040)
         );
  CND2X1 U2421 ( .A(n2041), .B(n2040), .Z(n370) );
  CANR2XL U2422 ( .A(n2129), .B(n2046), .C(n2175), .D(phase[14]), .Z(n2047) );
  CIVXL U2423 ( .A(n2097), .Z(n2049) );
  CND2XL U2424 ( .A(n2049), .B(n2096), .Z(n2050) );
  CANR2XL U2425 ( .A(n2129), .B(acc[17]), .C(sync3_d), .D(phase[17]), .Z(n2052) );
  CIVXL U2426 ( .A(n2056), .Z(n2057) );
  CANR2XL U2427 ( .A(n2129), .B(n778), .C(n2175), .D(phase[15]), .Z(n2061) );
  CEOXL U2428 ( .A(n2067), .B(n2066), .Z(n2068) );
  CND2XL U2429 ( .A(n2068), .B(n2128), .Z(n2070) );
  CANR2XL U2430 ( .A(n2129), .B(acc[16]), .C(n2175), .D(phase[16]), .Z(n2069)
         );
  CND2X1 U2431 ( .A(n2079), .B(n2071), .Z(n2073) );
  CANR1XL U2432 ( .A(n2071), .B(n2080), .C(n401), .Z(n2072) );
  COND1X1 U2433 ( .A(n2073), .B(n2110), .C(n2072), .Z(n2076) );
  CANR2XL U2434 ( .A(n2129), .B(acc[20]), .C(sync3_d), .D(phase[20]), .Z(n2077) );
  CANR2XL U2435 ( .A(n2129), .B(n532), .C(sync3_d), .D(phase[19]), .Z(n2085)
         );
  CIVXL U2436 ( .A(n2108), .Z(n2100) );
  CIVXL U2437 ( .A(n2112), .Z(n2087) );
  COND1X1 U2438 ( .A(n2089), .B(n2110), .C(n2088), .Z(n2092) );
  CND2XL U2439 ( .A(n575), .B(n2090), .Z(n2091) );
  CANR2XL U2440 ( .A(n2129), .B(n457), .C(sync3_d), .D(phase[18]), .Z(n2099)
         );
  CANR2XL U2441 ( .A(n2129), .B(acc[23]), .C(n2175), .D(phase[23]), .Z(n2107)
         );
  CNIVXL U2442 ( .A(n2108), .Z(n2111) );
  COND1X1 U2443 ( .A(n2111), .B(n2110), .C(n2109), .Z(n2114) );
  CANR2XL U2444 ( .A(n2129), .B(acc[21]), .C(sync3_d), .D(phase[21]), .Z(n2115) );
  CIVXL U2445 ( .A(n2123), .Z(n2117) );
  CND2XL U2446 ( .A(n2118), .B(n2128), .Z(n2120) );
  CANR2XL U2447 ( .A(n2129), .B(acc[24]), .C(n2175), .D(phase[24]), .Z(n2119)
         );
  CIVXL U2448 ( .A(n2124), .Z(n2126) );
  CANR2XL U2449 ( .A(n2129), .B(n465), .C(n2175), .D(phase[25]), .Z(n2130) );
  CIVXL U2450 ( .A(flag1_d), .Z(n2137) );
  CENX1 U2451 ( .A(g2[2]), .B(g2[0]), .Z(n2131) );
  CENX1 U2452 ( .A(n2132), .B(n2131), .Z(n2134) );
  CENX1 U2453 ( .A(n2134), .B(n2133), .Z(n2136) );
  CANR1XL U2454 ( .A(g2[9]), .B(n2137), .C(sync4_d), .Z(n2135) );
  COND1XL U2455 ( .A(n2137), .B(n2136), .C(n2135), .Z(n328) );
  CENX1 U2456 ( .A(g1[0]), .B(g1[7]), .Z(n2138) );
  CND2IXL U2457 ( .B(n2138), .A(flag1_d), .Z(n2139) );
  CND3XL U2458 ( .A(n2141), .B(n2140), .C(n2139), .Z(n318) );
  CND2XL U2459 ( .A(n2149), .B(count1_d[0]), .Z(n2142) );
  COND11XL U2460 ( .A(count1_d[0]), .B(n2146), .C(n2151), .D(n2142), .Z(n348)
         );
  COND1XL U2461 ( .A(n2144), .B(n2151), .C(n2143), .Z(n341) );
  CND2XL U2462 ( .A(n2149), .B(count1_d[1]), .Z(n2147) );
  COND1XL U2463 ( .A(n2148), .B(n2151), .C(n2147), .Z(n347) );
  COND1XL U2464 ( .A(n2152), .B(n2151), .C(n2150), .Z(n339) );
  CND2XL U2465 ( .A(n2153), .B(push_corr), .Z(n2154) );
  CND2XL U2466 ( .A(n2155), .B(n2154), .Z(n317) );
  CND2XL U2467 ( .A(n2165), .B(s2_d[3]), .Z(n2158) );
  CANR2XL U2468 ( .A(freq_d[3]), .B(n2167), .C(n2166), .D(s1_d[3]), .Z(n2157)
         );
  CANR2XL U2469 ( .A(n2169), .B(phase_d[3]), .C(dout[3]), .D(n2168), .Z(n2156)
         );
  CND3XL U2470 ( .A(n2158), .B(n2157), .C(n2156), .Z(n288) );
  CND2XL U2471 ( .A(n2165), .B(s2_d[2]), .Z(n2161) );
  CANR2XL U2472 ( .A(freq_d[2]), .B(n2167), .C(n2166), .D(s1_d[2]), .Z(n2160)
         );
  CANR2XL U2473 ( .A(n2169), .B(phase_d[2]), .C(dout[2]), .D(n2168), .Z(n2159)
         );
  CND3XL U2474 ( .A(n2161), .B(n2160), .C(n2159), .Z(n287) );
  CND2XL U2475 ( .A(n2165), .B(s2_d[1]), .Z(n2164) );
  CANR2XL U2476 ( .A(freq_d[1]), .B(n2167), .C(n2166), .D(s1_d[1]), .Z(n2163)
         );
  CANR2XL U2477 ( .A(n2169), .B(phase_d[1]), .C(dout[1]), .D(n2168), .Z(n2162)
         );
  CND3XL U2478 ( .A(n2164), .B(n2163), .C(n2162), .Z(n286) );
  CND2XL U2479 ( .A(n2165), .B(s2_d[0]), .Z(n2172) );
  CANR2XL U2480 ( .A(freq_d[0]), .B(n2167), .C(n2166), .D(s1_d[0]), .Z(n2171)
         );
  CANR2XL U2481 ( .A(n2169), .B(phase_d[0]), .C(dout[0]), .D(n2168), .Z(n2170)
         );
  CND3XL U2482 ( .A(n2172), .B(n2171), .C(n2170), .Z(n285) );
endmodule

