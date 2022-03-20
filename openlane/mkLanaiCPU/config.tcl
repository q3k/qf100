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

set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) mkLanaiCPU

set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/mkLanaiCPU.v"

set ::env(CLOCK_PORT) "CLK"
set ::env(CLOCK_NET) "CLK"
set ::env(CLOCK_PERIOD) "25"
set ::env(CLOCK_BUFFER_FANOUT) "8"

set ::env(CTS_CLK_BUFFER_LIST) "sky130_fd_sc_hd__clkbuf_4 sky130_fd_sc_hd__clkbuf_8"
set ::env(CTS_SINK_CLUSTERING_SIZE) "16"

set ::env(FP_SIZING) relative
set ::env(FP_CORE_UTIL) "30"
set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg
set ::env(FP_PDN_CORE_RING) 0

set ::env(SYNTH_MAX_FANOUT) 4
set ::env(SYNTH_STRATEGY) "AREA 0"

set ::env(PL_BASIC_PLACEMENT) 0
set ::env(PL_TARGET_DENSITY) 0.35
set ::env(PL_TIME_DRIVEN) 1
#set ::env(PL_ROUTABILITY_DRIVEN) 1
set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) "1"

set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) "1"
set ::env(DIODE_INSERTION_STRATEGY) 4
set ::env(GLB_RT_MAX_DIODE_INS_ITERS) 10

set ::env(RT_MAX_LAYER) {met4}
set ::env(DESIGN_IS_CORE) 0
set ::env(USE_ARC_ANTENNA_CHECK) 1

set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]

set ::env(ROUTING_CORES) 12

# If you're going to use multiple power domains, then disable cvc run.
set ::env(RUN_CVC) 1

#set ::env(PL_RESIZER_HOLD_SLACK_MARGIN) 0.8
#set ::env(GLB_RESIZER_HOLD_SLACK_MARGIN) 0.8
#set ::env(PL_RESIZER_SETUP_SLACK_MARGIN) 0.8
#set ::env(GLB_RESIZER_SETUP_SLACK_MARGIN) 0.8

# cargocult
#
#
set ::env(FP_CORE_UTIL) "24"
set ::env(PL_TIME_DRIVEN) 1
set ::env(PL_TARGET_DENSITY) "0.26"

# helps in anteena fix
set ::env(USE_ARC_ANTENNA_CHECK) "0"


set ::env(GLB_RT_MAX_DIODE_INS_ITERS) 10
set ::env(DIODE_INSERTION_STRATEGY) 4

## CTS
set ::env(CTS_CLK_BUFFER_LIST) "sky130_fd_sc_hd__clkbuf_4 sky130_fd_sc_hd__clkbuf_8 sky130_fd_sc_hd__clkbuf_16"
set ::env(CTS_SINK_CLUSTERING_MAX_DIAMETER) 50
set ::env(CTS_SINK_CLUSTERING_SIZE) 20

## Placement
set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 1
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 0

set ::env(PL_RESIZER_MAX_SLEW_MARGIN) 2
set ::env(PL_RESIZER_MAX_CAP_MARGIN) 2

## Routing
set ::env(GLB_RT_ADJUSTMENT) 0
set ::env(GLB_RT_L2_ADJUSTMENT) 0.21
set ::env(GLB_RT_L3_ADJUSTMENT) 0.21
set ::env(GLB_RT_L4_ADJUSTMENT) 0.1
set ::env(GLB_RT_L5_ADJUSTMENT) 0.1
set ::env(GLB_RT_L6_ADJUSTMENT) 0.1
set ::env(GLB_RT_ALLOW_CONGESTION) 0
set ::env(GLB_RT_OVERFLOW_ITERS) 200

#set ::env(GLB_RT_MINLAYER) 2
#set ::env(GLB_RT_MAXLAYER) 6


set ::env(QUIT_ON_TIMING_VIOLATIONS) "1"
set ::env(QUIT_ON_MAGIC_DRC) "1"
set ::env(QUIT_ON_LVS_ERROR) "1"
set ::env(QUIT_ON_SLEW_VIOLATIONS) "0"

set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) "0"
set ::env(PL_RESIZER_BUFFER_INPUT_PORTS) "0"
set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) "1"
set ::env(PL_RESIZER_MAX_WIRE_LENGTH) "2000"
set ::env(PL_RESIZER_MAX_SLEW_MARGIN) "2.0"
set ::env(PL_RESIZER_MAX_CAP_MARGIN) "5"

## FANOUT Reduced to take care of long routes
set ::env(SYNTH_MAX_FANOUT) "2"
