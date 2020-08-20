#!/bin/bash
# Commonly used scripts

RED='\033[0;31m'
LIGHT_BLUE='\033[1;34m'
NC='\033[0m' # No color
ERROR="${RED}Incorrect inputs. Try again."

# Identity files

# SSH logins

HELP_MSG="
c:			Compress images at 70% quality
c -quality 50 file:	Compress images at custom quality
g:			Git stash and pull/push - current directory
"

if [ -z "$*" ]; then
	echo "$HELP_MSG"
	exit 1
fi

# Help message
if [[ $1 == -h ]]; then
	echo "$HELP_MSG"

# Compress images at 70% quality
elif [[ $1 == c && -z "$3" ]]; then
	mogrify -quality 70 $2
	
# Compress images at custom quality
elif [[ $1 == c && ! -z "$3" ]]; then
	mogrify -quality $2 $3
	
# Git stash and pull/push - current directory
elif [[ $1 == g ]]; then
	git stash && git pull && git push && git stash pop

else
	echo -e "$ERROR"
	exit 1
fi
