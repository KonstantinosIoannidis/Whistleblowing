** Prepare raw experimental data **
import delimited "../Data/Experimental Data.csv", encoding(UTF-8) clear
run "../Stata/Prepare Data.do"

** Demographics (Table 1) **
sum payoff_final if round == 1
tab treatment location, sum(age)
bysort treatment location: tab study if round == 1
bysort treatment location: tab gender if round == 1

** Power analysis (Footnote 7) **
preserve
do "../Stata/Power Analysis.do"
restore

** Section 3 **
do "../Stata/Results.do"
