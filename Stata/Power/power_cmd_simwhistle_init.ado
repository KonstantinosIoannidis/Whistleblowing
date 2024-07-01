capture program drop power_cmd_simwhistle_init
program power_cmd_simwhistle_init, sclass
	sreturn clear
    sreturn local pss_numopts  "s p_c p_nc"
    sreturn local pss_colnames "s p_c p_nc"
end
