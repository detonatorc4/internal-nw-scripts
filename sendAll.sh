#!/bin/bash

# IPs
HOSTS=(
    "10.33.170.155" 
    "10.33.162.66" 
    "10.33.163.79" 
    "10.33.164.117" 
    "10.33.156.64" 
    # "10.33.161.76" 
    "10.33.159.58" 
    "10.33.152.61"
    "10.33.166.71" 
    "10.33.155.52" 
    "10.33.153.67"
    "10.33.165.47" 
    "10.33.158.49" 
    "10.33.160.58" 
    "10.33.167.183" 
    "10.33.154.67"
    "10.33.157.64" 
    "10.33.169.11" 
    #"10.33.168.199" 
)

# targetUser
USER="user"
PASSWORD="Cloud@123$"

# targetDest
DEST="/home/user/"

FILE="$1"

# sendFile

for HOST in "${HOSTS[@]}"; do
    echo "Sending $USER@$HOST:$DEST"

#    scp "$FILE" "$USER@$HOST:$DEST"

	sshpass -p "$PASSWORD" scp -o StrictHostKeyChecking=no "$FILE" "$USER@$HOST:$DEST"

    if [ $? -eq 0 ]; then

        echo "Success $HOST"
    else
        echo "Fail $HOST"
    fi
done

echo "Script Exit"
