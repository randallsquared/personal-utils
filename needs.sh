#!/bin/bash

# In an npm package, finds the usages of some other package.
# 
# With one argument, just tries to find that package name in 
# package.json files or in require statements.
# 
# With two arguments, passes the first argument to grep, so 
# `needs -l ...` just prints filenames.
# 
# This doesn't parse anything or do anything smart.
# 

if [ "" = "$2" ]; then
  # no grep switches
  find . -type f -name package.json -or -type f -name '*.js' \
  | xargs egrep '("'"$1"'": "|require\(.'"$1"'.\))'
else
  find . -type f -name package.json -or -type f -name '*.js' \
  | xargs egrep ${1}e '("'"$2"'": "|require\(.'"$2"'.\))'
fi
