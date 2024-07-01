** Label Dataset **
label data "Whistleblowing and Competition - Experiment"

** Generate participate index **
gen index = _n

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

** Label values **
label define locations 0 "Birmingham" 1 "Cambridge"
label values location locations
label define treatments 0 "Baseline" 1 "Competition" 2 "Random"
label values treatment treatments
label define studies 0 "Other" 1 "Social Sciences" 2 "Natural and Applied Sciences" 3 "Humanities"
label values study studies
label define genders 0 "Female" 1 "Male" 2 "Other"
label values gender genders

** Normalise Variables **
egen whistle_total = sum(whistle), by(participantcode)
gen belief_whistle_clean = belief_whistle - whistle_total, after(belief_whistle)
drop whistle_total
egen cheat_total = sum(cheat), by(participantcode)
gen belief_cheat_clean = belief_cheat - cheat_total, after(belief_cheat)
drop cheat_total
replace belief_whistle = belief_whistle/72
replace belief_whistle_clean = belief_whistle_clean/66
replace belief_cheat = belief_cheat/36
replace belief_cheat_clean = belief_cheat_clean/24
replace morality_employee = (morality_employee+2)/4
replace morality_manager = (morality_manager+2)/4
replace morality_public = (morality_public+2)/4
replace firm_loyalty = (firm_loyalty+2)/4

** Sort data **
sort index round
order index, before(participantcode)
