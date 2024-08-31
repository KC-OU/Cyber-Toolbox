#!/bin/sh -e

checkEscalationTool() {
  ## Check for escalation tools.
  if [ -z "$ESCALATION_TOOL_CHECKED" ]; then
    ESCALATION_TOOLS='sudo doas'
    for tool in ${ESCALATION_TOOLS}; do
      if command_exists "${tool}"; then
        ESCALATION_TOOL=${tool}
        echo "Using ${tool} for privilege escalation"
        ESCALATION_TOOL_CHECKED=true
        return 0
      fi
    done

    echo -e "${RED}Can't find a supported escalation tool${RC}"
    exit 1
  fi
}

# install tools

sudo apt install python3
sudo apt install nodejs
sudo apt install php
sudo apt install go
