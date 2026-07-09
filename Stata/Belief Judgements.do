** Aggregate **
preserve
* One observation per participant
collapse ///
    (mean) belief_whistle belief_cheat morality_employee morality_manager morality_public firm_loyalty ///
    (first) sessionlabel, ///
    by(participantcode treatment)
* Outcomes in preferred display order
local outcomes belief_whistle belief_cheat morality_employee morality_manager morality_public firm_loyalty
tempfile results
postfile handle ///
    order str30 outcome N mean_baseline mean_competition p_raw ///
    using `results', replace
local i = 1
foreach y of local outcomes {
    quietly summarize `y' if treatment == 0, meanonly
    local n = r(N)
    local m0 = r(mean)
    quietly summarize `y' if treatment == 1, meanonly
    local m1 = r(mean)
    quietly reg `y' i.treatment, vce(cluster sessionlabel)
    local t = _b[1.treatment] / _se[1.treatment]
    local p = 2 * ttail(e(df_r), abs(`t'))
    post handle (`i') ("`y'") (`n') (`m0') (`m1') (`p')
    local ++i
}
postclose handle
use `results', clear
* Holm-Bonferroni adjusted p-values
gen p_holm = .
sort p_raw
gen rank = _n
gen m = _N
gen p_holm_raw = (m - rank + 1) * p_raw
replace p_holm_raw = 1 if p_holm_raw > 1
* Enforce monotonicity
replace p_holm = p_holm_raw
replace p_holm = max(p_holm, p_holm[_n-1]) if _n > 1
* Return to original order
sort order
format mean_baseline mean_competition p_raw p_holm %9.3f
list outcome N mean_baseline mean_competition p_raw p_holm, ///
    noobs sep(0)
restore

** Managers **
preserve
* One observation per participant
collapse ///
    (mean) belief_whistle belief_cheat morality_employee morality_manager morality_public firm_loyalty ///
    (first) sessionlabel if role == "manager", ///
    by(participantcode treatment)
* Outcomes in preferred display order
local outcomes belief_whistle belief_cheat morality_employee morality_manager morality_public firm_loyalty
tempfile results
postfile handle ///
    order str30 outcome N mean_baseline mean_competition p_raw ///
    using `results', replace
local i = 1
foreach y of local outcomes {
    quietly summarize `y' if treatment == 0, meanonly
    local n = r(N)
    local m0 = r(mean)
    quietly summarize `y' if treatment == 1, meanonly
    local m1 = r(mean)
    quietly reg `y' i.treatment, vce(cluster sessionlabel)
    local t = _b[1.treatment] / _se[1.treatment]
    local p = 2 * ttail(e(df_r), abs(`t'))
    post handle (`i') ("`y'") (`n') (`m0') (`m1') (`p')
    local ++i
}
postclose handle
use `results', clear
* Holm-Bonferroni adjusted p-values
gen p_holm = .
sort p_raw
gen rank = _n
gen m = _N
gen p_holm_raw = (m - rank + 1) * p_raw
replace p_holm_raw = 1 if p_holm_raw > 1
* Enforce monotonicity
replace p_holm = p_holm_raw
replace p_holm = max(p_holm, p_holm[_n-1]) if _n > 1
* Return to original order
sort order
format mean_baseline mean_competition p_raw p_holm %9.3f
list outcome N mean_baseline mean_competition p_raw p_holm, ///
    noobs sep(0)
restore

** Employees **
preserve
* One observation per participant
collapse ///
    (mean) belief_whistle belief_cheat morality_employee morality_manager morality_public firm_loyalty ///
    (first) sessionlabel if role != "manager", ///
    by(participantcode treatment)
* Outcomes in preferred display order
local outcomes belief_whistle belief_cheat morality_employee morality_manager morality_public firm_loyalty
tempfile results
postfile handle ///
    order str30 outcome N mean_baseline mean_competition p_raw ///
    using `results', replace
local i = 1
foreach y of local outcomes {
    quietly summarize `y' if treatment == 0, meanonly
    local n = r(N)
    local m0 = r(mean)
    quietly summarize `y' if treatment == 1, meanonly
    local m1 = r(mean)
    quietly reg `y' i.treatment, vce(cluster sessionlabel)
    local t = _b[1.treatment] / _se[1.treatment]
    local p = 2 * ttail(e(df_r), abs(`t'))
    post handle (`i') ("`y'") (`n') (`m0') (`m1') (`p')
    local ++i
}
postclose handle
use `results', clear
* Holm-Bonferroni adjusted p-values
gen p_holm = .
sort p_raw
gen rank = _n
gen m = _N
gen p_holm_raw = (m - rank + 1) * p_raw
replace p_holm_raw = 1 if p_holm_raw > 1
* Enforce monotonicity
replace p_holm = p_holm_raw
replace p_holm = max(p_holm, p_holm[_n-1]) if _n > 1
* Return to original order
sort order
format mean_baseline mean_competition p_raw p_holm %9.3f
list outcome N mean_baseline mean_competition p_raw p_holm, ///
    noobs sep(0)
restore
