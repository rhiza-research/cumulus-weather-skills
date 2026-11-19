#!/usr/bin/env bash
# Install the Cumulus agent and skills as a Claude Code plugin.
set -e

claude plugin marketplace add rhiza-research/cumulus-weather-skills
claude plugin install rhiza-cumulus@cumulus-weather-skills

cat <<'EOF'

Installed the rhiza-cumulus plugin.

Next steps:

# Then run the agent
claude --agent rhiza-cumulus:cumulus

EOF
