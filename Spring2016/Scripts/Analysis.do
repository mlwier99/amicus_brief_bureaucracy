set more off 

use "C:\Users\Michelle\OneDrive\Data\Bureaucracy_Amicus_Brief\Master_specific.dta", clear

*description of main explainatory variarbles 

sum agency_ideol, detail
hist agency_ideol, kdens

sum circuit_ideol_dm1, detail
hist circuit_ideol_dm1, kdens

sum pres_ideol_dm1, detail
hist pres_ideol_dm1, kdens

sum filed_cases, detail
sum log_filed_cases, detail
hist filed_cases, kdens name(hist_fcases)
hist log_filed_cases, kdens name(hist_logged_fcases)
graph combine hist_fcases hist_logged_fcases
graph export "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\Logged_fCases.pdf", as(pdf) replace

hist pending_cases, kdens name(hist_pcases)
hist log_pending_cases, kdens name(hist_logged_pcases)
graph combine hist_pcases hist_logged_pcases
graph export "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\Logged_pCases.pdf", as(pdf) replace

hist term_cases, kdens name(hist_tcases)
hist log_term_cases, kdens name(hist_logged_tcases)
graph combine hist_tcases hist_logged_tcases
graph export "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\Logged_tCases.pdf", as(pdf) replace

gen filed_cases_thousand = filed_cases/1000
lab define circuit 1 "First Circuit" 2 "Second Circuit" 3 "Third Circuit" 4 "Fourth Circuit" 5 "Fifth Circuit" 6 "Sixth Ciruit" 7 "Seventh Circuit" 8 "Eigth Circuit" 9 "Ninth Circuit" 10 "Tenth Circuit" 11 "Eleventh Circuit" 12 "D.C. Circuit"
lab values circuit circuit
graph bar (firstnm) filed_cases_thousand, over(year, label(angle(vertical)alt)) missing ytitle(Number of Filed Cases (thousands)) by(, title(Circuit Caseload over Time)) by(circuit) subtitle(, size(medium))
graph save Graph "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\Circuit_caseload_by_year.gph", replace
graph export "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\Circuit_caseload_by_year.pdf", as(pdf) replace
drop filed_cases_thousand

sum emps, detail
hist emps 
sum managers, detail
hist managers

sum political_strict, detail
hist political_strict, kdens
sum political_loose, detail
hist political_loose, kdens

tab indp agency 
tab indp indp_lit
tab indp rulemaking 
tab indp party_bal

sum total, detail 
hist total 
sum total_dummy, detail

sutex2 total total_dummy political_strict political_loose agency_age log_filed_cases distance_courtagency , na() varlab minmax  percentiles(50) caption(Summary Statistics for Main Variables) placement(H)
bys agency: sutex2 total total_dummy political_strict political_loose agency_age log_filed_cases distance_courtagency , na() varlab minmax  percentiles(50) caption(Summary Statistics for Main Variables, [insert Agency]) placement(H)

sutex2 total total_dummy political_strict political_loose agency_age log_filed_cases distance_courtagency if type==0 , na() varlab minmax  percentiles(50) caption(Summary Statistics for Main Variables, Department of Labor) placement(H) 
sutex2 total total_dummy political_strict political_loose agency_age log_filed_cases distance_courtagency if type==0 , na() varlab minmax  percentiles(50) caption(Summary Statistics for Main Variables, Department of Justice) placement(H) 

*Scatter for the distance between the cabinet agency total and the court/agency distance 
scatter total distance_courtagency if cabinet==1 || qfit total distance_courtagency if cabinet==1

*Scatter for the distance between the economic agency total and the court/agency distance 
scatter total distance_courtagency if economic==1 || qfit total distance_courtagency if economic==1

*Scatter for the distance between the civil rights agency total and the court/agency distance 
scatter total distance_courtagency if civil_rights==1 || qfit total distance_courtagency if civil_rights==1

*AGENCY TOTAL SCATTERS ON IDEOLOGICAL DISTANCES 

*Scatter for the distance between the eeoc total and the court/agency distance 
scatter total distance_courtagency if agency==1, title(Total Amici Filings) subtitle(by Increasing Ideology Distance of Court & EEOC) ytitle(Total Amici Filed) || qfit total distance_courtagency if agency==1
graph export "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\scatter_a1_distancetotal.pdf", as(pdf) replace

*Scatter for the distance between the FTC total and the court/agency distance 
scatter total distance_courtagency if agency==2, title(Total Amici Filings) subtitle(by Increasing Ideology Distance of Court & FTC) ytitle(Total Amici Filed) || qfit total distance_courtagency if agency==2
graph export "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\scatter_a2_distancetotal.pdf", as(pdf) replace

*Scatter for the distance between the SEC total and the court/agency distance 
scatter total distance_courtagency if agency==4, title(Total Amici Filings) subtitle(by Increasing Ideology Distance of Court & SEC) ytitle(Total Amici Filed) || qfit total distance_courtagency if agency==4
graph export "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\scatter_a4_distancetotal.pdf", as(pdf) replace

*Scatter for the distance between Worker’s Comp total and the court/agency distance 
scatter total distance_courtagency if agency==5, title(Total Amici Filings) subtitle(by Increasing Ideology Distance of Court & Workers's Compensation) ytitle(Total Amici Filed) || qfit total distance_courtagency if agency==5
graph export "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\scatter_a5_distancetotal.pdf", as(pdf) replace

*Scatter for the distance between Wage and Hours agency total and the court/agency distance 
scatter total distance_courtagency if agency==6, title(Total Amici Filings) subtitle(by Increasing Ideology Distance of Court & Wage and Hours) ytitle(Total Amici Filed) || qfit total distance_courtagency if agency==6
graph export "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\scatter_a6_distancetotal.pdf", as(pdf) replace

*Scatter for the distance between the EBSA  agency total and the court/agency distance 
scatter total distance_courtagency if agency==7, title(Total Amici Filings) subtitle(by Increasing Ideology Distance of Court & Employee Benefit Sec. Admin.) ytitle(Total Amici Filed) || qfit total distance_courtagency if agency==7
graph export "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\scatter_a7_distancetotal.pdf", as(pdf) replace

*Scatter for the distance between OHS agency total and the court/agency distance 
scatter total distance_courtagency if agency==8, title(Total Amici Filings) subtitle(by Increasing Ideology Distance of Court & Occupational Health & Safety) ytitle(Total Amici Filed) || qfit total distance_courtagency if agency==8
graph export "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\scatter_a8_distancetotal.pdf", as(pdf) replace

*Scatter for the distance between Employee Standards Admin agency total and the court/agency distance 
scatter total distance_courtagency if agency==9, title(Total Amici Filings) subtitle(by Increasing Ideology Distance of Court & Employee Standards Admin.) ytitle(Total Amici Filed) || qfit total distance_courtagency if agency==9
graph export "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\scatter_a9_distancetotal.pdf", as(pdf) replace

*Scatter for the distance between the DOJ Antitrust total and the court/agency distance 
scatter total distance_courtagency if agency==11, title(Total Amici Filings) subtitle(by Increasing Ideology Distance of Court & DOJ: Antitrust) ytitle(Total Amici Filed) || qfit total distance_courtagency if agency==111
graph export "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\scatter_a11_distancetotal.pdf", as(pdf) replace

*Scatter for the distance between DOJ Civil Rights agency total and the court/agency distance 
scatter total distance_courtagency if agency==12, title(Total Amici Filings) subtitle(by Increasing Ideology Distance of Court & DOJ: Civil Rights) ytitle(Total Amici Filed) || qfit total distance_courtagency if agency==12
graph export "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\scatter_a12_distancetotal.pdf", as(pdf) replace
