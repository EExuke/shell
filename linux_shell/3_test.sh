 ############################################################################# ##
 # Copyright (C) 2010-2011 Cameo Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : 3_test.sh
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
# for 命令格式
list="Alabama Alaska Arizona Arkansas California Colorado"
list=$list" China"
# file="filename"
# for test in $(cat $file)
for test in $list
do
	echo The next state is $test
done

# while 格式
var1=5
while [ $var1 -gt 0 ]
do
	echo $var1
	var1=$[ $var1 - 1 ]
done

# until 格式
var1=100
until [ $var1 -eq 0 ]
do
	echo $var1
	var1=$[ $var1 - 25 ]
done

# 循环处理文件数据， IFS指定分隔符
IFS.OLD=$IFS
IFS=$'\n'
for entry in $(cat /etc/passwd)
do
	echo "Value in $entry -"
	IFS=:
	for value in $entry
	do
		echo "    $value"
	done
done

# 可用break和continue 控制循环退出和跳过

# 处理循环的输出，重定向结果
for (( a = 1; a < 10; a++ ))
do
	echo "The number is $a"
done > test23.txt
echo "The command is finished."
# 管道传递结果
for state in "North Dakota" Connecticut Illinois Alabama Tennessee
do
	echo "$state is the next place to go"
done | sort
echo "This completes our travels"

#---------------------------------------------------
# 查找可执行文件
echo " 可执行文件： "
IFS=:
for folder in $PATH
do
	for file in $folder/*
	do
		if [ -x $file ]
		then
			echo "    $file"
		fi
	done
done

#---------------------------------------------------
# 创建多个用户
# 文本文件的格式如下:
# userid,user name
#
#input="users.csv"
#while IFS=',' read -r userid name
#do
	#echo "adding $userid"
	#useradd -c "$name" -m $userid
#done < "$input"


