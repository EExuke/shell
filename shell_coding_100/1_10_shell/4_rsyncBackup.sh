 ############################################################################# ##
 # Copyright (C) 2001-2020 Inhand Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : 4_rsyncBackup.sh
 #     FILE DESCRIPTION         : Linux shell script file
 #     FIRST CREATION DATE      : 2020/07/06
 # --------------------------------------------------------------------------
 #     Version                  : 1.0
 #     Last Change              : 2020/07/06
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
#使用 rsync 备份数据
#-----------------------------------------------------------
#                  MAIN PROCESS
#-----------------------------------------------------------
# 备份日期
DATE=`date + "%F-%H-%M"`
# 备份程序域名
Backup_Domain="www.abc.com"
# 备份数据目录
Need_Backup=(/usr/local/apache-tomcat-6.0.44    /www/www.abc.com    /home/scripts
/var/spool/cron /etc/rc.d/rc.local /etc/mtab /etc/hosts)
# 系统IP地址
IP_addr=`/sbin/ifconfig | awk '/inet addr:/&&/Bcast:192.168/ {split($2,a,":"); print a[2]}'`
# 数据存放的目录名称
Backup_Dir=${Backup_Domain}_${IP_addr}
# 新建备份目录
mkdir /opt/${Backup_Dir}
# 删除之前的备份文件，节省磁盘空间
rm -f /opt/${Backup_Dir}/*
cd /opt
# 备份数据文件并压缩
for i in ${Need_Backup[*]}
do
	i_name=`echo $i|awk -F "[/]" '{print $NF}'`
	tar cjvf ./${Backup_Dir}/${Backup_Domain}_${i_name}_${DATE}.ta.bz2 --exclude=*.log.*
	--exclude="*rootlog" --exclude="*catalina.out" --exclude=*.log --exclude
	=*.tar.* $i
done
# 把备份的目录压缩成一个文件
tar cjvf ${Backup_Dir}_${DATE}_all.tar.bz2 ${Backup_Dir}
# 把备份的文件通过rsynx传到备份机192.168.1.1上
rsync    -azP    ${Backup_Dir}_${DATE}_all.tar.bz2    rsync@192.168.1.1::backup_day
--password-file=/etc/rsyncd_backup.secrets > /tmp/backup.log 2>&1
# 提取数据文件大小和文件传输的大小
SEND_SIZE=`cat /tmp/backup.log | awk '/total size is/ {print $4}'`
FILE_SIZE=`ls -l ${Backup_Dir}_${DATE}_all.tar.bz2 | awk '{print $5}'`
# 判断传输是否准确，如果准确将本地文件进行删除
if [[ ${SEND_SIZE} -eq ${FILE_SIZE} ]]
then
	rm -f /opt/${Backup_Dir}/*
	rm -f /opt/${Backup_Dir}_${DATE}_all.tar.bz2
fi


