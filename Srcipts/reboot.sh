#!/bin/bash
cd /home/arkserver/Scripts/
./rcon "broadcast AUTOMATIC MESSAGE: The server will be going off for reboot in 15 minutes."
echo "Premier avertissement : $(date +%R)"
sleep 5m
./rcon "broadcast AUTOMATIC MESSAGE: The server will be going off for reboot in 10 minutes."
echo "Deuxieme avertissement : $(date +%R)"
sleep 5m
./rcon "broadcast AUTOMATIC MESSAGE: The server will be going off for reboot in 5 minutes."
echo "Troisieme avertissement : $(date +%R)"
sleep 4m
./rcon "broadcast AUTOMATIC MESSAGE: The server will be going off for reboot in 60 seconds."
echo "Quatrieme avertissement : $(date +%R)"
sleep 55
while [ $i -ge 0 ]
do
    echo "Decompte : "$i;
    ./rcon "broadcast AUTOMATIC MESSAGE: The server will be going laggy for save in "$i" seconds."
    let "i--"
    sleep 1
done
./rcon "saveworld"
echo "Sauvegarde en cours : $(date +%R)"
echo "Sauvegarde en cours : $(date +%R)" >> log
sleep 2m
let "i = i + 10"
while [ $i -ge 0 ]
do
    echo "Decompte : "$i;
    ./rcon "broadcast AUTOMATIC MESSAGE: The server will be going off for reboot in "$i" seconds. Please disconnect to avoid character corruption"
    let "i--"
    sleep 1
done
echo "Backup en cours : $(date +%R)"
echo "Backup en cours : $(date +%R)" >> log
su - arkserver -c '/home/arkserver/arkserver stop'
su - arkserver -c '/home/arkserver/arkserver backup'
echo "Reboot en cours : $(date +%R)"
echo "Reboot en cours : $(date +%R)" >> log
/sbin/shutdown -r now
