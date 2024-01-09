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



if [ $# -eq 4 ]
then
        if [[ $1 =~ ^[1-6]$ && $2 =~ ^[1-6]$ && $3 =~ ^[1-6]$ && $4 =~ ^[1-6]$ ]]
        then
                if [[ $1 -eq $2 || $3 -eq $4 ]]
                then
                        echo "Parameters 1 and 2 or 3 and 4 are the same. Run the script again."; exit 1;
                fi
        else
                  echo "Parameters is not correct" ; exit 1
        fi
else
        echo "No parameters found or more 1 "; exit 1;
fi

if [[ $1 -eq 1 ]]
then
        par_1="$white_layout";
elif [[ $1 -eq 2 ]]
then
        par_1="$red_layout"
elif [[ $1 -eq 3 ]]
then
        par_1="$green_layout";
elif [[ $1 -eq 4 ]]
then
        par_1="$blue_layout"
elif [[ $1 -eq 5 ]]
then
        par_1="$purple_layout"
else
        par_1="$black_layout";
fi

if [[ $3 -eq 1 ]]
then
        par_3="$white_layout";
elif [[ $3 -eq 2 ]]
then
        par_3="$red_layout"
elif [[ $3 -eq 3 ]]
then
        par_3="$green_layout";
elif [[ $3 -eq 4 ]]
then
        par_3="$blue_layout"
elif [[ $3 -eq 5 ]]
then
        par_3="$purple_layout"
else
        par_3="$black_layout";
fi


if [[ $2 -eq 1 ]]
then
        par_2="$white";
elif [[ $2 -eq 2 ]]
then
        par_2="$red"
elif [[ $2 -eq 3 ]]
then
        par_2="$green";
elif [[ $2 -eq 4 ]]
then
        par_2="$blue"
elif [[ $2 -eq 5 ]]
then
        par_2="$purple"
else
        par_2="$black";
fi

if [[ $4 -eq 1 ]]
then
        par_4="$white";
elif [[ $4 -eq 2 ]]
then
        par_4="$red"
elif [[ $4 -eq 3 ]]
then
        par_4="$green";
elif [[ $4 -eq 4 ]]
then
        par_4="$blue"
elif [[ $4 -eq 5 ]]
then
        par_4="$purple"
else
        par_4="$black";
fi


timezone=$(timedatectl | awk '/Time zone:/{print $3 $4 $5 }');
os=$(lsb_release -d | awk '/Description:/{print $2, $3, $4 }');
date=$(date | awk '{print $3, $2, $6, $4}');
uptime=$(uptime | awk '{print $3}');
uptime_sec=$(cat /proc/uptime | awk '{print $1}');
ip=$(ifconfig | awk '/inet/{printf $2; exit}');
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