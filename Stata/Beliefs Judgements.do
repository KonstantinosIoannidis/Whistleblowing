** Econometric - Observation 1 **
eststo whistle_controls: quietly ///
reg whistle i.treatment risk svo gender age study if treatment !=2 & role == "employee" & task == 1, vce(cluster sessionlabel)
eststo whistle_beliefs_judgements: quietly ///
reg whistle i.treatment belief_whistle belief_cheat morality_employee morality_public firm_loyalty risk svo gender age study if treatment !=2 & role == "employee" & task == 1, vce(cluster sessionlabel)
eststo cheat_controls: quietly ///
reg cheat i.treatment risk svo gender age study if treatment !=2 & role == "manager" & task == 1, vce(cluster sessionlabel)
eststo cheat_beliefs_judgements: quietly ///
reg cheat i.treatment belief_cheat belief_whistle morality_manager morality_public firm_loyalty risk svo gender age study if treatment !=2 & role == "manager" & task == 1, vce(cluster sessionlabel)
eststo cheat_inter: quietly ///
reg cheat i.treatment##c.belief_cheat belief_whistle morality_manager morality_public firm_loyalty risk svo gender age study if treatment !=2 & role == "manager" & task == 1, vce(cluster sessionlabel)
** Table 1 **
esttab whistle_controls whistle_beliefs_judgements cheat_controls cheat_beliefs_judgements cheat_inter, ///
indicate(Controls = gender age study risk svo) se r2 label nonumber nonotes noomitted nobaselevels interaction(*) b(3) obslast replace type /// 
star(* 0.10 ** 0.05 *** 0.01) ///
addnotes("Standard errors in parentheses, clustered on matching group level." "Significance levels \sym{*} \(p<0.10\), \sym{**} \(p<0.05\), \sym{***} \(p<0.01\)" "Controls: Age, Gender, Study, Risk, SVO")

** Footnote 13 (repeating observation 1 with clean beliefs ) **
eststo whistle_controls: quietly ///
reg whistle i.treatment risk svo gender age study if treatment !=2 & role == "employee" & task == 1, vce(cluster sessionlabel)
eststo whistle_beliefs_judgements: quietly ///
reg whistle i.treatment belief_whistle_clean belief_cheat_clean morality_employee morality_public firm_loyalty risk svo gender age study if treatment !=2 & role == "employee" & task == 1, vce(cluster sessionlabel)
eststo cheat_controls: quietly ///
reg cheat i.treatment risk svo gender age study if treatment !=2 & role == "manager" & task == 1, vce(cluster sessionlabel)
eststo cheat_beliefs_judgements: quietly ///
reg cheat i.treatment belief_cheat_clean belief_whistle_clean morality_manager morality_public firm_loyalty risk svo gender age study if treatment !=2 & role == "manager" & task == 1, vce(cluster sessionlabel)
eststo cheat_inter: quietly ///
reg cheat i.treatment##c.belief_cheat_clean belief_whistle_clean morality_manager morality_public firm_loyalty risk svo gender age study if treatment !=2 & role == "manager" & task == 1, vce(cluster sessionlabel)
** Table 1 **
esttab whistle_controls whistle_beliefs_judgements cheat_controls cheat_beliefs_judgements cheat_inter, ///
indicate(Controls = gender age study risk svo) se r2 label nonumber nonotes noomitted nobaselevels interaction(*) b(3) obslast replace type /// 
star(* 0.10 ** 0.05 *** 0.01) ///
addnotes("Standard errors in parentheses, clustered on matching group level." "Significance levels \sym{*} \(p<0.10\), \sym{**} \(p<0.05\), \sym{***} \(p<0.01\)" "Controls: Age, Gender, Study, Risk, SVO")

** Ranksum tests - Observation 2 **
preserve
collapse (mean) belief_whistle belief_cheat morality_manager morality_employee morality_public firm_loyalty if role != "public", by(task treatment participantcode role)
tab treatment if task == 1 & treatment != 2 & role == "employee", sum(belief_whistle)
ranksum belief_whistle if task == 1 & treatment !=2 & role == "employee", by(treatment)
tab treatment if task == 1 & treatment != 2 & role == "manager", sum(belief_cheat)
ranksum belief_cheat if task == 1 & treatment !=2 & role == "manager", by(treatment)
tab treatment if task == 1 & treatment != 2 & role == "employee", sum(morality_employee)
ranksum morality_employee  if task == 1 & treatment !=2 & role == "employee", by(treatment)
tab treatment if task == 1 & treatment != 2 & role == "manager", sum(morality_manager)
ranksum morality_manager if task == 1 & treatment !=2 & role == "manager", by(treatment)
tab treatment if task == 1 & treatment != 2, sum(morality_public)
ranksum morality_public if task == 1 & treatment !=2, by(treatment)
tab treatment if task == 1 & treatment != 2, sum(firm_loyalty)
ranksum firm_loyalty if task == 1 & treatment !=2, by(treatment)
restore

** Footnote 15 (false consensus) **
preserve
collapse (mean) belief_whistle belief_cheat morality_manager morality_employee morality_public firm_loyalty if role != "public", by(task treatment participantcode role)
tab treatment if task == 1 & treatment != 2 & role == "manager", sum(belief_whistle)
ranksum belief_whistle if task == 1 & treatment !=2 & role == "manager", by(treatment)
tab treatment if task == 1 & treatment != 2 & role == "employee", sum(belief_cheat)
ranksum belief_cheat if task == 1 & treatment !=2 & role == "employee", by(treatment)
restore
