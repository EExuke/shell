 ############################################################################# ##
 # Copyright (C) 2010-2011 Cameo Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : 5_test.sh
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
#                  呈现数据
#-----------------------------------------------------------
# 重定向 >、<、>>
# STDERR 重定向
ls -al badfile 2> test5
cat test5

# exec 命令告诉shell在脚本执行期间重定向某个特定文件描述符
exec 1>>test5
echo "This is a test of redirecting all output"
echo "From a script to another file."
echo "without having to redirect every individual line"
# exec 命令允许你将 STDIN 重定向到Linux系统上的文件中
exec 0< test.txt
count=1
while read line
do
	echo "Line #$count: $line"
	count=$[ $count + 1 ]
done
# 重定向到丢弃,不显示
ls -al > /dev/null

# 临时文件: 系统在启动时自动删除/tmp目录的所有文件
# mktemp 会在本地目录中创建一个文件。要用 mktemp 命令在本地目录中创建一
# 个临时文件,你只要指定一个文件名模板就行了。模板可以包含任意文本文件名,在文件名末尾加上6个 X 就行了
mktemp testing.XXXXXX
tempfile=$(mktemp test5.XXXXXX)
exec 3>$tempfile
echo "This script writes to temp file $tempfile"
echo "This is the first line" >&3
echo "This is the second line." >&3
echo "This is the last line." >&3
exec 3>&-
echo "Done creating temp file. The contents are:"
cat $tempfile
rm -f $tempfile 2> /dev/null
# -t 选项会强制 mktemp 命令来在系统的临时目录来创建该文件
mktemp -t test.XXXXXX
ls -al /tmp/test*
# -d 选项告诉 mktemp 命令来创建一个临时目录而不是临时文件

# tee 命令相当于管道的一个T型接头,它将从 STDIN 过来的数据同时发往两处
date | tee -a testfile

#------------------------------------------------------------------------------------------------------------
