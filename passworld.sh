#!/usr/bin/env bash

echo -e "Enter passworld"

stty -echo

read passworld

stty echo
echo
echo Passworld read = $passworld.