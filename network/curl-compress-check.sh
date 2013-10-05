#!/bin/bash
# Scriptacular - curl-compress-check.sh
# Determine whether a web server is serving gzip or deflate compressed files
# Copyright 2013 Christopher Simpkins
# MIT License

if [ $# -eq 0 ]; then
	echo "Please include the URL(s) for the site(s) that you would like to test." 1>&2
	exit 1
fi

for url in "$@";
do
	printf "Testing %s ---> " "$url"
	curl -I -L -s -H 'Accept-Encoding: gzip,deflate' $url | grep "Content-Encoding"
	if (( $? )); then
		echo "Unable to evaluate the URL $url" >&2
		exit 1
	fi
done
exit 0