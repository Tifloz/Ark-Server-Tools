#!/bin/bash
i=5
cd /home/arkserver/Scripts/
./rcon "broadcast AUTOMATIC MESSAGE: The server will be going laggy for save in 15 minutes."
echo "Premier avertissement : $(date +%R)"
sleep 5m
./rcon "broadcast AUTOMATIC MESSAGE: The server will be going laggy for save in 10 minutes."
echo "Deuxieme avertissement : $(date +%R)"
sleep 5m
./rcon "broadcast AUTOMATIC MESSAGE: The server will be going laggy for save in 5 minutes."
echo "Troisieme avertissement : $(date +%R)"
sleep 4m
./rcon "broadcast AUTOMATIC MESSAGE: The server will be going laggy for save in 60 seconds."
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
