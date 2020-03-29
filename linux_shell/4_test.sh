 ############################################################################# ##
 # Copyright (C) 2010-2011 Cameo Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : 4_test.sh
 #     FILE DESCRIPTION         : Linux shell script file
 #     FIRST CREATION DATE      : 2020/03/27
 # --------------------------------------------------------------------------
 #     Version                  : 1.0
 #     Last Change              : 2020/03/27
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
#                  处理用户输入
#-----------------------------------------------------------
# 检测参数是否输入
if [ -n "$1" ]
then
	echo Hello $1, glad to meet you.
else
	echo "Sorry, you did not identify yourself. "
fi

# 特殊变量 $# 统计参数个数，在{}内引用时，要用！号
echo There were $# parameters supplied
params=$#
echo The last parameter is $params
echo The last parameter is ${!#}

# 抓取所有参数，$* 和 $@
# $* 会将命令行上提供的所有参数当作一个单词保存
# $@ 会将命令行上提供的所有参数当作同一字符串中的多个独立的单词
echo
echo "Using the \$* method: $*"
echo
echo "Using the \$@ method: $@"
# 遍历：
count=1
for param in "$*"
do
	echo "\$* Parameter #$count = $param"
	count=$[ $count + 1 ]
done
echo "------------------------------"
count=1
for param in "$@"
do
	echo "\$@ Parameter #$count = $param"
	count=$[ $count + 1 ]
done

# 移动变量
# 使用 shift 命令时,默认情况下它会将每个参数变量向左移动一个位置
# 而变量 $1 的值则会被删除(注意,变量 $0 的值,即程序名,不会改变)
count=1
while [ -n "$1" ]
do
	echo "Parameter #$count = $1"
	count=$[ $count + 1 ]
	shift    #shift可跟参数，确定每次移动的位数
done
# 处理选项,shell会用双破折线来表明选项列表结束
while [ -n "$1" ]
do
	case "$1" in
		-a) echo "Found the -a option" ;;
		-b) echo "Found the -b option" ;;
		-c) echo "Found the -c option" ;;
		--) shift
			break ;;
		*) echo "$1 is not an option" ;;
	esac
	shift
done
#
count=1
for param in $@
do
	echo "Parameter #$count: $param"
	count=$[ $count + 1 ]
done
# 处理带值的选项
while [ -n "$1" ]
do
	case "$1" in
		-a) echo "Found the -a option";;
		-b) param="$2"
			echo "Found the -b option, with parameter value $param"
			shift ;;
		-c) echo "Found the -c option";;
		--) shift
			break ;;
		*) echo "$1 is not an option";;
	esac
	shift
done

# 使用getopt命令，它能够识别命令行参数; 也可以使用扩展的版本:getopts
set -- $(getopt -q ab:cd "$@")

#------------------------------------------------------------------
# 获取用户输入
# read 命令从标准输入或文件接收输入
echo -n "Enter your name: "
read name
echo "Hello $name, welcome to my program. "
# -p 选项,允许你直接在 read 命令行指定提示符
read -p "Please enter your age: " age
days=$[ $age * 365 ]
echo "That makes you over $days days old! "
# 多个参数变量
read -p "Enter your name: " first last
echo "Checking data for $last, $first..."

# 限时，-t 选项指定了 read 命令等待输入的秒数
if read -t 5 -p "Please enter your name: " name
then
	echo "Hello $name, welcome to my script"
else
	echo
	echo "Sorry, too slow! "
fi
# 隐藏方式读取，-s 选项可以避免在 read 命令中输入的数据出现在显示器上
read -s -p "Enter your password: " pass
echo
echo "Is your password really $pass? "

# 从文件中读取,每次调用 read 命令,它都会从文件中读取一行文本
count=1
cat test.txt | while read line
do
	echo "Line $count: $line"
	count=$[ $count + 1]
done
echo "Finished processing the file"
# while 循环会持续通过 read 命令处理文件中的行,直到 read 命令以非零退出状态码退出



