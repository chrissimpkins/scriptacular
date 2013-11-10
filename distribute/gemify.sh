#!/bin/sh
# Scriptacular - gemify.sh
# Create a Ruby gem and push it to rubygems.org
# Copyright 2013 Christopher Simpkins
# MIT License

# Enter your gem name below (do not enter version number)
# or pass it as the first argument to the shell script
GEM_NAME=""

# Don't touch these
GEMSPEC_SUFFIX=".gemspec"
GEM_BUILD_CMD="gem build"
GEM_PUSH_CMD="gem push"

# if there is an argument to the script, define the gem name with it
if [ $# -eq 1 ]; then
	GEM_NAME=$1
elif [ $# -gt 1 ]; then
	echo "You entered too many arguments.  Please specify the name of your gem as the argument to the script." >&2
	exit 1
fi

# if the gem name has not been defined, print error message and exit
if [ -z "$GEM_NAME" ]; then
	echo "You did not enter a gem name.  Please include it as an argument to the script or hard code it as a variable in the script." >&2
	exit 1
fi

# run the gem build and parse for the gem release filename
GEM_BUILD_NAME=$(gem build "$GEM_NAME$GEMSPEC_SUFFIX" |  awk '/File/ {print $2}' -)

# if the build failed (i.e. no file name obtained above), print error message and exit
if [ -z "$GEM_BUILD_NAME" ]; then
	echo "The gem build failed.  Please confirm the gem name and try again." >&2
	exit 1
fi

# if above succeeded, then push to rubygems.org using the gem that was compiled
gem push $GEM_BUILD_NAME
exit 0