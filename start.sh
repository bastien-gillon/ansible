#!/bin/bash

echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1

if [ $? -eq 0 ]; then 
    
    dpkg -s git # check git a faire 
    dpkg -s ansible #check ansible a faire

    if [ nogit ]; then 
        pacman -Sy git --noconfirm
    else if  [ noansible ]; then
        pacman -Sy git --noconfirm
    fi

    ansible-playbook playbook.yml

else
    echo "Offline : please make sure that you have a internet connection"
fi