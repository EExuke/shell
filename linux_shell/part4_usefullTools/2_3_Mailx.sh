 ############################################################################# ##
 # Copyright (C) 2010-2011 Cameo Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : 2_3_Mailx.sh
 #     FILE DESCRIPTION         : Linux shell script file
 #     FIRST CREATION DATE      : 2020/04/02
 # --------------------------------------------------------------------------
 #     Version                  : 1.0
 #     Last Change              : 2020/04/02
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
#           使用mailutils通过shell发送email
#-----------------------------------------------------------
# Mailx程序发送消息的命令行的格式为:
# mail [-eIinv] [-a header] [-b addr] [-c addr] [-s subj] to-addr
#
# mailing the answer to a factorial
MALL=$(which mailx)

factorial=1
counter=1

read -p "Enter the number: " value
while [ $counter -le $value ]
do
	factorial=$[ $factorial * $counter ]
	counter=$[ $counter + 1 ]
done

echo The factorial of $value is $factorial | $MALL -s "Factorial answer" $USER
echo "The result has been mailed to you."
#
#############################################################
# file meassage
# sending the current disk statistics in an e-mail message
date=$(date +%m/%d/%Y)
MALL=$(which mailx)
TEMP=$(mktemp tmp.XXXX)

df -k > $TEMP
cat $TEMP | $MALL -s "Disk stats for $date" $1
rm -rf $TEMP
#
#############################################################
