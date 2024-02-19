#!/bin/bash

exclude_workspace="2: com"

workspaces=$(i3-msg -t get_workspaces | jq -r '.[].name')

for workspace in $workspaces; do
  if [ "$workspace" != "$exclude_workspace" ]; then
    i3-msg "workspace $workspace; move workspace to output right"
  fi
done
