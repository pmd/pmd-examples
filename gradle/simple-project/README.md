# simple-project

Demonstrates the usage of PMD with Gradle.

Run with

    ./gradlew check

This should find the following violations in App.java:

    .../pmd-examples/gradle/simple-project/app/src/main/java/org/example/App.java:8:   UnusedPrivateField:     Avoid unused private fields such as 'unusedField'.
    .../pmd-examples/gradle/simple-project/app/src/main/java/org/example/App.java:16:  SystemPrintln:  Usage of System.out/err

## References

*   <https://docs.pmd-code.org/latest/pmd_userdocs_tools_gradle.html>
*   <https://docs.gradle.org/current/userguide/pmd_plugin.html>
