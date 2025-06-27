#!/bin/bash

# exit immediately if a command fails
set -e

ANT_VERSION=1.10.15
PMD_VERSION=7.15.0

BASEDIR="$(pwd)"
mkdir -p tools

echo
echo "======================================================="
echo "Downloading ant ${ANT_VERSION}"
echo "======================================================="
export ANT_HOME="${BASEDIR}/tools/apache-ant-${ANT_VERSION}"
if [ ! -d "${ANT_HOME}" ]; then
  wget --no-verbose "https://dlcdn.apache.org/ant/binaries/apache-ant-${ANT_VERSION}-bin.zip" -O "${BASEDIR}/tools/apache-ant-${ANT_VERSION}-bin.zip"
  unzip -q -d "${BASEDIR}/tools" "${BASEDIR}/tools/apache-ant-${ANT_VERSION}-bin.zip"
  echo "Ant ${ANT_VERSION} installed at ${ANT_HOME}"
else
  echo "Ant ${ANT_VERSION} already installed: ${ANT_HOME}"
fi

echo
echo "======================================================="
echo "Downloading PMD ${PMD_VERSION}"
echo "======================================================="
export PMD_HOME="${BASEDIR}/tools/pmd-bin-${PMD_VERSION}"
if [ ! -d "${PMD_HOME}" ]; then
    if [[ "${PMD_VERSION}" == *-SNAPSHOT ]]; then
      wget --no-verbose https://sourceforge.net/projects/pmd/files/pmd/${PMD_VERSION}/pmd-dist-${PMD_VERSION}-bin.zip/download -O ${BASEDIR}/tools/pmd-dist-${PMD_VERSION}-bin.zip
    else
      wget --no-verbose https://github.com/pmd/pmd/releases/download/pmd_releases%2F${PMD_VERSION}/pmd-dist-${PMD_VERSION}-bin.zip -O ${BASEDIR}/tools/pmd-dist-${PMD_VERSION}-bin.zip
    fi
    unzip -q -d "${BASEDIR}/tools" "${BASEDIR}/tools/pmd-dist-${PMD_VERSION}-bin.zip"
    echo "PMD ${PMD_VERSION} installed at: ${PMD_HOME}"
else
    echo "PMD ${PMD_VERSION} already installed: ${PMD_HOME}"
fi


echo
echo "======================================================="
echo "Building project..."
echo "======================================================="
${ANT_HOME}/bin/ant -Dpmd.home="$PMD_HOME" clean pmd cpd


echo
echo "======================================================="
echo "Verify build/pmd-report.xml..."
echo "======================================================="
grep "${BASEDIR}/src/net/sourceforge/pmd/examples/ant/simpleproject/Main.java" build/pmd-report.xml || (echo -e "\n\n\x1b[31mMissing expected rule violation\e[0m"; exit 1)

echo -e "\n\n\x1b[32mTest successful\e[0m"
