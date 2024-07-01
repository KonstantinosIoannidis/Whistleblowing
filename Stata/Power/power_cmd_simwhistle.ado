capture program drop power_cmd_simwhistle
program power_cmd_simwhistle, rclass
version 17.0
** Define input parameters and default values **
	syntax, n(integer)	      		/// sessions per treatment
		[alpha(real 0.05)			/// significance level
		p_c(real 0.15)				/// whistle probability in C
		p_nc(real 0.23)				/// whistle probability in NC
		reps(integer 100)  			/// number of repetitions
		]
    ** GENERATE THE RANDOM DATA AND TEST THE NULL HYPOTHESIS
    quietly {
		simulate reject=r(reject), reps(`reps'): simwhistle, n(`n') alpha(`alpha') p_c(`p_c') p_nc(`p_nc')
        summarize reject
    }
    ** RETURN RESULTS
    return scalar power = r(mean)
    return scalar N = `n'*15
	return scalar s = `n'
	return scalar alpha = `alpha'
	return scalar p_c = `p_c'
    return scalar p_nc = `p_nc'
end
