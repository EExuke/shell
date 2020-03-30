 ############################################################################# ##
 # Copyright (C) 2010-2011 Cameo Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : 8_2_test.sh
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
#                  制作窗口
#-----------------------------------------------------------
# dialog包能够用ANSI转义控制字符在文本环境中创建标准的窗口对话框
# 安装: sudo apt-get install dialog
# dialog 命令使用命令行参数来决定生成哪种窗口部件(widget)
#部件         	    描述
#calendar     	提供选择日期的日历
#checklist    	显示多个选项(其中每个选项都能打开或关闭)
#form         	构建一个带有标签以及文本字段(可以填写内容)的表单
#fselect      	提供一个文件选择窗口来浏览选择文件
#gauge        	显示完成的百分比进度条
#infobox      	显示一条消息,但不用等待回应
#inputbox     	提供一个输入文本用的文本表单
#inputmenu    	提供一个可编辑的菜单
#menu         	显示可选择的一系列选项
#msgbox       	显示一条消息,并要求用户选择OK按钮
#pause        	显示一个进度条来显示暂定期间的状态
#passwordbox  	显示一个文本框,但会隐藏输入的文本
#passwordform 	显示一个带标签和隐藏文本字段的表单
#radiolist    	提供一组菜单选项,但只能选择其中一个
#tailbox      	用tail命令在滚动窗口中显示文件的内容
#tailboxbg    	跟tailbox一样,但是在后台模式中运行
#textbox      	在滚动窗口中显示文件的内容
#timebox      	提供一个选择小时、分钟和秒数的窗口
#yesno        	提供一条带有Yes和No按钮的简单消息

#dialog --widget parameters
	#其中 widget 是表中的部件名, 
	#parameters 定义了部件窗口的大小以及部件需要的文本
dialog --inputbox "Enter your age:" 10 20 2>age.txt
# dialog --msgbox text height width
dialog --title Testing --msgbox "This is a test" 10 20
# yes or No
dialog --title "Please answer" --yesno "Is this thing on?" 10 20
if [ $? -eq 0 ]
then
	echo 'yes'
else
	echo 'no'
fi
# inputbox
dialog --inputbox "Enter your age:" 10 20 2>age.txt
# textbox
dialog --textbox /etc/passwd 15 45
# menu
dialog --menu "Sys Admin Menu" 20 30 10 \
1 "Display disk space" \
2 "Display users" \
3 "Display memory usage" \
4 "Exit" 2> test.txt
# fselect
dialog --title "Select a file" --fselect $HOME/ 10 50 2>file.txt

# 实例:
temp=$(mktemp -t test.XXXXXX)
temp2=$(mktemp -t test2.XXXXXX)

function diskspace {
	df -k > $temp
	dialog --textbox $temp 20 60
}
function whoseon {
	who > $temp
	dialog --textbox $temp 20 50
}
function memusage {
	cat /proc/meminfo > $temp
	dialog --textbox $temp 20 50
}

while [ 1 ]
do
	dialog --menu "Sys Admin Menu" 20 30 10 \
		1 "Display disk space" \
		2 "Display users" \
		3 "Display memory usage" \
		0 "Exit" 2> $temp2
	if [ $? -eq 1 ]
	then
		break
	fi
	
	selection=$(cat $temp2)

	case $selection in
		1)
			diskspace ;;
		2)
			whoseon ;;
		3)
			memusage ;;
		0)
			break ;;
		*)
			dialog --msgbox "Sorry, invalid selection" 10 30
	esac
done

rm -f $temp 2> /dev/null
rm -f $temp2 2> /dev/null



