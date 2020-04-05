 ############################################################################# ##
 # Copyright (C) 2010-2011 Cameo Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : 3_1_TermiMesg.sh
 #     FILE DESCRIPTION         : Linux shell script file
 #     FIRST CREATION DATE      : 2020/04/04
 # --------------------------------------------------------------------------
 #     Version                  : 1.0
 #     Last Change              : 2020/04/04
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
#               向本服务器其他终端用户发送消息
#-----------------------------------------------------------
# 开启mesg功能: mesg y
# 格式：write username ttyN
#-----------------------------------------------------------
# 实例
# Save the username parameter
muser=$1

# Determine if user is logged on:
logged_on=$(who | grep -i -m 1 $muser | gawk '{print $1}')
# 判断是否为空
if [ -z $logged_on ]
then
	echo "$muser is not logged on."
	echo "Exiting script..."
	exit
fi

# Determine if user allows messaging:
allowed=$(who -T | grep -i -m 1 $muser | gawk '{print $2}')
# 判断是否允许接受
if [ $allowed != "+" ]
then
	echo "$muser does not allowing messaging."
	echo "Exiting script..."
	exit
fi

# Determine if a message was included:
if [ -z $2 ]
then
	echo "No message parameter included."
	echo "Exiting script..."
	exit
fi

# Send message to user:
uterminal=$(who | grep -i -m 1 $muser | gawk '{print $2}')
# 参数形式发送简单消息
#echo $2 | write $logged_on $uterminal

# 发送长消息，用shift移动参数发送
shift

while [ -n "$1" ]
do
	whole_message=$whole_message' '$1
	shift
done

echo $whole_message | write $logged_on $uterminal

exit
#
############################################################


