#!/bin/bash

echo "Setuid files by user: "
find / -type f \
       -executable \
       -perm -4000 \
       -exec stat --format="%A %U %n" {} + 2>/dev/null |
    sort -k 2,3 |
    while read perms username filename; do
        if [ "$olduser" != "$username" ]; then
            echo "================"
            echo "Owner: $username"
            echo "================"
        fi
        echo $perms $filename
        olduser=$username
    done
