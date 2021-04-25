cd ".\amicus_briefs_bureaucracy\Fall2016\Data\"
use "base_yearcircuitcount.dta", clear

rename agency agency_id
gen agency = "", before(agency_id)
 
hist count, discrete kdens normal title(All Agencies Count) caption(Figure 1)
hist count if count!=0, discrete kdens normal 

**generating civil rights, economic, doj, and dol agencies
gen civil_rights = 0
gen economic = 0
gen labor = 0
gen justice = 0

replace civil_rights = 1 if agency_id==1 | agency_id==5
replace economic = 1 if agency_id==2 | agency_id==3 | agency_id==4  
replace labor = 1 if agency_id==6 | agency_id==7 | agency_id==8 | agency_id==9
replace justice =1 if agency_id==5 | agency_id==4

replace agency = "EEOC" if agency_id==1
replace agency = "FTC" if agency_id==2
replace agency = "SEC" if agency_id==3
replace agency = "Antitrust" if agency_id==4
replace agency = "Civil Rights" if agency_id==5
replace agency = "BLLLS" if agency_id==6
replace agency = "FLS" if agency_id==7
replace agency = "OSH" if agency_id==8
replace agency = "PBS" if agency_id==9

hist count if civil_rights==1, discrete kdens normal title(Civil Rights Agencies Count) 
hist count if count!=0 & civil_rights==1, discrete kdens normal title(Economic Agencies Count)

hist count if economic==1, discrete kdens normal
hist count if count!=0 & economic==1, discrete kdens normal 
/*
hist count if agency_id==1, discrete kdens normal title(EEOC Count)
graph export ".\amicus_briefs_bureaucracy\Fall2016Analysis\Proposal_Descriptions\histogram, eeoc.png", as(png) replace

hist count if agency_id==2, discrete kdens normal title(FTC Count)
graph export ".\amicus_briefs_bureaucracy\Fall2016Analysis\Proposal_Descriptions\histogram, ftc.png", as(png) replace

hist count if agency_id==3, discrete kdens normal title(SEC Count)
graph export ".\amicus_briefs_bureaucracy\Fall2016Analysis\Proposal_Descriptions\histogram, sec.png", as(png) replace

hist count if agency_id==4, discrete kdens normal title(Antitrust Count)
graph export ".\amicus_briefs_bureaucracy\Fall2016Analysis\Proposal_Descriptions\histogram, antitrust.png", as(png) replace

hist count if agency_id==5, discrete kdens normal title(Civil Rights Count)
graph export ".\amicus_briefs_bureaucracy\Fall2016Analysis\Proposal_Descriptions\histogram, civil_rights.png", as(png) replace

hist count if agency_id==6, discrete kdens normal title(Black Lung & Longshore Legal Services Count)
graph export ".\amicus_briefs_bureaucracy\Fall2016Analysis\Proposal_Descriptions\histogram, bllls.png", as(png) replace

hist count if agency_id==7, discrete kdens normal title(Fair Labor Standards Count)
graph export ".\amicus_briefs_bureaucracy\Fall2016Analysis\Proposal_Descriptions\histogram, fls.png", as(png) replace

hist count if agency_id==8, discrete kdens normal title(Occupational Safety and Health Count)
graph export ".\amicus_briefs_bureaucracy\Fall2016Analysis\Proposal_Descriptions\histogram, osh.png", as(png) replace

hist count if agency_id==9, discrete kdens normal title(Plan Benefit Securities Count)
graph export ".\amicus_briefs_bureaucracy\Fall2016Analysis\Proposal_Descriptions\histogram, pbs.png", as(png) replace

hist count, by(circuit) discrete title(Count by Circuit) subtitle(Frequencies) addl freq
hist count, by(year) discrete title(Count by Year) subtitle(Frequencies) addl freq

hist count, by(circuit) discrete title(Count by Circuit) caption(Figure 2)
graph export ".\amicus_briefs_bureaucracy\Fall2016Analysis\Proposal_Descriptions\histogram, circuit.png", as(png) replace

hist count, by(year) discrete title(Count by Year) caption(Figure 3) 
graph export ".\amicus_briefs_bureaucracy\Fall2016Analysis\Proposal_Descriptions\histogram, year.png", as(png) replace
*/
***with ideology scores and independence scores now 
