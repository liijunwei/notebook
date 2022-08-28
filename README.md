# Intro

[Editor+Cmdline+TODO-OK Workflow](http://blog.bxzy.top/2021/09/05/effiency-sharing/)

Personal use since `2020-07-18 22:51`, 18290 commits until `2022-01-28 22:26`, experience value for *auto commit frequency* is 10min/commit.

# Important Notice

**Pushing *Your Notebook* to public repo is a BAD IDEA, since when this workflow gets handy you'll inevitably write down important/sensitive info and they'll all be logged into `git`.**

# Core

+ cmdline + texteditor + shellscript(or other cli)
+ workflow + template + crontab
+ mark your task as TODO/OK
+ note on what you are doing, what you'are planning... and **prioritize them visually**
+ fuzzy search with keywords using texteditor(cmd/ctrl+p) or [fzf](https://github.com/junegunn/fzf)
    + **Naming is vital**
    + **Naming is vital**
    + **Naming is vital**
+ duplication is acceptable
+ all changes are auto commited
```sh
NOTEBOOK_PATH=/path/to/your/notebook

*/10 * * * * /bin/bash -l -c "cd $NOTEBOOK_PATH && git pull >> /dev/null && git add . && git commit -m 'Commit automatically by crontab' >> /dev/null 2>> log/cron_commit.log"
7 * * * *    /bin/bash -l -c "cd $NOTEBOOK_PATH && git push --porcelain >> log/cron_push.log 2>&1"
```

# Example

+ [cronatb generate daily worklog](tools/create_worklog.daily.sh)
+ [shell script generate task folder from template](tools/init_task_folder.sh)
    + add `source $NOTEBOOK_PATH/tools/init_task_folder.sh` to your `.bashrc` or `.zshrc` ...
    + and you get the init_task_folder helper
    + then every task will have a sepreate workspace
    + every task start from the "README.md" file

+ Hopefully you get the idea now. Good Luck :D

# Tips

+ Setup your dotfile repo and isolate from notebook
+ Find patterns and make template dirs, standardize/automate your workflow with shell(...), you may will benefit from automation and earn more efficient hours
    + ["Spend 30 minutes each day improving something about your process (automate the thing you repeat the most) or environment (editor, shell, OS, etc)." --- Zenspider](https://www.zenspider.com/ruby/2012/09/career-advice.html)
+ Git provides rich information, you may develop scripts to analyze your `notebook` repo
+ Seperate your life and work notebook repo
