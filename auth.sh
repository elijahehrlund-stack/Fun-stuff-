#!/bin/bash


echo $(sqlite3 mydatabase.db "SELECT authen FROM auth WHERE id = 1 LIMIT 1;")


while true; do
echo "Please enter auth code for login. If you want to login choose [continue (c)],[stop (s)]"
    read -r -p "Do you want to proceed? [continue/stop] "  cs
    case $cs in
        [continue]* ) echo " Setting up auth login, please wait...";;
        [stop]* ) echo "Exiting auth login..."; exit;;
        * ) echo "Please answer yes (c) or no (s).";;
    esac
     

    read -r -p " Please enter auth code. " MY_VALUE
DB_FILE="mydatabase.db"

ROW_ID=2
    
ROW_ELEMENTS=$(sqlite3 -separator $'\n' "$DB_FILE" "SELECT * FROM auth WHERE id = $ROW_ID=2;")


        if echo "$ROW_ELEMENTS" | grep -Fxq "$MY_VALUE"; then
    echo "Auth complete, welcome in!" break 
        else 
        echo "Code incorrect, try again..." 
    fi
done