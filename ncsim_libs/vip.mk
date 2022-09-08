#
# Copyright (C) 2015-2019 ETH Zurich, University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

IP=vip
IP_PATH=$(RTL_PATH)/vip
LIB_NAME=$(IP)_lib

include ncompile/build.mk

.PHONY: ncompile-$(IP) ncompile-subip-S25FS256_model ncompile-subip-24FC1025_model ncompile-subip-hyperflash_model ncompile-subip-hyperram_model ncompile-subip-psram_model ncompile-subip-i2s_model ncompile-subip-open_models 

ncompile-$(IP): $(LIB_PATH)/_nmake

$(LIB_PATH)/_nmake : $(LIB_PATH)/S25FS256_model.nmake $(LIB_PATH)/24FC1025_model.nmake $(LIB_PATH)/hyperflash_model.nmake $(LIB_PATH)/hyperram_model.nmake $(LIB_PATH)/psram_model.nmake $(LIB_PATH)/i2s_model.nmake $(LIB_PATH)/open_models.nmake 
	echo $(LIB_PATH)/_nmake


SRC_SVLOG_S25FS256_MODEL=\
	$(/home/wangchengxuan/pulp-master/ips/)/spi_flash/S25fs256s/model/s25fs256s.v
SRC_VHDL_S25FS256_MODEL=

ncompile-subip-S25FS256_model: $(LIB_PATH)/S25FS256_model.nmake

$(LIB_PATH)/S25FS256_model.nmake: $(SRC_SVLOG_S25FS256_MODEL) $(SRC_VHDL_S25FS256_MODEL)
	$(call subip_echo,S25FS256_model)
	$(SVLOG_CC) -makelib ./ncsim_libs    +define+SPEEDSIM $(INCDIR_S25FS256_MODEL) $(SRC_SVLOG_S25FS256_MODEL) -endlib

	echo $(LIB_PATH)/S25FS256_model.nmake

SRC_SVLOG_24FC1025_MODEL=\
	$(/home/wangchengxuan/pulp-master/ips/)/i2c_eeprom/24FC1025.v
SRC_VHDL_24FC1025_MODEL=

ncompile-subip-24FC1025_model: $(LIB_PATH)/24FC1025_model.nmake

$(LIB_PATH)/24FC1025_model.nmake: $(SRC_SVLOG_24FC1025_MODEL) $(SRC_VHDL_24FC1025_MODEL)
	$(call subip_echo,24FC1025_model)
	$(SVLOG_CC) -makelib ./ncsim_libs    +define+SPEEDSIM $(INCDIR_24FC1025_MODEL) $(SRC_SVLOG_24FC1025_MODEL) -endlib

	echo $(LIB_PATH)/24FC1025_model.nmake

SRC_SVLOG_HYPERFLASH_MODEL=\
	$(/home/wangchengxuan/pulp-master/ips/)/hyperflash_model/s26ks512s.v
SRC_VHDL_HYPERFLASH_MODEL=

ncompile-subip-hyperflash_model: $(LIB_PATH)/hyperflash_model.nmake

$(LIB_PATH)/hyperflash_model.nmake: $(SRC_SVLOG_HYPERFLASH_MODEL) $(SRC_VHDL_HYPERFLASH_MODEL)
	$(call subip_echo,hyperflash_model)
	$(SVLOG_CC) -makelib ./ncsim_libs    +define+SPEEDSIM $(INCDIR_HYPERFLASH_MODEL) $(SRC_SVLOG_HYPERFLASH_MODEL) -endlib

	echo $(LIB_PATH)/hyperflash_model.nmake

SRC_SVLOG_HYPERRAM_MODEL=\
	$(/home/wangchengxuan/pulp-master/ips/)/hyperram_model/s27ks0641.v
SRC_VHDL_HYPERRAM_MODEL=

ncompile-subip-hyperram_model: $(LIB_PATH)/hyperram_model.nmake

$(LIB_PATH)/hyperram_model.nmake: $(SRC_SVLOG_HYPERRAM_MODEL) $(SRC_VHDL_HYPERRAM_MODEL)
	$(call subip_echo,hyperram_model)
	$(SVLOG_CC) -makelib ./ncsim_libs    +define+SPEEDSIM $(INCDIR_HYPERRAM_MODEL) $(SRC_SVLOG_HYPERRAM_MODEL) -endlib

	echo $(LIB_PATH)/hyperram_model.nmake

SRC_SVLOG_PSRAM_MODEL=\
	$(/home/wangchengxuan/pulp-master/ips/)/psram_model/*.vp_modelsim
SRC_VHDL_PSRAM_MODEL=

ncompile-subip-psram_model: $(LIB_PATH)/psram_model.nmake

$(LIB_PATH)/psram_model.nmake: $(SRC_SVLOG_PSRAM_MODEL) $(SRC_VHDL_PSRAM_MODEL)
	$(call subip_echo,psram_model)
	$(SVLOG_CC) -makelib ./ncsim_libs    +define+SPEEDSIM $(INCDIR_PSRAM_MODEL) $(SRC_SVLOG_PSRAM_MODEL) -endlib

	echo $(LIB_PATH)/psram_model.nmake

SRC_SVLOG_I2S_MODEL=\
	$(/home/wangchengxuan/pulp-master/ips/)/i2s/i2c_if.v\
	$(/home/wangchengxuan/pulp-master/ips/)/i2s/i2s_vip_channel.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/i2s/i2s_vip.sv
SRC_VHDL_I2S_MODEL=

ncompile-subip-i2s_model: $(LIB_PATH)/i2s_model.nmake

$(LIB_PATH)/i2s_model.nmake: $(SRC_SVLOG_I2S_MODEL) $(SRC_VHDL_I2S_MODEL)
	$(call subip_echo,i2s_model)
	$(SVLOG_CC) -makelib ./ncsim_libs    +define+SPEEDSIM $(INCDIR_I2S_MODEL) $(SRC_SVLOG_I2S_MODEL) -endlib

	echo $(LIB_PATH)/i2s_model.nmake

SRC_SVLOG_OPEN_MODELS=\
	$(/home/wangchengxuan/pulp-master/ips/)/spi_master_padframe.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/uart_tb_rx.sv\
	$(/home/wangchengxuan/pulp-master/ips/)/camera/cam_vip.sv
SRC_VHDL_OPEN_MODELS=

ncompile-subip-open_models: $(LIB_PATH)/open_models.nmake

$(LIB_PATH)/open_models.nmake: $(SRC_SVLOG_OPEN_MODELS) $(SRC_VHDL_OPEN_MODELS)
	$(call subip_echo,open_models)
	$(SVLOG_CC) -makelib ./ncsim_libs    $(INCDIR_OPEN_MODELS) $(SRC_SVLOG_OPEN_MODELS) -endlib

	echo $(LIB_PATH)/open_models.nmake

