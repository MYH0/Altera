transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {flow_led.vo}

vlog -vlog01compat -work work +incdir+C:/0\ TEST/T2/project/simulation/modelsim {C:/0 TEST/T2/project/simulation/modelsim/flow_led.vt}

vsim -t 1ps -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  flow_led_vlg_tst

add wave *
view structure
view signals
run -all
