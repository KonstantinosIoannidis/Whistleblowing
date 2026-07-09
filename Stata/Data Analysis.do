** Prepare raw experimental data **
import delimited "../Data/Experimental Data.csv", encoding(UTF-8) clear
run "../Stata/Prepare Data.do"

** Subsection 2.4 **
sum payoff_final if round == 1
preserve
do "../Stata/Power Analysis.do"
restore

** Section 3 **
* Results 1 & 2, Observation 1 *
do "../Stata/Results.do"
* Observation 2 *
do "../Stata/Beliefs Judgements.do"
* Observation 2 *
do "../Stata/Heterogeneity.do"

** Appendix **
do "../Stata/Balance.do"
