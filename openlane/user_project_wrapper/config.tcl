# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

# Base Configurations. Don't Touch
# section begin

set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

# YOU ARE NOT ALLOWED TO CHANGE ANY VARIABLES DEFINED IN THE FIXED WRAPPER CFGS 
source $::env(CARAVEL_ROOT)/openlane/user_project_wrapper/fixed_wrapper_cfgs.tcl

# YOU CAN CHANGE ANY VARIABLES DEFINED IN THE DEFAULT WRAPPER CFGS BY OVERRIDING THEM IN THIS CONFIG.TCL
source $::env(CARAVEL_ROOT)/openlane/user_project_wrapper/default_wrapper_cfgs.tcl

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) user_project_wrapper
#section end

# User Configurations

## Source Verilog Files
set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/user_project_wrapper.v \
	$script_dir/../../verilog/rtl/sky130_sram_2kbyte_1rw1r_32x512_8_wrapper.v \
	$script_dir/../../verilog/rtl/mkQF105.v"

## Clock configurations
set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET) "wb_clk_i"

set ::env(CLOCK_PERIOD) "20"

## Internal Macros
### Macro PDN Connections
#set ::env(FP_PDN_MACRO_HOOKS) "\
#	mprj vccd1 vssd1"

### Macro Placement
set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro.cfg

### Black-box verilog and views
set ::env(VERILOG_FILES_BLACKBOX) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
        $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/verilog/sky130_sram_2kbyte_1rw1r_32x512_8.v \
	$script_dir/../../verilog/rtl/mkLanaiCPU.v \
	$script_dir/../../verilog/rtl/mkLanaiFrontend.v \
	$script_dir/../../verilog/rtl/mkQF100Fabric.v \
	$script_dir/../../verilog/rtl/mkQF100FlashController.v \
	$script_dir/../../verilog/rtl/mkQF100GPIO.v \
	$script_dir/../../verilog/rtl/mkQF100KSC.v \
	$script_dir/../../verilog/rtl/mkQF100SPI.v"

set ::env(EXTRA_LEFS) "\
	$::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/lef/sky130_sram_2kbyte_1rw1r_32x512_8.lef \
	$script_dir/../../lef/mkLanaiCPU.lef \
	$script_dir/../../lef/mkLanaiFrontend.lef \
	$script_dir/../../lef/mkQF100Fabric.lef \
	$script_dir/../../lef/mkQF100FlashController.lef \
	$script_dir/../../lef/mkQF100GPIO.lef \
	$script_dir/../../lef/mkQF100KSC.lef \
	$script_dir/../../lef/mkQF100SPI.lef"

set ::env(EXTRA_GDS_FILES) "\
	$::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/gds/sky130_sram_2kbyte_1rw1r_32x512_8.gds \
	$script_dir/../../gds/mkLanaiCPU.gds \
	$script_dir/../../gds/mkLanaiFrontend.gds \
	$script_dir/../../gds/mkQF100Fabric.gds \
	$script_dir/../../gds/mkQF100FlashController.gds \
	$script_dir/../../gds/mkQF100GPIO.gds \
	$script_dir/../../gds/mkQF100KSC.gds \
	$script_dir/../../gds/mkQF100SPI.gds"

# set ::env(GLB_RT_MAXLAYER) 5
set ::env(RT_MAX_LAYER) {met4}

# disable pdn check nodes becuase it hangs with multiple power domains.
# any issue with pdn connections will be flagged with LVS so it is not a critical check.
set ::env(FP_PDN_CHECK_NODES) 0

set ::env(PL_TARGET_DENSITY) "0.05"

# The following is because there are no std cells in the example wrapper project.
#set ::env(SYNTH_TOP_LEVEL) 1
set ::env(PL_RANDOM_GLB_PLACEMENT) 1

#set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0
#set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 0
#set ::env(PL_RESIZER_BUFFER_INPUT_PORTS) 0
#set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0

#set ::env(FP_PDN_ENABLE_RAILS) 0

set ::env(DIODE_INSERTION_STRATEGY) 4
#set ::env(FILL_INSERTION) 0
#set ::env(TAP_DECAP_INSERTION) 0
#set ::env(CLOCK_TREE_SYNTH) 0

set ::env(CLOCK_PORT)   "wb_clk_i"
set ::env(CLOCK_NET)    "wb_clk_i"
set ::env(CLOCK_PERIOD) "20"

set ::env(DECAP_CELL) "\
	sky130_fd_sc_hd__decap_3 \
	sky130_fd_sc_hd__decap_4 \
	sky130_fd_sc_hd__decap_6 \
	sky130_fd_sc_hd__decap_8 \
	sky130_ef_sc_hd__decap_12"
