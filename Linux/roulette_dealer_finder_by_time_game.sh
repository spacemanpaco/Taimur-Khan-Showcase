#!/bin/bash

cat $1_Dealer_schedule | grep $2 | awk '{print '$3' '$4' '$5' '$6' '$7' '$8'}' 
