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

# Tools Install

apt install nmap
apt install dnsmap
apt install enum4linux-ng
apt install nikto
apt install smbmap
apt install wireshark
apt install autorecon
apt install recon-ng
