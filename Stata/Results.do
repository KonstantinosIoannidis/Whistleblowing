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

** Table 1 **
eststo whistle: quietly ///
reg whistle i.treatment risk svo gender age study if role == "employee", vce(cluster sessionlabel)
eststo whistle_beliefs_judgements: quietly ///
reg whistle i.treatment belief_whistle belief_cheat morality_employee morality_public firm_loyalty risk svo gender age study if role == "employee", vce(cluster sessionlabel)
eststo whistle_int: quietly ///
reg whistle i.treatment##c.belief_whistle i.treatment##c.belief_cheat morality_employee morality_public firm_loyalty risk svo gender age study if role == "employee", vce(cluster sessionlabel)
eststo cheat_controls: quietly ///
reg cheat i.treatment risk svo gender age study if role == "manager", vce(cluster sessionlabel)
eststo cheat_beliefs_judgements: quietly ///
reg cheat i.treatment belief_whistle belief_cheat morality_manager morality_public firm_loyalty risk svo gender age study if role == "manager", vce(cluster sessionlabel)
eststo cheat_int: quietly ///
reg cheat i.treatment##c.belief_whistle i.treatment##c.belief_cheat morality_manager morality_public firm_loyalty risk svo gender age study if role == "manager", vce(cluster sessionlabel)
* Combine results *
esttab whistle whistle_beliefs_judgements whistle_int cheat_controls cheat_beliefs_judgements cheat_int using "..\Tex\task.tex", ///
    indicate(Controls = gender age study risk svo) ///
    se r2 label nonumber nonotes noomitted nobaselevels interaction(*) b(3) obslast replace ///
    star(* 0.05 ** 0.01 *** 0.001) ///
    addnotes("Standard errors in parentheses, clustered on session level." ///
             "Significance levels \sym{*} \(p<0.05\), \sym{**} \(p<0.01\), \sym{***} \(p<0.001\)" ///
             "Controls: Age, Gender, Study, Risk, SVO")

** Footnote 7 **
reg whistle i.treatment risk svo gender age study if role == "employee" & round <=6, vce(cluster sessionlabel)
reg whistle i.treatment risk svo gender age study if role == "employee" & round >6, vce(cluster sessionlabel)
reg cheat i.treatment risk svo gender age study if role == "manager" & round <=6, vce(cluster sessionlabel)
reg cheat i.treatment risk svo gender age study if role == "manager" & round >6, vce(cluster sessionlabel)
