#!/bin/bash

white_layout='\033[107m';
red_layout="\033[101m";
green_layout="\033[102m";
blue_layout="\033[104m";
purple_layout="\033[105m";
black_layout="\033[40m";

white="\033[97m";
red="\033[91m";
green="\033[92m";
blue="\033[94m";
purple="\033[95m";
black="\033[30m";

par_1="";
par_2="";
par_3="";
par_4="";

color_name_1=""
color_name_2=""
color_name_3=""
color_name_4=""

defualt=0;

file_path="setting.txt"
if [ ! -f "$file_path" ]; 
then
	echo "File dont exist"
	exit 1
fi

par__1=$(cat $file_path | awk '/column1_background=/{printf substr($1, length($1), 1)}');
par__2=$(cat $file_path | awk '/column1_font_color=/{printf substr($1, length($1), 1)}');
par__3=$(cat $file_path | awk '/column2_background=/{printf substr($1, length($1), 1)}');
par__4=$(cat $file_path | awk '/column2_font_color=/{printf substr($1, length($1), 1)}');



if [[ $par__1 =~ ^[1-6]$ && $par__2 =~ ^[1-6]$ && $par__3 =~ ^[1-6]$ && $par__4 =~ ^[1-6]$ ]]
then
    if [[ $par__1 -eq $par__2 || $par__3 -eq $par__4 ]]
    then
       defualt=1
        par__1=1
        par__2=5
        par__3=1
        par__4=6
     fi
else
       defualt=1
        par__1=1
        par__2=5
        par__3=1
        par__4=6
fi




if [[ $par__1 = "1" ]]
then
	par_1="$white_layout";
        color_name_1="white"
elif [[ $par__1 = "2" ]]
then 
	par_1="$red_layout"
        color_name_1="red"
elif [[ $par__1 = "3" ]]
then 
	par_1="$green_layout";
        color_name_1="green"
elif [[ $par__1 = "4" ]]
then	
	par_1="$blue_layout"
        color_name_1="blue"
elif [[ $par__1 = "5" ]]
then 
	par_1="$purple_layout"
        color_name_1="purple"
else
	par_1="$black_layout";
        color_name_1="black"
fi

if [[ $par__3 = "1" ]]
then
        par_3="$white_layout";
        color_name_3="white"
elif [[ $par__3  = "2" ]]
then
        par_3="$red_layout"
        color_name_3="red"
elif [[ $par__3  = "3" ]]
then
        par_3="$green_layout";
        color_name_3="green"
elif [[ $par__3  = "4" ]]
then
        par_3="$blue_layout"
        color_name_3="blue"
elif [[ $par__3  = "5" ]]
then
        par_3="$purple_layout"
        color_name_3="purple"
else
        par_3="$black_layout";
        color_name_3="black"
fi


if [[ $par__2  = "1" ]]
then
        par_2="$white";
        color_name_2="white"
elif [[ $par__2  = "2" ]]
then
        par_2="$red"
        color_name_2="red"
elif [[ $par__2  = "3" ]]
then
        par_2="$green";
        color_name_2="green"
elif [[ $par__2  = "4" ]]
then
        par_2="$blue"
        color_name_2="blue"
elif [[ $par__2  = "5" ]]
then
        par_2="$purple"
        color_name_2="purple"
else
        par_2="$black";
        color_name_2="black"
fi

if [[ $par__4  = "1" ]]
then
        par_4="$white";
        color_name_4="white"
elif [[ $par__4  = "2" ]]
then
        par_4="$red"
        color_name_4="red"
elif [[ $par__4  = "3" ]]
then
        par_4="$green";
        color_name_4="green"
elif [[ $par__4  = "4" ]]
then
        par_4="$blue"
        color_name_4="blue"
elif [[ $par__4  = "5" ]]
then
        par_4="$purple"
        color_name_4="purple"
elif [[ $par__4  = "6" ]]
then
        par_4="$black";
        color_name_4="black"
fi


timezone=$(timedatectl | awk '/Time zone:/{print $3 $4 $5 }');
os=$(lsb_release -d | awk '/Description:/{print $2, $3, $4 }');
date=$(date | awk '{print $3, $2, $6, $4}');
uptime=$(uptime | awk '{print $3}');
uptime_sec=$(cat /proc/uptime | awk '{print $1}');
ip=$(ifconfig | awk '/inet/{printf $2; exit}');
mask=$(ifconfig | awk '/netmask/{printf $4; exit}');
gateway=$(ip route | awk '/via/{printf $3; exit}');
ram_total=$(free -h | awk '/^Mem:/ {printf "%.3f GB", $2/1024}');
ram_used=$(free -h | awk '/^Mem:/ {printf "%.3f GB", $3/1024}');
ram_free=$(free -h | awk '/^Mem:/ {printf "%.3f GB", $4/1024}');
s_r=$(df / | awk 'NR==2  {printf "%.3f MB", $2/1024; exit}');
s_r_u=$(df / | awk 'NR==2  {printf "%.3f MB", $3/1024; exit}');
s_r_f=$(df / | awk 'NR==2  {printf "%.3f MB", $4/1024; exit}');
echo -e "${par_1}${par_2}HOSTNAME =${par_3}${par_4} ${HOSTNAME}";
echo -e "${par_1}${par_2}TIMEZONE =${par_3}${par_4} $timezone";
echo -e "${par_1}${par_2}USER =${par_3}${par_4} $USER";
echo -e "${par_1}${par_2}OS =${par_3}${par_4} $os";
echo -e "${par_1}${par_2}DATE =${par_3}${par_4} $date";
echo -e "${par_1}${par_2}UPTIME =${par_3}${par_4} $uptime";
echo -e "${par_1}${par_2}UPTIME_SEC =${par_3}${par_4} $uptime_sec";
echo -e "${par_1}${par_2}IP =${par_3}${par_4} $ip";
echo -e "${par_1}${par_2}MASK =${par_3}${par_4} $mask";
echo -e "${par_1}${par_2}GATEWAY =${par_3}${par_4} $gateway";
echo -e "${par_1}${par_2}RAM_TOTAL =${par_3}${par_4} $ram_total";
echo -e "${par_1}${par_2}RAM_USED =${par_3}${par_4} $ram_used";
echo -e "${par_1}${par_2}RAM_FREE =${par_3}${par_4} $ram_free";
echo -e "${par_1}${par_2}SPACE_ROOT =${par_3}${par_4} $s_r";
echo -e "${par_1}${par_2}SPACE_ROOT_USED =${par_3}${par_4} $s_r_u";
echo -e "${par_1}${par_2}SPACE_ROOT_FREE =${par_3}${par_4} $s_r_f${black_layout}${white}";	

echo ""

if [[ $defualt -eq 1 && $par__1  -eq 1 && $par__2  -eq 5 && $par__3 -eq 1 && $par__4 -eq 6 ]]
then 
        echo "Column 1 background = default (black)"
 echo "Column 1 font color = default (white)"
 echo "Column 2 background = default (red)"
 echo "Column 2 font color = default (blue)"

else 
echo "Column 1 background = $par__1 ($color_name_1)"
 echo "Column 1 font color = $par__2 ($color_name_2)"
 echo "Column 2 background = $par__3 ($color_name_3)"
 echo "Column 2 font color = $par__4 ($color_name_4)"
fi