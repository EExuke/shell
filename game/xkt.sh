 ############################################################################# ##
 # Copyright (C) 2010-2011 Cameo Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : xkt.sh
 #     FILE DESCRIPTION         : Linux shell script file
 #     FIRST CREATION DATE      : 2019/10/29
 # --------------------------------------------------------------------------
 #     Version                  : 1.0
 #     Last Change              : 2019/10/29
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
# 菜单
clear
echo    "欢迎来到虚空台，凡人，这里你可以得到匹敌世界的财富，拥有灭星的力量，只要...你能活下去"
read
mainmenu()                             #返回
{
	echo ' =========================================== '
	echo '  **              1.虚空斗场             **  '
	echo '  **              2.落日神殿             **  '
	echo '  **              3.殷红梦境             **  '
	echo '  **              4.离开此界             **  '
	echo " =========================================== "
	read -p "选择吧，你要传送去的地方: " num
	options=( 虚空斗场 落日神殿  殷红梦境  离开此界 )
	case $num in
		1)
			submenu
			;;
		2)
			cqyx
			;;
		3)
			nswc
			;;
		4)
			exit
			;;
		*)
			echo "输入错误："  ;;
	esac
	mainmenu
}
submenu(){
	#!/bin/bash
	echo "这里是虚空的竞技场，来自万界的强者们汇聚于此，败者化为枯骨，胜者将分享虚空的宝物"
	read
	echo "本次比赛将由虚空之树公证"
	echo "虚空之树公证中......"
	read
	echo "根据以下提示信息，选择您要压注的角色"
	game=(虚空剑豪 青莲剑歌 祖龙 恒星撕裂者 虫族二等 没有人！)
	num=$[RANDOM%6]
	computer=${game[$num]}
	echo "q.虚空剑豪"
	echo "w.青莲剑歌"
	echo "e.祖龙"
	echo "r.恒星撕裂者"
	echo "t.虫族二等" 
	echo "y.离开虚空竞技场"
	read  -p  "请选择 q w e r t 所代表的五位强者之一 ,或者作为一个懦夫，选择y，离开这里"  person
	echo "一场惨烈的战斗！获胜者是:$computer"
	case  $person  in
		q)
			if [ $num -eq 5 ];then
				echo "来自虚空的五位强者同归于尽了，真是爆冷阿！"
				mainmenu
			elif [ $num -eq 0 ];then
				echo "见鬼，你压注的强者胜利，根据契约，你得到高等虚空生物核心X1"
				mainmenu
			else
				echo "你压注的强者已经变成了渣渣！凡人，作为代价，献出你的灵魂吧！"
				mainmenu
			fi;;
		w)
			if [ $num -eq 1 ];then
				echo "来自虚空的五位强者同归于尽了，真是爆冷阿"
			elif [ $num -eq 2 ];then
				echo "见鬼，你压注的强者胜利，根据契约，你得到龙渊剑X1！"
			else
				echo "你压注的强者已经变成了渣渣！凡人，作为代价，献出你的灵魂吧！"
				mainmenu
			fi;;
		e)
			if [ $num -eq 5 ];then
				echo "来自虚空的五位强者同归于尽了，真是爆冷阿！"
			elif [ $num -eq 2 ];then
				echo "见鬼，你压注的强者胜利，根据契约，你得到龙牙+龙魂+龙之力！"
			else
				echo "你压注的强者已经变成了渣渣！凡人，作为代价，献出你的灵魂吧！"
				mainmenu
			fi;;
		r)
			if [ $num -eq 5 ];then
				echo "来自虚空的五位强者同归于尽了，真是爆冷阿！"
			elif [ $num -eq 3 ];then
				echo "见鬼，你压注的强者胜利，根据契约，你得到行星泯灭炮X1！"
			else
				echo "你压注的强者已经变成了渣渣！凡人，作为代价，献出你的灵魂吧！"
				mainmenu
			fi;;
		t)
			if [ $num -eq 5 ];then
				echo "来自虚空的五位强者同归于尽了，真是爆冷阿！"
			elif [ $num -eq 4 ];then
				echo "见鬼，你压注的强者胜利，根据契约，你得到虫母矿场15235地契x3！"
			else
				echo "你压注的强者已经变成了渣渣！凡人，作为代价，献出你的灵魂吧！"
				mainmenu
			fi;;
		y)
			echo "请重新选择游戏："     
			mainmenu
			;;

		*)
			echo "你必须选择这五位强者中的一员！                ——来自魔鬼撒阿的警告"
			mainmenu
	esac
}

cqyx()
{
	game=(太阳之力 海洋之力 雷霆之力 逃离落日神殿)
	num=$[RANDOM%3]
	computer=${game[$num]}
	echo "落日神殿最后的守护者者拥有太阳之力，海洋之力和雷霆之力"
	echo "你必须使用和它相同的力量"
	echo "否则..."
	read
	echo "落日降临，守卫者苏醒了！选择你的力量，在还来得及的时候"
	echo "a.太阳之力"
	echo "b.海洋之力"
	echo "c.雷霆之力" 
	echo "d.逃离落日神殿"
	read  -p  "将篆刻有 a b c d 的符文石放入祭台！ :"  person
	case  $person  in
		a)
			echo "这位的守护者者拥有的力量是：$computer"
			if [ $num -eq 0 ];then
				echo "你击碎了守护者，获得了落日神殿所有的黄金！"
				mainmenu
			else
				echo "你的力量耗尽，成为了落日神殿诸多的石像之一..."
				mainmenu
			fi;;
		b)
			echo "这位守护者拥有的力量是：$computer"
			if [ $num -eq 1 ];then
				echo "你击碎了守护者，获得了落日神殿所有的黄金！"
				mainmenu
			else
				echo "你的力量耗尽，成为了落日神殿诸多的石像之一..."
				mainmenu
			fi;;
		c)
			echo "这位守护者拥有的力量是：$computer"
			if [ $num -eq 2 ];then
				echo "你击碎了守护者，获得了落日神殿所有的黄金！"
				mainmenu
			else
				echo "你的力量耗尽，成为了落日神殿诸多的石像之一..."
				mainmenu
			fi;;
		d)
			echo "返回虚空台"     
			mainmenu
			;;
		*)
			echo "必须输入a-d !!!"
			mainmenu
	esac
}
nswc(){
	#殷红梦境
	#RANDOM 为系统自带的随机数:0-32767
	echo "殷红梦境的主宰,是血恶魔，一个喜欢游戏的恐怖恶魔，没有任何手段可以战胜他，只有与他进行游戏，并获得胜利，才可能离开..."
	echo "殷红梦境分为50层，血恶魔会夺取每一个进入者的心脏，将它藏在任意一层，现在，在时间限制内，找到你的心脏"
	echo "否则..."
	read
	num=$[ RANDOM%50+1 ]
	while :
	do
		read -p "嘿嘿嘿...猜猜看，你的心脏...在哪里？！：" cai
		if [ $cai  -eq  $num  ];then
			echo "你的心脏的确在这一层，和它埋在一起的，还有50枚珍贵的洛南斯文明古代金币"
			mainmenu
		elif [ $cai -gt $num  ];then
			echo "你的心脏并不在这里，根据感应，它在更深沉的地方！"
		else
			echo "你的心脏并不在这里，根据感应，它在更高远的地方！"
		fi
	done
}
mainmenu

