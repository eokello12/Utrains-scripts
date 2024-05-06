#!/bin/bash

#Author: Emmanuel
#Date: May 5 2025
#Description: Script to clean up docker images and containers

echo -e "\nLet us start by clearing up all the containiners we haver first...\n"
sleep 3
docker rm -f $(docker ps -a -q) > /dev/null 2>&1
if 
    [ $? -ne 0 ]

then
    echo -e "\nVerify your docker remove command\n"

else
    echo -e "\nAll the containers have been cleared form the system\n"
fi

sleep 3

echo -e "\Now let's clear all the images we have...\n"
sleep 3
docker rmi $(docker images -q) -f > /dev/null 2>&1
if
    [ $? -ne 0 ]
then
    echo -e "\nVerify your docker remove images command\n"

else
    echo -e "\nAll the images have been cleared form the system\n"
fi
