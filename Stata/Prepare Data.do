** Label Dataset **
label data "Whistleblowing and Competition - Experiment"

** Label variables **
label variable participantlabel "Participant label"
label variable participantcode "Participant code"
label variable payoff_final "Payoff total (in pounds)"
label variable sessionlabel "Session label"
label variable location "Session location"
label variable task "Treatment task"
label variable treatment "Treatment"
label variable id_in_group "ID in group"
label variable round "Round"
label variable role "Role"
label variable correct "Correct answers"
label variable cheat "Break the law"
label variable whistle "Blow the whistle"
label variable group_id "Group ID"
label variable role_group "Group role"
label variable output_employees "Employee output"
label variable output_firm "Firm output"
label variable surplus_firm "Firm surplus"
label variable winning_firm "Winning firm"
label variable payoff "Round earnings"
label variable cheaters "Round lawbreakers"
label variable whistlers "Round whistleblowers"
label variable payoff_total "Payoff total (in points)"
label variable payoff_game "Payoff from game (in points)"
label variable payoff_beliefs "Payoff from belief task (in points)"
label variable payoff_judgements "Payoff from judgements task (in points)"
label variable payoff_risk "Payoff from risk task (in points)"
label variable payoff_svo "Payoff from SVO task (in points)"
label variable belief_cheat "Belief about lawbreaking"
label variable belief_whistle "Belief about whistleblowing"
label variable total_cheaters "Session lawbreakers"
label variable total_whistlers "Session whistleblowers"
label variable morality_manager "Judgement of manager"
label variable morality_employee "Judgement of employee"
label variable morality_public "Judgement of public"
label variable firm_loyalty "Loyalty to firm"
label variable risk "Risk"
label variable svo "SVO"
label variable age "Age"
label variable study "Field of study"
label variable gender "Gender"

** Recode variables **
rename location location_old
gen location = 0 if location_old == "Birmingham"
replace location = 1 if location_old == "Cambridge"
order location, after(location_old)
drop location_old
rename treatment treatment_old
gen treatment = 0 if treatment_old == "Baseline"
replace treatment = 1 if treatment_old == "Competition"
order treatment, after(treatment_old)
drop treatment_old
rename study study_old
gen study = 0 if study_old == "Other"
replace study = 1 if study_old == "Social Sciences"
replace study = 2 if study_old == "Natural and Applied Sciences"
replace study = 3 if study_old == "Humanities"
order study, after(study_old)
drop study_old
rename gender gender_old
gen gender = 0 if gender_old == "Female"
replace gender = 1 if gender_old == "Male"
replace gender = 2 if gender_old == "Other"
order gender, after(gender_old)
drop gender_old

** Label values **
label define locations 0 "Birmingham" 1 "Cambridge"
label values location locations
label define treatments 0 "Baseline" 1 "Competition"
label values treatment treatments
label define studies 0 "Other" 1 "Social Sciences" 2 "Natural and Applied Sciences" 3 "Humanities"
label values study studies
label define genders 0 "Female" 1 "Male" 2 "Other"
label values gender genders

** Sort data **
drop index
sort sessionlabel round
gen index = _n
order index, before(participantcode)
sort index
