#!/bin/sh
#

# Step 1:
# When you get following options during svn merge command,  select option 'l'. This is to launch external tool to resolve conflicts.
#
# Conflict discovered in 'main.h'.
# Select: (p) postpone,  (df) diff-full,  (e) edit,
#        (mc) mine-conflict,  (tc) theirs-conflict,
#        (s) show all options: l

# Step 2: Now vim will be opened in diff mode with 3 files - mine,  theirs and merged. Make the required changes in the merged file,  and do save and exit (:xa).

# Step 3:
# Now below options will appear again,  select 'r' (to accept the merged version) now.

BASE=${1}
LOCAL=${2}
REMOTE=${3}
MERGED=${4}
WCPATH=${5}

# copied from from git's vimdiff script
# @see https://github.com/git/git/blob/master/mergetools/vimdiff
vimdiff -f -d -c 'wincmd J' "$MERGED" "$LOCAL" "$BASE" "$REMOTE"
