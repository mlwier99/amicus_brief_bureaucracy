use "C:\Users\Michelle\OneDrive\Data\Bureaucracy_Amicus_Brief\Master_specific.dta", clear 

set more off

*running a poisson regression in order to check for overdisperstion
*H1: Court/agency ideological distance. 
poisson total distance_courtagency 
poisgof 
*H2: President/agency vs. President/Court ideological distance. 
poisson total pa_greater_pc 
poisgof 
*H3: Information advantage
poisson total c.agency_age#c.log_filed_cases
poisgof 
*Altogther: 
poisson total distance_courtagency c.agency_age#c.log_filed_cases pa_greater_pc agency_age log_filed_cases indp
poisgof 
*Checking whether or not to run a zero-inflated or non-inflation negative binomial. 
zinb total distance_courtagency c.agency_age#c.log_filed_cases pa_greater_pc agency_age log_filed_cases indp i.agency i.circuit, inflate(distance_courtagency c.agency_age#c.log_filed_cases pa_greater_pc agency_age log_filed_cases indp) zip vuong

*Actual model, with fixed effects for the agency and circuit; clustered standard errors by circuit; and logged filed cases. 
zinb total distance_courtagency c.agency_age#c.log_filed_cases pa_greater_pc agency_age log_filed_cases indp i.agency i.circuit, inflate(distance_courtagency c.agency_age#c.log_filed_cases pa_greater_pc agency_age log_filed_cases indp i.agency i.circuit) vce(cluster circuit)
estat ic 
esttab using "znb_fixed_effects_circuit_agency.tex", scalars(N ic rc "N_zero Observations of Zero") replace l

*Robustness tests; instead of cases filed, using productivity. This might better reflect the capabilities of the court to handle a certain amount of workload. 
zinb total distance_courtagency c.agency_age#c.productivity pa_greater_pc agency_age productivity, inflate(distance_courtagency c.agency_age#c.productivity pa_greater_pc agency_age productivity ) vce(cluster agency)

*Robustness tests; cluster by agency to see if the results hold. 
zinb total distance_courtagency c.agency_age#c.log_filed_cases pa_greater_pc agency_age log_filed_cases indp, inflate(distance_courtagency c.agency_age#c.log_filed_cases pa_greater_pc agency_age log_filed_cases indp) vce(cluster agency) 
esttab using "znb_no_fixed_effects_circuit_agency_clusteragency.tex", scalars(N ic rc "N_zero Observations of Zero") replace l
zinb total distance_courtagency c.agency_age#c.log_filed_cases pa_greater_pc agency_age log_filed_cases indp i.agency i.circuit, inflate(distance_courtagency c.agency_age#c.log_filed_cases pa_greater_pc agency_age log_filed_cases indp) vce(cluster agency)
esttab using "znb_fixed_effects_circuit_agency_clusteragency.tex", scalars(N ic rc "N_zero Observations of Zero") replace l

*Robustness tests; taking out the fixed effects of agency and circuit. 
zinb total distance_courtagency c.agency_age#c.log_filed_cases pa_greater_pc agency_age log_filed_cases indp, inflate(distance_courtagency c.agency_age#c.log_filed_cases pa_greater_pc agency_age log_filed_cases indp) vce(cluster circuit) 
esttab using "znb_no_fixed_effects_circuit_agency.tex", scalars(N ic rc "N_zero Observations of Zero") replace l

*Probit 
probit total_dummy distance_courtagency c.agency_age#c.log_filed_cases pa_greater_pc agency_age log_filed_cases indp
probit total_dummy distance_courtagency c.agency_age#c.log_filed_cases pa_greater_pc agency_age log_filed_cases indp, fe 

*Probit with only the eeoc
probit total_dummy distance_courtagency distance_courtagencysq c.agency_age#c.log_filed_cases agency_age log_filed_cases extdistance_courtagency i.circuit i.year if agency==1, robust

*Probit: baseic model with extreme and moderate ideological distance
probit total_dummy moderate_distance_agencycourt c.agency_age#c.log_filed_cases agency_age log_filed_cases
probit total_dummy extdistance_courtagency c.agency_age#c.log_filed_cases agency_age log_filed_cases

*Zero Inflated Neg. Binomial, with corrected equation: 
zinb total distance_courtagency c.agency_age#c.log_filed_cases agency_age log_filed_cases, inflate(moderate_distance_agencycourt c.agency_age#c.log_filed_cases agency_age log_filed_cases)
zinb total distance_courtagency c.agency_age#c.log_filed_cases agency_age log_filed_cases, inflate(extdistance_courtagency c.agency_age#c.log_filed_cases agency_age log_filed_cases)
