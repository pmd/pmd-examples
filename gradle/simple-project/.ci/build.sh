#!/bin/bash

# exit immediately if a command fails
set -e

./gradlew check 2>&1 | tee build.log

echo
echo "Verifying build.log..."
grep "2 PMD rule violations were found." build.log || (echo -e "\n\n\x1b[31mMissing expected rule violation\e[0m"; exit 1)

echo -e "\n\n\x1b[32mTest successful\e[0m"
