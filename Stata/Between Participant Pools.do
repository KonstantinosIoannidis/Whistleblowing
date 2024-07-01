** Balance table (Table A1) **
bysort task treatment location: sum age if round == 1 & task == 1 & treatment != 2
bysort task treatment location: tab gender if round == 1 & task == 1 & treatment != 2
bysort task treatment location: tab study if round == 1 & task == 1 & treatment != 2
* Footnote 17 (treatment demographics differences) *
egen loc_treat = group(treatment location)
anova age loc_treat if round == 1 & task == 1 & treatment != 2
tab loc_treat gender if round == 1 & task == 1 & treatment != 2, chi2
tab loc_treat study if round == 1 & task == 1 & treatment != 2, chi2
drop loc_treat

** Table A2 & Observation 1 **
tab location treatment if task == 1 & treatment !=2 & role == "employee", sum(whistle)
tab location treatment if task == 1 & treatment !=2 & role == "manager", sum(cheat)
* row 3 *
preserve
collapse (mean) whistle cheat, by(location task treatment sessionlabel role)
bysort treatment: ranksum whistle if task == 1 & treatment !=2 & role == "employee", by(location)
bysort treatment: ranksum cheat if task == 1 & treatment !=2 & role == "manager", by(location)
restore
* row 4 *
bysort treatment: reg whistle i.location risk svo gender age study if treatment !=2 & role == "employee" & task == 1, vce(cluster sessionlabel)
bysort treatment: reg cheat i.location risk svo gender age study if treatment !=2 & role == "manager" & task == 1, vce(cluster sessionlabel)

** Observation A2 **
preserve
collapse (mean) whistle cheat, by(location task treatment sessionlabel role)
bysort location: ranksum whistle if task == 1 & treatment !=2 & role == "employee", by(treatment)
bysort location: ranksum cheat if task == 1 & treatment !=2 & role == "manager", by(treatment)
restore
