#
# Copyright (C) 2015-2019 ETH Zurich, University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

IP=pulpemu
IP_PATH=$(RTL_PATH)/pulpemu
LIB_NAME=$(IP)_lib

include ncompile/build.mk

.PHONY: ncompile-$(IP) 

ncompile-$(IP): $(LIB_PATH)/_nmake

$(LIB_PATH)/_nmake : 
	echo $(LIB_PATH)/_nmake



