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
cd pmd-java-dist/target
unzip pmd-java-bin-1.0.0-SNAPSHOT.zip
pmd-java-bin-1.0.0-SNAPSHOT/bin/run.sh pmd --no-cache \
    -f text \
    -d ../../ \
    -R custom-java-ruleset.xml \
    --fail-on-violation false \
    --report-file pmdreport.txt

grep "examples/java/rules/MyRule.java" pmdreport.txt || (echo "Missing expected rule violation"; exit 1)
