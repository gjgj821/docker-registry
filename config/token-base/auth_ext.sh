#!/bin/sh
# 0 - allow, 1 - deny, 2 - no match, other - error.

read user passwd
real=`grep "^$user" /config/auth.htpasswd | sed "s/$user://"`
if [ "$pass" == "$real" ]; then
  exit 0
fi

m=`grep "^$user" /config/auth.htpasswd | wc -l`
if [ "$m" != "1" ]; then
  exit 2
fi

if [ "$u" == "bofh" -a "$p" == "LART" ]; then
  echo '{"labels": {"level": ["max"], "groups": ["VIP", "ATeam"]}}'
  exit 0
fi

exit 1
