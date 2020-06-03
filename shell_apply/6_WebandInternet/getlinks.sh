 ############################################################################# ##
 # Copyright (C) 2001-2020 Inhand Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : getlinks.sh
 #     FILE DESCRIPTION         : Linux shell script file
 #                              : 返回给定URL的所有相对链接和绝对链接
 #                              : -d会生成每个链接的主域
 #                              : -i只列出网站内部的链接
 #                              : -x只产生外部链接
 #     FIRST CREATION DATE      : 2020/06/03
 # --------------------------------------------------------------------------
 #     Version                  : 1.0
 #     Last Change              : 2020/06/03
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
if [[ $# -eq 0 ]]; then
	echo "Usage: $0 [-d|-i|-x] url" >&2
	echo "-d=domains only, -i=internal refs only, -x=external only" >&2
	exit 1
fi

if [[ $# -gt 1 ]]; then
	case "$1" in
		-d) lastcmd="cut -d/ -f3 | sort | uniq"
			shift
			;;
		-i) basedomain="http://$(echo $2 | cut -d/ f3)/"
			lastcmd="grep \"$basedomain\" | sed \"s|$basedomain||g\" | sort | uniq"
			shift
			;;
		-x) basedomain="http://$(echo $2 | cut -d/ -f3)/"
			lastcmd="grep -v \"^$basedomain\" | sort | uniq"
			shift
			;;
		*) echo "$0: unknown option specified: $1" >&2
			exit 1
	esac
else
	lastcmd="sort | uniq"
fi

lynx -dump "$1" | \
	sed -n '/^References$/,$p' | \
	grep -E '[[:digit:]]+\.' | \
	awk '{print $2}' | \
	cut -d\? -f1 | \
	eval $lastcmd

exit 0
