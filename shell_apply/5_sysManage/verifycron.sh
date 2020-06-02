 ############################################################################# ##
 # Copyright (C) 2001-2020 Inhand Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : verifycron.sh
 #     FILE DESCRIPTION         : Linux shell script FILE
 #                              : 检查crontab文件，确保格式方面没有问题
 #     FIRST CREATION DATE      : 2020/06/02
 # --------------------------------------------------------------------------
 #     Version                  : 1.0
 #     Last Change              : 2020/06/02
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

#########################################################################################################
# 定时任务：
# $ crontab -e
# 添加格式：
# 1  2  3  4  5  /home/xuke/timeTask/*.sh
# 分 时 天 月 星期(第几个)   任务脚本
#
#########################################################################################################

#-----------------------------------------------------------
#                  MAIN PROCESS
#-----------------------------------------------------------

#-----------------------------------------------------------
# 如果给定的数字是有效的整数，返回0，否则返回1
# 指定数字和最大值作为函数参数
#-----------------------------------------------------------
validNum()
{
	num=$1
	max=$2
	# X 代表 *
	if [[ "$num" = "X" ]]; then
		return 0
	elif [[ ! -z $(echo $num | sed 's/[[:digit:]]//g') ]]; then
		# 检查删掉所有数字后是否还有内容
		return 1
	elif [[ $num -gt $max ]]; then
		# 数字大于允许的最大值
		return 1
	else
		return 0
	fi
}

#-----------------------------------------------------------
# 如果传入函数的值是一个有效的周几名称，返回0, 否则返回1
#-----------------------------------------------------------
validDay()
{
	case $(echo $1 | tr '[:upper:]' '[:lower:]') in
		sun*|mon*|tue*|wed*|thu*|fri*|sat*)
			return 0 ;;
		X)              # 被改写的X，代表*
			return 0 ;;
		*)
			return 1
	esac
}

#-----------------------------------------------------------
# 如果传入月份名称有效，返回0, 否则返回1
#-----------------------------------------------------------
validMon()
{
	case $(echo $1 | tr '[:uppper:]' '[:lower:]') in
		jan*|feb*|mar*|apr*|may|jun*|jul*|aug*|sep*|oct*|nov*|dec*)
			return 0 ;;
		X)              # 被改写的X，代表*
			return 0 ;;
		*)
			return 1
	esac
}

#-----------------------------------------------------------
# 将所有的'*' 转换成'X'，以避免shell扩展
# 将原始输入保存到变量sourceline中
#-----------------------------------------------------------
fixvars()
{
	sourceline="$min $hour $dom $mon $dow $command"
	min=$(echo "$min" | tr '*' 'X') # 分钟
	hour=$(echo "$hour" | tr '*' 'X') # 小时
	dom=$(echo "$dom" | tr '*' 'X') # 月份天数
	mon=$(echo "$mon" | tr '*' 'X') # 月份
	dow=$(echo "$dow" | tr '*' 'X') # 周几
}

#-----------------------------------------------------------
# mian script
#-----------------------------------------------------------
if [ $# -ne 1 ] || [ ! -r $1 ]; then
	# 如果crontab文件名未给出或者脚本无法读取该文件，则退出
	echo "Usage: $0 usercrontabfile" >&2
	exit 1
fi

lines=0
entries=0
totalerrors=0

# 逐行检查crontab文件
while read min hour dom mon dow command
do
	lines="$(( $lines + 1 ))"
	errors=0

	if [ -z "$min" -o "${min%${min#?}}" = "#" ]; then
		# 如果是空行或者注视行，则跳过
		continue
	fi

	((entries++))

	fixvars

# 检查分钟
for minslice in $(echo "$min" | sed 's/[,-]/ /g'); do
	if ! validNum $minslice 60 ; then
		echo "Line ${lines}: Invalid minute value \"$minslice\""
		errors=1
	fi
done

# 检查小时
for hrslice in $(echo "$hour" | sed 's/[,-]/ /g'); do
	if ! validNum $hrslice 24 ; then
		echo "Line ${lines}: Invalid hour value \"$hrslice\""
		errors=1
	fi
done

# 检查月份天数
for domslice in $(echo "$dom" | sed 's/[,-]/ /g'); do
	if ! validNum $domslice 31 ; then
		echo "Line ${lines}: Invalid day of month value \"$domslice\""
		errors=1
	fi
done

# 检查月份
for monslice in $(echo "$mon" | sed 's/[,-]/ /g'); do
	if ! validNum $monslice 12 ; then
		if ! validMon "$monslice" ; then
			echo "Line ${lines}: Invalid month value \"$monslice\""
			errors=1
		fi
	fi
done

# 检查周几
for dowslice in $(echo "$dow" | sed 's/[,-]/ /g'); do
	if ! validNum $dowslice 7 ; then
		if ! validDay "$dowslice" ; then
			echo "Line ${lines}: Invalid day of month value \"$dowslice\""
			errors=1
		fi
	fi
done

# 
if [[ $error -gt 0 ]]; then
	echo ">>>> ${lines}: $sourceline"
	echo ""
	totalerrors="$(( $totalerrors + 1 ))"
fi
done < $1    # 读取作为脚本参数的crontab
echo "Done. Found $totalerrors errors in $entries crontab entries."

exit 0
