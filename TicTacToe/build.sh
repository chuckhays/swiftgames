#!/bin/bash
pushd  "$(dirname "$0")"

swift build 

if [ $? -eq 0 ]
then
  echo "Build succeeded"
else
  echo "Build failed"
  exit 1
fi

swift test
if [ $? -eq 0 ]
then
  echo "Test succeeded"
else
  echo "Test failed"
  exit 1
fi
