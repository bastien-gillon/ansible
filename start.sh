#!/bin/bash

echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1

if [ $? -eq 0 ]; then 
   
    pacman -Sy git --noconfirm
    pacman -Sy ansible --noconfirm

    ansible-playbook playbook.yml
    ansible-playbook -i vyos.example.net, -u ansible -k -e ansible_network_os=vyos first_playbook.yml

else
    echo "Offline : please make sure that you have a internet connection"
fi