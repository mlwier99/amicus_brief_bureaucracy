cd "./Data"
use "base_yearcircuitcount.dta", clear

**generating indicator variables
gen presname = ""
gen pres_id = .

gen party_bal = .
gen rulemaking = .
gen indp_lit = .
gen indp = .

lab var presname "President's name"
lab var pres_id "President ID number"
lab var party_bal "Party balanced agency"
lab var rulemaking "Is agency capable of rulemaking?"
lab var indp_lit "Independent litigating authority"
lab var indp "Independent agency" 

**generating ideology variables
gen agency_ideo = .
lab var agency_ideo "Agency ideology, D1" 

gen crt_ideo =.
lab var crt_ideo "Circuit court ideology, D1"

gen pres_ideo1 = .
lab var pres_ideo1 "Presidential ideology, D1"

gen pres_ideo2 = .
lab var pres_ideo2 "Presidential ideology, D2"

gen filed_cases = .

gen pend_cases = .

gen term_cases = .

rename agency agency_id

gen agency = "", before(agency_id) 

gen agency_age = . 

gen civil_rights = 0
gen economics = 0
gen dol = 0
gen doj = 0

replace civil_rights = 1 if agency_id==1 | agency_id==5
replace economics = 1 if agency_id==2 | agency_id==3 | agency_id==4 | agency_id==6 | agency_id==7 | agency_id==8 | agency_id==9
replace doj = 1 if agency_id==4 | agency_id==5
replace dol = 1 if agency_id==6 | agency_id==7 | agency_id==8 | agency_id==9

lab var agency_age "Age of the agency"
lab var agency "Agency name"
lab var agency_id "Agency ID numbers"
lab var filed_cases "Raw number of filed cases"
lab var pend_cases "Raw number of pending cases"
lab var term_cases "Raw number of terminated cases" 
lab var civil_rights "Civil Rights agency"
lab var economic "Economic agency"
lab var dol "Department of Labor"
lab var doj "Department of Justice"

***replacing empty variables with values

replace agency = "EEOC" if agency_id==1
replace agency = "FTC" if agency_id==2
replace agency = "SEC" if agency_id==3
replace agency = "Antitrust" if agency_id==4
replace agency = "Civil Rights" if agency_id==5
replace agency = "BLLLS" if agency_id==6
replace agency = "FLS" if agency_id==7
replace agency = "OSH" if agency_id==8
replace agency = "PBS" if agency_id==9

replace presname = "Clinton" if year==2000
replace presname = "Bush" if year==2001 | year==2002 | year==2003 | year==2004
replace presname = "Bush II" if year==2005 | year==2006 | year==2007 | year==2008
replace presname = "Obama" if year==2009 | year==2010 | year==2011 | year==2012

replace pres_id = 1 if presname=="Clinton"
replace pres_id = 2 if presname=="Bush"
replace pres_id = 3 if presname=="Bush II"
replace pres_id = 4 if presname=="Obama"

replace pres_ideo1 = -0.48 if pres_id==1
replace pres_ideo1 = 0.981 if pres_id==2
replace pres_ideo1 = 0.981 if pres_id==3
replace pres_ideo1 = -0.378 if pres_id==4

replace pres_ideo2 = 0.211 if pres_id==1
replace pres_ideo2 = -0.134 if pres_id==2
replace pres_ideo2 = -0.134 if pres_id==3
replace pres_ideo2 = -0.435 if pres_id==4

replace agency_age = 36 if agency_id==1 & year==2000
replace agency_age = 37 if agency_id==1 & year==2001
replace agency_age = 38 if agency_id==1 & year==2002
replace agency_age = 39 if agency_id==1 & year==2003
replace agency_age = 40 if agency_id==1 & year==2004
replace agency_age = 41 if agency_id==1 & year==2005
replace agency_age = 42 if agency_id==1 & year==2006
replace agency_age = 43 if agency_id==1 & year==2007
replace agency_age = 44 if agency_id==1 & year==2008
replace agency_age = 45 if agency_id==1 & year==2009
replace agency_age = 46 if agency_id==1 & year==2010
replace agency_age = 47 if agency_id==1 & year==2011
replace agency_age = 48 if agency_id==1 & year==2012

replace agency_age = 86 if agency_id==2 & year==2000
replace agency_age = 87 if agency_id==2 & year==2001
replace agency_age = 88 if agency_id==2 & year==2002
replace agency_age = 89 if agency_id==2 & year==2003
replace agency_age = 90 if agency_id==2 & year==2004
replace agency_age = 91 if agency_id==2 & year==2005
replace agency_age = 92 if agency_id==2 & year==2006
replace agency_age = 93 if agency_id==2 & year==2007
replace agency_age = 94 if agency_id==2 & year==2008
replace agency_age = 95 if agency_id==2 & year==2009
replace agency_age = 96 if agency_id==2 & year==2010
replace agency_age = 97 if agency_id==2 & year==2011
replace agency_age = 98 if agency_id==2 & year==2012

replace agency_age = 67 if agency_id==3 & year==2000
replace agency_age = 68 if agency_id==3 & year==2001
replace agency_age = 69 if agency_id==3 & year==2002
replace agency_age = 70 if agency_id==3 & year==2003
replace agency_age = 71 if agency_id==3 & year==2004
replace agency_age = 72 if agency_id==3 & year==2005
replace agency_age = 73 if agency_id==3 & year==2006
replace agency_age = 74 if agency_id==3 & year==2007
replace agency_age = 75 if agency_id==3 & year==2008
replace agency_age = 76 if agency_id==3 & year==2009
replace agency_age = 77 if agency_id==3 & year==2010
replace agency_age = 78 if agency_id==3 & year==2011
replace agency_age = 79 if agency_id==3 & year==2012

replace agency_age = 26 if agency_id==9 & year==2000
replace agency_age = 27 if agency_id==9 & year==2001
replace agency_age = 28 if agency_id==9 & year==2002
replace agency_age = 29 if agency_id==9 & year==2003
replace agency_age = 30 if agency_id==9 & year==2004
replace agency_age = 31 if agency_id==9 & year==2005
replace agency_age = 32 if agency_id==9 & year==2006
replace agency_age = 33 if agency_id==9 & year==2007
replace agency_age = 34 if agency_id==9 & year==2008
replace agency_age = 35 if agency_id==9 & year==2009
replace agency_age = 36 if agency_id==9 & year==2010
replace agency_age = 37 if agency_id==9 & year==2011
replace agency_age = 38 if agency_id==9 & year==2012

replace agency_age = 29 if agency_id==8 & year==2000
replace agency_age = 30 if agency_id==8 & year==2001
replace agency_age = 31 if agency_id==8 & year==2002
replace agency_age = 32 if agency_id==8 & year==2003
replace agency_age = 33 if agency_id==8 & year==2004
replace agency_age = 34 if agency_id==8 & year==2005
replace agency_age = 35 if agency_id==8 & year==2006
replace agency_age = 36 if agency_id==8 & year==2007
replace agency_age = 37 if agency_id==8 & year==2008
replace agency_age = 38 if agency_id==8 & year==2009
replace agency_age = 39 if agency_id==8 & year==2010
replace agency_age = 40 if agency_id==8 & year==2011
replace agency_age = 41 if agency_id==8 & year==2012

replace agency_age = 29 if agency_id==7 & year==2000
replace agency_age = 30 if agency_id==7 & year==2001
replace agency_age = 31 if agency_id==7 & year==2002
replace agency_age = 32 if agency_id==7 & year==2003
replace agency_age = 33 if agency_id==7 & year==2004
replace agency_age = 34 if agency_id==7 & year==2005
replace agency_age = 35 if agency_id==7 & year==2006
replace agency_age = 36 if agency_id==7 & year==2007
replace agency_age = 37 if agency_id==7 & year==2008
replace agency_age = 38 if agency_id==7 & year==2009
replace agency_age = 39 if agency_id==7 & year==2010
replace agency_age = 40 if agency_id==7 & year==2011
replace agency_age = 41 if agency_id==7 & year==2012

replace agency_age = 29 if agency_id==6 & year==2000
replace agency_age = 30 if agency_id==6 & year==2001
replace agency_age = 31 if agency_id==6 & year==2002
replace agency_age = 32 if agency_id==6 & year==2003
replace agency_age = 33 if agency_id==6 & year==2004
replace agency_age = 34 if agency_id==6 & year==2005
replace agency_age = 35 if agency_id==6 & year==2006
replace agency_age = 36 if agency_id==6 & year==2007
replace agency_age = 37 if agency_id==6 & year==2008
replace agency_age = 38 if agency_id==6 & year==2009
replace agency_age = 39 if agency_id==6 & year==2010
replace agency_age = 40 if agency_id==6 & year==2011
replace agency_age = 41 if agency_id==6 & year==2012

replace agency_age = 67 if agency_id==4 & year==2000
replace agency_age = 68 if agency_id==4 & year==2001
replace agency_age = 69 if agency_id==4 & year==2002
replace agency_age = 70 if agency_id==4 & year==2003
replace agency_age = 71 if agency_id==4 & year==2004
replace agency_age = 72 if agency_id==4 & year==2005
replace agency_age = 73 if agency_id==4 & year==2006
replace agency_age = 74 if agency_id==4 & year==2007
replace agency_age = 75 if agency_id==4 & year==2008
replace agency_age = 76 if agency_id==4 & year==2009
replace agency_age = 77 if agency_id==4 & year==2010
replace agency_age = 78 if agency_id==4 & year==2011
replace agency_age = 79 if agency_id==4 & year==2012

replace agency_age = 43 if agency_id==5 & year==2000
replace agency_age = 44 if agency_id==5 & year==2001
replace agency_age = 45 if agency_id==5 & year==2002
replace agency_age = 46 if agency_id==5 & year==2003
replace agency_age = 47 if agency_id==5 & year==2004
replace agency_age = 48 if agency_id==5 & year==2005
replace agency_age = 49 if agency_id==5 & year==2006
replace agency_age = 50 if agency_id==5 & year==2007
replace agency_age = 51 if agency_id==5 & year==2008
replace agency_age = 52 if agency_id==5 & year==2009
replace agency_age = 53 if agency_id==5 & year==2010
replace agency_age = 54 if agency_id==5 & year==2011
replace agency_age = 55 if agency_id==5 & year==2012


replace crt_ideo = 0.2085 if circuit==1 & year==2000
replace crt_ideo = 0.2085 if circuit==1 & year==2001
replace crt_ideo = 0.2085 if circuit==1 & year==2002
replace crt_ideo = 0.2085 if circuit==1 & year==2003
replace crt_ideo = 0.2085 if circuit==1 & year==2004
replace crt_ideo = 0.2085 if circuit==1 & year==2005
replace crt_ideo = 0.2085 if circuit==1 & year==2006
replace crt_ideo = 0.403 if circuit==1 & year==2007
replace crt_ideo = 0.403 if circuit==1 & year==2008
replace crt_ideo = 0.403 if circuit==1 & year==2009
replace crt_ideo = 0.403 if circuit==1 & year==2012
replace crt_ideo = 0.0335 if circuit==1 & year==2010
replace crt_ideo = 0.0335 if circuit==1 & year==2011

replace crt_ideo = -0.297 if circuit==2 & year==2002
replace crt_ideo = -0.297 if circuit==2 & year==2001
replace crt_ideo = -0.297 if circuit==2 & year==2002
replace crt_ideo = -0.252 if circuit==2 & year==2003
replace crt_ideo = -0.252 if circuit==2 & year==2004
replace crt_ideo = -0.252 if circuit==2 & year==2005
replace crt_ideo = -0.252 if circuit==2 & year==2006
replace crt_ideo = -0.252 if circuit==2 & year==2007
replace crt_ideo = -0.252 if circuit==2 & year==2008
replace crt_ideo = -0.252 if circuit==2 & year==2009
replace crt_ideo = -0.252 if circuit==2 & year==2010
replace crt_ideo = -0.255 if circuit==2 & year==2011
replace crt_ideo = -0.255 if circuit==2 & year==2012

replace crt_ideo = 0.0175 if circuit==3 & year==2000
replace crt_ideo = -0.13725 if circuit==3 & year==2001
replace crt_ideo = 0.0175 if circuit==3 & year==2002
replace crt_ideo = 0.0175 if circuit==3 & year==2003
replace crt_ideo = 0.0175 if circuit==3 & year==2004
replace crt_ideo = 0.0175 if circuit==3 & year==2005
replace crt_ideo = 0.0175 if circuit==3 & year==2006
replace crt_ideo = -0.141 if circuit==3 & year==2007
replace crt_ideo = -0.141 if circuit==3 & year==2008
replace crt_ideo = -0.141 if circuit==3 & year==2009
replace crt_ideo = -0.27225 if circuit==3 & year==2010
replace crt_ideo = -0.27225 if circuit==3 & year==2011
replace crt_ideo = -0.2525 if circuit==3 & year==2012

replace crt_ideo = 0.187 if circuit==4 & year==2000
replace crt_ideo = 0.203  if circuit==4 & year==2001
replace crt_ideo = 0.22875 if circuit==4 & year==2002
replace crt_ideo = 0.2545 if circuit==4 & year==2003
replace crt_ideo = 0.2545 if circuit==4 & year==2004
replace crt_ideo = 0.2545 if circuit==4 & year==2005
replace crt_ideo = 0.2545 if circuit==4 & year==2006
replace crt_ideo = 0.27725 if circuit==4 & year==2007
replace crt_ideo = 0.203 if circuit==4 & year==2008
replace crt_ideo = 0.195 if circuit==4 & year==2009
replace crt_ideo = -0.174 if circuit==4 & year==2010
replace crt_ideo = -0.174 if circuit==4 & year==2011
replace crt_ideo = -0.174 if circuit==4 & year==2012

replace crt_ideo = 0.28 if circuit==5 & year==2000
replace crt_ideo = 0.341 if circuit==5 & year==2001
replace crt_ideo = 0.341 if circuit==5 & year==2002
replace crt_ideo = 0.36775 if circuit==5 & year==2003
replace crt_ideo = 0.3325 if circuit==5 & year==2004
replace crt_ideo = 0.36775 if circuit==5 & year==2005
replace crt_ideo = 0.36775 if circuit==5 & year==2006
replace crt_ideo = 0.3325 if circuit==5 & year==2007
replace crt_ideo = 0.3325 if circuit==5 & year==2008
replace crt_ideo = 0.3325 if circuit==5 & year==2009
replace crt_ideo = 0.3325 if circuit==5 & year==2010
replace crt_ideo = 0.3325 if circuit==5 & year==2011
replace crt_ideo = 0.3325 if circuit==5 & year==2012

replace crt_ideo = -0.234 if circuit==6 & year==2000
replace crt_ideo = -0.2425 if circuit==6 & year==2001
replace crt_ideo = -0.2425 if circuit==6 & year==2002
replace crt_ideo = -0.03275 if circuit==6 & year==2003
replace crt_ideo = -0.03275 if circuit==6 & year==2004
replace crt_ideo = 0.1685 if circuit==6 & year==2005
replace crt_ideo = 0.1685 if circuit==6 & year==2006
replace crt_ideo = 0.1685 if circuit==6 & year==2007
replace crt_ideo = 0.22425 if circuit==6 & year==2008
replace crt_ideo = 0.22425 if circuit==6 & year==2009
replace crt_ideo = 0.22425 if circuit==6 & year==2010
replace crt_ideo = 0.22425 if circuit==6 & year==2011
replace crt_ideo = 0.22425 if circuit==6 & year==2012

replace crt_ideo = 0.198 if circuit==7 & year==2000
replace crt_ideo = 0.198 if circuit==7 & year==2001
replace crt_ideo = 0.198 if circuit==7 & year==2002
replace crt_ideo = 0.198 if circuit==7 & year==2003
replace crt_ideo = 0.25175 if circuit==7 & year==2004
replace crt_ideo = 0.3055 if circuit==7 & year==2005
replace crt_ideo = 0.3055 if circuit==7 & year==2006
replace crt_ideo = 0.25975 if circuit==7 & year==2007
replace crt_ideo = 0.214 if circuit==7 & year==2008
replace crt_ideo = 0.061 if circuit==7 & year==2009
replace crt_ideo = 0.061 if circuit==7 & year==2010
replace crt_ideo = 0.1375 if circuit==7 & year==2011
replace crt_ideo = 0.1375 if circuit==7 & year==2012

replace crt_ideo = 0.1275 if circuit==8 & year==2000
replace crt_ideo = 0.134 if circuit==8 & year==2001
replace crt_ideo = 0.189 if circuit==8 & year==2002
replace crt_ideo = 0.2125 if circuit==8 & year==2003
replace crt_ideo = 0.264 if circuit==8 & year==2004
replace crt_ideo = 0.264 if circuit==8 & year==2005
replace crt_ideo = 0.2645 if circuit==8 & year==2006
replace crt_ideo = 0.265 if circuit==8 & year==2007
replace crt_ideo = 0.265 if circuit==8 & year==2008
replace crt_ideo = 0.265 if circuit==8 & year==2009
replace crt_ideo = 0.265 if circuit==8 & year==2010
replace crt_ideo = 0.265 if circuit==8 & year==2011
replace crt_ideo = 0.265 if circuit==8 & year==2012

replace crt_ideo = -0.29 if circuit==9 & year==2000
replace crt_ideo = -0.274 if circuit==9 & year==2001
replace crt_ideo = -0.26075 if circuit==9 & year==2002
replace crt_ideo = -0.2475 if circuit==9 & year==2003
replace crt_ideo = -0.26075 if circuit==9 & year==2004
replace crt_ideo = -0.26075 if circuit==9 & year==2005
replace crt_ideo = -0.26635 if circuit==9 & year==2006
replace crt_ideo = -0.219 if circuit==9 & year==2007
replace crt_ideo = -0.219 if circuit==9 & year==2008
replace crt_ideo = -0.219 if circuit==9 & year==2009
replace crt_ideo = -0.23325 if circuit==9 & year==2010
replace crt_ideo = -0.2475 if circuit==9 & year==2011
replace crt_ideo = -0.294 if circuit==9 & year==2012

replace crt_ideo = 0.202 if circuit==10 & year==2000
replace crt_ideo = 0.202 if circuit==10 & year==2001
replace crt_ideo = 0.202 if circuit==10 & year==2002
replace crt_ideo = 0.202 if circuit==10 & year==2003
replace crt_ideo = 0.202 if circuit==10 & year==2004
replace crt_ideo = 0.202 if circuit==10 & year==2005
replace crt_ideo = 0.2075 if circuit==10 & year==2006
replace crt_ideo = 0.20475 if circuit==10 & year==2007
replace crt_ideo = 0.20475 if circuit==10 & year==2008
replace crt_ideo = 0.20475 if circuit==10 & year==2009
replace crt_ideo = 0.202 if circuit==10 & year==2010
replace crt_ideo = 0.202 if circuit==10 & year==2011
replace crt_ideo = 0.202 if circuit==10 & year==2012

replace crt_ideo = 0.308 if circuit==11 & year==2000
replace crt_ideo = 0.264 if circuit==11 & year==2001
replace crt_ideo = 0.264 if circuit==11 & year==2002
replace crt_ideo = 0.264 if circuit==11 & year==2003
replace crt_ideo = 0.264 if circuit==11 & year==2004
replace crt_ideo = 0.308 if circuit==11 & year==2005
replace crt_ideo = 0.308 if circuit==11 & year==2006
replace crt_ideo = 0.308 if circuit==11 & year==2007
replace crt_ideo = 0.308 if circuit==11 & year==2008
replace crt_ideo = 0.308 if circuit==11 & year==2009
replace crt_ideo = 0.308 if circuit==11 & year==2010
replace crt_ideo = 0.264 if circuit==11 & year==2011
replace crt_ideo = -0.169 if circuit==11 & year==2012

replace crt_ideo = 0.492 if circuit==12 & year==2000
replace crt_ideo = 0.492 if circuit==12 & year==2001
replace crt_ideo = 0.0575 if circuit==12 & year==2002
replace crt_ideo = 0.486 if circuit==12 & year==2003
replace crt_ideo = 0.486 if circuit==12 & year==2004
replace crt_ideo = 0.486 if circuit==12 & year==2005
replace crt_ideo = 0.486 if circuit==12 & year==2006
replace crt_ideo = 0.486 if circuit==12 & year==2007
replace crt_ideo = 0.486 if circuit==12 & year==2008
replace crt_ideo = 0.486 if circuit==12 & year==2009
replace crt_ideo = 0.486 if circuit==12 & year==2010
replace crt_ideo = 0.486 if circuit==12 & year==2011
replace crt_ideo = 0.486 if circuit==12 & year==2012

replace crt_ideo = 0.2085 if circuit==2 & year==2000

replace agency_ideo = 0.035418335 if agency_id== 4 & year== 2000
replace agency_ideo = 0.01164498 if agency_id== 4 & year== 2001
replace agency_ideo = 0.01164498 if agency_id== 4 & year== 2002
replace agency_ideo = 0.01164498 if agency_id== 4 & year== 2003
replace agency_ideo = 0.01164498 if agency_id== 4 & year== 2004
replace agency_ideo = -0.129159196 if agency_id== 4 & year== 2005
replace agency_ideo = -0.129159196 if agency_id== 4 & year== 2006
replace agency_ideo = -0.129159196 if agency_id== 4 & year== 2007
replace agency_ideo = -0.129159196 if agency_id== 4 & year== 2008
replace agency_ideo = -0.159702183 if agency_id== 4 & year== 2009
replace agency_ideo = -0.159702183 if agency_id== 4 & year== 2010
replace agency_ideo = -0.159702183 if agency_id== 4 & year== 2011
replace agency_ideo = -0.159702183 if agency_id== 4 & year== 2012
replace agency_ideo = -0.25169092 if agency_id== 1 & year== 2000
replace agency_ideo = -0.179416743 if agency_id== 2 & year== 2000
replace agency_ideo = -0.34237054 if agency_id== 3 & year== 2000
replace agency_ideo = -0.234897134 if agency_id== 9 & year== 2000
replace agency_ideo = -0.234897134 if agency_id== 8 & year== 2000
replace agency_ideo = -0.234897134 if agency_id== 7 & year== 2000
replace agency_ideo = 0.035418335 if agency_id== 5 & year== 2000
replace agency_ideo = -0.246786484 if agency_id== 1 & year== 2001
replace agency_ideo = -0.177265809 if agency_id== 2 & year== 2001
replace agency_ideo = -0.101772856 if agency_id== 3 & year== 2001
replace agency_ideo = 0.088942231 if agency_id== 9 & year== 2001
replace agency_ideo = 0.088942231 if agency_id== 8 & year== 2001
replace agency_ideo = 0.088942231 if agency_id== 7 & year== 2001
replace agency_ideo = 0.01164498 if agency_id== 5 & year== 2001
replace agency_ideo = -0.246786484 if agency_id== 1 & year== 2002
replace agency_ideo = -0.177265809 if agency_id== 2 & year== 2002
replace agency_ideo = -0.101772856 if agency_id== 3 & year== 2002
replace agency_ideo = 0.088942231 if agency_id== 9 & year== 2002
replace agency_ideo = 0.088942231 if agency_id== 8 & year== 2002
replace agency_ideo = 0.088942231 if agency_id== 7 & year== 2002
replace agency_ideo = 0.01164498 if agency_id== 5 & year== 2002
replace agency_ideo = -0.246786484 if agency_id== 1 & year== 2003
replace agency_ideo = -0.177265809 if agency_id== 2 & year== 2003
replace agency_ideo = -0.101772856 if agency_id== 3 & year== 2003
replace agency_ideo = 0.088942231 if agency_id== 9 & year== 2003
replace agency_ideo = 0.088942231 if agency_id== 8 & year== 2003
replace agency_ideo = 0.088942231 if agency_id== 7 & year== 2003
replace agency_ideo = 0.01164498 if agency_id== 5 & year== 2003
replace agency_ideo = -0.246786484 if agency_id== 1 & year== 2004
replace agency_ideo = -0.177265809 if agency_id== 2 & year== 2004
replace agency_ideo = -0.101772856 if agency_id== 3 & year== 2004
replace agency_ideo = 0.088942231 if agency_id== 9 & year== 2004
replace agency_ideo = 0.088942231 if agency_id== 8 & year== 2004
replace agency_ideo = 0.088942231 if agency_id== 7 & year== 2004
replace agency_ideo = 0.01164498 if agency_id== 5 & year== 2004
replace agency_ideo = -0.29094548 if agency_id== 1 & year== 2005
replace agency_ideo = -0.222321593 if agency_id== 2 & year== 2005
replace agency_ideo = -0.162149011 if agency_id== 3 & year== 2005
replace agency_ideo = 0.024725012 if agency_id== 9 & year== 2005
replace agency_ideo = 0.024725012 if agency_id== 8 & year== 2005
replace agency_ideo = 0.024725012 if agency_id== 7 & year== 2005
replace agency_ideo = -0.129159196 if agency_id== 5 & year== 2005
replace agency_ideo = -0.29094548 if agency_id== 1 & year== 2006
replace agency_ideo = -0.222321593 if agency_id== 2 & year== 2006
replace agency_ideo = -0.162149011 if agency_id== 3 & year== 2006
replace agency_ideo = 0.024725012 if agency_id== 9 & year== 2006
replace agency_ideo = 0.024725012 if agency_id== 8 & year== 2006
replace agency_ideo = 0.024725012 if agency_id== 7 & year== 2006
replace agency_ideo = -0.129159196 if agency_id== 5 & year== 2006
replace agency_ideo = -0.29094548 if agency_id== 1 & year== 2007
replace agency_ideo = -0.222321593 if agency_id== 2 & year== 2007
replace agency_ideo = -0.162149011 if agency_id== 3 & year== 2007
replace agency_ideo = 0.024725012 if agency_id== 9 & year== 2007
replace agency_ideo = 0.024725012 if agency_id== 8 & year== 2007
replace agency_ideo = 0.024725012 if agency_id== 7 & year== 2007
replace agency_ideo = -0.129159196 if agency_id== 5 & year== 2007
replace agency_ideo = -0.29094548 if agency_id== 1 & year== 2008
replace agency_ideo = -0.222321593 if agency_id== 2 & year== 2008
replace agency_ideo = -0.162149011 if agency_id== 3 & year== 2008
replace agency_ideo = 0.024725012 if agency_id== 9 & year== 2008
replace agency_ideo = 0.024725012 if agency_id== 8 & year== 2008
replace agency_ideo = 0.024725012 if agency_id== 7 & year== 2008
replace agency_ideo = -0.129159196 if agency_id== 5 & year== 2008
replace agency_ideo = -0.270976985 if agency_id== 1 & year== 2009
replace agency_ideo = -0.326950073 if agency_id== 2 & year== 2009
replace agency_ideo = -0.218419752 if agency_id== 3 & year== 2009
replace agency_ideo = -0.285191627 if agency_id== 9 & year== 2009
replace agency_ideo = -0.285191627 if agency_id== 8 & year== 2009
replace agency_ideo = -0.285191627 if agency_id== 7 & year== 2009
replace agency_ideo = -0.159702183 if agency_id== 5 & year== 2009
replace agency_ideo = -0.270976985 if agency_id== 1 & year== 2010
replace agency_ideo = -0.326950073 if agency_id== 2 & year== 2010
replace agency_ideo = -0.218419752 if agency_id== 3 & year== 2010
replace agency_ideo = -0.285191627 if agency_id== 9 & year== 2010
replace agency_ideo = -0.285191627 if agency_id== 8 & year== 2010
replace agency_ideo = -0.285191627 if agency_id== 7 & year== 2010
replace agency_ideo = -0.159702183 if agency_id== 5 & year== 2010
replace agency_ideo = -0.270976985 if agency_id== 1 & year== 2011
replace agency_ideo = -0.326950073 if agency_id== 2 & year== 2011
replace agency_ideo = -0.218419752 if agency_id== 3 & year== 2011
replace agency_ideo = -0.285191627 if agency_id== 6 & year== 2011
replace agency_ideo = -0.285191627 if agency_id== 7 & year== 2011
replace agency_ideo = -0.285191627 if agency_id== 9 & year== 2011
replace agency_ideo = -0.285191627 if agency_id== 8 & year== 2011
replace agency_ideo = -0.159702183 if agency_id== 5 & year== 2011
replace agency_ideo = -0.270976985 if agency_id== 1 & year== 2012
replace agency_ideo = -0.326950073 if agency_id== 2 & year== 2012
replace agency_ideo = -0.218419752 if agency_id== 3 & year== 2012
replace agency_ideo = -0.285191627 if agency_id== 6 & year== 2012
replace agency_ideo = -0.285191627 if agency_id== 7 & year== 2012
replace agency_ideo = -0.285191627 if agency_id== 9 & year== 2012
replace agency_ideo = -0.285191627 if agency_id== 8 & year== 2012
replace agency_ideo = -0.159702183 if agency_id== 5 & year== 2012
replace agency_ideo = -0.234897134 if agency_id==6 & year==2000
replace agency_ideo = 0.088942231 if agency_id==6 & year==2001
replace agency_ideo = 0.088942231 if agency_id==6 & year==2002
replace agency_ideo = 0.088942231 if agency_id==6 & year==2003
replace agency_ideo = 0.088942231 if agency_id==6 & year==2004
replace agency_ideo = 0.024725012 if agency_id==6 & year==2005
replace agency_ideo = 0.024725012 if agency_id==6 & year==2006
replace agency_ideo = 0.024725012 if agency_id==6 & year==2007
replace agency_ideo = 0.024725012 if agency_id==6 & year==2008
replace agency_ideo = -0.285191627 if agency_id==6 & year==2009
replace agency_ideo = -0.285191627 if agency_id==6 & year==2010
replace agency_ideo = -0.285191627 if agency_id==6 & year==2011
replace agency_ideo = -0.285191627 if agency_id==6 & year==2012

replace filed_cases = 1417 if   circuit==   12  & year==   2000
replace filed_cases = 1610 if   circuit==   1  & year==   2000
replace filed_cases = 4973 if   circuit==   2  & year==   2000
replace filed_cases = 3368 if   circuit==   3  & year==   2000
replace filed_cases = 4621 if   circuit==   4  & year==   2000
replace filed_cases = 8172 if   circuit==   5  & year==   2000
replace filed_cases = 4809 if   circuit==   6  & year==   2000
replace filed_cases = 3516 if   circuit==   7  & year==   2000
replace filed_cases = 3428 if   circuit==   8  & year==   2000
replace filed_cases = 9582 if   circuit==   9  & year==   2000
replace filed_cases = 2612 if   circuit==   10  & year==   2000
replace filed_cases = 7248 if   circuit==   11  & year==   2000
replace filed_cases = 1417 if   circuit==   12  & year==   2001
replace filed_cases = 1610 if   circuit==   1  & year==   2001
replace filed_cases = 4684 if   circuit==   2  & year==   2001
replace filed_cases = 3757 if   circuit==   3  & year==   2001
replace filed_cases = 4869 if   circuit==   4  & year==   2001
replace filed_cases = 8580 if   circuit==   5  & year==   2001
replace filed_cases = 5018 if   circuit==   6  & year==   2001
replace filed_cases = 3367 if   circuit==   7  & year==   2001
replace filed_cases = 2991 if   circuit==   8  & year==   2001
replace filed_cases = 9859 if   circuit==   9  & year==   2001
replace filed_cases = 2753 if   circuit==   10  & year==   2001
replace filed_cases = 7162 if   circuit==   11  & year==   2001
replace filed_cases = 1293 if   circuit==   12  & year==   2002
replace filed_cases = 1657 if   circuit==   1  & year==   2002
replace filed_cases = 4516 if   circuit==   2  & year==   2002
replace filed_cases = 3697 if   circuit==   3  & year==   2002
replace filed_cases = 5187 if   circuit==   4  & year==   2002
replace filed_cases = 8641 if   circuit==   5  & year==   2002
replace filed_cases = 4673 if   circuit==   6  & year==   2002
replace filed_cases = 3452 if   circuit==   7  & year==   2002
replace filed_cases = 3097 if   circuit==   8  & year==   2002
replace filed_cases = 9990 if   circuit==   9  & year==   2002
replace filed_cases = 2688 if   circuit==   10  & year==   2002
replace filed_cases = 7643 if   circuit==   11  & year==   2002
replace filed_cases = 1077 if   circuit==   12  & year==   2003
replace filed_cases = 1812 if   circuit==   1  & year==   2003
replace filed_cases = 5843 if   circuit==   2  & year==   2003
replace filed_cases = 3731 if   circuit==   3  & year==   2003
replace filed_cases = 4791 if   circuit==   4  & year==   2003
replace filed_cases = 8771 if   circuit==   5  & year==   2003
replace filed_cases = 4728 if   circuit==   6  & year==   2003
replace filed_cases = 3533 if   circuit==   7  & year==   2003
replace filed_cases = 3267 if   circuit==   8  & year==   2003
replace filed_cases = 13127 if   circuit==   9  & year==   2003
replace filed_cases = 2663 if   circuit==   10  & year==   2003
replace filed_cases = 7318 if   circuit==   11  & year==   2003
replace filed_cases = 1263 if   circuit==   12  & year==   2004
replace filed_cases = 1780 if   circuit==   1  & year==   2004
replace filed_cases = 6532 if   circuit==   2  & year==   2004
replace filed_cases = 3946 if   circuit==   3  & year==   2004
replace filed_cases = 4797 if   circuit==   4  & year==   2004
replace filed_cases = 8428 if   circuit==   5  & year==   2004
replace filed_cases = 5012 if   circuit==   6  & year==   2004
replace filed_cases = 3386 if   circuit==   7  & year==   2004
replace filed_cases = 3035 if   circuit==   8  & year==   2004
replace filed_cases = 12929 if   circuit==   9  & year==   2004
replace filed_cases = 2485 if   circuit==   10  & year==   2004
replace filed_cases = 6912 if   circuit==   11  & year==   2004
replace filed_cases = 1359 if   circuit==   12  & year==   2005
replace filed_cases = 1725 if   circuit==   1  & year==   2005
replace filed_cases = 6839 if   circuit==   2  & year==   2005
replace filed_cases = 4037 if   circuit==   3  & year==   2005
replace filed_cases = 5196 if   circuit==   4  & year==   2005
replace filed_cases = 9025 if   circuit==   5  & year==   2005
replace filed_cases = 4785 if   circuit==   6  & year==   2005
replace filed_cases = 3482 if   circuit==   7  & year==   2005
replace filed_cases = 3387 if   circuit==   8  & year==   2005
replace filed_cases = 15236 if   circuit==   9  & year==   2005
replace filed_cases = 2824 if   circuit==   10  & year==   2005
replace filed_cases = 7523 if   circuit==   11  & year==   2005
replace filed_cases = 1380 if   circuit==   12  & year==   2006
replace filed_cases = 2055 if   circuit==   1  & year==   2006
replace filed_cases = 7453 if   circuit==   2  & year==   2006
replace filed_cases = 4787 if   circuit==   3  & year==   2006
replace filed_cases = 5527 if   circuit==   4  & year==   2006
replace filed_cases = 9326 if   circuit==   5  & year==   2006
replace filed_cases = 5441 if   circuit==   6  & year==   2006
replace filed_cases = 3951 if   circuit==   7  & year==   2006
replace filed_cases = 3584 if   circuit==   8  & year==   2006
replace filed_cases = 15953 if   circuit==   9  & year==   2006
replace filed_cases = 2894 if   circuit==   10  & year==   2006
replace filed_cases = 8024 if   circuit==   11  & year==   2006
replace filed_cases = 1233 if   circuit==  12  & year==   2007
replace filed_cases = 1754 if   circuit==   1  & year==   2007
replace filed_cases = 6506 if   circuit==   2  & year==   2007
replace filed_cases = 4138 if   circuit==   3  & year==   2007
replace filed_cases = 4804 if   circuit==   4  & year==   2007
replace filed_cases = 8717 if   circuit==   5  & year==   2007
replace filed_cases = 4909 if   circuit==   6  & year==   2007
replace filed_cases = 3335 if   circuit==   7  & year==   2007
replace filed_cases = 3109 if   circuit==   8  & year==   2007
replace filed_cases = 13107 if   circuit==   9  & year==   2007
replace filed_cases = 2579 if   circuit==   10  & year==   2007
replace filed_cases = 6477 if   circuit==   11  & year==   2007
replace filed_cases = 1323 if   circuit==   12  & year==   2008
replace filed_cases = 1727 if   circuit==   1  & year==   2008
replace filed_cases = 6606 if   circuit==   2  & year==   2008
replace filed_cases = 3926 if   circuit==   3  & year==   2008
replace filed_cases = 4604 if   circuit==   4  & year==   2008
replace filed_cases = 7615 if   circuit==   5  & year==   2008
replace filed_cases = 4694 if   circuit==   6  & year==   2008
replace filed_cases = 3215 if   circuit==   7  & year==   2008
replace filed_cases = 2975 if   circuit==   8  & year==   2008
replace filed_cases = 13026 if   circuit==   9  & year==   2008
replace filed_cases = 2301 if   circuit==   10  & year==   2008
replace filed_cases = 6361 if   circuit==   11  & year==   2008
replace filed_cases = 1272 if   circuit==   12  & year==   2009
replace filed_cases = 1640 if   circuit==   1  & year==   2009
replace filed_cases = 6175 if   circuit==   2  & year==   2009
replace filed_cases = 3879 if   circuit==   3  & year==   2009
replace filed_cases = 5629 if   circuit==   4  & year==   2009
replace filed_cases = 7507 if   circuit==   5  & year==   2009
replace filed_cases = 4805 if   circuit==   6  & year==   2009
replace filed_cases = 3463 if   circuit==   7  & year==   2009
replace filed_cases = 3067 if   circuit==   8  & year==   2009
replace filed_cases = 12912 if   circuit==   9  & year==   2009
replace filed_cases = 2224 if   circuit==   10  & year==   2009
replace filed_cases = 7785 if   circuit==   11  & year==   2009
replace filed_cases = 1056 if   circuit==   12  & year==   2010
replace filed_cases = 1715 if   circuit==   1  & year==   2010
replace filed_cases = 5410 if   circuit==   2  & year==   2010
replace filed_cases = 3884 if   circuit==   3  & year==   2010
replace filed_cases = 5038 if   circuit==   4  & year==   2010
replace filed_cases = 7217 if   circuit==   5  & year==   2010
replace filed_cases = 4920 if   circuit==   6  & year==   2010
replace filed_cases = 3164 if   circuit==   7  & year==   2010
replace filed_cases = 3012 if   circuit==   8  & year==   2010
replace filed_cases = 12327 if   circuit==   9  & year==   2010
replace filed_cases = 2348 if   circuit==   10  & year==   2010
replace filed_cases = 6699 if   circuit==   11  & year==   2010
replace filed_cases = 1189 if   circuit==   12 & year==   2011
replace filed_cases = 1481 if   circuit==   1  & year==   2011
replace filed_cases = 5533 if   circuit==   2  & year==   2011
replace filed_cases = 3754 if   circuit==   3  & year==   2011
replace filed_cases = 4663 if   circuit==   4  & year==   2011
replace filed_cases = 7687 if   circuit==   5  & year==   2011
replace filed_cases = 4954 if   circuit==   6  & year==   2011
replace filed_cases = 3082 if   circuit==   7  & year==   2011
replace filed_cases = 2904 if   circuit==   8  & year==   2011
replace filed_cases = 11975 if   circuit==   9  & year==   2011
replace filed_cases = 2241 if   circuit==   10  & year==   2011
replace filed_cases = 6290 if   circuit==   11  & year==   2011
replace filed_cases = 1200 if   circuit==   12 & year==   2012
replace filed_cases = 1578 if   circuit==   1  & year==   2012
replace filed_cases = 5710 if   circuit==   2  & year==   2012
replace filed_cases = 3784 if   circuit==   3  & year==   2012
replace filed_cases = 4803 if   circuit==   4  & year==   2012
replace filed_cases = 7429 if   circuit==   5  & year==   2012
replace filed_cases = 4710 if   circuit==   6  & year==   2012
replace filed_cases = 3008 if   circuit==   7  & year==   2012
replace filed_cases = 2960 if   circuit==   8  & year==   2012
replace filed_cases = 12438 if   circuit==   9  & year==   2012
replace filed_cases = 2290 if   circuit==   10  & year==   2012
replace filed_cases = 6714 if   circuit==   11  & year==   2012


replace pend_cases= 1233 if circuit== 1 & year== 2000
replace pend_cases= 1392 if circuit== 1 & year== 2001
replace pend_cases= 1316 if circuit== 1 & year== 2002
replace pend_cases= 1395 if circuit== 1 & year== 2003
replace pend_cases= 1541 if circuit== 1 & year== 2004
replace pend_cases= 1648 if circuit== 1 & year== 2005
replace pend_cases= 1631 if circuit== 1 & year== 2006
replace pend_cases= 1574 if circuit== 1 & year== 2007
replace pend_cases= 1497 if circuit== 1 & year== 2008
replace pend_cases= 1564 if circuit== 1 & year== 2009
replace pend_cases= 1360 if circuit== 1 & year== 2010
replace pend_cases= 1198 if circuit== 1 & year== 2011
replace pend_cases= 1248 if circuit== 1 & year== 2012
replace pend_cases= 3342 if circuit== 2 & year== 2000
replace pend_cases= 3677 if circuit== 2 & year== 2001
replace pend_cases= 4042 if circuit== 2 & year== 2002
replace pend_cases= 5801 if circuit== 2 & year== 2003
replace pend_cases= 8332 if circuit== 2 & year== 2004
replace pend_cases= 9857 if circuit== 2 & year== 2005
replace pend_cases= 8739 if circuit== 2 & year== 2006
replace pend_cases= 6146 if circuit== 2 & year== 2007
replace pend_cases= 6136 if circuit== 2 & year== 2008
replace pend_cases= 5415 if circuit== 2 & year== 2009
replace pend_cases= 4294 if circuit== 2 & year== 2010
replace pend_cases= 4382 if circuit== 2 & year== 2011
replace pend_cases= 4886 if circuit== 2 & year== 2012
replace pend_cases= 2759 if circuit== 3 & year== 2000
replace pend_cases= 3154 if circuit== 3 & year== 2001
replace pend_cases= 3154 if circuit== 3 & year== 2002
replace pend_cases= 3067 if circuit== 3 & year== 2003
replace pend_cases= 3085 if circuit== 3 & year== 2004
replace pend_cases= 3287 if circuit== 3 & year== 2005
replace pend_cases= 3736 if circuit== 3 & year== 2006
replace pend_cases= 3896 if circuit== 3 & year== 2007
replace pend_cases= 3719 if circuit== 3 & year== 2008
replace pend_cases= 3709 if circuit== 3 & year== 2009
replace pend_cases= 3152 if circuit== 3 & year== 2010
replace pend_cases= 2636 if circuit== 3 & year== 2011
replace pend_cases= 2305 if circuit== 3 & year== 2012
replace pend_cases= 2472 if circuit== 4 & year== 2000
replace pend_cases= 2612 if circuit== 4 & year== 2001
replace pend_cases= 2431 if circuit== 4 & year== 2002
replace pend_cases= 2385 if circuit== 4 & year== 2003
replace pend_cases= 2610 if circuit== 4 & year== 2004
replace pend_cases= 3030 if circuit== 4 & year== 2005
replace pend_cases= 3211 if circuit== 4 & year== 2006
replace pend_cases= 2922 if circuit== 4 & year== 2007
replace pend_cases= 2719 if circuit== 4 & year== 2008
replace pend_cases= 3305 if circuit== 4 & year== 2009
replace pend_cases= 3143 if circuit== 4 & year== 2010
replace pend_cases= 2912 if circuit== 4 & year== 2011
replace pend_cases= 2562 if circuit== 4 & year== 2012
replace pend_cases= 4815 if circuit== 5 & year== 2000
replace pend_cases= 4745 if circuit== 5 & year== 2001
replace pend_cases= 4818 if circuit== 5 & year== 2002
replace pend_cases= 4743 if circuit== 5 & year== 2003
replace pend_cases= 4413 if circuit== 5 & year== 2004
replace pend_cases= 5721 if circuit== 5 & year== 2005
replace pend_cases= 7108 if circuit== 5 & year== 2006
replace pend_cases= 6394 if circuit== 5 & year== 2007
replace pend_cases= 4937 if circuit== 5 & year== 2008
replace pend_cases= 5127 if circuit== 5 & year== 2009
replace pend_cases= 4639 if circuit== 5 & year== 2010
replace pend_cases= 4568 if circuit== 5 & year== 2011
replace pend_cases= 4571 if circuit== 5 & year== 2012
replace pend_cases= 3997 if circuit== 6 & year== 2000
replace pend_cases= 4214 if circuit== 6 & year== 2001
replace pend_cases= 4005 if circuit== 6 & year== 2002
replace pend_cases= 4206 if circuit== 6 & year== 2003
replace pend_cases= 4459 if circuit== 6 & year== 2004
replace pend_cases= 4498 if circuit== 6 & year== 2005
replace pend_cases= 4675 if circuit== 6 & year== 2006
replace pend_cases= 4474 if circuit== 6 & year== 2007
replace pend_cases= 4278 if circuit== 6 & year== 2008
replace pend_cases= 4224 if circuit== 6 & year== 2009
replace pend_cases= 4699 if circuit== 6 & year== 2010
replace pend_cases= 5252 if circuit== 6 & year== 2011
replace pend_cases= 4518 if circuit== 6 & year== 2012
replace pend_cases= 2359 if circuit== 7 & year== 2000
replace pend_cases= 1943 if circuit== 7 & year== 2001
replace pend_cases= 2022 if circuit== 7 & year== 2002
replace pend_cases= 2187 if circuit== 7 & year== 2003
replace pend_cases= 2272 if circuit== 7 & year== 2004
replace pend_cases= 2400 if circuit== 7 & year== 2005
replace pend_cases= 2254 if circuit== 7 & year== 2006
replace pend_cases= 2115 if circuit== 7 & year== 2007
replace pend_cases= 2254 if circuit== 7 & year== 2008
replace pend_cases= 2302 if circuit== 7 & year== 2009
replace pend_cases= 2083 if circuit== 7 & year== 2010
replace pend_cases= 1933 if circuit== 7 & year== 2011
replace pend_cases= 1926 if circuit== 7 & year== 2012
replace pend_cases= 2075 if circuit== 8 & year== 2000
replace pend_cases= 1857 if circuit== 8 & year== 2001
replace pend_cases= 1508 if circuit== 8 & year== 2002
replace pend_cases= 1758 if circuit== 8 & year== 2003
replace pend_cases= 1833 if circuit== 8 & year== 2004
replace pend_cases= 2331 if circuit== 8 & year== 2005
replace pend_cases= 2278 if circuit== 8 & year== 2006
replace pend_cases= 2049 if circuit== 8 & year== 2007
replace pend_cases= 1999 if circuit== 8 & year== 2008
replace pend_cases= 1986 if circuit== 8 & year== 2009
replace pend_cases= 1632 if circuit== 8 & year== 2010
replace pend_cases= 1389 if circuit== 8 & year== 2011
replace pend_cases= 1438 if circuit== 8 & year== 2012
replace pend_cases= 9394 if circuit== 9 & year== 2000
replace pend_cases= 9655 if circuit== 9 & year== 2001
replace pend_cases= 9159 if circuit== 9 & year== 2002
replace pend_cases= 10855 if circuit== 9 & year== 2003
replace pend_cases= 12205 if circuit== 9 & year== 2004
replace pend_cases= 14899 if circuit== 9 & year== 2005
replace pend_cases= 17274 if circuit== 9 & year== 2006
replace pend_cases= 16849 if circuit== 9 & year== 2007
replace pend_cases= 16774 if circuit== 9 & year== 2008
replace pend_cases= 17208 if circuit== 9 & year== 2009
replace pend_cases= 15907 if circuit== 9 & year== 2010
replace pend_cases= 14111 if circuit== 9 & year== 2011
replace pend_cases= 14100 if circuit== 9 & year== 2012
replace pend_cases= 2020 if circuit== 10 & year== 2000
replace pend_cases= 1915 if circuit== 10 & year== 2001
replace pend_cases= 1987 if circuit== 10 & year== 2002
replace pend_cases= 1994 if circuit== 10 & year== 2003
replace pend_cases= 1935 if circuit== 10 & year== 2004
replace pend_cases= 2329 if circuit== 10 & year== 2005
replace pend_cases= 2270 if circuit== 10 & year== 2006
replace pend_cases= 2030 if circuit== 10 & year== 2007
replace pend_cases= 1885 if circuit== 10 & year== 2008
replace pend_cases= 1638 if circuit== 10 & year== 2009
replace pend_cases= 1592 if circuit== 10 & year== 2010
replace pend_cases= 1330 if circuit== 10 & year== 2011
replace pend_cases= 1401 if circuit== 10 & year== 2012
replace pend_cases= 5179 if circuit== 11 & year== 2000
replace pend_cases= 4126 if circuit== 11 & year== 2001
replace pend_cases= 3618 if circuit== 11 & year== 2002
replace pend_cases= 3324 if circuit== 11 & year== 2003
replace pend_cases= 3189 if circuit== 11 & year== 2004
replace pend_cases= 3905 if circuit== 11 & year== 2005
replace pend_cases= 3809 if circuit== 11 & year== 2006
replace pend_cases= 3195 if circuit== 11 & year== 2007
replace pend_cases= 3279 if circuit== 11 & year== 2008
replace pend_cases= 3673 if circuit== 11 & year== 2009
replace pend_cases= 3540 if circuit== 11 & year== 2010
replace pend_cases= 3949 if circuit== 11 & year== 2011
replace pend_cases= 3790 if circuit== 11 & year== 2012
replace pend_cases= 1265 if circuit== 12 & year== 2000
replace pend_cases= 1319 if circuit== 12 & year== 2001
replace pend_cases= 1188 if circuit== 12 & year== 2002
replace pend_cases= 1001 if circuit== 12 & year== 2003
replace pend_cases= 1102 if circuit== 12 & year== 2004
replace pend_cases= 1313 if circuit== 12 & year== 2005
replace pend_cases= 1504 if circuit== 12 & year== 2006
replace pend_cases= 1441 if circuit== 12 & year== 2007
replace pend_cases= 1542 if circuit== 12 & year== 2008
replace pend_cases= 1412 if circuit== 12 & year== 2009
replace pend_cases= 1379 if circuit== 12 & year== 2010
replace pend_cases= 1287 if circuit== 12 & year== 2011
replace pend_cases= 1369 if circuit== 12 & year== 2012
     
     
replace term_cases= 1382 if circuit== 1 & year== 2000
replace term_cases= 1452 if circuit== 1 & year== 2001
replace term_cases= 1741 if circuit== 1 & year== 2002
replace term_cases= 1534 if circuit== 1 & year== 2003
replace term_cases= 1635 if circuit== 1 & year== 2004
replace term_cases= 1651 if circuit== 1 & year== 2005
replace term_cases= 2080 if circuit== 1 & year== 2006
replace term_cases= 1818 if circuit== 1 & year== 2007
replace term_cases= 1804 if circuit== 1 & year== 2008
replace term_cases= 1579 if circuit== 1 & year== 2009
replace term_cases= 1759 if circuit== 1 & year== 2010
replace term_cases= 1548 if circuit== 1 & year== 2011
replace term_cases= 1528 if circuit== 1 & year== 2012
replace term_cases= 4750 if circuit== 2 & year== 2000
replace term_cases= 4362 if circuit== 2 & year== 2001
replace term_cases= 4174 if circuit== 2 & year== 2002
replace term_cases= 4118 if circuit== 2 & year== 2003
replace term_cases= 4068 if circuit== 2 & year== 2004
replace term_cases= 5488 if circuit== 2 & year== 2005
replace term_cases= 8222 if circuit== 2 & year== 2006
replace term_cases= 8251 if circuit== 2 & year== 2007
replace term_cases= 6616 if circuit== 2 & year== 2008
replace term_cases= 6438 if circuit== 2 & year== 2009
replace term_cases= 6850 if circuit== 2 & year== 2010
replace term_cases= 5487 if circuit== 2 & year== 2011
replace term_cases= 5206 if circuit== 2 & year== 2012
replace term_cases= 3187 if circuit== 3 & year== 2000
replace term_cases= 3251 if circuit== 3 & year== 2001
replace term_cases= 3707 if circuit== 3 & year== 2002
replace term_cases= 3824 if circuit== 3 & year== 2003
replace term_cases= 3844 if circuit== 3 & year== 2004
replace term_cases= 3858 if circuit== 3 & year== 2005
replace term_cases= 4341 if circuit== 3 & year== 2006
replace term_cases= 3988 if circuit== 3 & year== 2007
replace term_cases= 4103 if circuit== 3 & year== 2008
replace term_cases= 3892 if circuit== 3 & year== 2009
replace term_cases= 4297 if circuit== 3 & year== 2010
replace term_cases= 4238 if circuit== 3 & year== 2011
replace term_cases= 4115 if circuit== 3 & year== 2012
replace term_cases= 4832 if circuit== 4 & year== 2000
replace term_cases= 4730 if circuit== 4 & year== 2001
replace term_cases= 5356 if circuit== 4 & year== 2002
replace term_cases= 4815 if circuit== 4 & year== 2003
replace term_cases= 4574 if circuit== 4 & year== 2004
replace term_cases= 4777 if circuit== 4 & year== 2005
replace term_cases= 5344 if circuit== 4 & year== 2006
replace term_cases= 5094 if circuit== 4 & year== 2007
replace term_cases= 4807 if circuit== 4 & year== 2008
replace term_cases= 5051 if circuit== 4 & year== 2009
replace term_cases= 5190 if circuit== 4 & year== 2010
replace term_cases= 4897 if circuit== 4 & year== 2011
replace term_cases= 5153 if circuit== 4 & year== 2012
replace term_cases= 8692 if circuit== 5 & year== 2000
replace term_cases= 8649 if circuit== 5 & year== 2001
replace term_cases= 8561 if circuit== 5 & year== 2002
replace term_cases= 8844 if circuit== 5 & year== 2003
replace term_cases= 8749 if circuit== 5 & year== 2004
replace term_cases= 7709 if circuit== 5 & year== 2005
replace term_cases= 7939 if circuit== 5 & year== 2006
replace term_cases= 9421 if circuit== 5 & year== 2007
replace term_cases= 9072 if circuit== 5 & year== 2008
replace term_cases= 7316 if circuit== 5 & year== 2009
replace term_cases= 7683 if circuit== 5 & year== 2010
replace term_cases= 7740 if circuit== 5 & year== 2011
replace term_cases= 7426 if circuit== 5 & year== 2012
replace term_cases= 5066 if circuit== 6 & year== 2000
replace term_cases= 4801 if circuit== 6 & year== 2001
replace term_cases= 4882 if circuit== 6 & year== 2002
replace term_cases= 4527 if circuit== 6 & year== 2003
replace term_cases= 4762 if circuit== 6 & year== 2004
replace term_cases= 4761 if circuit== 6 & year== 2005
replace term_cases= 5275 if circuit== 6 & year== 2006
replace term_cases= 5111 if circuit== 6 & year== 2007
replace term_cases= 4890 if circuit== 6 & year== 2008
replace term_cases= 4864 if circuit== 6 & year== 2009
replace term_cases= 4595 if circuit== 6 & year== 2010
replace term_cases= 4440 if circuit== 6 & year== 2011
replace term_cases= 5444 if circuit== 6 & year== 2012
replace term_cases= 3358 if circuit== 7 & year== 2000
replace term_cases= 3783 if circuit== 7 & year== 2001
replace term_cases= 3375 if circuit== 7 & year== 2002
replace term_cases= 3355 if circuit== 7 & year== 2003
replace term_cases= 3302 if circuit== 7 & year== 2004
replace term_cases= 3357 if circuit== 7 & year== 2005
replace term_cases= 4103 if circuit== 7 & year== 2006
replace term_cases= 3473 if circuit== 7 & year== 2007
replace term_cases= 3076 if circuit== 7 & year== 2008
replace term_cases= 3416 if circuit== 7 & year== 2009
replace term_cases= 3367 if circuit== 7 & year== 2010
replace term_cases= 3232 if circuit== 7 & year== 2011
replace term_cases= 3015 if circuit== 7 & year== 2012
replace term_cases= 3202 if circuit== 8 & year== 2000
replace term_cases= 3188 if circuit== 8 & year== 2001
replace term_cases= 3441 if circuit== 8 & year== 2002
replace term_cases= 2984 if circuit== 8 & year== 2003
replace term_cases= 2964 if circuit== 8 & year== 2004
replace term_cases= 2893 if circuit== 8 & year== 2005
replace term_cases= 3632 if circuit== 8 & year== 2006
replace term_cases= 3326 if circuit== 8 & year== 2007
replace term_cases= 3025 if circuit== 8 & year== 2008
replace term_cases= 3078 if circuit== 8 & year== 2009
replace term_cases= 3365 if circuit== 8 & year== 2010
replace term_cases= 3148 if circuit== 8 & year== 2011
replace term_cases= 2911 if circuit== 8 & year== 2012
replace term_cases= 8777 if circuit== 9 & year== 2000
replace term_cases= 9569 if circuit== 9 & year== 2001
replace term_cases= 10164 if circuit== 9 & year== 2002
replace term_cases= 10766 if circuit== 9 & year== 2003
replace term_cases= 11595 if circuit== 9 & year== 2004
replace term_cases= 12572 if circuit== 9 & year== 2005
replace term_cases= 13590 if circuit== 9 & year== 2006
replace term_cases= 13604 if circuit== 9 & year== 2007
replace term_cases= 13101 if circuit== 9 & year== 2008
replace term_cases= 12705 if circuit== 9 & year== 2009
replace term_cases= 12889 if circuit== 9 & year== 2010
replace term_cases= 13730 if circuit== 9 & year== 2011
replace term_cases= 12449 if circuit== 9 & year== 2012
replace term_cases= 2637 if circuit== 10 & year== 2000
replace term_cases= 2842 if circuit== 10 & year== 2001
replace term_cases= 2630 if circuit== 10 & year== 2002
replace term_cases= 2633 if circuit== 10 & year== 2003
replace term_cases= 2544 if circuit== 10 & year== 2004
replace term_cases= 2468 if circuit== 10 & year== 2005
replace term_cases= 2960 if circuit== 10 & year== 2006
replace term_cases= 2839 if circuit== 10 & year== 2007
replace term_cases= 2446 if circuit== 10 & year== 2008
replace term_cases= 2472 if circuit== 10 & year== 2009
replace term_cases= 2396 if circuit== 10 & year== 2010
replace term_cases= 2330 if circuit== 10 & year== 2011
replace term_cases= 2219 if circuit== 10 & year== 2012
replace term_cases= 8198 if circuit== 11 & year== 2000
replace term_cases= 8220 if circuit== 11 & year== 2001
replace term_cases= 8152 if circuit== 11 & year== 2002
replace term_cases= 7620 if circuit== 11 & year== 2003
replace term_cases= 7044 if circuit== 11 & year== 2004
replace term_cases= 6804 if circuit== 11 & year== 2005
replace term_cases= 8117 if circuit== 11 & year== 2006
replace term_cases= 7087 if circuit== 11 & year== 2007
replace term_cases= 6277 if circuit== 11 & year== 2008
replace term_cases= 7393 if circuit== 11 & year== 2009
replace term_cases= 6833 if circuit== 11 & year== 2010
replace term_cases= 6279 if circuit== 11 & year== 2011
replace term_cases= 6418 if circuit== 11 & year== 2012
replace term_cases= 1597 if circuit== 12 & year== 2000
replace term_cases= 1363 if circuit== 12 & year== 2001
replace term_cases= 1424 if circuit== 12 & year== 2002
replace term_cases= 1264 if circuit== 12 & year== 2003
replace term_cases= 1162 if circuit== 12 & year== 2004
replace term_cases= 1148 if circuit== 12 & year== 2005
replace term_cases= 1189 if circuit== 12 & year== 2006
replace term_cases= 1296 if circuit== 12 & year== 2007
replace term_cases= 1222 if circuit== 12 & year== 2008
replace term_cases= 1400 if circuit== 12 & year== 2009
replace term_cases= 1092 if circuit== 12 & year== 2010
replace term_cases= 1280 if circuit== 12 & year== 2011
replace term_cases= 1118 if circuit== 12 & year== 2012

replace indp = 1 if agency_id==1
replace indp = 1 if agency_id==2
replace indp = 1 if agency_id==3
replace indp = 0 if agency_id==4
replace indp = 0 if agency_id==5
replace indp = 0 if agency_id==6
replace indp = 0 if agency_id==7
replace indp = 0 if agency_id==8
replace indp = 0 if agency_id==9

count if indp==.
tab agency_id if indp==.

**logging the cases 
gen ln_term = ln(term_cases), after(term_cases)
gen ln_filed = ln(filed_cases), after(filed_cases)
gen ln_pend = ln(pend_cases), after(pend_cases)

hist ln_filed 
hist agency_ideo
hist crt_ideo
hist pres_ideo1

scatter (count) agency_ideo
scatter (count) pres_ideo1
scatter (count) crt_ideo

**creating a civil rights and economic agency variable, along with department varaibles
*gen dol = 0, after(agency_id)
*gen doj = 0, after(dol)
*gen civil_rights = 0, after(agency_id)
*gen economic = 0, after(civil_rights)

lab var doj "Dept. of Justice"
lab var dol "Dept. of Labor"
lab var civil_rights "Civil Rights Agency"
lab var economic "Economic Agency"

replace doj = 1 if agency_id==4
replace doj = 1 if agency_id==5

replace dol = 1 if agency_id==6
replace dol = 1 if agency_id==7
replace dol = 1 if agency_id==8
replace dol = 1 if agency_id==9

replace civil_rights = 1 if agency_id==1 
replace civil_rights = 1 if agency_id==5

replace economic = 1 if agency_id==2
replace economic = 1 if agency_id==3
replace economic = 1 if agency_id==4
replace economic = 1 if agency_id==6
replace economic = 1 if agency_id==7
replace economic = 1 if agency_id==8
replace economic = 1 if agency_id==9

***Labels that were missing. 
lab var ln_filed "Log Filed Cases"
lab var ln_pend "Log Pending Cases"
lab var ln_term "Log Terminated Cases"

***Number of judges in a circuit

*this first variable, seats, shows the number of seats in a circuit. Vacancy isn't in this one.
gen judgeships = ., after(ln_term)

lab var judgeships "Circuit Judgeships"

replace judgeships = 6 if circuit==1 & year>1984
replace judgeships = 13 if circuit==2 & year>1984
replace judgeships = 14 if circuit==3 & year>1990
replace judgeships = 15 if circuit==4 & year>1990
replace judgeships = 17 if circuit==5 & year>1990
replace judgeships = 16 if circuit==6 & year>1990
replace judgeships = 11 if circuit==7 & year>1984
replace judgeships = 11 if circuit==8 & year>1990
replace judgeships = 28 if circuit==9 & year<2008
replace judgeships = 29 if circuit==9 & year>=2008
replace judgeships = 12 if circuit==10 & year>1990
replace judgeships = 12 if circuit==11 & year>1980
replace judgeships = 12 if circuit==12 & year<2008
replace judgeships = 11 if circuit==12 & year>=2008

**This the number of active judges, not including senior judges
**who are retired but hear a number of cases.
gen judges = ., after(ln_term)

replace judges = 6 if circuit==1 & year==2000
replace judges = 5 if circuit==1 & year==2001
replace judges = 6 if circuit==1 & year==2002
replace judges = 6 if circuit==1 & year==2003
replace judges = 6 if circuit==1 & year==2004
replace judges = 6 if circuit==1 & year==2005
replace judges = 5 if circuit==1 & year==2006
replace judges = 5 if circuit==1 & year==2007
replace judges = 5 if circuit==1 & year==2008
replace judges = 5 if circuit==1 & year==2009
replace judges = 6 if circuit==1 & year==2010
replace judges = 5 if circuit==1 & year==2011
replace judges = 5 if circuit==1 & year==2012

replace judges = 12 if circuit==2 & year==2000
replace judges = 13 if circuit==2 & year==2001
replace judges = 12 if circuit==2 & year==2002
replace judges = 12 if circuit==2 & year==2003
replace judges = 13 if circuit==2 & year==2004 
replace judges = 13 if circuit==2 & year==2005
replace judges = 12 if circuit==2 & year==2006
replace judges = 13 if circuit==2 & year==2007
replace judges = 12 if circuit==2 & year==2008
replace judges = 9 if circuit==2 & year==2009
replace judges = 11 if circuit==2 & year==2010
replace judges = 13 if circuit==2 & year==2011
replace judges = 13 if circuit==2 & year==2012

replace judges = 12 if circuit==3 & year==2000
replace judges = 12 if circuit==3 & year==2001
replace judges = 12 if circuit==3 & year==2002
replace judges = 13 if circuit==3 & year==2003
replace judges = 14 if circuit==3 & year==2004
replace judges = 12 if circuit==3 & year==2005
replace judges = 11 if circuit==3 & year==2006
replace judges = 12 if circuit==3 & year==2007
replace judges = 12 if circuit==3 & year==2008
replace judges = 12 if circuit==3 & year==2009
replace judges = 14 if circuit==3 & year==2010
replace judges = 13 if circuit==3 & year==2011
replace judges = 13 if circuit==3 & year==2012

replace judges = 11 if circuit==4 & year==2000
replace judges = 11 if circuit==4 & year==2001
replace judges = 12 if circuit==4 & year==2002
replace judges = 13 if circuit==4 & year==2003
replace judges = 13 if circuit==4 & year==2004
replace judges = 13 if circuit==4 & year==2005
replace judges = 12 if circuit==4 & year==2006
replace judges = 10 if circuit==4 & year==2007
replace judges = 11 if circuit==4 & year==2008
replace judges = 11 if circuit==4 & year==2009
replace judges = 14 if circuit==4 & year==2010
replace judges = 14 if circuit==4 & year==2011
replace judges = 15 if circuit==4 & year==2012

replace judges = 14 if circuit==5 & year==2000
replace judges = 15 if circuit==5 & year==2001
replace judges = 15 if circuit==5 & year==2002
replace judges = 15 if circuit==5 & year==2003
replace judges = 15 if circuit==5 & year==2004
replace judges = 16 if circuit==5 & year==2005
replace judges = 15 if circuit==5 & year==2006
replace judges = 16 if circuit==5 & year==2007
replace judges = 17 if circuit==5 & year==2008
replace judges = 16 if circuit==5 & year==2009
replace judges = 15 if circuit==5 & year==2010
replace judges = 17 if circuit==5 & year==2011
replace judges = 15 if circuit==5 & year==2012

replace judges = 12 if circuit==6 & year==2000
replace judges = 8 if circuit==6 & year==2001
replace judges = 10 if circuit==6 & year==2002
replace judges = 12 if circuit==6 & year==2003
replace judges = 12 if circuit==6 & year==2004
replace judges = 15 if circuit==6 & year==2005
replace judges = 14 if circuit==6 & year==2006
replace judges = 14 if circuit==6 & year==2007
replace judges = 15 if circuit==6 & year==2008
replace judges = 15 if circuit==6 & year==2009
replace judges = 15 if circuit==6 & year==2010
replace judges = 16 if circuit==6 & year==2011
replace judges = 16 if circuit==6 & year==2012

replace judges = 11 if circuit==7 & year==2000
replace judges = 11 if circuit==7 & year==2001
replace judges = 11 if circuit==7 & year==2002
replace judges = 11 if circuit==7 & year==2003
replace judges = 11 if circuit==7 & year==2004
replace judges = 11 if circuit==7 & year==2005
replace judges = 11 if circuit==7 & year==2006
replace judges = 11 if circuit==7 & year==2007
replace judges = 10 if circuit==7 & year==2008
replace judges = 11 if circuit==7 & year==2009
replace judges = 10 if circuit==7 & year==2010
replace judges = 10 if circuit==7 & year==2011
replace judges = 10 if circuit==7 & year==2012

replace judges = 10 if circuit==8 & year==2000
replace judges = 9 if circuit==8 & year==2001
replace judges = 11 if circuit==8 & year==2002
replace judges = 9 if circuit==8 & year==2003
replace judges = 11 if circuit==8 & year==2004
replace judges = 11 if circuit==8 & year==2005
replace judges = 11 if circuit==8 & year==2006
replace judges = 11 if circuit==8 & year==2007
replace judges = 11 if circuit==8 & year==2008
replace judges = 11 if circuit==8 & year==2009
replace judges = 11 if circuit==8 & year==2010
replace judges = 11 if circuit==8 & year==2011
replace judges = 11 if circuit==8 & year==2012

replace judges = 25 if circuit==9 & year==2000
replace judges = 25 if circuit==9 & year==2001
replace judges = 24 if circuit==9 & year==2002
replace judges = 26 if circuit==9 & year==2003
replace judges = 24 if circuit==9 & year==2004
replace judges = 24 if circuit==9 & year==2005
replace judges = 26 if circuit==9 & year==2006
replace judges = 27 if circuit==9 & year==2007
replace judges = 27 if circuit==9 & year==2008
replace judges = 27 if circuit==9 & year==2009
replace judges = 25 if circuit==9 & year==2010
replace judges = 25 if circuit==9 & year==2011
replace judges = 28 if circuit==9 & year==2012

replace judges = 10 if circuit==10 & year==2000
replace judges = 9 if circuit==10 & year==2001
replace judges = 11 if circuit==10 & year==2002
replace judges = 12 if circuit==10 & year==2003
replace judges = 12 if circuit==10 & year==2004
replace judges = 11 if circuit==10 & year==2005
replace judges = 12 if circuit==10 & year==2006
replace judges = 12 if circuit==10 & year==2007
replace judges = 12 if circuit==10 & year==2008
replace judges = 11 if circuit==10 & year==2009
replace judges = 11 if circuit==10 & year==2010
replace judges = 10 if circuit==10 & year==2011
replace judges = 9 if circuit==10 & year==2012

replace judges = 11 if circuit==11 & year==2000
replace judges = 11 if circuit==11 & year==2001
replace judges = 11 if circuit==11 & year==2002
replace judges = 11 if circuit==11 & year==2003
replace judges = 12 if circuit==11 & year==2004
replace judges = 12 if circuit==11 & year==2005
replace judges = 12 if circuit==11 & year==2006
replace judges = 12 if circuit==11 & year==2007
replace judges = 12 if circuit==11 & year==2008
replace judges = 11 if circuit==11 & year==2009
replace judges = 11 if circuit==11 & year==2010
replace judges = 10 if circuit==11 & year==2011
replace judges = 10 if circuit==11 & year==2012

replace judges = 9 if circuit==12 & year==2000
replace judges = 8 if circuit==12 & year==2001
replace judges = 8 if circuit==12 & year==2002
replace judges = 9 if circuit==12 & year==2003
replace judges = 9 if circuit==12 & year==2004
replace judges = 9 if circuit==12 & year==2005
replace judges = 10 if circuit==12 & year==2006
replace judges = 10 if circuit==12 & year==2007
replace judges = 9 if circuit==12 & year==2008
replace judges = 9 if circuit==12 & year==2009
replace judges = 9 if circuit==12 & year==2010
replace judges = 8 if circuit==12 & year==2011
replace judges = 8 if circuit==12 & year==2012

lab var judges "Active Judges on Circuit"

***cases per judgeship is a better measure of workload.
**Theoretically, it's more sound than choosing active and senior judges.
**Clerkships and financial resources for judges are probably based on judgships,
**rather than the actual number of judges. Maybe?
gen prod_judgeships = filed_cases/judgeships, after(judgeships)
lab var prod_judgeships "Num. of filed cases by judgeships"

gen prod_judges = filed_cases/judges, after(judgeships)
lab var prod_judges "Num. of filed cases by judges"

***agency budgets
gen budget = ., after(agency_age)

replace budget = 280928000 if agency_id==1 & year==2000
replace budget = 303195000 if agency_id==1 & year==2001
replace budget = 310406000 if agency_id==1 & year==2002
replace budget = 321815000 if agency_id==1 & year==2003
replace budget = 324944000 if agency_id==1 & year==2004
replace budget = 326804000 if agency_id==1 & year==2005
replace budget = 326883000 if agency_id==1 & year==2006
replace budget = 328745000 if agency_id==1 & year==2007
replace budget = 329300000 if agency_id==1 & year==2008
replace budget = 343925000 if agency_id==1 & year==2009
replace budget = 367303000 if agency_id==1 & year==2010
replace budget = 366568000 if agency_id==1 & year==2011
replace budget = 360000000 if agency_id==1 & year==2012

replace budget = 125000000 if agency_id==2 & year==2000
replace budget = 147000000 if agency_id==2 & year==2001
replace budget = 156000000 if agency_id==2 & year==2002
replace budget = 177000000 if agency_id==2 & year==2003
replace budget = 186000000 if agency_id==2 & year==2004
replace budget = 205000000 if agency_id==2 & year==2005
replace budget = 211000000 if agency_id==2 & year==2006
replace budget = 211000000 if agency_id==2 & year==2007
replace budget = 244000000 if agency_id==2 & year==2008
replace budget = 259000000 if agency_id==2 & year==2009
replace budget = 292000000 if agency_id==2 & year==2010
replace budget = 291000000 if agency_id==2 & year==2011
replace budget = 312000000 if agency_id==2 & year==2012

replace budget = 377000000 if agency_id==3 & year==2000
replace budget = 422800000 if agency_id==3 & year==2001
replace budget = 513989000 if agency_id==3 & year==2002
replace budget = 716350000 if agency_id==3 & year==2003
replace budget = 811500000 if agency_id==3 & year==2004
replace budget = 913000000 if agency_id==3 & year==2005
replace budget = 888117000 if agency_id==3 & year==2006
replace budget = 881560000 if agency_id==3 & year==2007
replace budget = 906000000 if agency_id==3 & year==2008
replace budget = 953000000 if agency_id==3 & year==2009
replace budget = 1111000000 if agency_id==3 & year==2010
replace budget = 1185000000 if agency_id==3 & year==2011
replace budget = 1321000000 if agency_id==3 & year==2012

replace budget = 110000000 if agency_id==4 & year==2000
replace budget = 120838000 if agency_id==4 & year==2001
replace budget = 130791000 if agency_id==4 & year==2002
replace budget = 137799000 if agency_id==4 & year==2003
replace budget = 133133000 if agency_id==4 & year==2004
replace budget = 138763000 if agency_id==4 & year==2005
replace budget = 144451000 if agency_id==4 & year==2006
replace budget = 145361000 if agency_id==4 & year==2007
replace budget = 147819000 if agency_id==4 & year==2008
replace budget = 157800000 if agency_id==4 & year==2009
replace budget = 163200000 if agency_id==4 & year==2010
replace budget = 163200000 if agency_id==4 & year==2011
replace budget = 159600000 if agency_id==4 & year==2012

replace budget = 97922000 if agency_id==5 & year==2000
replace budget = 91963000 if agency_id==5 & year==2001
replace budget = 100642000 if agency_id==5 & year==2002
replace budget = 105099000 if agency_id==5 & year==2003
replace budget = 108842000 if agency_id==5 & year==2004
replace budget = 107680000 if agency_id==5 & year==2005
replace budget = 109036000 if agency_id==5 & year==2006
replace budget = 113597000 if agency_id==5 & year==2007
replace budget = 114450000 if agency_id==5 & year==2008
replace budget = 123151000 if agency_id==5 & year==2009
replace budget = 145449000 if agency_id==5 & year==2010
replace budget = 144000000 if agency_id==5 & year==2011
replace budget = 144500000 if agency_id==5 & year==2012

**Appropriations Bills
replace budget = 337260000 if agency_id==6 & year==2000
replace budget = 361491000 if agency_id==6 & year==2001
replace budget = 369220000 if agency_id==6 & year==2002
replace budget = 382067000 if agency_id==6 & year==2003
replace budget = 390045000 if agency_id==6 & year==2004
replace budget = 400797000 if agency_id==6 & year==2005
*DoL budget documents
replace budget = 1056342000 if agency_id==6 & year==2006
replace budget = 1065434000 if agency_id==6 & year==2007
replace budget = 1066000000 if agency_id==6 & year==2008
replace budget = 9320683000 if agency_id==6 & year==2009
replace budget = 302494000 if agency_id==6 & year==2010
replace budget = 296152000 if agency_id==6 & year==2011
replace budget = 295000000 if agency_id==6 & year==2012

**Appropriations Bills
replace budget = 337260000 if agency_id==7 & year==2000
replace budget = 361491000 if agency_id==7 & year==2001
replace budget = 369220000 if agency_id==7 & year==2002
replace budget = 382067000 if agency_id==7 & year==2003
replace budget = 390045000 if agency_id==7 & year==2004
replace budget = 400797000 if agency_id==7 & year==2005
*DoL budget documents
replace budget = 165685000 if agency_id==7 & year==2006
replace budget = 170220000 if agency_id==7 & year==2007
replace budget = 175658000 if agency_id==7 & year==2008
replace budget = 193092000 if agency_id==7 & year==2009
replace budget = 227262000 if agency_id==7 & year==2010
replace budget = 227491000 if agency_id==7 & year==2011
replace budget = 227061000 if agency_id==7 & year==2012

**Appropriations Bills
replace budget = 382000000 if agency_id==8 & year==2000
replace budget = 425983000 if agency_id==8 & year==2001
replace budget = 443651000 if agency_id==8 & year==2002
replace budget = 469604000 if agency_id==8 & year==2003
replace budget = 463324000 if agency_id==8 & year==2004
replace budget = 461599000 if agency_id==8 & year==2005
*DoL budget documents
replace budget = 472427000 if agency_id==8 & year==2006
replace budget = 486925000 if agency_id==8 & year==2007
replace budget = 486001000 if agency_id==8 & year==2008
replace budget = 513042000 if agency_id==8 & year==2009
replace budget = 558620000 if agency_id==8 & year==2010
replace budget = 558619000 if agency_id==8 & year==2011
replace budget = 564788000 if agency_id==8 & year==2012

**Appropriations Bills
replace budget = 99000000 if agency_id==9 & year==2000
replace budget = 107832000 if agency_id==9 & year==2001
replace budget = 109866000 if agency_id==9 & year==2002
replace budget = 114044000 if agency_id==9 & year==2003
replace budget = 121316000 if agency_id==9 & year==2004
replace budget = 132345000 if agency_id==9 & year==2005
*DoL budget documents
replace budget = 133550000 if agency_id==9 & year==2006
replace budget = 141573000 if agency_id==9 & year==2007
replace budget = 139313000 if agency_id==9 & year==2008
replace budget = 143419000 if agency_id==9 & year==2009
replace budget = 154861000 if agency_id==9 & year==2010
replace budget = 154551000 if agency_id==9 & year==2011
replace budget = 183153000 if agency_id==9 & year==2012

lab var budget "Agency budget for FY"

hist budget
sum budget
gen ln_budget = ln(budget)
hist ln_budget
sum ln_budget
lab var ln_budget "Logged agency budget for FY"

save "./Data/basic_dataset.dta", replace
