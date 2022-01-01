#!/bin/bash

# manually trigger:
# bash efficiency/self_use_tools/create_worklog.daily.sh

# */2 5-10 * * * /bin/bash -l -c 'cd $NOTEBOOK_PATH && bash efficiency/self_use_tools/create_worklog.daily.sh >> log/create_worklog.log'

cd $NOTEBOOK_PATH

date_format="+%Y%m%d"
date_format_log="+%Y-%m-%d %H:%M:%S"

yesterday_worklog="work/worklog/worklog.$(date -v-1d $date_format).md"
today_worklog="work/worklog/worklog.$(date $date_format).md"

if test -f "$today_worklog"; then
  echo "$(date "$date_format_log") TODAY $today_worklog EXISTS, DO NOTHING."
  exit 0;
fi

if test -f "$yesterday_worklog"; then
  echo "$(date "$date_format_log") YESTERDAY $FILE EXISTS. COPY ONE";
  cp $yesterday_worklog $today_worklog;
else
  echo "$(date "$date_format_log") YESTERDAY $FILE DOES NOT EXISTS. CREATE ONE";
  touch $today_worklog;
fi
