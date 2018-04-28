#!/bin/bash

# readme: add your custom aliases in this file

# listing files in color
if [ "$TERM" != "dumb" ]; then
    # try to do a color listing
    if ls --color=always >& /dev/null; then

        # Configure it with dircolors, using sed to remove "Unknown
        # colorls variable `su'." error on unix machines.
	
        ls_colors=`dircolors -b`;

	eval "$ls_colors";
        if [ `uname` = "Linux" ]
	then
	    alias ls="ls -F --color=always"
	fi
    fi
fi

# convenience 
alias cd.="cd ."
alias cd..="cd .."
alias ll="ls -l"
alias be_root="sudo su - root";

# docker-ish aliases
alias drun="docker run"
alias dbuild="docker build"
alias k="kubectl"

