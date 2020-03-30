 ############################################################################# ##
 # Copyright (C) 2010-2011 Cameo Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : 8_test.sh
 #     FILE DESCRIPTION         : Linux shell script file
 #     FIRST CREATION DATE      : 2020/03/30
 # --------------------------------------------------------------------------
 #     Version                  : 1.0
 #     Last Change              : 2020/03/30
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
#                  图形化桌面环境中的脚本编程
#-----------------------------------------------------------
# 创建文本菜单
	# 要在 echo 命令中包含非打印字符,必须用 -e 选项
function menu {
	clear
	echo
	echo -e "\t\t\tSys Admin Menu\n"    # echo使用非打印字符,必须用 -e 选项
	echo -e "\t1. Display disk space"
	echo -e "\t2. Display logged on users"
	echo -e "\t3. Display memory usage"
	echo -e "\t0. Exit menu\n\n"
	echo -en "\t\tEnter option: "    # -en 会抹去末尾换行符

	read -n 1 option    # -n 选项只读取一个字符
}

# 实现函数
function diskspace {
	clear
	df -k
}

function whoseon {
	clear
	who
}

function memusage {
	clear
	cat /proc/meminfo
}

# 逻辑函数
while [ 1 ]
do
	menu
	case $option in
		0)
			break ;;
		1)
			diskspace ;;
		2)
			whoseon ;;
		3)
			memusage ;;
		*)
			clear
			echo "Sorry, wrong selection" ;;
	esac
	echo -en "\n\n\t\t\tHit any key to continue"
	read -n 1 line
done
clear

#-----------------------------------------------------------------
# select 命令创建菜单
PS3="Enter option: "
select option in "Display disk space" "Display logged on users" \
	"Display memory usage" "Exit program"
do
	case $option in
		"Exit program")
			break ;;
		"Display disk space")
			diskspace ;;
		"Display logged on users")
			whoseon ;;
		"Display memory usage")
			memusage ;;
		*)
			clear
			echo "Sorry, wrong selection";;
	esac
	echo -en "\n\n\t\t\tHit any key to continue"
	read -n 1 line
done
clear

