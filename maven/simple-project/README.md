# simple-project

Demonstrates the usage of PMD with maven-pmd-plugin.

Run with

    mvn clean verify

This should find the following violations in Main.java:

    [INFO] PMD Failure: Main:4 Rule:UnusedPrivateField Priority:3 Avoid unused private fields such as 'unusedField'..
    [INFO] PMD Failure: Main:10 Rule:EmptyStatementNotInLoop Priority:3 An empty statement (semicolon) not part of a loop.
    [INFO] PMD Failure: Main:10 Rule:EmptyIfStmt Priority:3 Avoid empty if statements.

Run with

    mvn clean verify -Dpmd.version=7.0.0-SNAPSHOT -Dpmd.plugin.version=3.15.0-SNAPSHOT

in order to set specific version for PMD and/or maven-pmd-plugin.

## References

*   <https://pmd.github.io/latest/pmd_userdocs_tools_maven.html>
*   <https://maven.apache.org/plugins/maven-pmd-plugin/index.html>
