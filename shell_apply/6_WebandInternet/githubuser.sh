 ############################################################################# ##
 # Copyright (C) 2001-2020 Inhand Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : githubuser.sh
 #     FILE DESCRIPTION         : Linux shell script FILE
 #                              : 根据指定的Github用户名，获取用户信息
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
if [[ $# -ne 1 ]]; then
	echo "Usage: $0 <username>"
	exit 1
fi

# -s 选项可以禁止curl正常的详细信息输出
curl -s "https://api.github.com/users/$1" | \
	# -F 指定分隔符为 “
	awk -F'"' '
		/\"name\":/{
			print $4" is the name of the Github user"
		}
		/\"followers\":/{
			split($3, a, " ")
			sub(/,/, "", a[2])
			print "They have "a[2]" followers."
		}
		/\"following\":/{
			split($3, a, " ")
			sub(/,/, "", a[2])
			print "They have following "a[2]" other user."
		}
		/\"created_at\":/{
			print "Their account was created on "$4"."
		}
		'
exit 0

