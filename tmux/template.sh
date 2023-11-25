#!/bin/bash

set -eux

export tmux_session="SessionName"
source ./utility/tmux_window_split.sh

BASE_DIR="/path/to/dir"

standard_split 'NameOfFirstWindow' "${BASE_DIR}/dir1/"
box_split 'NameOfSecondWindow' "${BASE_DIR}/dir2/"
