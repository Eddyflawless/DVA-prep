#!/bin/bash

usage="$0 arn:aws:lambda:<rest> <absolute-path-to-output-file>"
which aws

if [ $? -gt 0 ]; then
    echo -e "aws-cli isnot installed \n"
    exit
fi

command="aws lambda invoke "
command=$command" --function-name $1"

if [[ -z $1 || -z $2  ]]; then

    echo $usage
    exit

fi

if [ -n "$2" ]; then
    #eg $2 | payload is dir1/dir2
    command=$command" --payload file://$2"
fi

command=$command" --output output.txt"

echo "running $command"
eval "$command"