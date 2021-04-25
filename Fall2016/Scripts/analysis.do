clear
cd "./amicus_briefs_bureaucracy/Fall2016/Fall2016/"
use "./Data/basic_dataset.dta"

***Agency-circuit ideological difference. 
**The non-squared variable should be positive and the squared term negative
**such that increasing ideological distance increases DV until a certain point,
**where a decrease in DV effect occurs (when ideological distance hits a certain 
**point). 
gen ideol_ac = abs(crt_ideo - agency_ideo)

gen ideol_acsq = abs(crt_ideo - agency_ideo)^2

lab var ideol_ac "Circuit Agency Ideological Distance"
lab var ideol_acsq "Circuit Agency Ideological Distance, Sqr."

hist ideol_ac, norm kdens
graph export "./Analysis/ideological_distance_hist.png", as(png) replace

hist ideol_acsq, norm kdens
graph export "./Analysis/ideological_distancesq_hist.png", as(png) replace

***Creating a category for anything greater than one, one, and zero, in order to
**run a mlogit/mprobit
gen count_3cat = ., after(count)
replace count_3cat = 1 if count==1 
replace count_3cat = 0 if count==0
replace count_3cat = 2 if count>1

lab var count_3cat "Count categories: 0 is 0, 1 is 1, 2 is more than 1" 
notes count_3cat: 0 is no filings, 1 is 1 filing, 2 is anything more than 1 filing"

***labels
lab var prod_judges "Caseload by Judge" 
lab var prod_judgeships "Caseload by Judgeship" 
lab var ideol_ac "Ideo. Dist., Agency-Circuit"
lab var ideol_acsq "Ideo. Dist. Sq., Agency-Circuit"

***8Natural log of the judgeship caselaod varaible
gen ln_prod_judgeships = ln(prod_judgeships), after(prod_judgeships)
lab var ln_prod_judgeships "Log of Prod. by Judgeships"

hist ln_prod_judgeships


lab define circuit 1"First" 2"Second" 3"Third" 4"Fourth" 5"Fifth" 6"Sixth" 7"Seventh" 8"Eighth" 9"Ninth" 10"Tenth" 11"Eleventh" 12"D.C."
lab values circuit circuit

lab var count "Count of Amicus Briefs Filed"

lab define agency 1"EEOC" 2"FTC" 3"SEC" 4"DoJ, Antitrust" 5"DoJ, Civil Rights" 6"DoL, FLS" 7"DoL, OSH" 8"DoL, PBS"
lab values agency_id agency

****Dropping the BLLLS agency b/c it has 1 filing, sharing all characteristics with FLS, and does nothing for the analysis
list agency agency_id if year==2000 & circuit == 1
drop if agency_id==6
replace agency_id = 6 if agency=="FLS"
replace agency_id = 7 if agency=="OSH"
replace agency_id = 8 if agency=="PBS"

****DV histograms
**overall
hist count, norm kdens discrete normopts(lpattern(dash)) legend(off) title("Overall Count Distribution")  xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_overall_count.png", as(png) replace
 
*by agency
hist count if agency_id==1, norm kdens discrete normopts(lpattern(dash)) legend(off) title("Filing Distribution") subtitle("Equal Employment Oppertunity Commission") xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_eeoc_count.png", as(png) replace

hist count if agency_id==2, norm kdens discrete normopts(lpattern(dash)) legend(off) title("Filing Distribution") subtitle("Federal Trade Commission") xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_ftc_count.png", as(png) replace

hist count if agency_id==3, norm kdens discrete normopts(lpattern(dash)) legend(off) title("Filing Distribution") subtitle("Securities and Exchange Commission") xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_sec_count.png", as(png) replace

hist count if agency_id==4, norm kdens discrete normopts(lpattern(dash)) legend(off) title("Dept. of Justice, Antitrust Filing Distribution")  xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_antitrust_count.png", as(png) replace

hist count if agency_id==5, norm kdens discrete normopts(lpattern(dash)) legend(off) title("Dept. of Justice, Civil Rights Filing Distribution")  xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_cr_count.png", as(png) replace

hist count if agency_id==6, norm kdens discrete normopts(lpattern(dash)) legend(off) title("Dept. of Labor, Filing Distribution") subtitle("Fair Labor Standards") xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_fls_count.png", as(png) replace

hist count if agency_id==7, norm kdens discrete normopts(lpattern(dash)) legend(off) title("Dept. of Labor Filing Distribution") subtitle("Occuptional Safety and Healthy") xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_osh_count.png", as(png) replace

hist count if agency_id==8, norm kdens discrete normopts(lpattern(dash)) legend(off) title("Dept. of Labor Filing Distribution") subtitle("Plan Benefits Security") xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_pbs_count.png", as(png) replace

*by year, 4 years each
hist count if year==2000, norm kdens discrete normopts(lpattern(dash)) subtitle(2000) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_2000_count.png", as(png) replace

hist count if year==2001, norm kdens discrete normopts(lpattern(dash)) subtitle(2001)  xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_2001_count.png", as(png) replace

hist count if year==2002, norm kdens discrete normopts(lpattern(dash)) subtitle(2002) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_2002_count.png", as(png) replace

hist count if year==2003, norm kdens discrete normopts(lpattern(dash)) subtitle(2003) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_2003_count.png", as(png) replace

hist count if year==2004, norm kdens discrete normopts(lpattern(dash)) subtitle(2004) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_2004_count.png", as(png) replace

hist count if year==2005, norm kdens discrete normopts(lpattern(dash)) subtitle(2005) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_2005_count.png", as(png) replace

hist count if year==2006, norm kdens discrete normopts(lpattern(dash)) subtitle(2006) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_2006_count.png", as(png) replace

hist count if year==2007, norm kdens discrete normopts(lpattern(dash)) subtitle(2007) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_2007_count.png", as(png) replace

hist count if year==2008, norm kdens discrete normopts(lpattern(dash)) subtitle(2008) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_2008_count.png", as(png) replace

hist count if year==2009, norm kdens discrete normopts(lpattern(dash)) subtitle(2009) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_2009_count.png", as(png) replace

hist count if year==2010, norm kdens discrete normopts(lpattern(dash)) subtitle(2010) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_2010_count.png", as(png) replace

hist count if year==2011, norm kdens discrete normopts(lpattern(dash)) subtitle(2011) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_2011_count.png", as(png) replace

hist count if year==2012, norm kdens discrete normopts(lpattern(dash)) subtitle(2012) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_2012_count.png", as(png) replace

*by circuit
hist count if circuit==1, norm kdens discrete normopts(lpattern(dash)) subtitle(First Circuit)  xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_first_count.png", as(png) replace

hist count if circuit==2, norm kdens discrete normopts(lpattern(dash)) subtitle(Second Circuit) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_second_count.png", as(png) replace

hist count if circuit==3, norm kdens discrete normopts(lpattern(dash)) subtitle(Third Circuit) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_third_count.png", as(png) replace

hist count if circuit==4, norm kdens discrete normopts(lpattern(dash)) subtitle(Fourth Circuit) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_fourth_count.png", as(png) replace

hist count if circuit==5, norm kdens discrete normopts(lpattern(dash)) subtitle(Fifth Circuit) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_fifth_count.png", as(png) replace

hist count if circuit==6, norm kdens discrete normopts(lpattern(dash)) subtitle(Sixth Circuit) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_sixth_count.png", as(png) replace

hist count if circuit==7, norm kdens discrete normopts(lpattern(dash)) subtitle(Seventh Circuit) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_seventh_count.png", as(png) replace

hist count if circuit==8, norm kdens discrete normopts(lpattern(dash)) subtitle(Eighth Circuit) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_eighth_count.png", as(png) replace

hist count if circuit==9, norm kdens discrete normopts(lpattern(dash)) subtitle(Ninth Circuit) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_ninth_count.png", as(png) replace

hist count if circuit==10, norm kdens discrete normopts(lpattern(dash)) subtitle(Tenth Circuit) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_tenth_count.png", as(png) replace

hist count if circuit==11, norm kdens discrete normopts(lpattern(dash)) subtitle(Eleventh Circuit) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_eleventh_count.png", as(png) replace

hist count if circuit==12, norm kdens discrete normopts(lpattern(dash)) subtitle(D.C. Circuit) xlabel(0 1 2 3 4 5 6 7 8)
graph export "./Final Drafts/Hist_dc_count.png", as(png) replace

****Distribution of workload
hist filed_cases, norm kdens normopts(lpattern(dash)) title("Distribution of Filed Cases") 
graph export "./Final Drafts/Hist_filed.png", as(png) replace

hist ln_filed,  norm kdens normopts(lpattern(dash)) title("Distribution of Ln(Filed Cases)") 
graph export "./Final Drafts/Hist_ln_filed.png", as(png) replace

hist prod_judgeships, norm kdens normopts(lpattern(dash)) title("Distribution of Circuit Productivity") subtitle("Raw Filed Cases/Authorized Judgeships")
graph export "./Final Drafts/Hist_prod.png", as(png) replace

hist ln_prod_judgeships, norm kdens normopts(lpattern(dash)) title("Distribution of Circuit Productivity") subtitle("Ln. Filed Cases/Authorized Judgeships")
graph export "./Final Drafts/Hist_ln_prod.png", as(png) replace


save "./Final Drafts/Final_Dataset.dta", replace
***tier one is probit, tier two is truncated regression
eststo craggitjudges: craggit count ideol_ac ideol_acsq prod_judges civil_rights, second(count ideol_ac ideol_acsq prod_judges civil_rights) 
eststo craggitseats: craggit count ideol_ac ideol_acsq prod_judgeships civil_rights, second(count ideol_ac ideol_acsq prod_judgeships civil_rights) 

esttab craggitjudges craggitseats using craggitmodels.tex, lab replace mtitle("Productivity with Judges" "Productivity with Judgeships")

quietly eststo mlogitjudges: mlogit count_3cat ideol_ac ideol_acsq prod_judges civil_rights
quietly eststo mlogitseats: mlogit count_3cat ideol_ac ideol_acsq prod_judgeships civil_rights

esttab mlogitjudges mlogitseats using mlogit.tex, lab noomitted unstack replace mtitle("Productivity with Judges" "Productivity with Judgeships") 

***Zero-Inflated Negative Binomial. Judicial caseload by authorized judgeships. 

*Clustered on agency
eststo zinb: zinb count ideol_ac ideol_acsq civil_rights prod_judgeships, inflate(ideol_ac ideol_acsq civil_rights prod_judgeships) cluster(agency_id)  nolog
eststo zinb_irr: zinb count ideol_ac ideol_acsq civil_rights prod_judgeships, inflate(ideol_ac ideol_acsq civil_rights prod_judgeships) cluster(agency_id)  nolog irr

***output
esttab zinb zinb_irr using zinb.tex, lab replace mtitle("Zero-Inflated Neg. Binomial" "Incident Ratio Reports") aic bic

*Clustered on agency, fixed effects for agency
eststo zinb_feagency: zinb count ideol_ac ideol_acsq civil_rights prod_judgeships i.agency_id, inflate(ideol_ac ideol_acsq civil_rights prod_judgeships) cluster(agency_id) nolog

*Clustered on agency, fixed effects for agency and year
eststo zinb_feagencyyear: zinb count ideol_ac ideol_acsq civil_rights prod_judgeships i.agency_id i.year, inflate(ideol_ac ideol_acsq civil_rights prod_judgeships) cluster(agency_id) nolog

*Clustered on agency, fixed effects for agency, year, and circuit
eststo zinb_feagencyyearcircuit: zinb count ideol_ac ideol_acsq civil_rights prod_judgeships i.agency_id i.year i.circuit, inflate(ideol_ac ideol_acsq civil_rights prod_judgeships) cluster(agency_id) nolog

***output
esttab zinb_feagency zinb_feagencyyear zinb_feagencyyearcircuit using zinb_fe.tex, lab replace mtitle("Agency FE" "Agency-Year FE" "Agency-Year-Circuit FE") keep(ideol_ac ideol_acsq prod_judgeships civil_rights) aic bic

***Zero-Inflated Negative Binomial. Judicial caseload by authorized judgeships. 

*Clustered on agency
eststo zinb2: zinb count ideol_ac ideol_acsq civil_rights ln_filed, inflate(ideol_ac ideol_acsq civil_rights ln_filed) cluster(agency_id)  nolog
eststo zinb2_irr: zinb count ideol_ac ideol_acsq civil_rights ln_filed, inflate(ideol_ac ideol_acsq civil_rights ln_filed) cluster(agency_id)  nolog irr

***output
esttab zinb2 zinb2_irr using zinb2.tex, lab replace mtitle("Zero-Inflated Neg. Binomial" "Incident Ratio Reports") bic aic

*Clustered on agency, fixed effects for agency
eststo zinb2_feagency: zinb count ideol_ac ideol_acsq civil_rights ln_filed i.agency_id, inflate(ideol_ac ideol_acsq civil_rights ln_filed) cluster(agency_id) nolog

*Clustered on agency, fixed effects for agency and year
eststo zinb2_feagencyyear: zinb count ideol_ac ideol_acsq civil_rights ln_filed i.agency_id i.year, inflate(ideol_ac ideol_acsq civil_rights ln_filed) cluster(agency_id) nolog

*Clustered on agency, fixed effects for agency, year, and circuit
eststo zinb2_feagencyyearcircuit: zinb count ideol_ac ideol_acsq civil_rights ln_filed i.agency_id i.year i.circuit, inflate(ideol_ac ideol_acsq civil_rights ln_filed) cluster(agency_id) nolog
fitstat

***output
esttab zinb2_feagency zinb2_feagencyyear zinb2_feagencyyearcircuit using zinb2_fe.tex, lab replace mtitle("Agency FE" "Agency-Year FE" "Agency-Year-Circuit FE") keep(ideol_ac ideol_acsq ln_filed civil_rights) aic bic

***Zero-Inflated Negative Binomial. Logged judicial caseload by authorized judgeships. 

*Clustered on agency
eststo zinb3: zinb count ideol_ac ideol_acsq civil_rights ln_prod_judgeships, inflate(ideol_ac ideol_acsq civil_rights ln_prod_judgeships) cluster(agency_id)  nolog
eststo zinb3_irr: zinb count ideol_ac ideol_acsq civil_rights ln_prod_judgeships, inflate(ideol_ac ideol_acsq civil_rights ln_prod_judgeships) cluster(agency_id)  nolog irr

***output
esttab zinb3 zinb3_irr using zinb3.tex, lab replace mtitle("Zero-Inflated Neg. Binomial" "Incident Ratio Reports") aic bic

*Clustered on agency, fixed effects for agency
eststo zinb3_feagency: zinb count ideol_ac ideol_acsq civil_rights ln_prod_judgeships i.agency_id, inflate(ideol_ac ideol_acsq civil_rights ln_prod_judgeships) cluster(agency_id) nolog

*Clustered on agency, fixed effects for agency and year
eststo zinb3_feagencyyear: zinb count ideol_ac ideol_acsq civil_rights ln_prod_judgeships i.agency_id i.year, inflate(ideol_ac ideol_acsq civil_rights ln_prod_judgeships) cluster(agency_id) nolog

*Clustered on agency, fixed effects for agency, year, and circuit
eststo zinb3_feagencyyearcircuit: zinb count ideol_ac ideol_acsq civil_rights ln_prod_judgeships i.agency_id i.year i.circuit, inflate(ideol_ac ideol_acsq ln_prod_judgeships civil_rights) cluster(agency_id) nolog

***output
esttab zinb3_feagency zinb3_feagencyyear zinb3_feagencyyearcircuit using zinb3_fe.tex, lab replace mtitle("Agency FE" "Agency-Year FE" "Agency-Year-Circuit FE") keep(ideol_ac ideol_acsq ln_prod_judgeships civil_rights) aic bic


***Comparisons between the main fixed effects models
esttab zinb_feagency zinb3_feagency using compare_agencyfe.tex, lab replace  title(Agency FE)  mtitle("Filed/Judgeships" "Logged Filed/Judgeships") keep(ideol_ac ideol_acsq ln_prod_judgeships prod_judgeships civil_rights) aic bic
esttab zinb_feagencyyear zinb3_feagencyyear using compare_agencyyearfe.tex, lab replace title(Agency-Year FE)  mtitle("Filed/Judgeships" "Logged Filed/Judgeships") keep(ideol_ac ideol_acsq prod_judgeships ln_prod_judgeships civil_rights) aic bic

esttab zinb_feagencyyearcircuit zinb3_feagencyyearcircuit using compare_agencyyearcircuitfe.tex, lab replace title(Main Model: Zero-Inflated Negative Binomial) mtitle("Filed/Judgeships" "Logged Filed/Judgeships") keep(ideol_ac ideol_acsq prod_judgeships ln_prod_judgeships civil_rights) aic bic

esttab zinb zinb3 using compare_nofe.tex, lab replace  title(Main Model: Zero-Inflated Negative Binomial) mtitle("Filed/Judgeships" "Logged Filed/Judgeships") keep(ideol_ac ideol_acsq prod_judgeships ln_prod_judgeships civil_rights) aic bic

poisson count ideol_ac ideol_acsq prod_judgeships civil_rights i.agency_id i.year i.circuit, cluster(agency_id) nolog 
poisgof 

zinb count ideol_ac ideol_acsq prod_judgeships civil_rights i.agency_id i.year i.circuit, inflate(ideol_ac ideol_acsq prod_judgeships civil_rights) nolog vuong
zinb count ideol_ac ideol_acsq prod_judgeships civil_rights i.agency_id i.year i.circuit, inflate(ideol_ac ideol_acsq prod_judgeships civil_rights) nolog irr

***Generating fixed-effects variables
quietly tabulate year, generate(year_)
quietly tabulate agency_id, generate(agencyid_)
quietly tabulate circuit, generate(circuit_)

eststo a: zinb count ideol_ac ideol_acsq prod_judgeships civil_rights year_* circuit_* agencyid_*, inflate(ideol_ac ideol_acsq prod_judgeships civil_rights) nolog 

eststo b: zinb count ideol_ac ideol_acsq prod_judgeships civil_rights i.agency_id i.year i.circuit, inflate(ideol_ac ideol_acsq prod_judgeships civil_rights) nolog 

esttab a b, lab keep(ideol_ac ideol_acsq prod_judgeships civil_rights) aic bic

