transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FpgaExample/ex14 {D:/FpgaExample/ex14/ex_ram.v}
vlog -vlog01compat -work work +incdir+D:/FpgaExample/ex14 {D:/FpgaExample/ex14/ex13.v}

vlog -vlog01compat -work work +incdir+D:/FpgaExample/ex14/simulation/modelsim {D:/FpgaExample/ex14/simulation/modelsim/ex13.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  ex13_vlg_tst

add wave *
view structure
view signals
run -all
