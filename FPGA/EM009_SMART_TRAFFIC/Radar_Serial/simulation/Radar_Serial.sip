set_global_assignment -entity "Radar_Serial" -library "lib_Radar_Serial" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "Radar_Serial" -library "lib_Radar_Serial" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "Radar_Serial" -library "lib_Radar_Serial" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_Radar_Serial" -name SPD_FILE [file join $::quartus(sip_path) "../Radar_Serial.spd"]
set_global_assignment -library "lib_Radar_Serial" -name MISC_FILE [file join $::quartus(sip_path) "../../Radar_Serial.qsys"]

set_global_assignment -library "lib_Radar_Serial" -name MISC_FILE [file join $::quartus(sip_path) "Radar_Serial.vhd"]
set_global_assignment -library "lib_Radar_Serial" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.v"]
set_global_assignment -library "lib_Radar_Serial" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_synchronizer.v"]
set_global_assignment -library "lib_Radar_Serial" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.sdc"]
