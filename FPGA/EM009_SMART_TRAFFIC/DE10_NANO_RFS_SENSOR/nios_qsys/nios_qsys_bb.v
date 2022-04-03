
module nios_qsys (
	clk_clk,
	light_i2c_opencores_export_scl_pad_io,
	light_i2c_opencores_export_sda_pad_io,
	light_int_external_connection_export,
	mpu_i2c_opencores_export_scl_pad_io,
	mpu_i2c_opencores_export_sda_pad_io,
	mpu_int_external_connection_export,
	reset_reset_n,
	rh_temp_drdy_n_external_connection_export,
	rh_temp_i2c_opencores_export_scl_pad_io,
	rh_temp_i2c_opencores_export_sda_pad_io);	

	input		clk_clk;
	inout		light_i2c_opencores_export_scl_pad_io;
	inout		light_i2c_opencores_export_sda_pad_io;
	input		light_int_external_connection_export;
	inout		mpu_i2c_opencores_export_scl_pad_io;
	inout		mpu_i2c_opencores_export_sda_pad_io;
	input		mpu_int_external_connection_export;
	input		reset_reset_n;
	input		rh_temp_drdy_n_external_connection_export;
	inout		rh_temp_i2c_opencores_export_scl_pad_io;
	inout		rh_temp_i2c_opencores_export_sda_pad_io;
endmodule
