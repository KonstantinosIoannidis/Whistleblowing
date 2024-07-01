** Graph 1 **
graph bar (mean) whistle if role == "employee" & task == 1 & treatment != 2, ///
over(treatment) asyvars showyvars leg(off) ///
bar(1, color(navy%50)) bar(2, color(navy%100)) ///
nooutside blabel(total, format(%9.3f)) ///
ylabel(0 0.10 "0.10" 0.20 "0.20" 0.30 "0.30", nogrid) ///
ytitle("Probability of employee blowing the whistle") ///
name(whistle)
gr_edit .style.editstyle boxstyle(shadestyle(color(white))) editcopy
gr_edit style.editstyle boxstyle(linestyle(color(white))) editcopy
graph bar (mean) cheat if role == "manager" & task == 1 & treatment != 2, ///
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

** Ranksum tests - Result 1  **
preserve
collapse (mean) whistle, by(task treatment sessionlabel role)
ranksum whistle if task == 1 & treatment !=2 & role == "employee", by(treatment)
restore
** Econometric - Result 1 **
reg whistle i.treatment risk svo gender age study if treatment !=2 & role == "employee" & task == 1, vce(cluster sessionlabel)

** Ranksum tests - Result 2  **
preserve
collapse (mean) cheat, by(task treatment sessionlabel role)
ranksum cheat if task == 1 & treatment !=2 & role == "manager", by(treatment)
restore
** Econometric - Result 2 **
reg cheat i.treatment risk svo gender age study if treatment !=2 & role == "manager" & task == 1, vce(cluster sessionlabel)

