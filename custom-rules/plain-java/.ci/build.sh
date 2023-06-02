#!/bin/bash

# exit immediately if a command fails
set -e
java -version

PMD_VERSION=6.29.0

echo
echo "======================================================="
echo "Prepare environment"
echo "======================================================="
echo

mkdir -p ~/code
cd ~/code

echo
echo "======================================================="
echo "Downloading PMD ${PMD_VERSION}"
echo "======================================================="
echo
export PMD_HOME=${HOME}/code/pmd-bin-${PMD_VERSION}
if [ ! -d ${PMD_HOME} ]; then
    wget https://github.com/pmd/pmd/releases/download/pmd_releases%2F${PMD_VERSION}/pmd-bin-${PMD_VERSION}.zip -O ${HOME}/code/pmd-bin-${PMD_VERSION}.zip
    unzip -d ${HOME}/code ${HOME}/code/pmd-bin-${PMD_VERSION}.zip
else
    echo "PMD ${PMD_VERSION} already installed: ${PMD_HOME}"
fi

echo
echo "======================================================="
echo "Building java custom rules without maven"
echo "======================================================="
echo
echo "Cloning..."
cd ~/code
rm -rf pmd-examples
git clone https://github.com/pmd/pmd-examples.git pmd-examples
cd pmd-examples/custom-rules/plain-java
mkdir build
echo "Compiling..."
javac -d build -cp "${PMD_HOME}/lib/*" src/*.java
cp src/myrule.xml build/
echo "Creating jar custom-rule-example.jar..."
jar -c -f custom-rule-example.jar -C build .
echo "Executing PMD"
CLASSPATH=custom-rule-example.jar ${PMD_HOME}/bin/run.sh pmd -no-cache -f text -d testsrc -R myrule.xml \
    -failOnViolation false \
    -reportfile build/report.txt
grep "testsrc/Test.java" build/report.txt || (echo "Missing expected rule violation"; exit 1)
