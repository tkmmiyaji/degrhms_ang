#!/bin/bash 
#     Copyright (C) 2016 Takamitsu Miyaji (tkmmiyaji@gmail.com)
#     Distribiuted under:
#     GNU GENERAL PUBLIC LICENSE  Version 3, 29 June 2007
#     This program comes with ABSOLUTELY NO WARRANTY.
#     See the terms of aforementioned license.

if [[ $1 == "-h" || $# -lt 4 ]]; then
    echo "Usage:   $0 ra1 dec1 ra2 dec2"
    echo " where the coordinates  can be either in decimal degrees"
    echo " or in the HH:MM:SS.S DD:MM:SS.S format."
    echo ""
    cat `which $0` | head -7 | tail -6
    exit 
fi
#    
angle `degrhms $1 $2 | awk '{print $1" "$2}'` \
	`degrhms $3 $4 | awk '{print $1" "$2}'` | head -2 | tail -1    

