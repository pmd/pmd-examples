#!/bin/bash

# exit immediately if a command fails
set -e

./mvnw --show-version --batch-mode verify 2>&1 | tee build.log

echo
echo "Verifying build.log..."
failure_count=$(grep --count "PMD Failure" build.log)
if [[ $failure_count -ne 2 ]]; then
  echo -e "\n\n\x1b[31mMissing expected rule violations\e[0m"
  exit 1
fi

echo -e "\n\n\x1b[32mTest successful\e[0m"
