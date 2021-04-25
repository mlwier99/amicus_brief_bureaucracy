set more off 

use ".\Data\Bureaucracy_Amicus_Brief\Master_specific.dta", clear 

import excel ".\Data\Bureaucracy_Amicus_Brief\Stata_Import.xlsx", sheet("Sheet1") firstrow clear

drop AA AB AC AD AE AF
drop if agency==.

replace PartyBalancing="" if PartyBalancing=="."
replace PartyBalancing="" if PartyBalancing=="."
destring PartyBalancing, generate(party_bal)
rename NoncareerSES noncareerses
rename CareerSES careerses
rename TotalSES totalses
rename SchedA sch_a
rename SchedB sch_b
rename SchedC sch_c
rename OtherSES otherses
rename PAS pas
rename Indpendent indp
rename IndpLit ind_lit
rename Rulemaking rulemaking
lab var emps "Total Employees"
lab var managers "Total Managers" 
lab var pas "Senate-Confirmed Appontees" 

*Ideological differences to drop later 
gen ideol_diff_ac = abs( agency_ideol- circuit_ideol_dm1)
gen ideol_diff_ap = abs( agency_ideol- pres_ideol_dm1)
gen ideol_diff_cp = abs( circuit_ideol_dm1 - pres_ideol_dm1)

drop ideol_diff_ac ideol_diff_ap ideol_diff_cp

*generating polarization measures 
gen managers_emps = (manager/emps)*100
gen app_emps_loose = (( totalses + sch_c + sch_b + sch_a )/emps)*100
gen app_emps_strict = (( noncareerses + sch_c)/emps)*100
gen app_emps_ses = (( totalses)/emps)*100
gen app_emps_abc = (( sch_c + sch_b + sch_a )/emps)*100
gen app_emps_loose_pas = (( pas + totalses + sch_c + sch_b + sch_a )/emps)*100
gen app_emps_strict_pas = (( pas + noncareerses + sch_c)/emps)*100

gen political_strict = managers_emps - app_emps_strict
gen political_loose = managers_emps - app_emps_loose
gen political_strict_pas = managers_emps - app_emps_strict_pas
gen political_loose_pas= managers_emps - app_emps_loose_pas
lab var political_loose "Perc of managers to all appointees" 
lab var political_loose_pas "Perc of managers to all appointees, with PAS" 
lab var political_strict "Perc of managers to noncareer and schedule C" 
lab var political_strict_pas "Perc of managers to noncareer and schedule C, with PAS" 
drop managers_emps app_emps_loose app_emps_strict app_emps_ses app_emps_abc app_emps_strict_pas app_emps_strict_pas app_emps_loose_pas

*generating agency age 
gen agency_age = .
label variable agency_age "Age of the Agency/Division" 

*dropping the Employee Standards Division duplicates
drop if agency==5 & year<2011
drop if agency==6 & year<2011
*ID Numbers: the first digit is the agency ID number. The circuit is denotated by the second digits (or second+third). Ex: 101 is tenth circuit, eeoc. 124 is twelth circuit, sec. 
gen int id_num = 000
replace id_num= id_num + 100 if circuit==1
replace id_num= id_num + 200 if circuit==2
replace id_num= id_num + 300 if circuit==3
replace id_num= id_num + 400 if circuit==4
replace id_num= id_num + 500 if circuit==5
replace id_num= id_num + 600 if circuit==6
replace id_num= id_num + 700 if circuit==7
replace id_num= id_num + 800 if circuit==8
replace id_num= id_num + 900 if circuit==9
replace id_num= id_num + 1000 if circuit==10
replace id_num= id_num + 1100 if circuit==11
replace id_num= id_num + 1200 if circuit==12
replace id_num= id_num + 1300 if circuit==13
replace id_num= id_num + 1 if agency==1
replace id_num= id_num + 2 if agency==2
replace id_num= id_num + 3 if agency==3
replace id_num= id_num + 4 if agency==4
replace id_num= id_num + 5 if agency==5
replace id_num= id_num + 6 if agency==6
replace id_num= id_num + 7 if agency==7
replace id_num= id_num + 8 if agency==8
replace id_num= id_num + 9 if agency==9
replace id_num= id_num + 10 if agency==10
replace id_num= id_num + 11 if agency==11
replace id_num = id_num + 12 if agency==12


hist total if agency==1 | agency==2 | agency==3 | agency==4 | agency==10, bin(8)
xtset id_num year, yearly


rename general_caseload filed_cases
gen pending_caseload = .
gen term_caseload =.
replace pending_caseload=	1265	  if year==	2000	& circuit==	12
replace pending_caseload=	1233	  if year==	2000	& circuit==	1
replace pending_caseload=	3342	  if year==	2000	& circuit==	2
replace pending_caseload=	2759	  if year==	2000	& circuit==	3
replace pending_caseload=	2472	  if year==	2000	& circuit==	4
replace pending_caseload=	4815	  if year==	2000	& circuit==	5
replace pending_caseload=	3997	  if year==	2000	& circuit==	6
replace pending_caseload=	2359	  if year==	2000	& circuit==	7
replace pending_caseload=	2075	  if year==	2000	& circuit==	8
replace pending_caseload=	9394	  if year==	2000	& circuit==	9
replace pending_caseload=	2020	  if year==	2000	& circuit==	10
replace pending_caseload=	5179	  if year==	2000	& circuit==	11
replace pending_caseload=	1319	  if year==	2001	& circuit==	12
replace pending_caseload=	1392	  if year==	2001	& circuit==	1
replace pending_caseload=	3677	  if year==	2001	& circuit==	2
replace pending_caseload=	3154	  if year==	2001	& circuit==	3
replace pending_caseload=	2612	  if year==	2001	& circuit==	4
replace pending_caseload=	4745	  if year==	2001	& circuit==	5
replace pending_caseload=	4214	  if year==	2001	& circuit==	6
replace pending_caseload=	1943	  if year==	2001	& circuit==	7
replace pending_caseload=	1857	  if year==	2001	& circuit==	8
replace pending_caseload=	9655	  if year==	2001	& circuit==	9
replace pending_caseload=	1915	  if year==	2001	& circuit==	10
replace pending_caseload=	4126	  if year==	2001	& circuit==	11
replace pending_caseload=	1188	  if year==	2002	& circuit==	12
replace pending_caseload=	1316	  if year==	2002	& circuit==	1
replace pending_caseload=	4042	  if year==	2002	& circuit==	2
replace pending_caseload=	3154	  if year==	2002	& circuit==	3
replace pending_caseload=	2431	  if year==	2002	& circuit==	4
replace pending_caseload=	4818	  if year==	2002	& circuit==	5
replace pending_caseload=	4005	  if year==	2002	& circuit==	6
replace pending_caseload=	2022	  if year==	2002	& circuit==	7
replace pending_caseload=	1508	  if year==	2002	& circuit==	8
replace pending_caseload=	9159	  if year==	2002	& circuit==	9
replace pending_caseload=	1987	  if year==	2002	& circuit==	10
replace pending_caseload=	3618	  if year==	2002	& circuit==	11
replace pending_caseload=	1001	  if year==	2003	& circuit==	12
replace pending_caseload=	1395	  if year==	2003	& circuit==	1
replace pending_caseload=	5801	  if year==	2003	& circuit==	2
replace pending_caseload=	3067	  if year==	2003	& circuit==	3
replace pending_caseload=	2385	  if year==	2003	& circuit==	4
replace pending_caseload=	4743	  if year==	2003	& circuit==	5
replace pending_caseload=	4206	  if year==	2003	& circuit==	6
replace pending_caseload=	2187	  if year==	2003	& circuit==	7
replace pending_caseload=	1758	  if year==	2003	& circuit==	8
replace pending_caseload=	10855	  if year==	2003	& circuit==	9
replace pending_caseload=	1994	  if year==	2003	& circuit==	10
replace pending_caseload=	3324	  if year==	2003	& circuit==	11
replace pending_caseload=	1102	  if year==	2004	& circuit==	12
replace pending_caseload=	1541	  if year==	2004	& circuit==	1
replace pending_caseload=	8332	  if year==	2004	& circuit==	2
replace pending_caseload=	3085	  if year==	2004	& circuit==	3
replace pending_caseload=	2610	  if year==	2004	& circuit==	4
replace pending_caseload=	4413	  if year==	2004	& circuit==	5
replace pending_caseload=	4459	  if year==	2004	& circuit==	6
replace pending_caseload=	2272	  if year==	2004	& circuit==	7
replace pending_caseload=	1833	  if year==	2004	& circuit==	8
replace pending_caseload=	12205	  if year==	2004	& circuit==	9
replace pending_caseload=	1935	  if year==	2004	& circuit==	10
replace pending_caseload=	3189	  if year==	2004	& circuit==	11
replace pending_caseload=	1313	  if year==	2005	& circuit==	12
replace pending_caseload=	1648	  if year==	2005	& circuit==	1
replace pending_caseload=	9857	  if year==	2005	& circuit==	2
replace pending_caseload=	3287	  if year==	2005	& circuit==	3
replace pending_caseload=	3030	  if year==	2005	& circuit==	4
replace pending_caseload=	5721	  if year==	2005	& circuit==	5
replace pending_caseload=	4498	  if year==	2005	& circuit==	6
replace pending_caseload=	2400	  if year==	2005	& circuit==	7
replace pending_caseload=	2331	  if year==	2005	& circuit==	8
replace pending_caseload=	14899	  if year==	2005	& circuit==	9
replace pending_caseload=	2329	  if year==	2005	& circuit==	10
replace pending_caseload=	3905	  if year==	2005	& circuit==	11
replace pending_caseload=	1504	  if year==	2006	& circuit==	12
replace pending_caseload=	1631	  if year==	2006	& circuit==	1
replace pending_caseload=	8739	  if year==	2006	& circuit==	2
replace pending_caseload=	3736	  if year==	2006	& circuit==	3
replace pending_caseload=	3211	  if year==	2006	& circuit==	4
replace pending_caseload=	7108	  if year==	2006	& circuit==	5
replace pending_caseload=	4675	  if year==	2006	& circuit==	6
replace pending_caseload=	2254	  if year==	2006	& circuit==	7
replace pending_caseload=	2278	  if year==	2006	& circuit==	8
replace pending_caseload=	17274	  if year==	2006	& circuit==	9
replace pending_caseload=	2270	  if year==	2006	& circuit==	10
replace pending_caseload=	3809	  if year==	2006	& circuit==	11
replace pending_caseload=	1441	  if year==	2007	& circuit==	12
replace pending_caseload=	1574	  if year==	2007	& circuit==	1
replace pending_caseload=	6146	  if year==	2007	& circuit==	2
replace pending_caseload=	3896	  if year==	2007	& circuit==	3
replace pending_caseload=	2922	  if year==	2007	& circuit==	4
replace pending_caseload=	6394	  if year==	2007	& circuit==	5
replace pending_caseload=	4474	  if year==	2007	& circuit==	6
replace pending_caseload=	2115	  if year==	2007	& circuit==	7
replace pending_caseload=	2049	  if year==	2007	& circuit==	8
replace pending_caseload=	16849	  if year==	2007	& circuit==	9
replace pending_caseload=	2030	  if year==	2007	& circuit==	10
replace pending_caseload=	3195	  if year==	2007	& circuit==	11
replace pending_caseload=	1542	  if year==	2008	& circuit==	12
replace pending_caseload=	1497	  if year==	2008	& circuit==	1
replace pending_caseload=	6136	  if year==	2008	& circuit==	2
replace pending_caseload=	3719	  if year==	2008	& circuit==	3
replace pending_caseload=	2719	  if year==	2008	& circuit==	4
replace pending_caseload=	4937	  if year==	2008	& circuit==	5
replace pending_caseload=	4278	  if year==	2008	& circuit==	6
replace pending_caseload=	2254	  if year==	2008	& circuit==	7
replace pending_caseload=	1999	  if year==	2008	& circuit==	8
replace pending_caseload=	16774	  if year==	2008	& circuit==	9
replace pending_caseload=	1885	  if year==	2008	& circuit==	10
replace pending_caseload=	3279	  if year==	2008	& circuit==	11
replace pending_caseload=	1412	  if year==	2009	& circuit==	12
replace pending_caseload=	1564	  if year==	2009	& circuit==	1
replace pending_caseload=	5415	  if year==	2009	& circuit==	2
replace pending_caseload=	3709	  if year==	2009	& circuit==	3
replace pending_caseload=	3305	  if year==	2009	& circuit==	4
replace pending_caseload=	5127	  if year==	2009	& circuit==	5
replace pending_caseload=	4224	  if year==	2009	& circuit==	6
replace pending_caseload=	2302	  if year==	2009	& circuit==	7
replace pending_caseload=	1986	  if year==	2009	& circuit==	8
replace pending_caseload=	17208	  if year==	2009	& circuit==	9
replace pending_caseload=	1638	  if year==	2009	& circuit==	10
replace pending_caseload=	3673	  if year==	2009	& circuit==	11
replace pending_caseload=	1379	  if year==	2010	& circuit==	12
replace pending_caseload=	1360	  if year==	2010	& circuit==	1
replace pending_caseload=	4294	  if year==	2010	& circuit==	2
replace pending_caseload=	3152	  if year==	2010	& circuit==	3
replace pending_caseload=	3143	  if year==	2010	& circuit==	4
replace pending_caseload=	4639	  if year==	2010	& circuit==	5
replace pending_caseload=	4699	  if year==	2010	& circuit==	6
replace pending_caseload=	2083	  if year==	2010	& circuit==	7
replace pending_caseload=	1632	  if year==	2010	& circuit==	8
replace pending_caseload=	15907	  if year==	2010	& circuit==	9
replace pending_caseload=	1592	  if year==	2010	& circuit==	10
replace pending_caseload=	3540	  if year==	2010	& circuit==	11
replace pending_caseload=	1287	  if year==	2011	& circuit==	12
replace pending_caseload=	1198	  if year==	2011	& circuit==	1
replace pending_caseload=	4382	  if year==	2011	& circuit==	2
replace pending_caseload=	2636	  if year==	2011	& circuit==	3
replace pending_caseload=	2912	  if year==	2011	& circuit==	4
replace pending_caseload=	4568	  if year==	2011	& circuit==	5
replace pending_caseload=	5252	  if year==	2011	& circuit==	6
replace pending_caseload=	1933	  if year==	2011	& circuit==	7
replace pending_caseload=	1389	  if year==	2011	& circuit==	8
replace pending_caseload=	14111	  if year==	2011	& circuit==	9
replace pending_caseload=	1330	  if year==	2011	& circuit==	10
replace pending_caseload=	3949	  if year==	2011	& circuit==	11
replace pending_caseload=	1369	  if year==	2012	& circuit==	12
replace pending_caseload=	1248	  if year==	2012	& circuit==	1
replace pending_caseload=	4886	  if year==	2012	& circuit==	2
replace pending_caseload=	2305	  if year==	2012	& circuit==	3
replace pending_caseload=	2562	  if year==	2012	& circuit==	4
replace pending_caseload=	4571	  if year==	2012	& circuit==	5
replace pending_caseload=	4518	  if year==	2012	& circuit==	6
replace pending_caseload=	1926	  if year==	2012	& circuit==	7
replace pending_caseload=	1438	  if year==	2012	& circuit==	8
replace pending_caseload=	14100	  if year==	2012	& circuit==	9
replace pending_caseload=	1401	  if year==	2012	& circuit==	10
replace pending_caseload=	3790	  if year==	2012	& circuit==	11

replace term_caseload=	1597	 if year==	2000	& circuit==	12
replace term_caseload=	1382	 if year==	2000	& circuit==	1
replace term_caseload=	4750	 if year==	2000	& circuit==	2
replace term_caseload=	3187	 if year==	2000	& circuit==	3
replace term_caseload=	4832	 if year==	2000	& circuit==	4
replace term_caseload=	8692	 if year==	2000	& circuit==	5
replace term_caseload=	5066	 if year==	2000	& circuit==	6
replace term_caseload=	3358	 if year==	2000	& circuit==	7
replace term_caseload=	3202	 if year==	2000	& circuit==	8
replace term_caseload=	8777	 if year==	2000	& circuit==	9
replace term_caseload=	2637	 if year==	2000	& circuit==	10
replace term_caseload=	8198	 if year==	2000	& circuit==	11
replace term_caseload=	1363	 if year==	2001	& circuit==	12
replace term_caseload=	1452	 if year==	2001	& circuit==	1
replace term_caseload=	4362	 if year==	2001	& circuit==	2
replace term_caseload=	3251	 if year==	2001	& circuit==	3
replace term_caseload=	4730	 if year==	2001	& circuit==	4
replace term_caseload=	8649	 if year==	2001	& circuit==	5
replace term_caseload=	4801	 if year==	2001	& circuit==	6
replace term_caseload=	3783	 if year==	2001	& circuit==	7
replace term_caseload=	3188	 if year==	2001	& circuit==	8
replace term_caseload=	9569	 if year==	2001	& circuit==	9
replace term_caseload=	2842	 if year==	2001	& circuit==	10
replace term_caseload=	8220	 if year==	2001	& circuit==	11
replace term_caseload=	1424	 if year==	2002	& circuit==	12
replace term_caseload=	1741	 if year==	2002	& circuit==	1
replace term_caseload=	4174	 if year==	2002	& circuit==	2
replace term_caseload=	3707	 if year==	2002	& circuit==	3
replace term_caseload=	5356	 if year==	2002	& circuit==	4
replace term_caseload=	8561	 if year==	2002	& circuit==	5
replace term_caseload=	4882	 if year==	2002	& circuit==	6
replace term_caseload=	3375	 if year==	2002	& circuit==	7
replace term_caseload=	3441	 if year==	2002	& circuit==	8
replace term_caseload=	10164	 if year==	2002	& circuit==	9
replace term_caseload=	2630	 if year==	2002	& circuit==	10
replace term_caseload=	8152	 if year==	2002	& circuit==	11
replace term_caseload=	1264	 if year==	2003	& circuit==	12
replace term_caseload=	1534	 if year==	2003	& circuit==	1
replace term_caseload=	4118	 if year==	2003	& circuit==	2
replace term_caseload=	3824	 if year==	2003	& circuit==	3
replace term_caseload=	4815	 if year==	2003	& circuit==	4
replace term_caseload=	8844	 if year==	2003	& circuit==	5
replace term_caseload=	4527	 if year==	2003	& circuit==	6
replace term_caseload=	3355	 if year==	2003	& circuit==	7
replace term_caseload=	2984	 if year==	2003	& circuit==	8
replace term_caseload=	10766	 if year==	2003	& circuit==	9
replace term_caseload=	2633	 if year==	2003	& circuit==	10
replace term_caseload=	7620	 if year==	2003	& circuit==	11
replace term_caseload=	1162	 if year==	2004	& circuit==	12
replace term_caseload=	1635	 if year==	2004	& circuit==	1
replace term_caseload=	4068	 if year==	2004	& circuit==	2
replace term_caseload=	3844	 if year==	2004	& circuit==	3
replace term_caseload=	4574	 if year==	2004	& circuit==	4
replace term_caseload=	8749	 if year==	2004	& circuit==	5
replace term_caseload=	4762	 if year==	2004	& circuit==	6
replace term_caseload=	3302	 if year==	2004	& circuit==	7
replace term_caseload=	2964	 if year==	2004	& circuit==	8
replace term_caseload=	11595	 if year==	2004	& circuit==	9
replace term_caseload=	2544	 if year==	2004	& circuit==	10
replace term_caseload=	7044	 if year==	2004	& circuit==	11
replace term_caseload=	1148	 if year==	2005	& circuit==	12
replace term_caseload=	1651	 if year==	2005	& circuit==	1
replace term_caseload=	5488	 if year==	2005	& circuit==	2
replace term_caseload=	3858	 if year==	2005	& circuit==	3
replace term_caseload=	4777	 if year==	2005	& circuit==	4
replace term_caseload=	7709	 if year==	2005	& circuit==	5
replace term_caseload=	4761	 if year==	2005	& circuit==	6
replace term_caseload=	3357	 if year==	2005	& circuit==	7
replace term_caseload=	2893	 if year==	2005	& circuit==	8
replace term_caseload=	12572	 if year==	2005	& circuit==	9
replace term_caseload=	2468	 if year==	2005	& circuit==	10
replace term_caseload=	6804	 if year==	2005	& circuit==	11
replace term_caseload=	1189	 if year==	2006	& circuit==	12
replace term_caseload=	2080	 if year==	2006	& circuit==	1
replace term_caseload=	8222	 if year==	2006	& circuit==	2
replace term_caseload=	4341	 if year==	2006	& circuit==	3
replace term_caseload=	5344	 if year==	2006	& circuit==	4
replace term_caseload=	7939	 if year==	2006	& circuit==	5
replace term_caseload=	5275	 if year==	2006	& circuit==	6
replace term_caseload=	4103	 if year==	2006	& circuit==	7
replace term_caseload=	3632	 if year==	2006	& circuit==	8
replace term_caseload=	13590	 if year==	2006	& circuit==	9
replace term_caseload=	2960	 if year==	2006	& circuit==	10
replace term_caseload=	8117	 if year==	2006	& circuit==	11
replace term_caseload=	1296	 if year==	2007	& circuit==	12
replace term_caseload=	1818	 if year==	2007	& circuit==	1
replace term_caseload=	8251	 if year==	2007	& circuit==	2
replace term_caseload=	3988	 if year==	2007	& circuit==	3
replace term_caseload=	5094	 if year==	2007	& circuit==	4
replace term_caseload=	9421	 if year==	2007	& circuit==	5
replace term_caseload=	5111	 if year==	2007	& circuit==	6
replace term_caseload=	3473	 if year==	2007	& circuit==	7
replace term_caseload=	3326	 if year==	2007	& circuit==	8
replace term_caseload=	13604	 if year==	2007	& circuit==	9
replace term_caseload=	2839	 if year==	2007	& circuit==	10
replace term_caseload=	7087	 if year==	2007	& circuit==	11
replace term_caseload=	1222	 if year==	2008	& circuit==	12
replace term_caseload=	1804	 if year==	2008	& circuit==	1
replace term_caseload=	6616	 if year==	2008	& circuit==	2
replace term_caseload=	4103	 if year==	2008	& circuit==	3
replace term_caseload=	4807	 if year==	2008	& circuit==	4
replace term_caseload=	9072	 if year==	2008	& circuit==	5
replace term_caseload=	4890	 if year==	2008	& circuit==	6
replace term_caseload=	3076	 if year==	2008	& circuit==	7
replace term_caseload=	3025	 if year==	2008	& circuit==	8
replace term_caseload=	13101	 if year==	2008	& circuit==	9
replace term_caseload=	2446	 if year==	2008	& circuit==	10
replace term_caseload=	6277	 if year==	2008	& circuit==	11
replace term_caseload=	1400	 if year==	2009	& circuit==	12
replace term_caseload=	1579	 if year==	2009	& circuit==	1
replace term_caseload=	6438	 if year==	2009	& circuit==	2
replace term_caseload=	3892	 if year==	2009	& circuit==	3
replace term_caseload=	5051	 if year==	2009	& circuit==	4
replace term_caseload=	7316	 if year==	2009	& circuit==	5
replace term_caseload=	4864	 if year==	2009	& circuit==	6
replace term_caseload=	3416	 if year==	2009	& circuit==	7
replace term_caseload=	3078	 if year==	2009	& circuit==	8
replace term_caseload=	12705	 if year==	2009	& circuit==	9
replace term_caseload=	2472	 if year==	2009	& circuit==	10
replace term_caseload=	7393	 if year==	2009	& circuit==	11
replace term_caseload=	1092	 if year==	2010	& circuit==	12
replace term_caseload=	1759	 if year==	2010	& circuit==	1
replace term_caseload=	6850	 if year==	2010	& circuit==	2
replace term_caseload=	4297	 if year==	2010	& circuit==	3
replace term_caseload=	5190	 if year==	2010	& circuit==	4
replace term_caseload=	7683	 if year==	2010	& circuit==	5
replace term_caseload=	4595	 if year==	2010	& circuit==	6
replace term_caseload=	3367	 if year==	2010	& circuit==	7
replace term_caseload=	3365	 if year==	2010	& circuit==	8
replace term_caseload=	12889	 if year==	2010	& circuit==	9
replace term_caseload=	2396	 if year==	2010	& circuit==	10
replace term_caseload=	6833	 if year==	2010	& circuit==	11
replace term_caseload=	1280	 if year==	2011	& circuit==	12
replace term_caseload=	1548	 if year==	2011	& circuit==	1
replace term_caseload=	5487	 if year==	2011	& circuit==	2
replace term_caseload=	4238	 if year==	2011	& circuit==	3
replace term_caseload=	4897	 if year==	2011	& circuit==	4
replace term_caseload=	7740	 if year==	2011	& circuit==	5
replace term_caseload=	4440	 if year==	2011	& circuit==	6
replace term_caseload=	3232	 if year==	2011	& circuit==	7
replace term_caseload=	3148	 if year==	2011	& circuit==	8
replace term_caseload=	13730	 if year==	2011	& circuit==	9
replace term_caseload=	2330	 if year==	2011	& circuit==	10
replace term_caseload=	6279	 if year==	2011	& circuit==	11
replace term_caseload=	1118	 if year==	2012	& circuit==	12
replace term_caseload=	1528	 if year==	2012	& circuit==	1
replace term_caseload=	5206	 if year==	2012	& circuit==	2
replace term_caseload=	4115	 if year==	2012	& circuit==	3
replace term_caseload=	5153	 if year==	2012	& circuit==	4
replace term_caseload=	7426	 if year==	2012	& circuit==	5
replace term_caseload=	5444	 if year==	2012	& circuit==	6
replace term_caseload=	3015	 if year==	2012	& circuit==	7
replace term_caseload=	2911	 if year==	2012	& circuit==	8
replace term_caseload=	12449	 if year==	2012	& circuit==	9
replace term_caseload=	2219	 if year==	2012	& circuit==	10
replace term_caseload=	6418	 if year==	2012	& circuit==	11

replace filed_cases = 1264 if circuit==12 & year==2003
replace filed_cases = 1534 if circuit==1 & year==2003
replace filed_cases = 4118 if circuit==2 & year==2003
replace filed_cases = 3824 if circuit==3 & year==2003
replace filed_cases = 4815 if circuit==4 & year==2003
replace filed_cases = 8844 if circuit==5 & year==2003
replace filed_cases = 4527 if circuit==6 & year==2003
replace filed_cases = 3355 if circuit==7 & year==2003
replace filed_cases = 3250 if circuit==8 & year==2003
replace filed_cases = 10766 if circuit==9 & year==2003
replace filed_cases = 2633 if circuit==10 & year==2003
replace filed_cases = 7620 if circuit==11 & year==2003
replace filed_cases= 5111 if circuit==6 & year==2007


drop PartyBalancing
rename pending_caseload pending_cases
rename term_caseload term_cases

*dropping the general DOJ and DOL divisions: do this only for the specific agencies. 
drop if agency==3
drop if agency==10

*dummy varaible for amici filed
by agency, sort: gen total_dummy = 1 if total>0
by agency, sort: replace total_dummy = 0 if total==0
lab var total_dummy "Amicus Filed"

*Conservative circuits and agencies
gen circuit_cons = . 
gen agency_cons = . 
by circuit,sort: replace circuit_cons=1 if circuit_ideol_dm1>0
by circuit,sort: replace circuit_cons=0 if circuit_ideol_dm1<0
by agency,sort: replace agency_cons=0 if agency_ideol<0
by agency,sort: replace agency_cons=1 if agency_ideol>0
lab var agency_cons "Conservative Agency"
lab var circuit_cons "Conservative Circuit"
gen circuitagency_align = . 
replace circuitagency_align = 1 if circuit_cons==1 & agency_cons==1
replace circuitagency_align = 1 if circuit_cons==0 & agency_cons==0
replace circuitagency_align = 0 if circuit_cons==0 & agency_cons==1
replace circuitagency_align = 0 if circuit_cons==1 & agency_cons==0
lab var circuitagency_align "Same Ideological Direction" 

*logging the number of cases filed, which represents the workload for the circuit
hist filed_cases, kdens
kdensity filed_cases 
gen log_filed_cases = ln(filed_cases) 
hist log_filed_cases, kdens
kdensity log_filed_cases 
lab var log_filed_cases "Filed Cases (logged)" 
gen log_pending_cases = ln(pending_cases)
gen log_term_cases = ln(term_cases)
lab var log_term_cases "Terminated Cases (logged)"
lab var log_pending_cases "Last Year's Pending Cases (logged)" 
hist pending_cases, kdens
hist term_cases, kdens
hist log_pending_cases, kdens
hist log_term_cases, kdens


by year (circuit), sort: gen productivity = term_cases / (filed_cases+pending_cases)*100

*coding agency age
by year (agency), sort: replace agency_age = year-1964 if agency==1
by year (agency), sort: replace agency_age = year-1914 if agency==2
by year (agency), sort: replace agency_age = year-1913 if agency==3
by year (agency), sort: replace agency_age = year-1933 if agency==4
by year (agency), sort: replace agency_age = year-2009 if agency==5 
by year (agency), sort: replace agency_age = year-2009 if agency==6 
by year (agency), sort: replace agency_age = year-1971 if agency==9
by year (agency), sort: replace agency_age = year-1974 if agency==7
by year (agency), sort: replace agency_age = year-1971 if agency==8
by year (agency), sort: replace agency_age = year-1933 if agency==11
by year (agency), sort: replace agency_age = year-1957 if agency==12
by year (agency), sort: replace agency_age = year-1870 if agency==10

*generating ideological difference
by agency (year), sort: gen distance_courtagency=abs(agency_ideol - circuit_ideol_dm1)
by agency (year), sort: gen distance_courtagency_notabs=agency_ideol - circuit_ideol_dm1
lab var distance_courtagency "Distance: Court-Agency"
lab var distance_courtagency_notabs "Distance: Court-Agency, not abs." 

*creating the varaible for H2: 
*1 if the Agency-President distance is greater than President-Court distance.
*0 if the Agency-President distance is less than President-Court distance. 
gen pa_greater_pc = .
replace pa_greater_pc=1 if abs(pres_ideol_dm1-circuit_ideol_dm1) < abs(pres_ideol_dm1-agency_ideol)
replace pa_greater_pc=0 if abs(pres_ideol_dm1-circuit_ideol_dm1) > abs(pres_ideol_dm1-agency_ideol)
lab var pa_greater_pc "Distance: President-Agency > President-Circuit"

*Labeling: cases and productivity; indp. measures; agency/circuit ideology. 
lab var term_cases "Terminated Cases"
lab var pending_cases "Last Year's Pending Cases" 
lab var filed_cases "New Cases Filed" 
lab var productivity "Circuit Productivity" 
lab var indp "Independence" 
lab var ind_lit "Independent Litigating Authority" 
lab define ideology 1 "Consv." 0 "Lib."
lab values circuit_cons ideology
lab values agency_cons ideology

*gererating Extreme Distance and Moderate Distance
sum distance_courtagency, detail
gen extdistance_courtagency=.
lab var extdistance_courtagency "Extreme Ideological Distance, Court-Agency"
replace extdistance_courtagency= 1 if distance_courtagency<=r(p10)
replace extdistance_courtagency= 1 if distance_courtagency>=r(p90)
replace extdistance_courtagency=0 if extdistance_courtagency!=1
sum extdistance_courtagency 
lab define extreme 1 "yes" 0 "no"
lab values extdistance_courtagency extreme

gen moderate_distance_agencycourt=. 
replace moderate_distance_agencycourt = 1 if extdistance_courtagency==0
replace moderate_distance_agencycourt = 0 if extdistance_courtagency==1
lab var moderate_distance "Is the agency/court distance moderate?"

*generating president-court/agency ideological distance 
gen distance_prescourt = abs(pres_ideol_dm1 - circuit_ideol_dm1)
gen distance_presagency = abs(pres_ideol_dm1 - agency_ideol)
lab var distance_presagency "Distance: President-Agency"
lab var distance_prescourt "Distance: President-Court"
lab values distance_presagency distance_presagency
lab values distance_prescourt distance_prescourt
lab values distance_presagency distance_presagency

*generating variable, xtsetting data in order to create ideological change varaible 
xtset id_num year, yearly
gen lagged_circuit_ideol=.
replace lagged_circuit_ideol = l.circuit_ideol_dm1
gen circuit_ideol_change = .
replace circuit_ideol_change = lagged_circuit_ideol - circuit_ideol_dm1
lab var circuit_ideol_change "Yearly Change in Circuit Ideology" 
lab var lagged_circuit_ideol "Last Year's Circuit Ideology"
xtset, clear

*generating moderate circuits 
sum circuit_ideol_dm1, detail
gen moderate_circuit = . 
replace moderate_circuit = 1 if circuit_ideol_dm1==r(p25) | circuit_ideol_dm1==r(p50) | circuit_ideol_dm1==r(p75)
replace moderate_circuit = 0 if moderate_circuit==.
lab var moderate_circuit "Is the circuit moderate?" 

*generating resources 

*generating type of agency variable 
gen economic = .
replace economic = 1 if agency==2 | agency==4 | agency==5 | agency==6 | agency==7 | agency==8 | agency==9
replace economic = 0 if agency==1 | agency==11 | agency==12 
lab var economic "Economic Agency"

gen civil_rights = . 
replace civil_rights = 1 if agency==1 | agency==12 
replace civil_rights = 0 if agency==2 | agency==4 | agency==5 | agency==6 | agency==7 | agency==8 | agency==9
lab var civil_rights "Civil Rights Agency"

gen type = . 
lab define type 1 "Economic" 0 "Civil Rights"
replace type = 1 if agency==2 | agency==4 | agency==5 | agency==6 | agency==7 | agency==8 | agency==9
replace type = 0 if agency==1 | agency==11 | agency==12 
lab var type "Economic (1) or Civil Rights (0)? "

*Quadradic court-agency distance
gen distance_courtagencysq = (distance_courtagency)^2
lab var distance_courtagencysq "Distance: Court-Agency Sq." 

*Cabinet agencies
gen cabinet = . 
replace cabinet = 0 if agency==1 | agency==2 | agency==4
replace cabinet = 1 if agency==5 | agency==6 | agency==7 | agency==8 | agency==9 | agency==11 | agency==12
lab var cabinet "Cabinet Agency" 

gen dol = 0 
replace dol = 1 if agency==5 | agency==6 | agency==7 | agency==8 | agency==9 
lab var dol "Dept. of Labor Agency" 

gen doj = 0 
replace doj = 1 if agency==11 | agency==12
lab var doj "Dept. of Justice Agency" 

*generating cluster var for standard errors
gen cluster_ca = circuit*100+agency
lab var cluster_ca "Circuit-Agency ID" 

*more labels! 
lab var total "Total Amici Filed"
lab var total_dummy "Was a amicus brief filed?"
lab var political_strict "Polarization (Strict)"
lab var political_loose "Polarization (Loose)"
lab var agency_age "Agency Age"

save "C:\Users\Michelle\OneDrive\Data\Bureaucracy_Amicus_Brief\Master_specific.dta", replace

*dropping the DOJ and DOL divisions: do this only for the general agencies. 
*drop if agency==5|agency==6|agency==7|agency==8|agency==9|agency==11|agency==12
*save "C:\Users\Michelle\OneDrive\Data\Bureaucracy_Amicus_Brief\Master_general.dta", replace\
