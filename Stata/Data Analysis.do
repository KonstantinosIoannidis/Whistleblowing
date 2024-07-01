** Prepare raw experimental data **
import delimited "../Data/Experimental Data.csv", encoding(UTF-8) clear
do "../Stata/Prepare Data.do"

** Demographics (section 2.5) **
sum age payoff_final if task == 1 & treatment != 2 & round == 1
tab study gender if task == 1 & treatment != 2 & round == 1, row column

** Subsection 3.1 **
do "../Stata/Treatment Effects.do"

** Footnote 12 (power analysis) **
// do "../Stata/Power Analysis.do"

** Subsection 3.1 **
do "../Stata/Beliefs and Judgements.do"

** Appendix A1 **
do "../Stata/Between Participant Pools.do"
** Appendix A2 **
do "../Stata/Robustness Treatments.do"



