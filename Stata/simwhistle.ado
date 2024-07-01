capture program drop simwhistle
program simwhistle, rclass
version 17.0
** Define input parameters and default values **
syntax, n(integer)	      		/// #sessions per treatment
	[alpha(real 0.05)   		/// significance level
	p_c(real 0.15)				/// whistle probability in C
	p_nc(real 0.23)				/// whistle probability in NC
	]
** Generate random data **
clear
local sample_total = `n'*6*12
set obs `sample_total'
gen competition = (_n > 0.5*_N)
egen id_sub = seq(), block(6)
egen id_ses = seq(), block(72)
gen whistle = rbinomial(1, `p_nc')*(competition==0) + rbinomial(1, `p_c')*(competition==1) 
** Test for treatment effects (LPM clustered at session level)
reg whistle competition, vce(cluster id_ses)
test competition = 0
** Return results **
return scalar pvalue = r(p)
return scalar reject = (r(p)<`alpha')
end

