#!/bin/bash

bison -d -v $1.y
flex $1.in
gcc $1.c -lfl -Wall -o $1
