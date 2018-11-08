# PLSQL Custom Rules

Sample project which shows how to create and use custom rules for PLSQL.

## pmd-plsql-custom

This is a sample project, which contains two sample rules:

*   ShortVariable - which is a Java-based rule for detecting short variable names.
*   VariableNaming - which is a XPath-based rule for checking variable names against a regular expression.

Building the project also runs the unit tests for the rules.

The result is a jar file, which contains the rules: `target/pmd-plsql-custom-1.0.0-SNAPSHOT.jar`.
