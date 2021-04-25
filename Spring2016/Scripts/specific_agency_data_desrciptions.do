use "C:\Users\Michelle\OneDrive\Data\Bureaucracy_Amicus_Brief\Master_specific.dta",clear
cd "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis"
xtset, clear
#delimit ; 

sutex total, lab nobs key(descstat) minmax replace 
file("dv_stats.tex") title("Summary Statistics for Dependent Variable") ;

twoway (scatter total distance_courtagency) if agency==1,ytitle(Total Amici Briefs Filed) xtitle(Ideological Distance Between Circuit and Agency)title(Equal Employment Oppertunity Commission) subtitle(by Ideological Distance (All Circuits and the EEOC)); 
graph export "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\Scatter_Distance_a1.pdf", as(pdf) replace
	
twoway (scatter total distance_courtagency) if agency==2, ytitle(Total Amici Briefs Filed)  xtitle(Ideological Distance Between Circuit and Agency) title (Federal Trade Commission) subtitle(by Ideological Distance (All Circuits and the FTC)) ; 
graph export "C:\Users\Michelle\OneDrive\Research Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\Scatter_Distance_a2.pdf", as(pdf) replace ; 
	
twoway (scatter total distance_courtagency) if agency==4, ytitle(Total Amici Briefs Filed) xtitle(Ideological Distance Between Circuit and Agency) title(Securities & Exchange Commission) 	subtitle(by Ideological Distance (All Circuits and the SEC)) ; 
	graph export "C:\Users\Michelle\OneDrive\Research Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\Scatter_Distance_a4.pdf", as(pdf) replace ; 
	
twoway (scatter total distance_courtagency) if agency==9, ytitle(Total Amici Briefs Filed) 	xtitle(Ideological Distance Between Circuit and Agency) title(Employee Standards Admin.) subtitle(by Ideological Distance (All Circuits and the Employee Standards Admin.)) ; 
graph export "C:\Users\Michelle\OneDrive\Research_Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\Scatter_Distance_a9.pdf", as(pdf) replace

twoway (scatter total distance_courtagency) if agency==5, ytitle(Total Amici Briefs Filed) xtitle(Ideological Distance Between Circuit and Agency) title(Office of Worker's Compensastion)subtitle(by Ideological Distance (All Circuits and the Office of Worker's Compensastion)) ; 
	graph export "C:\Users\Michelle\OneDrive\Research Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\Scatter_Distance_a5.pdf", as(pdf) replace ; 
	
twoway (scatter total distance_courtagency) if agency==6, ytitle(Total Amici Briefs Filed) xtitle(Ideological Distance Between Circuit and Agency) title(Wage and Hour Division) subtitle(by Ideological Distance (All Circuits and the Wage and Hour Division)) ; 
	graph export "C:\Users\Michelle\OneDrive\Research Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\Scatter_Distance_a6.pdf", as(pdf) replace ; 

twoway (scatter total distance_courtagency) if agency==7,ytitle(Total Amici Briefs Filed) xtitle(Ideological Distance Between Circuit and Agency) title(Employee Benefit Secruity Admin.) subtitle(by Ideological Distance (All Circuits and the Employee Benefit Secruity Admin.)) ; 
	graph export "C:\Users\Michelle\OneDrive\Research Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\Scatter_Distance_a7.pdf", as(pdf) replace ; 
	
twoway (scatter total distance_courtagency) if agency==8, ytitle(Total Amici Briefs Filed) xtitle(Ideological Distance Between Circuit and Agency) title(Occupational Health & Safety Admin.) subtitle(by Ideological Distance (All Circuits and the Occupational Health & Safety Admin.)) ;
	graph export "C:\Users\Michelle\OneDrive\Research Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\Scatter_Distance_a8.pdf", as(pdf) replace ; 

twoway (scatter total distance_courtagency) if agency==11,ytitle(Total Amici Briefs Filed) xtitle(Ideological Distance Between Circuit and Agency) title(Antitrust Division in DOJ) subtitle(by Ideological Distance (All Circuits and the Antitrust Division)) ; 
	graph export "C:\Users\Michelle\OneDrive\Research Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\Scatter_Distance_a11.pdf", as(pdf) replace ; 
	
twoway (scatter total distance_courtagency) if agency==12, ytitle(Total Amici Briefs Filed) xtitle(Ideological Distance Between Circuit and Agency) title(Civil Rights Division in DOJ) subtitle(by Ideological Distance (All Circuits and the Civil Rights Division)) ; 
graph export "C:\Users\Michelle\OneDrive\Research Papers\Bureuacracy_Amicus_Briefs_Ideology,Spring_2016\Analysis\Scatter_Distance_a12.pdf", as(pdf) replace ; 

#delimit ; 
graph bar (asis) total if agency==1, over(circuit, relabel(12 "DC") 
label(labsize(vsmall))) ytitle(Total Amicus Briefs Filed) 
by(, title(Total Amicus Filings per Circuit) subtitle(EEOC)) 
name(eeoc_total_circuit, replace) by(year) ; 
graph export "C:\Users\Michelle\desktop\bar_totalcircuit_a1.pdf", as(pdf) ; 
#delimit ; 
graph bar (asis) total if agency==2, over(circuit, relabel(12 "DC") 
label(labsize(vsmall))) ytitle(Total Amicus Briefs Filed) 
by(, title(Total Amicus Filings per Circuit) subtitle(FTC)) 
name(ftc_total_circuit, replace) by(year) ; 
graph export "C:\Users\Michelle\desktop\bar_totalcircuit_a2.pdf", as(pdf) ; 

graph bar (asis) total if agency==4, over(circuit, relabel(12 "DC") 
label(labsize(vsmall))) ytitle(Total Amicus Briefs Filed) 
by(, title(Total Amicus Filings per Circuit) subtitle(SEC)) 
name(sec_total_circuit, replace) by(year) ; 
	graph export "C:\Users\Michelle\desktop\bar_totalcircuit_a4.pdf", as(pdf) replace ; 

graph bar (asis) total if agency==9, over(circuit, relabel(12 "DC") 
label(labsize(vsmall))) ytitle(Total Amicus Briefs Filed) 
by(, title(Total Amicus Filings per Circuit) subtitle(DOL: Employee Standards Act)) 
name(esa_total_circuit, replace) by(year) ; 
graph export "C:\Users\Michelle\desktop\bar_totalcircuit_a9.pdf", as(pdf) replace ; 

graph bar (asis) total if agency==5, over(circuit, relabel(12 "DC") 
label(labsize(vsmall))) ytitle(Total Amicus Briefs Filed) 
by(, title(Total Amicus Filings per Circuit) subtitle(DOL: Workers' Compensastion)) 
name(wc_total_circuit, replace) by(year) ; 
graph export "C:\Users\Michelle\desktop\bar_totalcircuit_a5.pdf", as(pdf) replace ; 

graph bar (asis) total if agency==6, over(circuit, relabel(12 "DC") 
label(labsize(vsmall))) ytitle(Total Amicus Briefs Filed) 
by(, title(Total Amicus Filings per Circuit) subtitle(DOL: Wage and Hour Divsion)) 
name(wh_total_circuit, replace) by(year) ; 
graph export "C:\Users\Michelle\desktop\bar_totalcircuit_a6.pdf", as(pdf) replace ; 

graph bar (asis) total if agency==7, over(circuit, relabel(12 "DC") 
label(labsize(vsmall))) ytitle(Total Amicus Briefs Filed) 
by(, title(Total Amicus Filings per Circuit) subtitle(DOL: Employee Benefit Secruity Admin.)) 
name(ebsa_total_circuit, replace) by(year) ; 
graph export "C:\Users\Michelle\desktop\bar_totalcircuit_a7.pdf", as(pdf) replace ; 

graph bar (asis) total if agency==8, over(circuit, relabel(12 "DC") 
label(labsize(vsmall))) ytitle(Total Amicus Briefs Filed) 
by(, title(Total Amicus Filings per Circuit) subtitle(DOL: Occupation Health & Safety)) 
name(ohs_total_circuit, replace) by(year) ; 
graph export "C:\Users\Michelle\desktop\bar_totalcircuit_a8.pdf", as(pdf) replace ; 

graph bar (asis) total if agency==11, over(circuit, relabel(12 "DC") 
label(labsize(vsmall))) ytitle(Total Amicus Briefs Filed) 
by(, title(Total Amicus Filings per Circuit) subtitle(DOJ: Antitrust Division)) 
name(antitrust_total_circuit, replace) by(year) ; 
graph export "C:\Users\Michelle\desktop\bar_totalcircuit_a11.pdf", as(pdf) replace ; 

graph bar (asis) total if agency==12, over(circuit, relabel(12 "DC") 
label(labsize(vsmall))) ytitle(Total Amicus Briefs Filed) 
by(, title(Total Amicus Filings per Circuit) subtitle(DOJ: Civil Rights Division)) 
name(civilrights_total_circuit, replace) by(year) ; 
graph export "C:\Users\Michelle\desktop\bar_totalcircuit_a12.pdf", as(pdf) replace ; 


by agency: egen total_total = sum(total)
by year: egen year_total = sum(total)
by circuit: egen circuit_total = sum(total)
graph bar (asis) year_total if agency==1 & circuit==1, over(year)

gen agency_young = .
sum agency_age
replace agency_young = 1 if agency_age<= r(p25)
replace agency_young = 0 if agency_age> r(p25)
lab variable agency_young "Agencies are young if equal or less than the 25th percetile"
lab define agency_young 1 "Young" 0 "Old"
lab values agency_young agency_young

twoway (scatter total distance_courtagency, msize(small)) (qfit agency_age distance_courtagency), xscale(alt)
twoway (scatter total distance_courtagency agency_age, msize(small)), xscale(alt)
twoway (scatter total distance_courtagency, msize(small)), xscale(alt) by(agency_young)
twoway (scatter total distance_courtagency, msize(small)) (qfit total distance_courtage), xscale(alt) by(agency_young)
twoway (scatter total distance_courtagency, msize(small)) (lfit total distance_courtage), xscale(alt) by(agency_young)

