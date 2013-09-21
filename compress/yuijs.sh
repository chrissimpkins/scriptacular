#!/bin/sh
# Scriptacular - yuijs.sh
# JavaScript file compression & obfuscation with yuicompressor
# Copyright 2013 Christopher Simpkins
# MIT License

# Modify YUI_PATH below with the path to your yuicompressor jar file
YUI_PATH="path/to/yuicompressor-2.4.8.jar"

if [ $# -eq 0]; then
	echo "Please include the file path(s) for the file(s) that you would like to compress." 1>&2
	exit 1
fi

for file in "$@";
do
if [ -f "$file" ]; then
		java -jar "$YUI_PATH" -o "${file%%.*}-min.js" "$file"
		echo "$file was minified to ${file%%.*}-min.js"
	else
		echo "Unable to find the javascript file '$file'."
fi
done;
exit 0