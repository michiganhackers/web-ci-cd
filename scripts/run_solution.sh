#!/bin/bash

# usage $directory
set -e

## supported languages and their extensions
# C: .c
# C++: .cpp
# Python: .py
pushd $1 
pwd

if [[ -f "solution.c" ]];  then
    gcc solution.c -o solution 
    for filename in test_cases/*
        do
    [-d "$filename"] || continue # failsafe
    ./solution < $filename/stdin > $filename/test.out
    diff --strip-trailing-cr $filename/test.out $filename/stdout
    done
elif [[ -f "solution.cpp" ]]; then
    g++ solution.cpp -o solution 
    for filename in test_cases/*
        do
    [ -d "$filename" ] || continue # failsafe
    ./solution < $filename/stdin > $filename/test.out
    diff --strip-trailing-cr $filename/test.out $filename/stdout
    done
elif [[ -f "solution.py" ]]; then
    
     for filename in test_cases/*
        do
    [ -d "$filename" ] || continue # failsafe
    python3 solution.py < $filename/stdin > $filename/test.out
    diff --strip-trailing-cr $filename/test.out $filename/stdout
    done
    
else
    echo "No solution file found"
fi

popd
