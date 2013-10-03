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
	if (( $? )); then
		echo "Unable to initialize your directory" >&2
		exit 1
	fi
	git add "$FILE_TYPE"
	if (( $? )); then
		echo "Unable to stage files" >&2
		exit 1
	fi
	git commit -m "$INITIAL_COMMIT_MESSAGE"
	if (( $? )); then
		echo "Unable to create the initial commit" >&2
		exit 1
	fi
	touch README.md
	touch .gitignore
	echo " ----- "
	echo "The directory was initialized and an initial commit was performed with the files matching the pattern '$FILE_TYPE'"
fi
exit 0
