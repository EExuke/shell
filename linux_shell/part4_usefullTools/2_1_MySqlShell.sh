 ############################################################################# ##
 # Copyright (C) 2010-2011 Cameo Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : 2_1_MySqlShell.sh
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
#                  脚本控制MySql
#-----------------------------------------------------------
# 1 send a command to the MySQL server
MYSQL=$(which mysql)

$MYSQL mytest -u test -e 'select * from employees'
#
############################################################
# 2 sending multiple commands to MySQL, 指定EOF为结束符,不能有缩进
MYSQL=$(which mysql)

$MYSQL mytest -u test << EOF
show tables;
select * from employees where salary > 20000;
EOF
#
############################################################
# 3 send data to the table in the MySQL database
MYSQL=$(which mysql)

if [ $# -ne 4 ]
then
	echo "Usage: mtest3 empid lastname firstname salary"
else
	statement="INSERT INTO employees VALUES ($1, '$2', '$3', $4)"
	$MYSQL mytest -u test << EOF
	$statement
EOF
	if [ $? -eq 0 ]
	then
		echo Data successfully added
	else
		echo Problem adding data
	fi
fi
#
#############################################################
# 4 redirecting SQL output to a variable
MYSQL=$(which mysql)

# -B mysql程序工作在批处理模式
# -s (silent)选项用于禁止输出列标题和格式化符号
dbs=$($MYSQL mytest -u test -Bse 'show databases')
for db in $dbs
do
	echo $db
done
#
#############################################################
# 5 use XML by '-X'
mysql mytest -u test -X -e 'select * from employees where salary > 20000'
#
#############################################################
