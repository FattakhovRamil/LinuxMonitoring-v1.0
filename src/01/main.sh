#!/bin/bash

if [ $# -eq 1 ]
then
        if [[ $1 =~ ^[0-9]+$ ]]
        then
                echo "Parameters is not correct" ; exit 1;
        else
                echo $1
        fi
else
        echo "No parameters found or more 1 "; exit 1;
fi
