# !/bin/bash
# Author: Joseph M. Garcia
# Date: 12/12/2019
# Description : Manage docker image versioning.

# 1st param
IMAGE=$1
# 2nd param
VERSION=$2

# 2> /dev/null - Redirect standard error.
# 1> - standard output
# 0> - standard input
IMAGEFILE=$(docker images -q $IMAGE:$VERSION 2> /dev/null)

# Check if the image exists:
if [[ $IMAGEFILE == ""]]
    echo "Docker image exist"
fi

