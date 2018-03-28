#!/bin/bash

DaySuffix() {
  case `date +%d` in
    1|21|31) echo "st";;
    2|22)    echo "nd";;
    3|23)    echo "rd";;
    *)       echo "th";;
  esac
}

f=~/Projects/Internal/notes/`date +%Y-%m-%d`'.md'
if [ ! -e "$f" ] ; then
  d=`date +%B\ %d``DaySuffix`', '`date +%Y`
  t='# '$d'\n\n## TodaysGoals\n- [ ] Paybills\n\n---\n## RandomThoughts\n\n\n---\n## Notes\n\n### ProjectX\n\n---\n## Summary\n'

  echo -e $t > $f
else
  atom $f
fi
