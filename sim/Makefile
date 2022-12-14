# Copyright 2019 ETH Zurich and University of Bologna
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# How to compile/elaborate/run:
# Generally you just need to call make -f Makefile.incisive sim-sc to simulate
# or make -f Makefile.incisive build-sc to just build

.PHONY: build-r build-sc build-mc lib-r sim-r sim-sc sim-mc build-deps
.PHONY: clean clean-r clean-sc clean-mc clean-deps

mkfile_path := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))

XRUN	    ?= xrun
XRUN_FLAGS  =
TIMESCALE   = -timescale 1ps/1ps
WARNINGS    = -warn_multiple_driver -nowarn NONPRT
RTLLIBS	    = -reflib ncsim_libs
SVLIB	    =  ../rtl/tb/remote_bitbang/librbs.so
VISIBILITY  = -access +r

# build the bitbang library, needed for simulating a jtag bridge to OpenOCD
build-deps:
	$(MAKE) -C ../rtl/tb/remote_bitbang all

clean-deps:
	$(MAKE) -C ../rtl/tb/remote_bitbang clean

# -allowredefinition is neede because we unfortunately got two
# modules named axi_slice_dc_slave_wrap and axi_slice_dc_master_wrap
sim-sc: build-deps
	$(XRUN) -64bit -top tb_pulp $(TIMESCALE) $(WARNINGS) \
		-sv -v93 -allowredefinition \
		-sv_lib $(SVLIB) \
		-defparam tb_pulp.USE_SDVT_SPI=0 -defparam tb_pulp.USE_SDVT_CPI=0 \
		-defparam tb_pulp.BAUDRATE=115200 -defparam tb_pulp.ENABLE_DEV_DPI=0 \
		-defparam tb_pulp.LOAD_L2=JTAG -defparam tb_pulp.USE_SDVT_I2S=0 \
		-defparam tb_pulp.USE_PULP_BUS_ACCESS=1 \
		$(VISIBILITY) $(XRUN_FLAGS) \
		-f ncompile/src_ips_files.f \
		-f ncompile/src_rtl_files.f

# this target is currently broken because the parser chokes on dpi_model.sv
sim-mc: build-deps
	$(XRUN) -64bit $(TIMESCALE) $(WARNINGS) \
		-mce -mce_top tb_pulp \
		-sv -v93 -allowredefinition \
		$(XRUN_FLAGS) \
		-f ncompile/src_ips_files.f \
		-f ncompile/src_rtl_files.f

# -v93 is required for the FLL
build-sc: build-deps
	$(XRUN) -64bit -elaborate $(TIMESCALE) $(WARNINGS) \
		-top tb_pulp \
		-sv -v93 -allowredefinition \
		 $(VISIBILITY) $(XRUN_FLAGS) \
		-f ncompile/src_ips_files.f \
		-f ncompile/src_rtl_files.f

build-mc: build-deps
	$(XRUN) -64bit -elaborate $(TIMESCALE) $(WARNINGS) \
		-mce -mce_top tb_pulp \
		-sv -v93 -allowredefinition \
		$(XRUN_FLAGS) \
		-f ncompile/src_ips_files.f \
		-f ncompile/src_rtl_files.f

clean-mc:
clean-sc:
	$(XRUN) -clean

# "recursive building" i.e. building libraries and linking them is also
# supported for ncsim/xcelium but It won't support multi-core simulation
sim-r:
	$(XRUN) -64bit -top tb_pulp $(TIMESCALE) $(WARNINGS) \
		-sv_lib $(SVLIB) \
		-defparam tb_pulp.USE_SDVT_SPI=0 -defparam tb_pulp.USE_SDVT_CPI=0 \
		-defparam tb_pulp.BAUDRATE=115200 -defparam tb_pulp.ENABLE_DEV_DPI=0 \
		-defparam tb_pulp.LOAD_L2=JTAG -defparam tb_pulp.USE_SDVT_I2S=0 \
		-defparam tb_pulp.USE_PULP_BUS_ACCESS=1 \
		$(VISIBILITY) $(XRUN_FLAGS) \
		$(RTLLIBS)

build-r:
	@make --no-print-directory -f $(mkfile_path)/ncompile/ips.mk build
	@make --no-print-directory -f $(mkfile_path)/ncompile/rtl.mk build

lib-r:
	@make --no-print-directory -f $(mkfile_path)/ncompile/ips.mk lib
	@make --no-print-directory -f $(mkfile_path)/ncompile/rtl.mk lib

clean-r:
	@make --no-print-directory -f $(mkfile_path)/ncompile/ips.mk clean
	@make --no-print-directory -f $(mkfile_path)/ncompile/rtl.mk clean


clean: clean-r clean-mc clean-sc clean-deps




compile: 
	@vcs -sverilog -full64  \
	    -top tb_pulp \
		-sv_lib $(SVLIB) \
	    +incdir+/home/wangchengxuan/pulp-master/ips/ \
		+incdir+/home/wangchengxuan/pulp-master/rtl/includes/ \
		+incdir+/home/wangchengxuan/pulp-master/ips/adv_dbg_if/rtl/ \
		+incdir+/home/wangchengxuan/pulp-master/ips/axi//axi/include \
		+incdir+/home/wangchengxuan/pulp-master/ips/riscv/rtl/include \
		+incdir+/home/wangchengxuan/pulp-master/ips/ibex/vendor/lowrisc_ip/ip/prim/rtl/ \
		+incdir+/home/wangchengxuan/pulp-master/ips/udma/udma_qspi/rtl/ \
		+incdir+/home/wangchengxuan/pulp-master/ips/register_interface/include/ \
		+incdir+/home/wangchengxuan/pulp-master/ips/pulp_soc/rtl/include/ \
		+incdir+/home/wangchengxuan/pulp-master/ips/mchan/rtl/include/ \
		+incdir+/home/wangchengxuan/pulp-master/ips/cluster_peripherals/event_unit/include/ \
		-assert svaext \
		+error+100 \
		-error=noMPD \
		-timescale=1ns/1ps \
		-f ncompile/src_ips_files.f -f ncompile/src_rtl_files.f \
		-Mdir=$(mkfile_path)/vcs_test/ 
		
elaborate:
	@vcs -sverilog -f ncompile/src_ips_files.f \ 
		 -f ncompile/src_rtl_files.f 


mix-compile:
	vcs -R -top tb_pulp \
		-debug_all \
		-full64 \
		-o $(mkfile_path)/vcs_test/simv
		-Mdir=$(mkfile_path)/vcs_test/  




verilog-compile:
	@vlogan -sverilog -full64  \
		-nc \
	    +incdir+/home/wangchengxuan/pulp-master/ips/ \
		+incdir+/home/wangchengxuan/pulp-master/rtl/includes/ \
		+incdir+/home/wangchengxuan/pulp-master/ips/adv_dbg_if/rtl/ \
		+incdir+/home/wangchengxuan/pulp-master/ips/axi//axi/include \
		+incdir+/home/wangchengxuan/pulp-master/ips/riscv/rtl/include \
		+incdir+/home/wangchengxuan/pulp-master/ips/ibex/vendor/lowrisc_ip/ip/prim/rtl/ \
		+incdir+/home/wangchengxuan/pulp-master/ips/udma/udma_qspi/rtl/ \
		+incdir+/home/wangchengxuan/pulp-master/ips/register_interface/include/ \
		+incdir+/home/wangchengxuan/pulp-master/ips/pulp_soc/rtl/include/ \
		+incdir+/home/wangchengxuan/pulp-master/ips/mchan/rtl/include/ \
		+incdir+/home/wangchengxuan/pulp-master/ips/cluster_peripherals/event_unit/include/ \
		-assert svaext \
		+error+100 \
		-timescale=1ns/1ps \
		-f ncompile/src_ips_files.f -f ncompile/src_rtl_files.f



vhdl-compile:
	vhdlan -nc -f ncompile/vhdl.f 


# build-sc: build-deps
# 	$(XRUN) -64bit -elaborate $(TIMESCALE) $(WARNINGS) \
# 		-top tb_pulp \
# 		-sv -v93 -allowredefinition \
# 		 $(VISIBILITY) $(XRUN_FLAGS) \
# 		-f ncompile/src_ips_files.f \
# 		-f ncompile/src_rtl_files.f

clean-compile:
	rm -rf AN.DB vcs_test work csrc 
	mkdir -p vcs_test work