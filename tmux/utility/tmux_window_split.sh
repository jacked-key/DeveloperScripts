#!/bin/bash

if [ -z "${tmux_session}" ]; then
  echo "Must provide tmux_session as exported variable"
fi

## adding the boolean operator to ignore exit code
tmux kill-ses -t $tmux_session || true
tmux new-session -d -s $tmux_session
tmux rename-window 'blank check'

## Send command to the current tmux window
send_to_window() {
	command="$@"
	tmux send-keys "$command" 'C-m'
}

## Exit with code 1 if not a valid directory
check_valid_directory() {
  directory="$@"
  if [ ! -d "$directory" ]; then
    echo "Error: $directory is not a directory"
    return 1
  fi
}

## Split the current window into two panes. The first value should be the name of window. The second value should be
## the first directory. The second directory is optional
## example usage: dual_window_split nameOfWindow /Documents /Downloads
dual_window_split() {
  if [ -z "$1" ]; then
    echo "Must provide a first argument name for the window"
    return 1
  fi
  tmux new-window
  tmux rename-window $1  
  if [ -z "$2" ]; then
    echo "Must provide at least 1 directory as argument"
    return 1
  fi
  check_valid_directory "$2"
  DIR=$2
  DIR2=${3:-$2}
	send_to_window cd $DIR #window 0
	tmux split-window -h #window 1
	send_to_window cd $DIR2 #window path/to/dir
}

## Split the current window into 6 panes (2 on left, 4 on right). The first value should be the name of window. The second value should be
## the first directory. The second directory is optional
## example usage: standard_split nameOfWindow /Documents /Download
standard_split() {
  if [ -z "$1" ]; then
    echo "Must provide a first argument name for the window"
    return 1
  fi
  tmux new-window
  tmux rename-window $1
  if [ -z "$2" ]; then
    echo "Must provide at least 1 directory as argument"
    return 1
  fi
  check_valid_directory "$2"
  DIR=$2
  DIR2=${3:-$2}
  send_to_window cd $DIR #window 0
	tmux split-window -h #1
	send_to_window cd $DIR2 #window 1
	tmux split-window -v #2
	send_to_window cd $DIR2 #window 2
	tmux split-window -v #3
	send_to_window cd $DIR2 #window 3
	tmux select-pane -t 1	# select pane #1
	tmux split-window -v #4
	send_to_window cd $DIR #window 4
  tmux select-pane -t 0	# select pane #0
  send_to_window cd $DIR #window 0
}


