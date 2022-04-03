	nios_qsys u0 (
		.clk_clk                                   (<connected-to-clk_clk>),                                   //                                clk.clk
		.light_i2c_opencores_export_scl_pad_io     (<connected-to-light_i2c_opencores_export_scl_pad_io>),     //         light_i2c_opencores_export.scl_pad_io
		.light_i2c_opencores_export_sda_pad_io     (<connected-to-light_i2c_opencores_export_sda_pad_io>),     //                                   .sda_pad_io
		.light_int_external_connection_export      (<connected-to-light_int_external_connection_export>),      //      light_int_external_connection.export
		.mpu_i2c_opencores_export_scl_pad_io       (<connected-to-mpu_i2c_opencores_export_scl_pad_io>),       //           mpu_i2c_opencores_export.scl_pad_io
		.mpu_i2c_opencores_export_sda_pad_io       (<connected-to-mpu_i2c_opencores_export_sda_pad_io>),       //                                   .sda_pad_io
		.mpu_int_external_connection_export        (<connected-to-mpu_int_external_connection_export>),        //        mpu_int_external_connection.export
		.reset_reset_n                             (<connected-to-reset_reset_n>),                             //                              reset.reset_n
		.rh_temp_drdy_n_external_connection_export (<connected-to-rh_temp_drdy_n_external_connection_export>), // rh_temp_drdy_n_external_connection.export
		.rh_temp_i2c_opencores_export_scl_pad_io   (<connected-to-rh_temp_i2c_opencores_export_scl_pad_io>),   //       rh_temp_i2c_opencores_export.scl_pad_io
		.rh_temp_i2c_opencores_export_sda_pad_io   (<connected-to-rh_temp_i2c_opencores_export_sda_pad_io>)    //                                   .sda_pad_io
	);

