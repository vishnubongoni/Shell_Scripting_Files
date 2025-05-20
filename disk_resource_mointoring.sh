#!/bin/bash
#
#
##########################
#Author:Vishnu
#Date:12/05/2025
#
#To create a command-line dashboard displaying system health.
#
#Version:v1
#
##############################

echo "--- System Health Dashboard ---"
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime | awk '{print $3, $4}')"
echo ""
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "User:", $2, "%, System:", $4, "%, Idle:", $8, "%"}'
echo ""
echo "Memory Usage:"
free -h | awk 'NR==2 {print "Total:", $2, ", Used:", $3, ", Free:", $4}'
echo ""
echo "Disk Usage:"
df -h / | awk 'NR==2 {print "Total:", $2, ", Used:", $3, ", Available:", $4, ", Use%:", $5}'
