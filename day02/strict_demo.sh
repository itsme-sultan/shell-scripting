#!/bin/bash




set -euo pipefail

echo "start of the script"


echo "Scenerio 1: testing undefiened variable (set -u)"
echo "Hello $name"
echo 
echo "scenerio 2:Testing failed command (set -e)"

cd /home/linux

echo "scenerio 3: ensuring whole pipe fail (set -o)"

echo $(date) | grep "Hello"

echo "Testing comppleted!!!"

