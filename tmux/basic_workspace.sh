#!/bin/bash

set -eux

sesssion="Workspace"
BASE_DIR="/home/jackie/MountedWorkspace/changeThisToo"

tmux new-session -d -s $session

send() {
	command="$@"
	tmux send-keys "command" 'C-m'
}

standard_split() {
	DIR=$1
	tmux split-window -h #1
	send cd $DIR
	tmux split-window -h #2
	send cd $DIR
	tmux split-window -h #3
	send cd $DIR
	# select pane #1
	tmux select-pane -t 1
	send cd $DIR
	tmux split-window -h #4
	send cd $DIR
}

window=0
tmux select-window -t $session:$window
tmux rename-window -t $session:$window 'RDE'
standard_split "${BASE_DIR}/"
