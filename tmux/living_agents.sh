
#!/bin/bash

set -eux

export tmux_session="LivingAgents"
# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$SCRIPT_DIR/utility/tmux_window_split.sh"

BASE_DIR=~/workspace/LivingAgents

standard_split 'SourceCode' "${BASE_DIR}/LivingAgentsSourceCode/"

tmux a -t $tmux_session