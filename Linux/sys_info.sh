#!/bin/bash

#Check if script was run as root. Exit if flase
if [ $UID -ne 0 ]
then
  echo "Please run this script with sudo."
  exit
fi

#Define Variables
output=$HOME/research/sys_info.txt
ip=$(ip addr | head -9 | tail -1)

#Check for research directory. Create it if needed.
if [ ! -d $HOME/research ]
then
 mkdir $HOME/research
fi

#Checj for output file. Clear it if needed
if [ -f $output ]
then
  rm $output
fi

#Title
echo Quick System Audit Script >> $output
date >> $output
echo "" >> $output

#Machine Type
echo "Machine Type Info:" >> $output
echo $MACHTYPE >> $output

#Uname Information
echo -e "Uname info: $(uname -a) \n" >> $output

#Machine's IP Address
echo -e "$ip \n"  >> $output

#Hostname
echo "Hostname: $(hostname -s) " >> $output

#DNS Information
echo "DNS Servers:" >> $output
cat /etc/resolv.conf >> $output

#Memory Information
echo "Memory Info:" >> $output
free >> $output

#CPU Information
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output

#Disk Usage
echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output

#Users Presently Logged on
echo -e "\nWho is logged in: \n $(who -a) \n" >> $output

#Top 10 Processes
echo -e "\nTop 10 Processes" >> $output
ps aux --sort -%mem | awk {'rpint $1, $2, $3, $4, $11'} | head >> $output
fi
