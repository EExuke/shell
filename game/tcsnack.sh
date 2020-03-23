 ############################################################################# ##
 # Copyright (C) 2010-2011 Cameo Communications, Inc.
 ############################################################################ ##
 #
 # -------------------------------------------------------------------------- --
 #     AUTHOR                   : EExuke
 #     FILE NAME                : tcsnack.sh
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
#下面是游戏界面的宽和高
# the width
with=42
# the height
height=22
#这个是游戏运行区域
# area
area=(
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 9
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 9
)

#bool
false=0
true=1

#贪吃蛇的一些信息
#snake info
head=47
tail=45
originPos=(45 46 47)
snakeBody=2
snakeFood=3
curPos=(${originPos[*]})

#game logic val
speed=0.2
foodPos=50
left=2
right=-2
up=3
down=-3
moveDirection=$right
eat=$true

#game info
side=$$
main=$!

#这个是开始时的界面
#start show interface
function startShowInterface()
{
	seconds=$1
	printf "\e[1;42m"
	printf "******************************************\n"
	for ((i=0; i<10; i++))
	do
		printf "*                                        *\n"
	done
	printf "*******\e[1;31msnake start after: $seconds seconds\e[0m\e[1;42m*******\n"
	for ((i=0; i<10; i++))
	do
		printf "*                                        *\n"
	done
	printf "******************************************\n"
	printf "\e[0m"
}


#start show 
function startShow()
{
	seconds=1;
	while [[ $seconds -gt -1 ]];
	do
		clear;
		startShowInterface $seconds;
		sleep 1;
		let seconds--;
	done
}
startShow;

#这个是游戏显示界面
# game main inteface
function gameMainInterface
{
	clear;
	pos=0
	echo -e "\e[1;42m"
	for data in ${area[@]};
	do

		case $data in
			[9])
				printf "\n"
				;;
			[1])
				printf "#"
				;;
			[0])
				printf " "
				;;
			[$snakeBody])
				printf "\e[1;31m"
				if [[ $pos = $head ]]; then
					printf "@"
				else
					printf "*"
				fi
				printf "\e[0m\e[1;42m"
				;;
			[$snakeFood])
				printf "\e[1;34m&\e[0m\e[1;42m"
				;;
		esac
		let pos++
	done
	echo -e "\e[0m"
}

#initinal snake body and pos
function initSnake()
{
	for data in ${originPos[@]};
	do
		area[$data]=$snakeBody
	done
}
initSnake;

#绘制贪吃蛇
#draw snake
function drawSnake()
{
	for data in ${originPos[@]};
	do
		area[$data]=0
	done
	for data in ${curPos[@]};
	do
		area[$data]=$snakeBody
	done
}
​
#随机生成食物位置
#generate food
function generateFood()
{
	if [[ $eat = $false ]]; then
		return
	fi
done=$false
	while [[ $done = $false ]];
	do
		newFoodPos=$(( RANDOM%$(( $(( $with-1 ))*$(( $height-1 )) )) ))
		[[ ${area[$newFoodPos]} = 0 ]] && area[$foodPos]=0 && foodPos=$newFoodPos && (( 
		area[$foodPos]=$snakeFood )) && done=$true && eat=$false
	done
}
#贪吃蛇移动的算法，用的一维数组，我也就这样来实现了
#move
function snakeMove()
{
	originPos=(${curPos[*]})
	length=${#curPos[*]}
	head=${curPos[$(( $length-1 ))]}
	case $moveDirection in
		$left)
			let head--
			[[ $(( $(( $head-2 ))%$with )) -eq 0 ]] && kill -35 $side
			;;
		$right)
			let head++
			[[ $(( $head%$with )) -eq 0 ]] && kill -35 $side
			;;
		$up)
			let head=head-with
			let head--
			[[ $head -lt $with ]] && kill -35 $side
			;;
		$down)
			let head=head+with
			let head++
			[[ $head -gt $(( $with*$(( $height-1 )) )) ]] && kill -35 $side
			;;
	esac
	if [[ $head -eq $foodPos ]];    then
		curPos[length]=$head
		eat=$true
	else
		for ((i=0; i<$((length-1)); i++));
		do
			curPos[i]=${curPos[$((i+1))]}
		done
		curPos[$((length-1))]=$head
	fi

}
#游戏运行的进程，游戏主逻辑都在这里了
#main interface
function mainInterface
{
	trap "moveDirection=$left" 36
	trap "moveDirection=$right" 37
	trap "moveDirection=$up" 38
	trap "moveDirection=$down" 39
	run=$true
	while [[ $run -eq $true ]];
	do
		generateFood;
		snakeMove;
		drawSnake;
		clear;
		gameMainInterface;
		sleep $speed
	done
}
mainInterface &
main=$!
​
# move snake
function moveDirectionUpdate()
{
	if [[ $(( $1+$2 )) -eq 0 || $1 -eq $2 ]];then   
		return;
	fi
	case $2 in
		$left)
			kill -36 $main
			;;
		$right)
			kill -37 $main
			;;
		$up)
			kill -38 $main
			;;
		$down)
			kill -39 $main
			;;
	esac
}
​
#监听上下左右键的输入
#watch input
function watchInput()
{
	curDirection=$left
	preDirection=$curDirection
	while :;
	do
		read -s -n 1 op;
		[[ $op = "q" ]] && kill -9 $! && return;
		[[ $op = "A" ]] && preDirection=$curDirection && curDirection=$up && moveDirectionUpdate $preDirection $curDirection;
		[[ $op = "B" ]] && preDirection=$curDirection && curDirection=$down && moveDirectionUpdate $preDirection $curDirection;
		[[ $op = "C" ]] && preDirection=$curDirection && curDirection=$right && moveDirectionUpdate $preDirection $curDirection;
		[[ $op = "D" ]] && preDirection=$curDirection && curDirection=$left && moveDirectionUpdate $preDirection $curDirection;

	done
}
watchInput;
#game over
function gameOver()
{
	kill -9 $main
	echo "game over."
}
trap "gameOver" 35

