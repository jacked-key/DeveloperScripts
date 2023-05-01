#!/bin/bash

set -eux

session="Bankalyze"
MOUNTED_DIR="/home/jackie/MountedWorkspace/bankalyze"
BASE_DIR="/home/jackie/Workspace/bankalyze"

tmux new-session -d -s $session

send() {
	command="$@"
	tmux send-keys "$command" 'C-m'
}

standard_split() {
	DIR=$1
	tmux split-window -h #1
	send cd $DIR
	tmux split-window -v #2
	send cd $DIR
	tmux split-window -v #3
	send cd $DIR
	# select pane #1
	tmux select-pane -t 1
	send cd $DIR
	tmux split-window -v #4
	send cd $DIR
}

window=0
tmux select-window -t $session:$window
tmux rename-window -t $session:$window 'MountedWSWebApp'
standard_split "${MOUNTED_DIR}/webapp_frontend"

window=1
tmux new-window
tmux select-window -t $session:$window
tmux rename-window -t $session:$window 'WSWebApp'
standard_split "${BASE_DIR}/webapp_frontend"

#attaching to session
tmux a -t $session
