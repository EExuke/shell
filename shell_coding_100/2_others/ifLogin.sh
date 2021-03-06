 ############################################################################# ##
 # Copyright (C) 2001-2020 Inhand Networks, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : ifLogin.sh
 #     FILE DESCRIPTION         : Linux shell script file
 #     FIRST CREATION DATE      : 2020/07/22
 # --------------------------------------------------------------------------
 #     Version                  : 1.0
 #     Last Change              : 2020/07/22
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
#每 5 秒钟来监控 zhtao 用户是否登录系统,
#如果没有登录提示“no login”
#如果登录成功返回登录时间
#-----------------------------------------------------------
#                  MAIN PROCESS
#-----------------------------------------------------------
LOGINUSER=`who | grep xuke | cut -d' ' -f1 | head -n 1`
while [[ $LOGINUSER != 'xuke' ]]; do
	echo $LOGINUSER
	sleep 5
	echo "no login"
	LOGINUSER=`who | grep xuke | cut -d' ' -f1 head -n 1`
done
echo "`who | grep xuke | head -n 1 | awk '{print $1}'` Login at `date`"
