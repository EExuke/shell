 ############################################################################# ##
 # Copyright (C) 2010-2011 Cameo Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : 7_test.sh
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
#                  函数
#-----------------------------------------------------------
# 格式1:
function name {
	ls
	return
}
# 格式2:
name() {
	ls
	return
}
# 退出状态码必须是0~255

# 数组变量和函数
function testit {
	local sum=0
	local newarray
	newarray=($(echo "$@"))
	for value in ${newarray[*]}
	do
		sum=$[ $sum + $value ]
	done
	echo $sum
}
myarray=(1 2 3 4 5)
echo "The original array is: ${myarray[*]}"
arg1=$(echo ${myarray[*]})
result=$(testit $arg1)
echo "The result is $result"
# 从函数返回数组
function arraydblr {
	local origarray
	local newarray
	local elements
	local i
	origarray=($(echo "$@"))
	newarray=($(echo "$@"))
	elements=$[ $# - 1 ]
	for (( i = 0; i <= $elements; i++ ))
	{
		newarray[$i]=$[ ${origarray[$i]} * 2 ]
	}
	echo ${newarray[*]}
}
myarray=(1 2 3 4 5)
echo "The original array is: ${myarray[*]}"
arg1=$(echo ${myarray[*]})
result=($(arraydblr $arg1))
echo "The new array is: ${result[*]}"

# 创建共享库
# 第一步是创建一个包含脚本中所需函数的公用库文件，如./myfuncs
# 下一步是在用到这些函数的脚本文件中包含myfuncs库文件
	# 使用 source 命令有个快捷的别名,称作点操作符
. ./myfuncs.sh

value1=10
value2=5
result1=$(addem $value1 $value2)
result2=$(multem $value1 $value2)
result3=$(divem $value1 $value2)
echo "The result of adding them is: $result1"
echo "The result of multiplying them is: $result2"
echo "The result of dividing them is: $result3"

# 在命令行中使用函数
	# 在 ~/.bashrc 文件中定义, 或引用创建的共享库即可
	# 如 "functions" 的调用

#------------------------------------------------------------------------
# 在开源世界中，可以下载大量各式各样的函数,并将其用于自己的应用程序中。
# 示例: GNU shtool shell脚本函数库
	# 下载安装: ftp://ftp.gnu.org/gnu/shtool/shtool-2.0.8.tar.gz
				# tar -zxvf shtool-2.0.8.tar.gz
	# 构建库: ./configure 再 make
	# 安装到公用位置: make install
# shtool库函数:
#函数        	    描述
#Arx         	创建归档文件(包含一些扩展功能)
#Echo        	显示字符串,并提供了一些扩展构件
#fixperm     	改变目录树中的文件权限
#install     	安装脚本或文件
#mdate       	显示文件或目录的修改时间
#mkdir       	创建一个或更多目录
#Mkln        	使用相对路径创建链接
#mkshadow    	创建一棵阴影树
#move        	带有替换功能的文件移动
#Path        	处理程序路径
#platform    	显示平台标识
#Prop        	显示一个带有动画效果的进度条
#rotate      	转置日志文件
#Scpp        	共享的C预处理器
#Slo         	根据库的类别,分离链接器选项
#Subst       	使用sed的替换操作
#Table       	以表格的形式显示由字段分隔(field-separated)的数据
#tarball     	从文件和目录中创建tar文件
#version     	创建版本信息文件
