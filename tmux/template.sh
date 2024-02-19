#!/bin/bash

set -eux

export tmux_session="SessionName"
# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$SCRIPT_DIR/utility/tmux_window_split.sh"

BASE_DIR="/path/to/dir"

standard_split 'NameOfFirstWindow' "${BASE_DIR}/dir2/"
box_split 'NameOfSecondWindow' "${BASE_DIR}/dir2/"
