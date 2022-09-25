#!/bin/bash

if [ $# -lt 2 ]; then
    echo Usage: tag_paper TAG KEY [KEY...]
    exit
fi

DIR=~/sync/papers
TAG=$1

mkdir -p ${DIR}/tags/${TAG}/pdf
mkdir -p ${DIR}/tags/${TAG}/txt

# -- Iterate through args 2 to end.
shift
for arg in "$@"
do
    cd ${DIR}/tags/${TAG}/pdf
    ln -s ${DIR}/pdf/$1.pdf $1.pdf
    cd ${DIR}/tags/${TAG}/txt
    ln -s ${DIR}/txt/$1.txt $1.txt
    cd ${DIR}/

    echo Tagged $1 as $TAG.
    shift
done


