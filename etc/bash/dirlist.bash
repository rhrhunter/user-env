#!/bin/bash

# Takes a list of ':' separated directories and appends the specified
# directory if it is not already in the list.

function dirlist.safe_append
{
    local dir_path="$1";
    local dir_list="$2";

    #local list_dirs=`echo $dir_list | ~/.user_env/bin/sed -e 's/:/ /g'`;
    local list_dirs=`echo $dir_list | sed -e 's/:/ /g'`;
    for dir in $list_dirs
    do
	if [ "$dir" = "$dir_path" ]
	then
	    echo $dir_list; # Directory already in list.
	    return 100;
	fi
    done

    if [ "$dir_list" = "" ]
    then
	echo "$dir_path";
    else
	echo "$dir_list:$dir_path";
    fi
    
    return 0;
}

# Takes a list of ':' separated directories and prepends the specified
# directory if it is not already in the list.

function dirlist.safe_prepend
{
    local dir_path="$1"
    local dir_list="$2"

    #local list_dirs=`echo $dir_list | ~/.user_env/bin/sed -e 's/:/ /g'`
    local list_dirs=`echo $dir_list | sed -e 's/:/ /g'`
    for dir in $list_dirs
    do
	if [ "$dir" = "$dir_path" ]
	then
	    echo $dir_list; # Directory in list.
	    return 100;
	fi
    done

    if [ "$dir_list" = "" ]
    then
	echo "$dir_path";
    else
	echo "$dir_path:$dir_list";
    fi
    return 0;
}




# Remove the specified directory from specified, ':' separated
# directory list.

function dirlist.remove
{
    local dir_path="$1";
    local dir_list="$2";

    local new_list=""
    #local list_dirs=`echo $dir_list | ~/.user_env/bin/sed -e 's/:/ /g'`;
    local list_dirs=`echo $dir_list | sed -e 's/:/ /g'`;
    for dir in $list_dirs
    do
	if [ "$dir" = "$dir_path" ]
	then
	    continue ;
	else
	    if [ "$dir" = "" ]
	    then
		continue ;
	    fi
	    if [ "$new_list" = "" ]
	    then
		new_list="$dir"
	    else
		new_list="$new_list:$dir"
            fi
	fi
    done

    echo "$new_list";
    return 0;
}
