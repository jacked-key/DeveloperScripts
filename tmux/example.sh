#!/bin/bash

set -eux

export tmux_session="DeveloperUtils"
source ./utility/tmux_window_split.sh

BASE_DIR="/home/jackie/Workspace/DeveloperScripts"

standard_split 'tmux' "${BASE_DIR}/tmux/"
dual_window_split 'vimrc' "${BASE_DIR}/vimrc/"

tmux a -t $tmux_session
