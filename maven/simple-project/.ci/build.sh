#!/bin/bash

# exit immediately if a command fails
set -e
java -version
mvn --version

mvn verify | tee build.log
grep "You have 2 PMD violations" build.log || (echo -e "\n\n\x1b[31mMissing expected rule violation\e[0m"; exit 1)

echo -e "\n\n\x1b[32mTest successful\e[0m"
