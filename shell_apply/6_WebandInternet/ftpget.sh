 ############################################################################# ##
 # Copyright (C) 2001-2020 Inhand Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : ftpget.sh
 #     FILE DESCRIPTION         : Linux shell script file
 #                              : 解析ftp形式的URL并尝试通过匿名ftp下载文件
 #     FIRST CREATION DATE      : 2020/06/02
 # --------------------------------------------------------------------------
 #     Version                  : 1.0
 #     Last Change              : 2020/06/02
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
anonpass="$LOGNAME@$(hostname)"

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 ftp://..." >&2
	exit 1
fi

# 典型的URL：ftp://ftp.ncftp.com/unixstuff/q2getty.tar.gz
if [ "$(echo $1 | cut -c1-6)" != "ftp://" ]; then
	echo "$0 Malformed url. I need it to start with ftp://" >&2
	exit 1
fi

server="$(echo $1 | cut -d/ -f3)"
filename="$(echo $1 | cut -d/ -f4-)"
basefile="$(basename $filename)"

echo ${0}: Downloading $basefile from server $server

ftp -np << EOF
open $server
user ftp $anonpass
get "$filename" "$basefile"
quit
EOF

if [[ $? -eq 0 ]]; then
	ls -l $basefile
fi

exit 0
