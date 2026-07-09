** Table B1 **
preserve
keep if round == 1
* Create compact indicators
gen female = (gender == 0)
gen social = (study == 1)
gen natural = (study == 2)
* Collapse to treatment-location cells
collapse ///
    (count) N = age ///
    (mean) age female social natural risk svo, ///
    by(treatment location)
* Format for viewing
format age female social natural risk svo %9.2f
list treatment location N age female social natural risk svo, noobs sep(0)
restore

*** Table B2 **
preserve
* Create task-performance categories
gen task_role = ""
replace task_role = "Addition" if role == "employee" | role == "public"
replace task_role = "Multiplication" if role == "manager" & cheat == 0
* Keep only observations where correct is meaningful
keep if task_role != ""
* Collapse to treatment-location-task cells
collapse ///
    (count) N = correct ///
    (mean) correct ///
    (sd) sd_correct = correct, ///
    by(treatment location task_role)
* Create ordering: Addition first, Multiplication second
gen task_order = .
replace task_order = 1 if task_role == "Addition"
replace task_order = 2 if task_role == "Multiplication"
sort task_order treatment location
* Format for viewing
format correct sd_correct %9.2f
list treatment location task_role N correct sd_correct, noobs sepby(task_role)
restore
