transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/INNOVATE_FPGA/FPGA_PROJECTS/EM009_SMART_TRAFFIC/ADC_Serial_Synch.vhd}
vlib nios_qsys
vmap nios_qsys nios_qsys

vcom -93 -work work {D:/INNOVATE_FPGA/FPGA_PROJECTS/EM009_SMART_TRAFFIC/simulation/modelsim/eslam_test_b.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -L nios_qsys -voptargs="+acc"  Eslam_TEST

add wave *
view structure
view signals
run -all
