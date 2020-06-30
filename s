#!/bin/bash
# Commonly used scripts

RED='\033[0;31m'
LIGHT_BLUE='\033[1;34m'
NC='\033[0m' # No color

ERROR="${RED}Incorrect inputs. Try again."

if [ -z "$*" ]; then
	echo -e "$ERROR"
	exit 1


# Compress images at 70% quality
elif [[ $1 == c && -z "$3" ]]; then
	mogrify -quality 70 $2
# Compress images at custom quality
elif [[ $1 == c && ! -z "$3" ]]; then
	mogrify -quality $2 $3


else
	echo -e "$ERROR"
	exit 1
fi
