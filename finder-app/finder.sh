#!/bin/sh



if [ "$#" -ne 2 ]; then
    echo "Illegal number of arguments"
    echo "expected: <filesdir> <searchstr>"
    exit 1
fi
FILESDIR=$1
SEARCHSTR=$2

if [! -d $FILESDIR ]; then
    echo "$FILESDIR does not represent a directory on the filesystem!"
    exit 1   
fi
FILESNO=$( find $FILESDIR -type f | wc -l )
MATCHINGLINES=$(grep -rnwl $FILESDIR -e $SEARCHSTR | wc -l )

echo "The number of files are $FILESNO , the number of matching lines are $MATCHINGLINES"

echo "success"
exit 0S
