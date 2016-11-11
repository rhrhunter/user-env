#!/bin/bash

# Color variables
#GRAY="\[\033[1;30m\]"
GRAY_RAW=$(tput setaf 7)
GRAY="\[$GRAY_RAW\]"

#BLACK="\[\033[0;30m\]"
BLACK_RAW=$(tput setaf 0)
BLACK="\[$BLACK_RAW\]"

#BLUE="\[\033[0;34m\]"
BLUE_RAW=$(tput setaf 4)
BLUE="\[$BLUE_RAW\]"

LIGHT_BLUE="\[\033[1;34m\]"

#CYAN="\[\033[0;36m\]"
CYAN_RAW=$(tput setaf 6)
CYAN="\[$CYAN_RAW\]"

LIGHT_CYAN="\[\033[1;36m\]"

#RED="\[\033[0;31m\]"
RED_RAW=$(tput setaf 1)
RED="\[$RED_RAW\]"

LIGHT_RED="\[\033[1;31m\]"

#GREEN="\[\033[0;32m\]"
GREEN_RAW=$(tput setaf 2)
GREEN="\[$GREEN_RAW\]"

LIGHT_GREEN="\[\033[1;32m\]"

#PURPLE="\[\033[0;35m\]"
PURPLE_RAW=$(tput setaf 5)
PURPLE="\[$PURPLE_RAW\]"

LIGHT_PURPLE="\[\033[1;35m\]"

#BROWN="\[\033[0;33m\]"
BROWN_RAW=$(tput setaf 3)
BROWN="\[$BROWN_RAW\]"

YELLOW="\[\033[1;33m\]"

#LIGHT_GRAY="\[\033[0;37m\]"
LIGHT_GRAY_RAW=$(tput setaf 7)
LIGHT_GRAY="\[$LIGHT_GRAY_RAW\]"

#WHITE="\[\033[1;37m\]"
WHITE_RAW=$(tput setaf 7)
WHITE="\[$WHITE_RAW\]"

RESET_RAW=$(tput sgr0)
RESET="\[$RESET_RAW\]"

NORMAL="\[\033[0m\]"
INPUT_COLOR=$NORMAL

function prompt.baroque {
    local TIME_COLOR=$LIGHT_RED
    local DATE_COLOR=$YELLOW
    local USER_COLOR=$CYAN
    local HOST_COLOR=$GREEN
    local WDIR_COLOR=$WHITE

    local PARN_COLOR=$RED
    local TYPING_COLOR=$INPUT_COLOR

    local po="$PARN_COLOR[$RESET"
    local pc="$PARN_COLOR]$RESET"

    USER_HOST="$USER_COLOR\u$RESET$LIGHT_GRAY@$RESET$HOST_COLOR\h$RESET"
    DATE_TIME="$TIME_COLOR\$(date +%I:%M%P)$RESET $DATE_COLOR\$(date +%m/%d/%y)$RESET"

    LINE1="$po$USER_HOST $DATE_TIME$pc"
    LINE2="$po$WDIR_COLOR\w$RESET$pc"

    PS1="\n$LINE1 $LINE2 $TYPING_COLOR"
}

function prompt.simple {
    local USER_COLOR=$CYAN
    local HOST_COLOR=$GREEN

    local PARN_COLOR=$RED
    local TYPING_COLOR=$INPUT_COLOR

    local po="$PARN_COLOR[$RESET"
    local pc="$PARN_COLOR]$RESET"
    local pr="$PARN_COLOR>$RESET"

    local USER_HOST="$USER_COLOR\u$RESET$LIGHT_GRAY@$RESET$HOST_COLOR\h$RESET"

    local LINE="$po$USER_HOST $pr"

    PS1="$LINE $TYPING_COLOR"
}

function prompt.showdir {
    local USER_COLOR=$CYAN
    local HOST_COLOR=$GREEN
    local WDIR_COLOR=$WHITE

    local PARN_COLOR=$RED
    local TYPING_COLOR=$INPUT_COLOR

    local po="$PARN_COLOR[$RESET"
    local pc="$PARN_COLOR]$RESET"
    local pr="$PARN_COLOR>$RESET"

    USER_HOST="$USER_COLOR\u$RESET$LIGHT_GRAY@$RESET$HOST_COLOR\h$RESET"

    LINE="$po$USER_HOST $WDIR_COLOR\w$RESET $pr"

    PS1="$LINE $TYPING_COLOR"
}

function prompt.gray {
    local USER_COLOR=$LIGHT_GRAY
    local HOST_COLOR=$GRAY      
    local WDIR_COLOR=$LIGHT_GRAY

    local PARN_COLOR=$WHITE     
    local TYPING_COLOR=$INPUT_COLOR

    local po="$PARN_COLOR[$RESET"
    local pc="$PARN_COLOR]$RESET"
    local pr="$PARN_COLOR>$RESET"

    USER_HOST="$USER_COLOR\u$RESET$LIGHT_GRAY@$RESET$HOST_COLOR\h$RESET"

    LINE="$po$USER_HOST $WDIR_COLOR\w$RESET $pr"

    PS1="$LINE $TYPING_COLOR"
}

function prompt.nocolor {
    local TYPING_COLOR=$NORMAL

    local po="$PARN_COLOR[$RESET"
    local pc="$PARN_COLOR]$RESET"
    local pr="$PARN_COLOR>$RESET"

    USER_HOST="$USER_COLOR\u$RESET@$HOST_COLOR\h$RESET"

    LINE="$po$USER_HOST $WDIR_COLOR\w$RESET $pr"

    PS1="$LINE $TYPING_COLOR"
}

function prompt.anonymous
{
    local TYPING_COLOR=$NORMAL

    PS1="> $TYPING_COLOR"
}

function prompt.gitdir {
    local USER_COLOR=$CYAN
    local HOST_COLOR=$GREEN
    local WDIR_COLOR=$WHITE

    local PARN_COLOR=$RED
    local TYPING_COLOR=$INPUT_COLOR

    local po="$PARN_COLOR[$RESET"
    local pr="$PARN_COLOR>$RESET"
    local gitbranch='$(parse_git_branch)';
    
    USER_HOST="$USER_COLOR\u$RESET$LIGHT_GRAY@$RESET$HOST_COLOR\h$RESET"

    LINE="$po$USER_HOST $WDIR_COLOR\w$RESET $PURPLE$gitbranch$RESET$pr"
    PS1="$LINE $TYPING_COLOR"
}

# prompt selection
prompt.gitdir
