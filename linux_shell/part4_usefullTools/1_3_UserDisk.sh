 ############################################################################# ##
 # Copyright (C) 2010-2011 Cameo Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : 1_3_UserDisk.sh
 #     FILE DESCRIPTION         : Linux shell script file
 #     FIRST CREATION DATE      : 2020/04/01
 # --------------------------------------------------------------------------
 #     Version                  : 1.0
 #     Last Change              : 2020/04/01
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
#                  监视用户磁盘占用情况
#-----------------------------------------------------------
# Big_Users - Find big disk space users in various directories
##############################################################
# Directories to check
CHECK_DIRECTORIES=" /var/log /home"
#
################# Main Script ################################
DATE=$(date '+%m%d%y')             # Date for report file

exec > disk_space_$DATE.rpt        # Make report file STDOUT

echo "Top Ten Disk Space Usage"    # Report header
echo "for $CHECK_DIRECTORIES Directories"

# Loop to du directories
for DIR_CHECK in $CHECK_DIRECTORIES
do
	echo
	echo "The $DIR_CHECK Directory:"    # Directory header
	# Create a listing of top ten disk space users in this dir
	du -S $DIR_CHECK -h 2>/dev/null |
	sort -rn |
	sed '{11, $D; =}' |
	sed 'N; s/\n/ /' |
	gawk '{printf $1 ":" "\t" $2 "\t" $3 "\n"}'
done

exec 1>&2        # recover to STDOUT
echo "Create report success!"
exit
#
###############################################################

