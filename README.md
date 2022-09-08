### 文件结构
ips下包含各种ip
rtl下包含各种rtl
rtl/tb/tb_pulp.sv为需要仿真的顶层文件

### 脚本
sim下makefile和makefile_backup.mk为修改后脚本
ncompile下是ncsim的各种*.mk文件，以及修改过低级重复声名错误的filelist

### makefile生成，有待确认
ipstools似乎包含完整的生成makefile的脚本，可以先编译doc下的makefile阅读_build/latex下的pdf
主要包含的工具是一些python库，需要先setup ipstools（python setup.py install)
