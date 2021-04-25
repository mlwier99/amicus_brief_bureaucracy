cd ".\amicus_briefs_bureaucracy\Fall2016\Data"
import excel "Amicus_Briefs.xlsx", sheet("CircuitsOnly") firstrow case(lower) allstring clear

**dropping what's not in analysis daterange 
destring year, replace
drop if year>2012

**dropping non-normal circuits and dealing with DC
drop if circuit=="Federal"
replace circuit = "12" if circuit=="DC"
destring circuit, replace

**Generating variable labels 
lab var casename "Name of the Case"
lab var circuit "Circuit Court of Case"
lab var year "Year of Case
lab var datefiled "Filing Date of Amicus Brief"
lab var agency "Which agency?"
lab var basis "Basis for agency involvement"
lab var statutes "Statutes agency envokes"
lab var case_no "Case ID number"

**generating a varaible for cases where the court invited an agency to file 
gen invitation = ., after(datefiled)
lab var invitation "Did court invite agency amici?"

**generating agency id numbers
gen agency_id = ., after(agency)

replace agency_id = 1 if agency=="EEOC"
replace agency_id = 2 if agency=="FTC"
replace agency_id = 3 if agency=="SEC"
replace agency_id = 4 if agency=="DoJ Antitrust"
replace agency_id = 5 if agency=="DoJ, Civil Rights"
replace agency_id = 6 if agency=="Division of Black Lung and Longshore Legal Services"
replace agency_id = 7 if agency=="Division of Fair Labor Standards"
replace agency_id = 8 if agency=="Division of Occupational Safety and Health"
replace agency_id = 9 if agency=="Division of Plan Benefits Security"

lab define agency_id 1"EEOC" 2"FTC" 3"SEC" 4"Antitrst" 5"Civil Rights" 6"BLLLS" 7"FLS" 8"OHS" 9"PBS"
lab values agency_id agency_id

**generating civil rights, economic, doj, and dol agencies
gen civil_rights = 0
gen economic = 0
gen labor = 0
gen justice = 0

replace civil_rights = 1 if agency_id==1 | agency_id==5
replace economic = 1 if agency_id==2 | agency_id==3 | agency_id==4  
replace labor = 1 if agency_id==6 | agency_id==7 | agency_id==8 | agency_id==9
replace justice =1 if agency_id==5 | agency_id==4

**duplicate tagging
duplicates tag casename, generate(dup_name)
duplicates tag case_no, generate(dup_caseno1)
duplicates tag, generate(dup_all)

lab var dup_name "Duplicated case names" 
lab var dup_caseno1 "Duplicated case numbers"
lab var dup_all "Duplicated: all variables"

count if dup_name!=0
count if dup_caseno1 != 0
count if dup_all != 0

outsheet casename case_no circuit agency datefiled dup_all dup_caseno1 dup_name if dup_name!=0 using dup_caseno.xls, lab replace

outsheet casename case_no circuit agency datefiled dup_all dup_caseno1 dup_name if dup_name!=0 using dup_name.xls, lab replace

count if dup_all != 0

count if dup_caseno1!=0 & dup_name!=0

**The duplicates are from repeat filings, or different case numbers with the same name. 
**So I'm going to just let them stay. These are still resource draining, in line with my theory.
drop if year<2000

**SO now, counting per year per circuit by agency. 
graph bar (count) if agency_id==1, over(circuit) by(year) blabel(bar)
graph bar (count) if agency_id==2, over(circuit) by(year) blabel(bar)
graph bar (count) if agency_id==3, over(circuit) by(year) blabel(bar)
graph bar (count) if agency_id==4, over(circuit) by(year) blabel(bar)
graph bar (count) if agency_id==5, over(circuit) by(year) blabel(bar)
graph bar (count) if agency_id==6, over(circuit) by(year) blabel(bar)
graph bar (count) if agency_id==7, over(circuit) by(year) blabel(bar)
graph bar (count) if agency_id==8, over(circuit) by(year) blabel(bar)
graph bar (count) if agency_id==9, over(circuit) by(year) blabel(bar)
