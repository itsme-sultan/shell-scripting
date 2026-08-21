#!/bin/bash

set -e

mkdir /tmp/devops-test  || echo " directory exist can't be created."

cd /tmp/devops-test || echo "unable to switch"

touch test-file.txt  || echo "file already exist".
