 ############################################################################# ##
 # Copyright (C) 2010-2011 Cameo Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : test2.sh
 #     FILE DESCRIPTION         : Linux shell script file
 #     FIRST CREATION DATE      : 2020/03/26
 # --------------------------------------------------------------------------
 #     Version                  : 1.0
 #     Last Change              : 2020/03/26
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
#                  MAIN PROCESS
#-----------------------------------------------------------
# test 命令
if test $1
then
	echo "No expression returns a True"
else
	echo "No expression returns a False"
fi

# 条件判断格式，可用于: 数值比较、字符串比较、文件比较
# 数值比较
# n1 -eq n2 检查 n1 是否与 n2 相等
# n1 -ge n2 检查 n1 是否大于或等于 n2
# n1 -gt n2 检查 n1 是否大于 n2
# n1 -le n2 检查 n1 是否小于或等于 n2
# n1 -lt n2 检查 n1 是否小于 n2
# n1 -ne n2 检查 n1 是否不等于 n2
var1=6
if [ $var1 -gt 5 ]
then
	echo "The test value > 5 "
fi

# 字符串比较, 可使用比较符: =、!=、<、>, -n检测长度非0、-z检测长度为0
testuser=xuke
if [ $USER = $testuser ]
then
	echo "Welcome $testuser"
fi

# 文件比较
 # -d file 检查 file 是否存在并是一个目录
 # -e file 检查 file 是否存在
 # -f file 检查 file 是否存在并是一个文件
 # -r file 检查 file 是否存在并可读
 # -s file 检查 file 是否存在并非空
 # -w file 检查 file 是否存在并可写
 # -x file 检查 file 是否存在并可执行
 # -O file 检查 file 是否存在并属当前用户所有
 # -G file 检查 file 是否存在并且默认组与当前用户相同
 # file1 -nt file2 检查 file1 是否比 file2 新
 # file1 -ot file2 检查 file1 是否比 file2 旧
filename=README.md
 if [ -e $filename ]
then
	echo "The $filename directory exists"
	cat $filename
else
	echo "The $filename directory does not exist"
fi

# 复合条件测试(多个条件)
# [ condition1 ] && [ condition2 ]
# [ condition1 ] || [ condition2 ]

# 双括号命令允许你在比较过程中使用高级数学表达式
# val++, vla--, ++val, --val, !, ~, **, <<, >>, &, |, &&, ||
value=1
if (( ++value == 2 ))
then
	echo value++ = 2
fi

# case 命令格式
case $USER in
	xuke | EExuke )
		echo "Welcome, $USER"
		echo "Please enjoy your visit";;
	testing )
		echo "Special testing account";;
	jessica )
		echo "Do not forget to log off when you're done";;
	* )
		echo "Sorry, you are not allowed here";;
esac

exit 2
