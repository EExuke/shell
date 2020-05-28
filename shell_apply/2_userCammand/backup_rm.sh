 ############################################################################# ##
 # Copyright (C) 2001-2020 Inhand Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : backup_rm.sh
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
archivedir="$HOME/.delete-files"
realrm="$(which rm)"
copy="$(which cp) -R"
if [[ $# -eq 0 ]]; then
	exec $realrm
fi

# 解析所有选项，从中查找-f选项
flags=""

while getopts "dfiPRrvW" opt
do
	case $opt in
		f ) exec $realrm "$@" ;;
		* ) flags="$flags -$opt" ;;
	esac
done
shift $(( $OPTIND - 1 ))

#----------------------------------------------------
if [[ ! -d $archivedir ]]; then
	if [[ ! -w $HOME ]]; then
		echo "$0 failed: can not create $archivedir in $HOME" >&2
		exit 1
	fi
	mkdir $archivedir
	chmod 700 $archivedir
fi

for arg
do
	newname="$archivedir/$(date "+%S.%M.%H.%d.%m").$(basename "$arg")"
	if [ -f "$arg" -o -d "$arg" ] ; then
		$copy "$arg" "$newname"
	fi
done

exec $realrm $flags "$@"
