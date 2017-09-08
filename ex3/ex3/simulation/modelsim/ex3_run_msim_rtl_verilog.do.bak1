transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FpgaExample/ex3 {D:/FpgaExample/ex3/ex3.v}

vlog -vlog01compat -work work +incdir+D:/FpgaExample/ex3/simulation/modelsim {D:/FpgaExample/ex3/simulation/modelsim/ex3.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  ex3_vlg_tst

add wave *
view structure
view signals
run -all
