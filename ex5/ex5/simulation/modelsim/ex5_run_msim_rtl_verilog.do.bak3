transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FpgaExample/ex5 {D:/FpgaExample/ex5/ex5.v}

vlog -vlog01compat -work work +incdir+D:/FpgaExample/ex5/simulation/modelsim {D:/FpgaExample/ex5/simulation/modelsim/ex5.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  ex5_vlg_tst

add wave *
view structure
view signals
run -all
