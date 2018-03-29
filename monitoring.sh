#!/bin/bash
cd /home/arkserver/Scripts/
su - arkserver -c '/home/arkserver/arkserver monitor'
./rcon "ListPlayers" > /var/www/html/index.html
