 ############################################################################# ##
 # Copyright (C) 2001-2020 Inhand Networks, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : disk_info.sh
 #     FILE DESCRIPTION         : Linux shell script file
 #     FIRST CREATION DATE      : 2020/07/22
 # --------------------------------------------------------------------------
 #     Version                  : 1.0
 #     Last Change              : 2020/07/22
 ## ************************************************************************** ##
#!/bin/bash
#-----------------------------------------------------------
#                COLOUR VARIABLES
#-----------------------------------------------------------
UNDL="\033[4m"    F6_E="\033[0m"    B_WT="\033[47m"
F_BL="\033[30m"   F_RD="\033[31m"   F_GR="\033[32m"
F_YL="\033[33m"   F_BU="\033[34m"   F_PU="\033[35m"
F_DG="\033[36m"   F_WT="\033[37m"   B_BL="\033[40m"
B_RE="\033[41m"   B_GR="\033[42m"   B_YL="\033[43m"
B_BU="\033[44m"   B_PR="\033[45m"   B_DG="\033[46m"

#-----------------------------------------------------------
#使用 case、while 和 read 进行查看磁盘信息
#-----------------------------------------------------------
#                  MAIN PROCESS
#-----------------------------------------------------------
cat << EOF
D|d 显示硬盘信息
M|m 显示内存信息
S|s 显示交换分区信息
EOF

read -p "请输入以上对应参数:" CANSHU
while [ $CANSHU != "exit" ]; do
	case $CANSHU in
		d|D)
			df -h
			;;
		m|M)
			free -m | grep Mem
			;;
		s|S)
			free -m | grep Swap
			;;
		*)
			echo "Ukown"
			;;
	esac
	read -p "请再次输入以上对应参数:" CANSHU
done