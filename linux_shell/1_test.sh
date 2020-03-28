 ############################################################################# ##
 # Copyright (C) 2010-2011 Cameo Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : test1.sh
 #     FILE DESCRIPTION         : Linux shell script file
 #     FIRST CREATION DATE      : 2020/03/26
 # --------------------------------------------------------------------------
 #     Version                  : 1.0
 #     Last Change              : 2020/03/26
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
# 命令结果写入1、反引号; 2、$()
testing=`date`
echo $testing
testingp=$(date)
echo $testingp

# expr 命令处理算数运算
# ARG1 | ARG2 如果 ARG1 既不是null也不是零值,返回 ARG1 ;否则返回 ARG2
# ARG1 & ARG2 如果没有参数是null或零值,返回 ARG1 ;否则返回 0
# ARG1 < ARG2 如果 ARG1 小于 ARG2 ,返回 1 ;否则返回 0
# ARG1 <= ARG2 如果 ARG1 小于或等于 ARG2 ,返回 1 ;否则返回 0
# ARG1 = ARG2 如果 ARG1 等于 ARG2 ,返回 1 ;否则返回 0
# ARG1 != ARG2 如果 ARG1 不等于 ARG2 ,返回 1 ;否则返回 0
# ARG1 >= ARG2 如果 ARG1 大于或等于 ARG2 ,返回 1 ;否则返回 0
# ARG1 > ARG2 如果 ARG1 大于 ARG2 ,返回 1 ;否则返回 0
# ARG1 + ARG2 返回 ARG1 和 ARG2 的算术运算和
# ARG1 - ARG2 返回 ARG1 和 ARG2 的算术运算差
# ARG1 * ARG2 返回 ARG1 和 ARG2 的算术乘积
# ARG1 / ARG2 返回 ARG1 被 ARG2 除的算术商
# ARG1 % ARG2 返回 ARG1 被 ARG2 除的算术余数
# STRING : REGEXP 如果 REGEXP 匹配到了 STRING 中的某个模式,返回该模式匹配
# match STRING REGEXP 如果 REGEXP 匹配到了 STRING 中的某个模式,返回该模式匹配
# substr STRING POS LENGTH 返回起始位置为 POS (从 1 开始计数)、长度为 LENGTH 个字符的子字符串
# index STRING CHARS 返回在 STRING 中找到 CHARS 字符串的位置;否则,返回 0
# length STRING 返回字符串 STRING 的数值长度
# + TOKEN 将 TOKEN 解释成字符串,即使是个关键字
# (EXPRESSION) 返回 EXPRESSION 的值
expr 1 + 5

# expr 的改进：直接使用放括号 [ ] 处理算数表达式
var1=$[2 * 5]
echo $(var1)

# 脚本中使用bc
var2=$(echo "scale=4; 3.44 / 5" | bc)
echo The bc answer is $var2

# 退出码 使用 echo $? 查看上次命令结束的退出码
# 0 命令成功结束
# 1 一般性未知错误
# 2 不适合的shell命令
# 126 命令不可执行
# 127 没找到命令
# 128 无效的退出参数
# 128+x 与Linux信号x相关的严重错误
# 130 通过Ctrl+C终止的命令
# 255 正常范围之外的退出状态码
# 在脚本中指定退出以及退出码：
exit 5
echo can not show this line

