#!/bin/bash

# exit immediately if a command fails
set -e
java -version

PMD_VERSION=7.2.0

echo
echo "======================================================="
echo "Prepare environment"
echo "======================================================="
echo

BASEDIR="$(pwd)"
mkdir -p code

echo
echo "======================================================="
echo "Downloading PMD ${PMD_VERSION}"
echo "======================================================="
echo
export PMD_HOME=${BASEDIR}/code/pmd-bin-${PMD_VERSION}
if [ ! -d ${PMD_HOME} ]; then
    if [[ "${PMD_VERSION}" == *-SNAPSHOT ]]; then
      wget --no-verbose https://sourceforge.net/projects/pmd/files/pmd/${PMD_VERSION}/pmd-dist-${PMD_VERSION}-bin.zip/download -O ${BASEDIR}/code/pmd-dist-${PMD_VERSION}-bin.zip
    else
      wget --no-verbose https://github.com/pmd/pmd/releases/download/pmd_releases%2F${PMD_VERSION}/pmd-dist-${PMD_VERSION}-bin.zip -O ${BASEDIR}/code/pmd-dist-${PMD_VERSION}-bin.zip
    fi
    unzip -q -d ${BASEDIR}/code ${BASEDIR}/code/pmd-dist-${PMD_VERSION}-bin.zip
    echo "PMD ${PMD_VERSION} installed at: ${PMD_HOME}"
else
    echo "PMD ${PMD_VERSION} already installed: ${PMD_HOME}"
fi

echo
echo "======================================================="
echo "Building java custom rules without maven"
echo "======================================================="
echo
#Cloning is done by github actions already
#echo "Cloning..."
#cd ~/code
#rm -rf pmd-examples
#git clone https://github.com/pmd/pmd-examples.git pmd-examples
#cd pmd-examples/custom-rules/plain-java
rm -rf build
mkdir build
echo "Compiling..."
javac -d build -cp "${PMD_HOME}/lib/*" src/*.java
cp src/myrule.xml build/
echo "Creating jar custom-rule-example.jar..."
jar -c -f custom-rule-example.jar -C build .
echo "Executing PMD"
CLASSPATH=custom-rule-example.jar ${PMD_HOME}/bin/pmd check \
    --no-cache \
    -f text -d testsrc -R myrule.xml \
    --no-fail-on-violation \
    --report-file build/report.txt

grep "testsrc/Test.java" build/report.txt || (echo -e "\n\n\x1b[31mMissing expected rule violation\e[0m"; exit 1)

echo -e "\n\n\x1b[32mTest successful\e[0m"
