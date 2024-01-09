#!/bin/bash

file_name=$(date +'%d_%m_%y_%H_%M_%S'.status);
touch $file_name;
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
echo "HOSTNAME = $HOSTNAME" >> $file_name;
echo "TIMEZONE = $timezone";
echo "TIMEZONE = $timezone" >> $file_name;
echo "USER = $USER";
echo "USER = $USER" >> $file_name;
echo "OS = $os";
echo "OS = $os" >> $file_name;
echo "DATE = $date";
echo "DATE = $date" >> $file_name;
echo "UPTIME = $uptime";
echo "UPTIME = $uptime" >> $file_name;
echo "UPTIME_SEC = $uptime_sec";
echo "UPTIME_SEC = $uptime_sec" >> $file_name;
echo "IP = $ip";
echo "IP = $ip" >> $file_name;
echo "MASK = $mask";
echo "MASK = $mask" >> $file_name;
echo "GATEWAY = $gateway";
echo "GATEWAY = $gateway" >> $file_name;
echo "RAM_TOTAL = $ram_total";
echo "RAM_TOTAL = $ram_total" >> $file_name;
echo "RAM_USED = $ram_used";
echo "RAM_USED = $ram_used" >> $file_name;
echo "RAM_FREE = $ram_free";
echo "RAM_FREE = $ram_free" >> $file_name;
echo "SPACE_ROOT = $s_r";
echo "SPACE_ROOT = $s_r" >> $file_name;
echo "SPACE_ROOT_USED = $s_r_u";
echo "SPACE_ROOT_USED = $s_r_u" >> $file_name;
echo "SPACE_ROOT_FREE = $s_r_f";
echo "SPACE_ROOT_FREE = $s_r_f" >> $file_name;

echo "Write data to file? (Y/N)?"
read ansver;
if [[ "$ansver" != "y" && "$ansver" != "Y" ]]
then
        rm $file_name
fi