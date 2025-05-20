#!/bin/bash
#
#
###########################
#Author:Vishnu
#Date:12/05/2025
#
#To manage and audit user accounts on a Linux system.
#
#
#Version:v1
############################



echo "--- User Access and Audit ---"
echo "Users with shell access:"
awk -F':' '$7 != "/sbin/nologin" {print $1}' /etc/passwd

echo ""
echo "Last login for each user:"
last | awk '{print $1, $3, $4, $5}' | sort -u

echo ""
echo "Users with sudo privileges:"
grep -E '^[^#].*(ALL|%wheel)' /etc/sudoers

# Example: Identifying inactive users (based on last login - adjust timeframe)
INACTIVE_DAYS=90
echo ""
echo "Users inactive for more than $INACTIVE_DAYS days:"
while IFS=' ' read -r user tty login_date login_time _ ; do
  if [[ "$user" != "reboot" && "$user" != "" ]]; then
    last_login=$(date -d "$login_date $login_time" +%s)
    now=$(date +%s)
    diff=$(( (now - last_login) / (60*60*24) ))
    if [[ "$diff" -gt "$INACTIVE_DAYS" ]]; then
      echo "$user (last login: $login_date $login_time)"
    fi
  fi
done < <(last)
