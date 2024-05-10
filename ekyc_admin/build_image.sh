#! /bin/bash

echo "Start build"

sudo docker build -t $1:$2 .

echo "Build Completed"

echo "====================================="

echo "Save image"

sudo docker save -o ./images/$1_$2.tar $1:$2

echo "Save Completed"

exit 0
