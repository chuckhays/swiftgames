#!/bin/bash
pushd  "$(dirname "$0")"

swift build
swift test

popd
