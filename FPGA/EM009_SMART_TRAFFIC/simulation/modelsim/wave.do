onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /counter/reset
add wave -noupdate /counter/clk
add wave -noupdate /counter/count
add wave -noupdate /counter/dac_busy
add wave -noupdate /counter/dac_en
add wave -noupdate /counter/clk_out
add wave -noupdate /counter/count_i
add wave -noupdate -color Cyan /counter/sine_count
add wave -noupdate /counter/clk_out_s
add wave -noupdate -radix unsigned /counter/count_s
add wave -noupdate /counter/dac_en_s
add wave -noupdate /counter/dac_busy_s
add wave -noupdate -color Gold -format Analog-Interpolated -height 74 -max 59672.0 -radix unsigned /counter/count_DAC
add wave -noupdate /counter/sine
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {173832979322 ps} 0} {{Cursor 2} {173832680200 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {173832174499 ps} {173834195043 ps}
