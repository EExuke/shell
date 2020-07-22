 ############################################################################# ##
 # Copyright (C) 2001-2020 Inhand Networks, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : findCanmand.sh
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
#find 命令大全
#-----------------------------------------------------------
#                  MAIN PROCESS
#-----------------------------------------------------------
#find . {-atime/-ctime/-mtime/-amin/-cmin/-mmin} [-/+]num
#atime:访问时间(access time),指的是文件最后被读取的时间,可以使用 touch 命令更改为当前时间;
#ctime:变更时间(change time),指的是文件本身最后被变更的时间,变更动作可以使 chmod、chgrp、mv 等等;
#mtime:修改时间(modify time),指的是文件内容最后被修改的时间,修改动作可以使echo 重定向、vi 等等;
#第一个参数,.,代表当前目录,如果是其他目录,可以输入绝对目录和相对目录位置;
#第二个参数分两部分,前面字母 a、c、m 分别代表访问、变更、修改,后面 time 为日期,min 为分钟,注意只能以这两个作为单位;
#第三个参数为量,其中不带符号表示符合该数量的,带-表示符合该数量以后的,带+表示符合该数量以前的。

#找/data 目录下一小时之前文件删除
find /data -mmin +60 -exec rm -f {} \;
#在当前目录下查找以 april 开始的文件
find -name april*
#在当前目录下查找以 april 开始的文件,并把结果输出到 file 中
find -name april* fprint file
#查找以 ap 或 may 开头的文件
find -name ap* -o -name may*#在/mnt 下查找名称为 tom.txt 且文件系统类型为 vfat 的文件
find /mnt -name tom.txt -ftype vfat
#在/mnt 下查找名称为 tom.txt 且文件系统类型不为 vfat 的文件
find /mnt -name t.txt ! -ftype vfat
#在/tmp 下查找名为 wa 开头且类型为符号链接的文件
find /tmp -name wa* -type l
#在/home 下查最近两天内改动过的文件
find /home -mtime -2
#查 1 天之内被存取过的文件
find /home -atime -1
#在/home 下查 60 分钟前改动过的文件
find /home -mmin +60
#查最近 30 分钟前被存取过的文件
find /home -amin +30
#在/home 下查更新时间比 tmp.txt 近的文件或目录
find /home -newer tmp.txt
#在/home 下查存取时间比 tmp.txt 近的文件或目录
find /home -anewer tmp.txt
#列出文件或目录被改动过之后,在 2 日内被存取过的文件或目录
find /home -used -2
#列出/home 目录内属于用户 cnscn 的文件或目录
find /home -user cnscn#列出/home 目录内用户的识别码大于 501 的文件或目录
find /home -uid +501
#列出/home 内组为 cnscn 的文件或目录
find /home -group cnscn
#列出/home 内组 id 为 501 的文件或目录
find /home -gid 501
#列出/home 内不属于本地用户的文件或目录
find /home -nouser
#列出/home 内不属于本地组的文件或目录
find /home -nogroup
#列出/home 内的 tmp.txt 查时深度最多为 3 层
find /home -name tmp.txt -maxdepth 4
#从第 2 层开始查
find /home -name tmp.txt -mindepth 3
#查找大小为 0 的文件或空目录
find /home -empty
#查大于 512k 的文件
find /home -size +512k
#查小于 512k 的文件
find /home -size -512k
#查硬连接数大于 2 的文件或目录
find /home -links +2
#查权限为 700 的文件或目录find /home -perm 0700
#查/tmp 的 tmp.txt 并查看
find /tmp -name tmp.txt -exec cat {} \;
#查/tmp 的 tmp.txt 并删除
find /tmp -name tmp.txt -ok rm {} \;
# 查找在系统中最后 10 分钟访问的文件
find / -amin -10
# 查找在系统中最后 48 小时访问的文件
find / -atime -2
# 查找在系统中为空的文件或者文件夹
find / -empty
# 查找在系统中属于 groupcat 的文件
find / -group cat
# 查找在系统中最后 5 分钟里修改过的文件
find / -mmin -5
#查找在系统中最后 24 小时里修改过的文件
find / -mtime -1
#查找在系统中属于作废用户的文件
find / -nouser
#查找在系统中属于 FRED 这个用户的文件
find / -user fred
#查当前目录下的所有普通文件find . -type f -exec ls -l {} \;
##在/logs 目录中查找更改时间在 5 日以前的文件并删除它们:
find logs -type f -mtime +5 -exec -ok rm {} \;
##匹配字符串,找出存在字符串文件
find /data -name "*.php" -type f -print0|xargs -0 egrep
"(phpspy|c99sh|milw0rm|eval\(base64_decode|spider_bc)"|awk -F: '{print $1}'|sort|uniq
find /data -name "*.php" -type f -print0|xargs -0 egrep "aaa"|awk -F: '{print $1}'|sort|uniq
find . -name "*.php" -type f -print0| xargs -0 egrep "aaa|bbb"| egrep "aaa"
##cd /var/cache/yum 找*.rpm 移动到一个文件夹
find . -name "*.rpm" -exec cp {} /root/111 \;
##找到*.log 日志全部删除
find . -name *.log | xargs rm
find . -name *.rpm | xargs rm
find /data/file1 -name .svn -print0 | xargs -0 rm -r -f
find /data/file1 -name .git -print0 | xargs -0 rm -r -f
#删除 5 天之前的日志
find /data/nginx/log/ -ctime +5 -exec rm -f {} \;
find /data/logs -ctime +5 -exec rm -f {} \;
find /data/logs -name "localhost_access_log*.txt" -type f -mtime +5 -print -exec rm -f {} \;
find /data/zookeeper/logs -name "log.*" -type f -mtime +5 -print -exec rm -f {} \;
##删除目录下所有的 .svn 隐藏子目录
find . -name .svn -print0 | xargs -0 rm -r -ffind /data/file1 -name .svn -print0 | xargs -0 rm -r -f
find /data/file1 -name .git -print0 | xargs -0 rm -r -f
find . -name .svn -print0 | xargs -0 rm -r -f
find . -name .git -print0 | xargs -0 rm -r -f
