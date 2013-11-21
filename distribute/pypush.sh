#!/bin/sh
# Scriptacular - pypush.sh
# Create a Python source distribution and push it to PyPi
# Copyright 2013 Christopher Simpkins
# MIT License

# Build and push to PyPi
python setup.py sdist upload

# Confirm that it worked
if (( $? )); then
  echo "Unable to distribute your release to PyPI" >&2
  exit 1
fi

python setup.py bdist_wheel upload

# Confirm that wheel distribution worked
if (( $? )); then
  echo "Unable to distribute your wheel to PyPI" >&2
  exit 1
fi

# Exit success
exit 0
