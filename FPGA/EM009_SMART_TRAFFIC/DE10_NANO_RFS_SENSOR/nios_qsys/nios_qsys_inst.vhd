	component nios_qsys is
		port (
			clk_clk                                   : in    std_logic := 'X'; -- clk
			light_i2c_opencores_export_scl_pad_io     : inout std_logic := 'X'; -- scl_pad_io
			light_i2c_opencores_export_sda_pad_io     : inout std_logic := 'X'; -- sda_pad_io
			light_int_external_connection_export      : in    std_logic := 'X'; -- export
			mpu_i2c_opencores_export_scl_pad_io       : inout std_logic := 'X'; -- scl_pad_io
			mpu_i2c_opencores_export_sda_pad_io       : inout std_logic := 'X'; -- sda_pad_io
			mpu_int_external_connection_export        : in    std_logic := 'X'; -- export
			reset_reset_n                             : in    std_logic := 'X'; -- reset_n
			rh_temp_drdy_n_external_connection_export : in    std_logic := 'X'; -- export
			rh_temp_i2c_opencores_export_scl_pad_io   : inout std_logic := 'X'; -- scl_pad_io
			rh_temp_i2c_opencores_export_sda_pad_io   : inout std_logic := 'X'  -- sda_pad_io
		);
	end component nios_qsys;

	u0 : component nios_qsys
		port map (
			clk_clk                                   => CONNECTED_TO_clk_clk,                                   --                                clk.clk
			light_i2c_opencores_export_scl_pad_io     => CONNECTED_TO_light_i2c_opencores_export_scl_pad_io,     --         light_i2c_opencores_export.scl_pad_io
			light_i2c_opencores_export_sda_pad_io     => CONNECTED_TO_light_i2c_opencores_export_sda_pad_io,     --                                   .sda_pad_io
			light_int_external_connection_export      => CONNECTED_TO_light_int_external_connection_export,      --      light_int_external_connection.export
			mpu_i2c_opencores_export_scl_pad_io       => CONNECTED_TO_mpu_i2c_opencores_export_scl_pad_io,       --           mpu_i2c_opencores_export.scl_pad_io
			mpu_i2c_opencores_export_sda_pad_io       => CONNECTED_TO_mpu_i2c_opencores_export_sda_pad_io,       --                                   .sda_pad_io
			mpu_int_external_connection_export        => CONNECTED_TO_mpu_int_external_connection_export,        --        mpu_int_external_connection.export
			reset_reset_n                             => CONNECTED_TO_reset_reset_n,                             --                              reset.reset_n
			rh_temp_drdy_n_external_connection_export => CONNECTED_TO_rh_temp_drdy_n_external_connection_export, -- rh_temp_drdy_n_external_connection.export
			rh_temp_i2c_opencores_export_scl_pad_io   => CONNECTED_TO_rh_temp_i2c_opencores_export_scl_pad_io,   --       rh_temp_i2c_opencores_export.scl_pad_io
			rh_temp_i2c_opencores_export_sda_pad_io   => CONNECTED_TO_rh_temp_i2c_opencores_export_sda_pad_io    --                                   .sda_pad_io
		);

