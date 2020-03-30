 ############################################################################# ##
 # Copyright (C) 2010-2011 Cameo Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : 8_3_test.sh
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
#                  使用图形
#-----------------------------------------------------------
# kdialog和zenity包,它们各自为KDE和GNOME桌面提供了图形化窗口部件
# GNOME图形化环境支持两种流行的可生成标准窗口的包:
	# gdialog
	# zenity
# zenity部件:
#选项             	    描述
#--calendar       	显示一整月日历
#--entry          	显示文本输入对话窗口
#--error          	显示错误消息对话窗口
#--file-selection 	显示完整的路径名和文件名对话窗口
#--info           	显示信息对话窗口
#--list           	显示多选列表或单选列表对话窗口
#--notification   	显示通知图标
#--progress       	显示进度条对话窗口
#--question       	显示yes/no对话窗口
#--scale          	显示可调整大小的窗口
#--text-info      	显示含有文本的文本框
#--warning        	显示警告对话窗口

# calendar
zenity --calendar

# 实例:
temp=$(mktemp -t temp.XXXXXX)
temp2=$(mktemp -t temp2.XXXXXX)

function diskspace {
	df -k > $temp
	zenity --text-info --title "Disk space" --filename=$temp
	--width 750 --height 10
}

function whoseon {
	who > $temp
	zenity --text-info --title "Logged in users" --filename=$temp
	--width 500 --height 10
}

function memusage {
	cat /proc/meminfo > $temp
	zenity --text-info --title "Memory usage" --filename=$temp
	--width 300 --height 500
}

while [ 1 ]
do
	zenity --list --radiolist --title "Sys Admin Menu" \
	       --column "Select" \
	       --column "Menu Item" FALSE \
	                "Display diskspace" FALSE \
	                "Display users" FALSE \
	                "Display memory usage" FALSE \
	                "Exit" > $temp2
	if [ $? -eq 1 ]
	then
		break
	fi
	
	selection=$(cat $temp2)
	
	case $selection in
		"Display disk space")
			diskspace ;;
		"Display users")
			whoseon ;;
		"Display memory usage")
			memusage ;;
		Exit)
			break ;;
		*)
			zenity --info "Sorry, invalid selection"
	esac
done

#----------------------------------------------------------------

