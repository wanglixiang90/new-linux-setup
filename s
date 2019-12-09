#!/bin/bash
# Commonly used scripts

RED='\033[0;31m'
LIGHT_BLUE='\033[1;34m'
NC='\033[0m' # No color

ERROR="${RED}Incorrect inputs. Try again."

if [ -z "$*" ]; then
	echo -e "$ERROR"
	exit 1
fi

if [[ $1 == some ]]; then

else
	echo -e "$ERROR"
	exit 1
fi
