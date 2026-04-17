** Graph 1 **
graph bar (mean) whistle if role == "employee", ///
over(treatment) asyvars showyvars leg(off) ///
bar(1, color(navy%50)) bar(2, color(navy%100)) ///
nooutside blabel(total, format(%9.3f)) ///
ylabel(0 0.10 "0.10" 0.20 "0.20" 0.30 "0.30", nogrid) ///
ytitle("Probability of employee blowing the whistle") ///
name(whistle)
gr_edit .style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit style.editstyle boxstyle(linestyle(color(white))) editcopy
graph bar (mean) cheat if role == "manager", ///
over(treatment) asyvars showyvars leg(off) ///
bar(1, color(navy%50)) bar(2, color(navy%100)) ///
nooutside blabel(total, format(%9.3f)) ///
ylabel(0 0.10 "0.10" 0.20 "0.20" 0.30 "0.30", nogrid) ///
ytitle("Probability of manager breaking the law") ///
name(cheat)
gr_edit .style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit style.editstyle boxstyle(linestyle(color(white))) editcopy
graph combine whistle cheat, name(Figure1)
gr_edit .style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit style.editstyle boxstyle(linestyle(color(white))) editcopy
graph drop whistle cheat

** Ranksum tests (Result 1)  **
preserve
collapse (mean) whistle, by(treatment sessionlabel role)
ranksum whistle if role == "employee", by(treatment)
restore
** Econometric (Result 1) **
reg whistle i.treatment risk svo gender age study if role == "employee", vce(cluster sessionlabel)

** Ranksum tests (Result 2)  **
preserve
collapse (mean) cheat, by(treatment sessionlabel role)
ranksum cheat if role == "manager", by(treatment)
restore
** Econometric (Result 2) **
reg cheat i.treatment risk svo gender age study if role == "manager", vce(cluster sessionlabel)

** Econometric (Table 2) **
eststo whistle_controls: quietly ///
reg whistle i.treatment risk svo gender age study if role == "employee", vce(cluster sessionlabel)
eststo whistle_beliefs_judgements: quietly ///
reg whistle i.treatment belief_whistle belief_cheat morality_employee morality_public firm_loyalty risk svo gender age study if role == "employee", vce(cluster sessionlabel)
eststo cheat_controls: quietly ///
reg cheat i.treatment risk svo gender age study if role == "manager", vce(cluster sessionlabel)
eststo cheat_beliefs_judgements: quietly ///
reg cheat i.treatment belief_whistle belief_cheat morality_manager morality_public firm_loyalty risk svo gender age study if role == "manager", vce(cluster sessionlabel)
** Table 2 **
esttab whistle_controls whistle_beliefs_judgements cheat_controls cheat_beliefs_judgements using "..\Tex\task.tex", ///
    indicate(Controls = gender age study risk svo) ///
    se r2 label nonumber nonotes noomitted nobaselevels interaction(*) b(3) obslast replace ///
    star(* 0.05 ** 0.01 *** 0.001) ///
    addnotes("Standard errors in parentheses, clustered on session level." ///
             "Significance levels \sym{*} \(p<0.05\), \sym{**} \(p<0.01\), \sym{***} \(p<0.001\)" ///
             "Controls: Age, Gender, Study, Risk, SVO")

** Ranksum tests (Observation 2) **
preserve
collapse (mean) belief_whistle belief_cheat morality_manager morality_employee morality_public firm_loyalty if role != "public", by(treatment participantcode role)
tab treatment if role == "employee", sum(belief_whistle)
ranksum belief_whistle if role == "employee", by(treatment)
tab treatment if role == "manager", sum(belief_cheat)
ranksum belief_cheat if role == "manager", by(treatment)
tab treatment if role == "employee", sum(morality_employee)
ranksum morality_employee  if role == "employee", by(treatment)
tab treatment if role == "manager", sum(morality_manager)
ranksum morality_manager if role == "manager", by(treatment)
tab treatment, sum(morality_public)
ranksum morality_public, by(treatment)
tab treatment, sum(firm_loyalty)
ranksum firm_loyalty, by(treatment)
restore

** Heterogeneity analysis (Observation 3) **
preserve
collapse (mean) whistle, by(treatment location sessionlabel role)
bysort location: ranksum whistle if role == "employee", by(treatment)
restore
preserve
collapse (mean) cheat, by(treatment location sessionlabel role)
bysort location: ranksum cheat if role == "manager", by(treatment)
restore
