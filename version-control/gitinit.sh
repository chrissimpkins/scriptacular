#!/bin/bash
# Scriptacular - gitinit.sh
# Initialize a directory with git, stage and commit existing files
# Copyright 2013 Christopher Simpkins
# MIT License

FILE_TYPE="."
INITIAL_COMMIT_MESSAGE="Initial commit"

if [ -d ".git" ]; then
	echo "This directory has already been initialized with git."
	exit 1
else
	git init
	git add "$FILE_TYPE"
	git commit -m "$INITIAL_COMMIT_MESSAGE"
	touch README.md
	touch .gitignore
	echo " ----- "
	echo "The directory was initialized and an initial commit was performed with the files matching the pattern '$FILE_TYPE'"
fi
exit 0
