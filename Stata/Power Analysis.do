run "../Stata/Power/simwhistle.ado"
run "../Stata/Power/power_cmd_simwhistle.ado"
run "../Stata/Power/power_cmd_simwhistle_init.ado"

power simwhistle, n(8) alpha(0.05) p_c(0.10(0.01)0.17) p_nc(0.23) reps(1000) table

power simwhistle, n(8) alpha(0.05) p_c(0.10(0.05)0.25) p_nc(0.32) reps(1000) table
