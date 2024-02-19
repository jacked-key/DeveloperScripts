#!/bin/bash

set -eux

export tmux_session="Vegas"
# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$SCRIPT_DIR/utility/tmux_window_split.sh"

BASE_DIR="/home/jackie/Workspace/VegasTrip2024"

standard_split 'frontend' "${BASE_DIR}/frontend/"
dual_window_split 'backend' "${BASE_DIR}/backend/"
dual_window_split 'mongo_db' "${BASE_DIR}/mongo_db/"

tmux a -t $tmux_session
