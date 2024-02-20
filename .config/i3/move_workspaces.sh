#!/bin/bash

exclude_workspace="2: com"

i3-msg -t get_workspaces | jq -r '.[].name' | while IFS= read -r workspace; do
  if [ "$workspace" != "$exclude_workspace" ]; then
    i3-msg "workspace $workspace; move workspace to output right;"
  fi
done
