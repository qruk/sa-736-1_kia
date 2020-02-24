#!/bin/bash

echo "||--< Checker of file premissions >--||"
echo "Program that can display user's premissions of file"
echo "Developer: I.A. Kruchkov"

while true
do
        echo "Current dicectory: $PWD"
        while true
        do
                read -rp "-| Enter file name: " file
                if test -f "$file"
                then
                        break
                else
                        echo "-| err |- File does not exist." >&2
                        read -p "-| Wanna retry? Y/[N] " answer
                        if [[ "$answer" == "Y" ||  "$answer" == "y" ]]
                        then
                                continue
                        else
                                echo "...closing program..."
                                exit 6
                        fi
                fi
        done
        read -p "-| User name: " nickname
        if id "$nickname" > /dev/null 2>&1
        then
                if sudo -u "$nickname" test -r "$file"; then echo1="read"; else echo1="none"; fi
                if sudo -u "$nickname" test -w "$file"; then echo2="write"; else echo2="none"; fi
                if sudo -u "$nickname" test -x "$file"; then echo3="execute"; else echo3="none"; fi
                echo "-| Premissions: $echo1/$echo2/$echo3"
        else
                echo "-| User not found." >&2
        fi

        read -p "-| Wanna continue? [Y]/N " answer
        if [[ "$answer" == "N" || "$answer" == "n" ]]; then exit 66; fi
done
