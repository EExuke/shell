 ############################################################################# ##
 # Copyright (C) 2010-2011 Cameo Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : 1_1_BackUp.sh
 #     FILE DESCRIPTION         : Daily_Archive - Archive destinated files & dir
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
#                  归档备份
#-----------------------------------------------------------
# Gather Current Date
DATE=$(date +%y%m%d)
#
# set File Name
FILE=archive$DATE.tar.gz
#
# set Configuration and Destination File
CONFIG_FILE=./Files_To_Backup
DESCRIPTION=./$FILE
#
################# Main Script ##############################
#
# Check Backup Config file exists
if [ -f $CONFIG_FILE ]
then
	echo 
else
	echo
	echo "$CONFIG_FILE does not exist."
	echo "Backup bot completed due to missing Configuration File"
	echo
	exit
fi
#
# Build the names of all the files to backup
FILE_NO=1                # Start on Line 1 of Config File.
exec < $CONFIG_FILE      # Redirect Std Input to Config File of name
#
read FILE_NAME           # Read 1st record
#
# Create list of files to backup.
while [ $? -eq 0 ]
do
	# Make sure the file or dir exists.
	if [ -f $FILE_NAME -o -d $FILE_NAME ]
	then
		# add name to the list
		FILE_LIST="$FILE_LIST $FILE_NAME"
	else
		echo
		echo "$FILE_NAME, does not exist."
		echo "Obviously, I will not include it in tihs archive."
		echo "It is listed on line $FILE_NO of the config file"
		echo "Continuing to build archive list..."
		echo
	fi

	FILE_NO=$[$FILE_NO + 1]    # next index
	read FILE_NAME             # read next line in CONFIG_FILE
done
#
#-------------------------------------------------------------
# Backup the files and Compress Archive
echo "Starting archive..."
echo
#
tar -zcf $DESCRIPTION $FILE_LIST 2> /dev/null
#
echo "Archive completed"
echo "Resulting archive file is: $DESCRIPTION"
echo
#
exit
##############################################################

