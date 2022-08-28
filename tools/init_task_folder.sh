#!/bin/bash

# init_task_folder CSTS-9999 monitoring-system-bugfix
function init_task_folder() {
  local task_number=$1
  local task_desc=$2

  cd $NOTEBOOK_PATH

  local base_folder="work/your-company"

  local task_folder="$base_folder/${task_number}.${task_desc}"
  cp -r "$base_folder/0.template.dir" "$task_folder"

  echo "${task_number} $task_desc" >> "${task_folder}/README.md"
  echo "" >> "${task_folder}/README.md"

  echo "\`\`\`bash" >> "${task_folder}/README.md"
  # csts_9999, depends on your branch naming convention
  local branch_name=$(echo $task_number | tr '-' '_' | tr "[:upper:]" "[:lower:]")
  echo "git checkout -b $branch_name" >> "${task_folder}/README.md"
  echo "git commit --allow-empty -m \"${task_number} $task_desc\"; git push" >> "${task_folder}/README.md"
  echo "git checkout $branch_name"   >> "${task_folder}/README.md"
  echo "\`\`\`" >> "${task_folder}/README.md"

  echo "" >> "${task_folder}/README.md"

  tree $task_folder

  echo
  echo "${task_folder}/README.md"
  cd -
}

