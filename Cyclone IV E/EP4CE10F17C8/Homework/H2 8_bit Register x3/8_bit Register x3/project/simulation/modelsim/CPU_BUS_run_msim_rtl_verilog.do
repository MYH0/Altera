transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/0Practice/Hardware/Altera/Cyclone\ IV\ E/EP4CE10F17C8/Homework/H2\ 8_bit\ Register\ x3/8_bit\ Register\ x3/code {C:/0Practice/Hardware/Altera/Cyclone IV E/EP4CE10F17C8/Homework/H2 8_bit Register x3/8_bit Register x3/code/CPU_BUS.V}

