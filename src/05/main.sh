#!/bin/bash

if [ $# -eq 1 ]
then
        if [[ -d $1 ]]
        then
               #echo "Directory exist"
               start_time=$(date +%s.%N)
               ./count_dir.sh $1
               end_time=$(date +%s.%N)
               elapsed_time=$(echo "$end_time - $start_time" | bc)
               echo "Script execution time (in seconds) = $elapsed_time"
               else
               echo "Directory dont exist"; exit 1;
        fi 
else
        echo "No parameters found or more 1 "; exit 1;
fi

