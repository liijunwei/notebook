# Intro

Editor+Cmdline+TODO-OK Workflow

Personal use since `2020-07-18 22:51`, 18290 commits until `2022-01-28 22:26`, experience value for *auto commit frequency* is 10min/commit.

# Important Notice

**Pushing *Your Notebook* to public repo is a BAD IDEA, since when this workflow gets handy you'll inevitably write down important/sensitive info and they'll all be logged into `git`.**

# Core

+ cmdline + texteditor + shellscript(or other cli)
+ workflow + template + crontab
+ mark your task as TODO/OK
+ note on what you are doing, what you'are planning... and prioritize them visually
+ fuzzy search with keywords using texteditor(cmd/ctrl+p) or [fzf](https://github.com/junegunn/fzf)
    + **Naming is vital**
    + **Naming is vital**
    + **Naming is vital**
+ duplication is acceptable
+ all changes are auto commited
```sh
*/10 * * * *   /bin/bash -l -c "cd $NOTEBOOK_PATH && git pull >> /dev/null && git add . && git commit -m 'AUTO COMMIT.' >> /dev/null 2>> log/cron_commit.log"
7 * * * *      /bin/bash -l -c "cd $NOTEBOOK_PATH && git push --porcelain >> log/cron_push.log 2>&1"
```

# Example

+ [cronatb generate daily worklog](efficiency/self_use_tools/create_worklog.daily.sh)
+ [shell script generate task folder from template](efficiency/self_use_tools/init_task_folder.sh)
    + add `source $NOTEBOOK_PATH/efficiency/self_use_tools/init_task_folder.sh` to your `.bashrc` or `.zshrc` ...
    + and you get the init_task_folder helper
    + then every task will have a sepreate workspace
    + every task start from the "README.md" file

+ Hopefully you get the idea now. Good Luck :D

# Tips

+ place you dotfiles into one of the folders and link them to your $HOME dir and your dotfiles are checked into version control system(setup your own dotfile repo might be a better idea)
+ find patterns and make template dirs, standardize your workflow, automate them using shell(...), you may spend less time in setup phase, and earn more efficient hours
+ since git provide so much information, you may develop scripts to analyze your own `notebook` repo

