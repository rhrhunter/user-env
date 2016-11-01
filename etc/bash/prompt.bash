#!/bin/bash

# Color variables
GRAY="\[\033[1;30m\]"
BLACK="\[\033[0;30m\]"
BLUE="\[\033[0;34m\]"
LIGHT_BLUE="\[\033[1;34m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[1;36m\]"
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
PURPLE="\[\033[0;35m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
BROWN="\[\033[0;33m\]"
YELLOW="\[\033[1;33m\]"
LIGHT_GRAY="\[\033[0;37m\]"
WHITE="\[\033[1;37m\]"
NORMAL="\[\033[0m\]"
INPUT_COLOR=$NORMAL

# Encapslate setting the prompt in a function. Every function ends
# with term_title_set since PS1 also controls the terminal title.

function prompt.baroque
{
    local TIME_COLOR=$LIGHT_RED         # color for time display
    local DATE_COLOR=$YELLOW            # color for date display
    local USER_COLOR=$CYAN                # color for user name
    local HOST_COLOR=$GREEN              # color for host name
    local WDIR_COLOR=$WHITE             # color for working directory

    local PARN_COLOR=$RED               # color for outside of parenthesis
    local TYPING_COLOR=$INPUT_COLOR     # color of user input

    local po="$PARN_COLOR["
    local pc="$PARN_COLOR]"

    USER_HOST="$USER_COLOR\u$LIGHT_GRAY@$HOST_COLOR\h"
    DATE_TIME="$TIME_COLOR\$(date +%I:%M%P) $DATE_COLOR\$(date +%m/%d/%y)"

    LINE1="$po$USER_HOST $DATE_TIME$pc"
    LINE2="$po$WDIR_COLOR\w$pc"

    PS1="\n$LINE1 $LINE2 $TYPING_COLOR"
}

# Encapslate setting the prompt in a function.

function prompt.simple
{
    local USER_COLOR=$CYAN               # color for user name
    local HOST_COLOR=$GREEN              # color for host name

    local PARN_COLOR=$RED                # color for outside of parenthesis
    local TYPING_COLOR=$INPUT_COLOR      # color of user input

    local po="$PARN_COLOR["
    local pc="$PARN_COLOR]"
    local pr="$PARN_COLOR>"

    local USER_HOST="$USER_COLOR\u$LIGHT_GRAY@$HOST_COLOR\h"

    local LINE="$po$USER_HOST $pr"

    PS1="$LINE $TYPING_COLOR"
}

# Encapslate setting the prompt in a function.

function prompt.showdir
{
    local USER_COLOR=$CYAN              # color for user name
    local HOST_COLOR=$GREEN             # color for host name
    local WDIR_COLOR=$WHITE             # color for working directory

    local PARN_COLOR=$RED               # color for outside of parenthesis
    local TYPING_COLOR=$INPUT_COLOR     # color of user input

    local po="$PARN_COLOR["
    local pc="$PARN_COLOR]"
    local pr="$PARN_COLOR>"

    USER_HOST="$USER_COLOR\u$LIGHT_GRAY@$HOST_COLOR\h"

    LINE="$po$USER_HOST $WDIR_COLOR\w $pr"

    PS1="$LINE $TYPING_COLOR"
}

# Encapslate setting the prompt in a function.

function prompt.gray
{
    local USER_COLOR=$LIGHT_GRAY        # color for user name
    local HOST_COLOR=$GRAY              # color for host name
    local WDIR_COLOR=$LIGHT_GRAY        # color for working directory

    local PARN_COLOR=$WHITE             # color for outside of parenthesis
    local TYPING_COLOR=$INPUT_COLOR     # color of user input

    local po="$PARN_COLOR["
    local pc="$PARN_COLOR]"
    local pr="$PARN_COLOR>"

    USER_HOST="$USER_COLOR\u$LIGHT_GRAY@$HOST_COLOR\h"

    LINE="$po$USER_HOST $WDIR_COLOR\w $pr"

    PS1="$LINE $TYPING_COLOR"
}

# Encapslate setting the prompt in a function.

function prompt.nocolor
{
    local TYPING_COLOR=$NORMAL           # color of user input

    local po="$PARN_COLOR["
    local pc="$PARN_COLOR]"
    local pr="$PARN_COLOR>"

    USER_HOST="$USER_COLOR\u@$HOST_COLOR\h"

    LINE="$po$USER_HOST $WDIR_COLOR\w $pr"

    PS1="$LINE $TYPING_COLOR"
}

# Encapslate setting the prompt in a function.

function prompt.anonymous
{
    local TYPING_COLOR=$NORMAL           # color of user input

    PS1="> $TYPING_COLOR"
}

function prompt.gitdir {
    local USER_COLOR=$CYAN              # color for user name
    local HOST_COLOR=$GREEN             # color for host name
    local WDIR_COLOR=$WHITE             # color for working directory

    local PARN_COLOR=$RED               # color for outside of parenthesis
    local TYPING_COLOR=$INPUT_COLOR     # color of user input

    local po="$PARN_COLOR["
    local pr="$PARN_COLOR>"
    local gitbranch='$(parse_git_branch)';
    local purple=$(tput setaf 5)
    local reset=$(tput sgr0)
    
    USER_HOST="$USER_COLOR\u$LIGHT_GRAY@$HOST_COLOR\h"

    LINE="$po$USER_HOST $WDIR_COLOR\w \[$purple\]$gitbranch\[$reset\]$pr"
    PS1="$LINE $TYPING_COLOR"
}

# prompt selection
prompt.gitdir
