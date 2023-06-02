#!/bin/bash

# exit immediately if a command fails
set -e

java -version

echo
echo "======================================================="
echo "Building..."
echo "======================================================="
echo
./mvnw clean verify

echo
echo "======================================================="
echo "Running PMD..."
echo "======================================================="
echo
cd pmd-plsql-dist/target
unzip -q pmd-plsql-bin-1.0.0-SNAPSHOT.zip
pmd-plsql-bin-1.0.0-SNAPSHOT/bin/run.sh pmd --no-cache \
    --use-version plsql- \
    -f text \
    -d ../../pmd-plsql-custom/src/test/plsql \
    -R custom-plsql-ruleset.xml \
    --fail-on-violation false \
    --report-file pmdreport.txt

grep "pmd-plsql-custom/src/test/plsql/short_variables.pls" pmdreport.txt || (echo -e "\n\n\x1b[31mMissing expected rule violation\e[0m"; exit 1)
grep "pmd-plsql-custom/src/test/plsql/variable_naming.pls" pmdreport.txt || (echo -e "\n\n\x1b[31mMissing expected rule violation\e[0m"; exit 1)

echo -e "\n\n\x1b[32mTest successful\e[0m"
