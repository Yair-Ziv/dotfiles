#!/bin/bash

exclude_workspaces=("$@")
echo "Received argument: $@" > /tmp/move_workspaces_log.txt

focused_workspace=$(i3-msg -t get_workspaces | jq -r '.[] | select (.focused) | .name')
echo "Focused window: $focused_workspace" >> /tmp/move_workspaces_log.txt

i3-msg -t get_workspaces | jq -r '.[].name' | while IFS= read -r workspace; do
  matched=false
  echo "Testing $workspace" >> /tmp/move_workspaces_log.txt
  for excluded_workspace in "${exclude_workspaces[@]}"
  do
    if [ "$workspace" == "$excluded_workspace" ]; then
      matched=true
    fi
  done
  if [ "$matched" = false ]; then
    echo "Moving $workspace" >> /tmp/move_workspaces_log.txt
    i3-msg "workspace $workspace; move workspace to output right;"
  fi
done

for excluded_workspace in "${exclude_workspaces[@]}"
do
  echo "Moving to workspace remaining of the left side: $excluded_workspace" >> /tmp/move_workspaces_log.txt
  i3-msg "workspace $excluded_workspace"
done

echo "Moving back to focused window: $focused_workspace" >> /tmp/move_workspaces_log.txt
i3-msg "workspace $focused_workspace"
