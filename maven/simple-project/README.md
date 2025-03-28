# simple-project

Demonstrates the usage of PMD with maven-pmd-plugin.

Run with

    mvn clean verify

This should find the following violations in Main.java:

    [INFO] PMD Failure: net.sourceforge.pmd.examples.maven.simpleproject.Main:6 Rule:UnusedPrivateField Priority:3 Avoid unused private fields such as 'unusedField'..
    [INFO] PMD Failure: net.sourceforge.pmd.examples.maven.simpleproject.Main:12 Rule:EmptyControlStatement Priority:3 Empty if statement.

Run with

    mvn clean verify -Dpmd.version=7.13.0-SNAPSHOT -Dpmd.plugin.version=3.27.0-SNAPSHOT

in order to set specific version for PMD and/or maven-pmd-plugin.

## References

*   <https://docs.pmd-code.org/latest/pmd_userdocs_tools_maven.html>
*   <https://maven.apache.org/plugins/maven-pmd-plugin/index.html>
