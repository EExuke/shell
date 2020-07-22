 ############################################################################# ##
 # Copyright (C) 2001-2020 Inhand Networks, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : 9_zbbixAgent.sh
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
#脚本自动安装 zbbix-agent
#-----------------------------------------------------------
#                  MAIN PROCESS
#-----------------------------------------------------------
cd /opt
groupadd zabbix -g 201
useradd -g zabbix -u 201 -m zabbix
tar -zxf zabbix-2.2.2.tar.gz

cd zabbix-2.2.2
./configure --prefix=/usr/local/zabbix --sysconfdir=/etc/zabbix --enable-agent
make
make install
mkdir /var/log/zabbix
chown zabbix.zabbix /var/log/zabbix
cp misc/init.d/fedora/core/zabbix_agentd /etc/init.d/

chmod 755 /etc/init.d/zabbix_agentd
cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bak
cd /etc/zabbix/ && rm -f zabbix_agentd.conf
cp /opt/zabbix_agentd.conf .

/bin/sed -i s/temp_hostname/`/bin/hostname`/g /etc/zabbix/zabbix_agentd.conf
/bin/sed -i "s#BASEDIR=/usr/local#BASEDIR=/usr/local/zabbix#g"

/etc/init.d/zabbix_agentd
chkconfig zabbix_agentd on
service zabbix_agentd restart

