 ############################################################################# ##
 # Copyright (C) 2001-2020 Inhand Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : str_DateForm.sh
 #     FILE DESCRIPTION         : Linux shell script file
 #     FIRST CREATION DATE      : 2020/05/28
 # --------------------------------------------------------------------------
 #     Version                  : 1.0
 #     Last Change              : 2020/05/28
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
#                  function
#-----------------------------------------------------------
monthNumToName()
{
	# 将变量month设置为相应的值
	case $1 in
		1) month='Jan'    ;;
		2) month='Feb'    ;;
		3) month='Mar'    ;;
		4) month='Apr'    ;;
		5) month='May'    ;;
		6) month='Jun'    ;;
		7) month='Jul'    ;;
		8) month='Aug'    ;;
		9) month='Sep'    ;;
		10) month='Oct'    ;;
		11) month='Nov'    ;;
		12) month='Dec'    ;;
		*) echo "$0: Unknown numeric month value $1" >&2
			exit 1
	esac
	return 0
}

#-----------------------------------------------------------
#                  MAIN PROCESS
#-----------------------------------------------------------
if [[ $# -eq 1 ]]; then
	set -- $(echo $1 | sed 's/[\/\-]/ /g')
fi

if [ $# -ne 3 ] ; then
	echo ""
	echo ""
	exit 1
fi
if [[ $3 -le 99 ]]; then
	echo "$0: expected 4-digit year value." >&2
	exit 1
fi

# 输入的月份是否为数字？
if [[ -z $(echo $1|sed 's/[[:digit:]]//g') ]]; then
	monthNumToName $1
else
	# 规范前三个字母，首字母大写，其余小写
	month="$(echo $1|cut -c1|tr '[:lower:]' '[:upper:]')"
	month="$month$(echo $1|cut -c2-3 | tr '[:upper:]' '[:lower:]')"
fi

echo $month $2 $3

exit 0
