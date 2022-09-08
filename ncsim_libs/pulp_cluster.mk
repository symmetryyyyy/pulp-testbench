#
# Copyright (C) 2015-2019 ETH Zurich, University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

IP=pulp_cluster
IP_PATH=$(IPS_PATH)/pulp_cluster
LIB_NAME=$(IP)_lib

include ncompile/build.mk

.PHONY: ncompile-$(IP) ncompile-subip-pulp_cluster 

ncompile-$(IP): $(LIB_PATH)/_nmake

$(LIB_PATH)/_nmake : $(LIB_PATH)/pulp_cluster.nmake 
	echo $(LIB_PATH)/_nmake


# pulp_cluster component
INCDIR_PULP_CLUSTER=+incdir+$(/home/wangchengxuan/pulp-master/ips/)/../../rtl/includes+$(/home/wangchengxuan/pulp-master/ips/)/packages+$(/home/wangchengxuan/pulp-master/ips/)/../axi/axi/include+$(/home/wangchengxuan/pulp-master/ips/)/../axi/axi/include/axi
SRC_SVLOG_PULP_CLUSTER=\
	$(/home/wangchengxuan/pulp-master/ips/)/../axi/axi/include/axi/typedef.svh\
	$(/home/wangchengxuan/pulp-master/ips/)/packages/pulp_cluster_package.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/instr_width_converter.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/core_region.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/core_demux.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/periph_demux.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/cluster_interconnect_wrap.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/tcdm_banks_wrap.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/per_demux_wrap.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/periph_FIFO.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/xbar_pe_wrap.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/cluster_peripherals.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/cluster_clock_gate.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/cluster_timer_wrap.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/cluster_event_map.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/dmac_wrap.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/hwpe_subsystem.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/cluster_bus_wrap.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/axi2mem_wrap.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/axi2per_wrap.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/per2axi_wrap.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/rtl/pulp_cluster.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/../pulp_soc/rtl/components/pulp_interfaces.sv
SRC_VHDL_PULP_CLUSTER=

ncompile-subip-pulp_cluster: $(LIB_PATH)/pulp_cluster.nmake

$(LIB_PATH)/pulp_cluster.nmake: $(SRC_SVLOG_PULP_CLUSTER) $(SRC_VHDL_PULP_CLUSTER)
	$(call subip_echo,pulp_cluster)
	$(SVLOG_CC) -makelib ./ncsim_libs    $(INCDIR_PULP_CLUSTER) $(SRC_SVLOG_PULP_CLUSTER) -endlib

	echo $(LIB_PATH)/pulp_cluster.nmake

