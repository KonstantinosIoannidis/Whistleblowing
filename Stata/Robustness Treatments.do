** Balance table (Table A3) **
bysort task treatment: sum age if round == 1 & location == 0
bysort task treatment: tab gender if round == 1 & location == 0
bysort task treatment: tab study if round == 1 & location == 0
* Footnote 19 (treatment demographics differences) *
bysort task: anova age treatment if round == 1 & location == 0
bysort task: tab treatment gender if round == 1 & location == 0, chi2
bysort task: tab treatment study if round == 1 & location == 0, chi2

** Figure A1 **
* Left subfigure (public performs task) *
graph bar (mean) whistle if role == "employee" & task == 1 & location == 0, ///
over(treatment) asyvars showyvars leg(off) ///
bar(1, color(navy%33)) bar(2, color(navy%67)) bar(3, color(navy%100)) ///
nooutside blabel(total, format(%9.3f)) ///
ylabel(0 0.10 "0.10" 0.20 "0.20" 0.30 "0.30", nogrid) ///
ytitle("Probability of employee blowing the whistle") ///
name(whistle_task)
gr_edit .style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit style.editstyle boxstyle(linestyle(color(white))) editcopy
graph bar (mean) cheat if role == "manager" & task == 1 & location == 0, ///
over(treatment) asyvars showyvars leg(off) ///
bar(1, color(navy%33)) bar(2, color(navy%67)) bar(3, color(navy%100)) ///
nooutside blabel(total, format(%9.3f)) ///
ylabel(0 0.10 "0.10" 0.20 "0.20" 0.30 "0.30", nogrid) ///
ytitle("Probability of manager breaking the law") ///
name(cheat_task)
gr_edit .style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit style.editstyle boxstyle(linestyle(color(white))) editcopy
graph combine whistle_task cheat_task, name(FigureA1a)
gr_edit .style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit style.editstyle boxstyle(linestyle(color(white))) editcopy

* Right subfigure (public does not perform task) *
graph bar (mean) whistle if role == "employee" & task == 0, ///
over(treatment, relabel(1 "BaselineNoTask" 2 "CompetitionNoTask")) asyvars showyvars leg(off) ///
bar(1, color(navy%33)) bar(2, color(navy%100)) ///
nooutside blabel(total, format(%9.3f)) ///
ylabel(0 0.10 "0.10" 0.20 "0.20" 0.30 "0.30", nogrid) ///
ytitle("Probability of employee blowing the whistle") ///
name(whistle_notask)
gr_edit .style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit style.editstyle boxstyle(linestyle(color(white))) editcopy
graph bar (mean) cheat if role == "manager" & task == 0, ///
over(treatment, relabel(1 "BaselineNoTask" 2 "CompetitionNoTask")) asyvars showyvars leg(off) ///
bar(1, color(navy%33)) bar(2, color(navy%100)) ///
nooutside blabel(total, format(%9.3f)) ///
ylabel(0 0.10 "0.10" 0.20 "0.20" 0.30 "0.30", nogrid) ///
ytitle("Probability of manager breaking the law") ///
name(cheat_notask)
gr_edit .style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit style.editstyle boxstyle(linestyle(color(white))) editcopy
graph combine whistle_notask cheat_notask, name(FigureA1b)
gr_edit .style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit style.editstyle boxstyle(linestyle(color(white))) editcopy

graph drop whistle_task cheat_task whistle_notask cheat_notask

** Observation A3 **
preserve
collapse (mean) whistle cheat, by(location task treatment sessionlabel role)
** Part (a) **
* Baseline vs Competition (task) *
ranksum whistle if location == 0 & task == 1 & treatment !=2 & role == "employee", by(treatment)
ranksum cheat if location == 0  & task == 1 & treatment !=2 & role == "manager", by(treatment)
* Baseline vs Random (task) *
ranksum whistle if location == 0 & task == 1 & treatment !=1 & role == "employee", by(treatment)
ranksum cheat if location == 0  & task == 1 & treatment !=1 & role == "manager", by(treatment)
* Competition vs Random (task) *
ranksum whistle if location == 0 & task == 1 & treatment !=0 & role == "employee", by(treatment)
ranksum cheat if location == 0  & task == 1 & treatment !=0 & role == "manager", by(treatment)
** Part (b) **
* Baseline vs Competition (no task) *
ranksum whistle if location == 0 & task == 0 & treatment !=2 & role == "employee", by(treatment)
ranksum cheat if location == 0  & task == 0 & treatment !=2 & role == "manager", by(treatment)
** Part (c) **
* Task vs NoTask (Baseline) *
ranksum whistle if location == 0 & treatment == 0 & role == "employee", by(task)
ranksum cheat if location == 0 & treatment == 0 & role == "manager", by(task)
* Task vs NoTask (Competition) *
ranksum whistle if location == 0 & treatment == 1 & role == "employee", by(task)
ranksum cheat if location == 0 & treatment == 1 & role == "manager", by(task)
restore
** Part (d) **
preserve
collapse (mean) belief_whistle belief_cheat morality_manager morality_employee morality_public firm_loyalty if role != "public", by(location task treatment participantcode role)
ranksum belief_whistle if location == 0 & treatment !=2 & role == "employee", by(task)
ranksum belief_cheat if location == 0 & treatment !=2 & role == "manager", by(task)
ranksum morality_employee if location == 0 & treatment !=2 & role == "employee", by(task)
ranksum morality_manager if location == 0 & treatment !=2 & role == "manager", by(task)
ranksum morality_public if location == 0 & treatment !=2, by(task)
ranksum firm_loyalty if location == 0 & treatment !=2, by(task)
restore
