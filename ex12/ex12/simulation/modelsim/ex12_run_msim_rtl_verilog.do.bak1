transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FpgaExample/ex12 {D:/FpgaExample/ex12/my_pll.v}
vlog -vlog01compat -work work +incdir+D:/FpgaExample/ex12 {D:/FpgaExample/ex12/ex12.v}
vlog -vlog01compat -work work +incdir+D:/FpgaExample/ex12/db {D:/FpgaExample/ex12/db/my_pll_altpll.v}

vlog -vlog01compat -work work +incdir+D:/FpgaExample/ex12/simulation/modelsim {D:/FpgaExample/ex12/simulation/modelsim/ex12.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  ex12_vlg_tst

add wave *
view structure
view signals
run -all
