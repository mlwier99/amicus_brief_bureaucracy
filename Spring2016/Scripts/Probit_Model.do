*Final version of the analysis. 
set more off 

use "C:\Users\Michelle\OneDrive\Data\Bureaucracy_Amicus_Brief\Master_specific.dta", clear 
eststo clear

lab var agency_age "Agency Age" 
*Main Hypotheses: 
eststo: quietly logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq c.agency_age##c.log_filed_cases if civil_rights==1, vce(cluster cluster_ca)
eststo: quietly logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq c.agency_age##c.log_filed_cases if economic==1, vce(cluster cluster_ca)
eststo: quietly logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq c.agency_age##c.log_filed_cases, vce(cluster cluster_ca)
esttab est1 est2 est3 using tables.tex, scalars("r2_p Pseudo-R2") mtitle("Civil Rights" "Economic" "Both") title(Models) l nodepvars r

*All Hypotheses, Margins: 
logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq c.agency_age##c.log_filed_cases if civil_rights==1, vce(cluster cluster_ca)
margins, dydx(distance_courtagency) at(agency_age=(27 30 35 45 73 88 93 98)) 
marginsplot, recast (line) recastci (rarea) saving(cr_dist, replace) title(Margins: Civil Rights Agency Age on Distance) ytitle(Effect on Pr(Filing))
margins, dydx(distance_courtagencysq) at(agency_age=(27 30 35 45 73 88 93 98))
marginsplot, recast (line) recastci (rarea) saving(cr_sq, replace) title(Margins: Civil Rights Agency Age on Distance Squr.) ytitle(Effect on Pr(Filing))
margins, dydx(log_filed_cases) at(agency_age=(27 30 35 45 73 88 93 98)) 
marginsplot, recast (line) recastci (rarea) saving(cr_filed, replace) title(Margins: Civil Rights Agency Age on Filed Cases) ytitle(Effect on Pr(Filing))

logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq c.agency_age##c.log_filed_cases if economic==1, vce(cluster cluster_ca)
margins, dydx(distance_courtagency) at(agency_age=(27 30 35 45 73 88 93 98)) 
marginsplot, recast (line) recastci (rarea) saving(econ_dist, replace) title(Margins: Economic Agency Age on Distance) ytitle(Effect on Pr(Filing))
margins, dydx(distance_courtagencysq) at(agency_age=(27 30 35 45 73 88 93 98))
marginsplot, recast (line) recastci (rarea) saving(econ_sq, replace) title(Margins: Economic Agency Age on Distance Squr.) ytitle(Effect on Pr(Filing))
margins, dydx(log_filed_cases) at(agency_age=(27 30 35 45 73 88 93 98)) 
marginsplot, recast (line) recastci (rarea) saving(econ_filed, replace) title(Margins: Economic Agency Age on Filed Cases) ytitle(Effect on Pr(Filing))

logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq c.agency_age##c.log_filed_cases, vce(cluster cluster_ca)
margins, dydx(distance_courtagency) at(agency_age=(27 30 35 45 73 88 93 98)) 
marginsplot, recast (line) recastci (rarea) saving(dis, replace) title(Margins: Agency Age on Distance) ytitle(Effect on Pr(Filing))
margins, dydx(distance_courtagencysq) at(agency_age=(27 30 35 45 73 88 93 98))
marginsplot, recast (line) recastci (rarea) saving(sq, replace) title(Margins: Agency Age on Distance Squr.) ytitle(Effect on Pr(Filing))
margins, dydx(log_filed_cases) at(agency_age=(27 30 35 45 73 88 93 98)) 
marginsplot, recast (line) recastci (rarea) saving(filed, replace) title(Margins: Agency Age on Filed Cases) ytitle(Effect on Pr(Filing))


*Comparing the margin plots
graph combine cr_filed.gph econ_filed.gph, title("Economic v. Civil Rights Agencies") altshrink
graph combine cr_dist.gph cr_sq.gph econ_dist.gph econ_sq.gph, title("Economic v. Civil Rights Agencies") altshrink
graph combine filed.gph, title("All Agencies") 
graph combine dis.gph sq.gph, title("All Agencies")

*Robustness Checks 
*Combined model without clustered errors 
eststo: quietly logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq c.agency_age##c.log_filed_cases, robust
esttab est3 est4 using tables2.tex, scalars("r2_p Pseudo-R2") mtitle("Clustered Standard Errors" "Simple Robust Standard Errors") title(Models for Std. Errors) l nodepvars r

*H1:  
eststo: logit total_dummy distance_courtagency distance_courtagencysq indp log_filed_cases agency_age if civil_rights==1, vce(cluster cluster_ca)
eststo: logit total_dummy distance_courtagency distance_courtagencysq indp log_filed_cases agency_age if economic==1, vce(cluster cluster_ca)
eststo: logit total_dummy distance_courtagency distance_courtagencysq indp log_filed_cases agency_age, vce(cluster cluster_ca)
esttab est5 est6 est7 using tables3.tex, scalars("r2_p Pseudo-R2") mtitle("Civil Rights" "Economic" "Both") title(Model for H2) l nodepvars r

*running outlier agencies seperately
eststo: quietly logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq c.agency_age##c.log_filed_cases civil_rights if agency==1|agency==12|agency==7, vce(cluster cluster_ca)
eststo: quietly logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq c.agency_age##c.log_filed_cases civil_rights if agency!=1|agency!=12|agency!=7, vce(cluster cluster_ca)
esttab est8 est9 using tables5.tex, scalars("r2_p Pseudo-R2") mtitle("EEOC, EBSA, and DOJ: Civil Rights" "FTC, SEC, DOL (except EBSA), and DOJ: Antitrust") title(Model Seperated by Outliers) l nodepvars r
