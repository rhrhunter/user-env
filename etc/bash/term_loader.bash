#!/bin/bash

# @file term_loader.bash

# This script should be run with the first command-line argument set
# to the directory where this script is located. This is necessary to
# correctly locate the other scripts that must be loaded.

# To run this, add the following line to ~/.bash_login

# . <loader directory path>/term_loader.bash <loader directory path>

# Every other bash envrionment script is loaded from here. With this
# loader, we need only move this directory into a new users directory
# and add one line to enable the environment changes (see instructions
# above).

DIR=$1

# Script Loader
function do_load
{
    local script_path=$1;
    local script_desc=$2;

    local abs_path="$DIR/$script_path";

    . "$abs_path" ;
}

# support functions
do_load "dirlist.bash" "Directory list operations"
do_load "path.bash" "PATH Management"
do_load "libpath.bash" "LD_LIBRARY_PATH Management"
do_load "prompt.bash" "Command prompt"
do_load "alias.bash" "Standard aliases"

# prompt selection
prompt.showdir

# Useful environment variables

# Don't put duplicate lines in the history. See bash(1) for more
# options
export HISTCONTROL=ignoredups

# -use less for reading man pages
export PAGER="less -r"

# make sure we are running a good shell
export SHELL="/bin/bash"

# Prevent logout on Ctrl-D
set -o ignoreeof

# Set the TERM to xterm
export TERM=xterm

# sane people use this editor
export EDITOR="emacs"

# give LS colors
export LS_COLORS="no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:"
