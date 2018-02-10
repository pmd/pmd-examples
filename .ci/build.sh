#!/bin/bash

# exit immediately if a command fails
set -e

jdk_switcher use oraclejdk9

echo
echo "======================================================="
echo "Downloading PMD 6.0.1"
echo "======================================================="
echo
export PMD_HOME=${HOME}/pmd-bin-6.0.1
if [ ! -d ${PMD_HOME} ]; then
    wget https://github.com/pmd/pmd/releases/download/pmd_releases%2F6.0.1/pmd-bin-6.0.1.zip -O ${HOME}/pmd-bin-6.0.1.zip
    unzip -d ${HOME} ${HOME}/pmd-bin-6.0.1.zip
else
    echo "PMD 6.0.1 already installed: ${PMD_HOME}"
fi


echo
echo "======================================================="
echo Building custom-rule-with-maven
echo "======================================================="
echo

mvn -f custom-rule-with-maven/pom.xml clean verify


echo
echo "======================================================="
echo Building custom-rule-manually
echo "======================================================="
echo
pushd custom-rule-manually
rm -rf build
mkdir build
echo "Compiling..."
javac -d build -cp ${PMD_HOME}'/lib/*' src/*.java
cp src/myrule.xml build/
echo "Creating jar custom-rule-example.jar..."
jar -c -f custom-rule-example.jar -C build .
echo "Executing PMD"
CLASSPATH=custom-rule-example.jar ${PMD_HOME}/bin/run.sh pmd -f text -d testsrc -R myrule.xml \
    -failOnViolation false \
    -reportfile build/report.txt
grep "testsrc/Test.java" build/report.txt || (echo "Missing expected rule violation"; exit 1)
popd
