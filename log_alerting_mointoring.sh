#!/bin/bash
#
#
###################
#Author: vishnu
#Date: 12/05/2025
#
#To monitor log files and send alerts
#
#Version:v1
#####################

#!/bin/bash

LOG_FILE="/var/log/syslog"
SEARCH_PATTERN="ERROR|FAILED"
ALERT_EMAIL="somerandom184@gmail.com"

# Check for errors in the log file
if grep -qE "$SEARCH_PATTERN" "$LOG_FILE"; then
  ERROR_COUNT=$(grep -cE "$SEARCH_PATTERN" "$LOG_FILE")
  SUBJECT="[ALERT] Errors found in $LOG_FILE"
  BODY="Found $ERROR_COUNT occurrences of '$SEARCH_PATTERN' in $LOG_FILE."
  echo "$BODY" | mail -s "$SUBJECT" "$ALERT_EMAIL"
  echo "Alert email sent to $ALERT_EMAIL"
fi
