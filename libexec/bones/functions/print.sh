#!/bin/sh

printok()
{
    printf "bones: %s\n" "${1}" > /dev/stdout
}

printerr()
{
    printf "bones: %s\n" "${1}" > /dev/stderr
}
