## This file is a general .xdc for the Nexys4 DDR Rev. C
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segments[0]}]
set_property PACKAGE_PIN E3 [get_ports clk]
#set_property PACKAGE_PIN J15 [get_ports reset]
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { reset }]; #IO_L9P_T1_DQS_14 Sch=btnc
set_property PACKAGE_PIN H15 [get_ports {segments[7]}]
set_property PACKAGE_PIN L18 [get_ports {segments[6]}]
set_property PACKAGE_PIN T11 [get_ports {segments[5]}]
set_property PACKAGE_PIN P15 [get_ports {segments[4]}]
set_property PACKAGE_PIN K13 [get_ports {segments[3]}]
set_property PACKAGE_PIN K16 [get_ports {segments[2]}]
set_property PACKAGE_PIN R10 [get_ports {segments[1]}]
set_property PACKAGE_PIN T10 [get_ports {segments[0]}]


set_property PACKAGE_PIN J17 [get_ports {anode[0]}]
set_property PACKAGE_PIN J18 [get_ports {anode[1]}]
set_property PACKAGE_PIN T9 [get_ports {anode[7]}]
set_property PACKAGE_PIN J14 [get_ports {anode[6]}]
set_property PACKAGE_PIN P14 [get_ports {anode[5]}]
set_property PACKAGE_PIN T14 [get_ports {anode[4]}]
set_property PACKAGE_PIN K2 [get_ports {anode[3]}]
set_property PACKAGE_PIN U13 [get_ports {anode[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[4]}]


set_property IOSTANDARD LVCMOS33 [get_ports {houradder[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {houradder[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {minuteadder[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {minuteadder[0]}]


set_property PACKAGE_PIN M17 [get_ports {houradder[0]}]
set_property PACKAGE_PIN P17 [get_ports {houradder[1]}]
set_property PACKAGE_PIN M18 [get_ports {minuteadder[1]}]
set_property PACKAGE_PIN P18 [get_ports {minuteadder[0]}]













