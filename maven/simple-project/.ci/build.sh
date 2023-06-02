#!/bin/bash

# exit immediately if a command fails
set -e
java -version
mvn --version

mvn verify | tee build.log
grep "You have 2 PMD violations" build.log || (echo "Missing expected rule violation"; exit 1)
