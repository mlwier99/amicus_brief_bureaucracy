*Final version of the analysis. 


use "C:\Users\Michelle\OneDrive\Data\Bureaucracy_Amicus_Brief\Master_specific.dta", clear 

*H1:  
logit total_dummy distance_courtagency distance_courtagencysq if civil_rights==1, vce(cluster cluster_ca)
logit total_dummy distance_courtagency distance_courtagencysq if economic==1, vce(cluster cluster_ca)
logit total_dummy distance_courtagency distance_courtagencysq, vce(cluster cluster_ca)

*H2
logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq if civil_rights==1, vce(cluster cluster_ca)
logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq if economic==1, vce(cluster cluster_ca)
logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq, vce(cluster cluster_ca)

*H3
logit total_dummy c.agency_age##log_filed_cases if civil_rights==1, vce(cluster cluster_ca)
logit total_dummy c.agency_age##log_filed_cases if economic==1, vce(cluster cluster_ca)
logit total_dummy c.agency_age##log_filed_cases, vce(cluster cluster_ca)

*All Hypotheses: 
logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq c.agency_age##c.log_filed_cases if civil_rights==1, vce(cluster cluster_ca)
logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq c.agency_age##c.log_filed_cases if economic==1, vce(cluster cluster_ca)
logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq c.agency_age##c.log_filed_cases, vce(cluster cluster_ca)


eststo: quietly logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq c.agency_age##c.log_filed_cases if civil_rights==1, vce(cluster cluster_ca)
eststo: quietly logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq c.agency_age##c.log_filed_cases if economic==1, vce(cluster cluster_ca)
eststo: quietly logit total_dummy c.agency_age##c.distance_courtagency c.agency_age##c.distance_courtagencysq c.agency_age##c.log_filed_cases, vce(cluster cluster_ca)
esttab est1 est2 est3 using tables.tex, scalars("r2_p Pseudo-R2") mtitle("Civil Rights"est1 "Economic"est2 "Both"est3) title(Models) l nodepvars r
 
*Full model with distance, distance^2, strict polarization, agency type 
*agency age interacted with distance^2, agency age interacted with distance 
*agency age interacted with logged cases, logged cases, agency age, moderate
*court, cabinet.

logit total_dummy distance_courtagency distance_courtagencysq political_strict 
economic c.agency_age#c.distance_courtagencysq c.agency_age#c.distance_courtagency 
c.agency_age#c.log_filed_cases log_filed_cases agency_age moderate_circuit cabinet, vce(cluster cluster_ca)

*Full model with distance, distance^2, loose polarization, agency type 
*agency age interacted with distance^2, agency age interacted with distance
*agency age interacted with logged cases, logged cases, agency age, moderate
*court, cabinet.

logit total_dummy distance_courtagency distance_courtagencysq political_loose 
economic c.agency_age#c.distance_courtagencysq c.agency_age#c.distance_courtagency 
c.agency_age#c.log_filed_cases log_filed_cases agency_age moderate_circuit cabinet, vce(cluster cluster_ca)

*Economic model with distance, distance^2, loose polarization, agency age
*interacted with distance^2, agency age interacted with distance 
*agency age interacted with logged cases, logged cases, agency age, moderate
*court, cabinet.

logit total_dummy distance_courtagency distance_courtagencysq political_loose 
c.agency_age#c.distance_courtagencysq c.agency_age#c.distance_courtagency 
c.agency_age#c.log_filed_cases log_filed_cases agency_age moderate_circuit cabinet
if economic==1, vce(cluster cluster_ca)

*Civil rights model with distance, distance^2, loose polarization, agency age
*interacted with distance^2, agency age interacted with distance 
*agency age interacted with logged cases, logged cases, agency age, moderate
*court, cabinet.

logit total_dummy distance_courtagency distance_courtagencysq political_loose 
c.agency_age#c.distance_courtagencysq c.agency_age#c.distance_courtagency 
c.agency_age#c.log_filed_cases log_filed_cases agency_age moderate_circuit cabinet
if civil_rights==1, vce(cluster cluster_ca)

*EEOC model with distance, distance^2, loose polarization, agency type 
*agency age interacted with distance^2, agency age interacted with distance 
*agency age interacted with logged cases, logged cases, agency age, moderate 
*court.

logit total_dummy distance_courtagency distance_courtagencysq political_loose 
c.agency_age#c.distance_courtagencysq c.agency_age#c.distance_courtagency 
c.agency_age#c.log_filed_cases log_filed_cases agency_age moderate_circuit if agency==1, vce(cluster cluster_ca)

*FTC model with distance, distance^2, loose polarization, agency type 
*agency age interacted with distance^2, agency age interacted with distance 
*agency age interacted with logged cases, logged cases, agency age, moderate 
*court.

logit total_dummy distance_courtagency distance_courtagencysq political_loose 
c.agency_age#c.distance_courtagencysq c.agency_age#c.distance_courtagency 
c.agency_age#c.log_filed_cases log_filed_cases agency_age moderate_circuit if agency==2, vce(cluster cluster_ca)

*SEC model with distance, distance^2, loose polarization, agency type 
*agency age interacted with distance^2, agency age interacted with distance 
*agency age interacted with logged cases, logged cases, agency age, moderate 
*court.

logit total_dummy distance_courtagency distance_courtagencysq political_loose 
c.agency_age#c.distance_courtagencysq c.agency_age#c.distance_courtagency 
c.agency_age#c.log_filed_cases log_filed_cases agency_age moderate_circuit if agency==3, vce(cluster cluster_ca)

*Workers' Comp model with distance, distance^2, loose polarization, agency type 
*agency age interacted with distance^2, agency age interacted with distance 
*agency age interacted with logged cases, logged cases, agency age, moderate 
*court. 

logit total_dummy distance_courtagency distance_courtagencysq political_loose 
c.agency_age#c.distance_courtagencysq c.agency_age#c.distance_courtagency 
c.agency_age#c.log_filed_cases log_filed_cases agency_age moderate_circuit if agency==4, vce(cluster cluster_ca)

*Wage and Hour Division model with distance, distance^2, loose polarization, 
*agency type agency age interacted with distance^2, agency age interacted with
*distance*agency age interacted with logged cases, logged cases, agency age,
*moderate court. 

logit total_dummy distance_courtagency distance_courtagencysq political_loose 
c.agency_age#c.distance_courtagencysq c.agency_age#c.distance_courtagency 
c.agency_age#c.log_filed_cases log_filed_cases agency_age moderate_circuit if agency==5, vce(cluster cluster_ca)

*Employee Benefits Security Administration model with distance, distance^2, 
*loose polarization, agency type agency age interacted with distance^2, 
*agency age interacted with distance agency age interacted with logged cases, 
*logged cases, agency age, moderate court.

logit total_dummy distance_courtagency distance_courtagencysq political_loose 
c.agency_age#c.distance_courtagencysq c.agency_age#c.distance_courtagency 
c.agency_age#c.log_filed_cases log_filed_cases agency_age moderate_circuit if agency==6, vce(cluster cluster_ca)

*Occupational Health and Safety model with distance, distance^2, 
*loose polarization, agency type agency age interacted with distance^2, 
*agency age interacted with distance agency age interacted with logged cases, 
*logged cases, agency age, moderate court.

logit total_dummy distance_courtagency distance_courtagencysq political_loose 
c.agency_age#c.distance_courtagencysq c.agency_age#c.distance_courtagency
c.agency_age#c.log_filed_cases log_filed_cases agency_age moderate_circuit if agency==8 , vce(cluster cluster_ca)

*Employee Standards Administration model with distance, distance^2, 
*loose polarization, agency type agency age interacted with distance^2, 
*agency age interacted with distance agency age interacted with logged cases, 
*logged cases, agency age, moderate court.

logit total_dummy distance_courtagency distance_courtagencysq political_loose 
c.agency_age#c.distance_courtagencysq c.agency_age#c.distance_courtagency 
c.agency_age#c.log_filed_cases log_filed_cases agency_age moderate_circuit if agency==9, vce(cluster cluster_ca)

*DOJ, Antitrust model with distance, distance^2, loose polarization, agency type 
*agency age interacted with distance^2, agency age interacted with distance 
*agency age interacted with logged cases, logged cases, agency age, moderate 
*court.

logit total_dummy distance_courtagency distance_courtagencysq political_loose 
c.agency_age#c.distance_courtagencysq c.agency_age#c.distance_courtagency 
c.agency_age#c.log_filed_cases log_filed_cases agency_age moderate_circuit if agency==11, vce(cluster cluster_ca)

*DOJ, Civil Rights model with distance, distance^2, loose polarization, agency type 
*agency age interacted with distance^2, agency age interacted with distance 
*agency age interacted with logged cases, logged cases, agency age, moderate 
*court.

logit total_dummy distance_courtagency distance_courtagencysq political_loose 
c.agency_age#c.distance_courtagencysq c.agency_age#c.distance_courtagency 
c.agency_age#c.log_filed_cases log_filed_cases agency_age moderate_circuit if agency==12, vce(cluster cluster_ca)

*DOJ model with distance, distance^2, loose polarization, agency type 
*agency age interacted with distance^2, agency age interacted with distance 
*agency age interacted with logged cases, logged cases, agency age, moderate 
*court.

logit total_dummy distance_courtagency distance_courtagencysq political_loose 
c.agency_age#c.distance_courtagencysq c.agency_age#c.distance_courtagency 
c.agency_age#c.log_filed_cases log_filed_cases agency_age moderate_circuit if doj==1, vce(cluster cluster_ca)

*DOL model with distance, distance^2, loose polarization, agency type 
*agency age interacted with distance^2, agency age interacted with distance 
*agency age interacted with logged cases, logged cases, agency age, moderate 
*court.

logit total_dummy distance_courtagency distance_courtagencysq political_loose 
c.agency_age#c.distance_courtagencysq c.agency_age#c.distance_courtagency 
c.agency_age#c.log_filed_cases log_filed_cases agency_age moderate_circuit if dol==1, vce(cluster cluster_ca)

