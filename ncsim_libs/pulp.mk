#
# Copyright (C) 2015-2019 ETH Zurich, University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

IP=pulp
IP_PATH=$(RTL_PATH)/pulp
LIB_NAME=$(IP)_lib

include ncompile/build.mk

.PHONY: ncompile-$(IP) ncompile-subip-pulp 

ncompile-$(IP): $(LIB_PATH)/_nmake

$(LIB_PATH)/_nmake : $(LIB_PATH)/pulp.nmake 
	echo $(LIB_PATH)/_nmake


# pulp component
INCDIR_PULP=+incdir+$(/home/wangchengxuan/pulp-master/ips/)/../includes
SRC_SVLOG_PULP=\
	$(/home/wangchengxuan/pulp-master/ips/)/../../ips/pulp_soc/rtl/pulp_soc/pkg_soc_interconnect.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/../../ips/axi/axi/src/axi_pkg.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/jtag_tap_top.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/pad_control.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/pad_frame.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/cluster_domain.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/safe_domain.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/soc_domain.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtc_date.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtc_clock.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/pulp.sv
SRC_VHDL_PULP=

ncompile-subip-pulp: $(LIB_PATH)/pulp.nmake

$(LIB_PATH)/pulp.nmake: $(SRC_SVLOG_PULP) $(SRC_VHDL_PULP)
	$(call subip_echo,pulp)
	$(SVLOG_CC) -makelib ./ncsim_libs    $(INCDIR_PULP) $(SRC_SVLOG_PULP) -endlib

	echo $(LIB_PATH)/pulp.nmake

