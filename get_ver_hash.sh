#!/bin/bash

if [[ -z "$1" ]]; then
    echo "error: no version provided"
    exit 1
fi

while IFS="" read -r p || [ -n "$p" ]
do
    version=$(echo "$p" | cut -f1 -d,)
    commit=$(echo "$p" | cut -f2 -d,)
    if [[ "$version" == "$1" ]]; then
        echo "$commit"
        exit 0
    fi
done < versions.csv

echo "error: Version $1 not found"
cat versions.csv
exit 1