 ############################################################################# ##
 # Copyright (C) 2001-2020 Inhand Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : scriptBC.sh
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
#                  MAIN PROCESS
#-----------------------------------------------------------
# bc的包装器，可返回计算结果
if [[ "$1" = "-p" ]]; then
	precision=$2
	shift 2
else
	precision=2    #默认精度
fi

bc -q << EOF
	scale=$precision
	$*
	quit
EOF

exit 0
