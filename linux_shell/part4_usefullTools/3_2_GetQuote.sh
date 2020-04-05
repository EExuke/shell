 ############################################################################# ##
 # Copyright (C) 2010-2011 Cameo Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : 3_2_GetQuote.sh
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
#                  获取每日格言
#-----------------------------------------------------------
# Script Variables
quote_url=www.quotationspage.com/qotd.html
# Check url validity
check_url=$(wget -nv --spider $quote_url 2>&1)

if [[ $check_url == *error404* ]]
then
	echo "Bad web address"
	echo "$quote_url invalid"
	echo "Exiting script..."
	exit
fi

# Download Web Site's Information
wget -o /tmp/quote.log -O /tmp/quote.html $quote_url

# Extract the Desired Data
sed 's/<[^>]*//g' /tmp/quote.html |
grep "Today's Quotes" -A4 |
sed 's/>//g' |
sed '/&nbsp;/{n ; d}' |
gawk 'BEGIN{FS="&nbsp;"} {print $1}' |
tee /tmp/daily_quote.txt > /dev/null

exit
#
##############################################################

