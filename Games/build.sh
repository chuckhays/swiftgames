#!/bin/bash
pushd  "$(dirname "$0")"

swift Games/main.swift

popd
