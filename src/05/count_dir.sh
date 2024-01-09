#!/bin/bash


dir_count=$(find "$1" -type d 2>/dev/null| grep -c "")
echo "Total number of folders (including all nested ones) = $dir_count"

top_B=$(du -h "$1" 2>/dev/null | sort -rh | head -n 5)

echo "TOP 5 folders of maximum size arranged in descending order (path and size):"



count_tmp=1
while IFS= read -r line; do
    size=$(echo "$line" | awk '{print $1}')
    folder=$(echo "$line" | awk '{$1=""; print $0}') 
    unit=$(echo "$size" | sed 's/[^A-Z]*//g') 
    size=$(echo "$size" | sed 's/[^0-9.]*//g') 
    printf "%d - %s, %.1f %sB\n" "$count_tmp" "$folder" "$size" "$unit"

    count_tmp=$((count+1))
done <<< "$top_B"


total_file_count=$(find "$1" -type f 2>/dev/null| grep -c "")
echo "Total number of files = $total_file_count"

echo "Number of:"
conf_file_count=$(find "$1" -type f -name "*.conf" 2>/dev/null | grep -c "")
echo "Configuration files (with the .conf extension) = $conf_file_count"

txt_file_count=$(find "$1" -type f -name "*.txt" 2>/dev/null | grep -c "")
echo "Text files = $txt_file_count"

exe_file_count=$(find "$1" -type f -executable 2>/dev/null | grep -c "")
echo "Executable files = $exe_file_count"

log_file_count=$(find "$1" -type f -name "*.log" 2>/dev/null | grep -c "")
echo "Log files (with the extension .log) = $log_file_count"

archive_file_count=$(find "$1" -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.gz" \) 2>/dev/null | grep -c "")
echo "Archive files = $archive_file_count"

symlink_count=$(find "$1" -type l 2>/dev/null | grep -c "")
echo "Symbolic links = $symlink_count"

top_files=$(find "$1" -type f -exec du -h {} + 2>/dev/null | sort -rh | head -n 10)

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"


count_tmp=1
while IFS= read -r line; do
    size=$(echo "$line" | awk '{print $1}')
    folder=$(echo "$line" | awk '{$1=""; print $0}')  
    unit=$(echo "$size" | sed 's/[^A-Z]*//g')  
    size=$(echo "$size" | sed 's/[^0-9.]*//g')  
    ext=$(basename "$folder" | awk -F. '{print $NF}')
  
    printf "%d - %s, %.1f %sB, %s\n" "$count_tmp" "$folder" "$size" "$unit" "$ext"

    count_tmp=$((count_tmp+1))
done <<< "$top_files"

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"

count_tmp=1

top_ex=$(find $1 -type f -executable -exec du -h --apparent-size {} + 2>/dev/null | sort -rh | head -n 10 | awk '{cmd="md5sum "$2; cmd | getline hash; close(cmd); printf "%s %s %s\n", $2, $1, hash}')

while IFS= read -r line; do
    folder=$(echo "$line" | awk '{print $1}') 
    size=$(echo "$line" | awk '{print $2}')
    
    unit=$(echo "$size" | sed 's/[^A-Z]*//g')
    size=$(echo "$size" | sed 's/[^0-9.]//g') 
    ext=$(echo "$line" |  awk '{print $3}')
    printf "%d - %s, %s %sB, %s\n" "$count_tmp" "$folder" "$size" "$unit" "$ext"

    count_tmp=$((count_tmp+1))
done <<< "$top_ex"




