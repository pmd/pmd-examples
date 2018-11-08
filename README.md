# PLSQL Custom Rules

Sample project which shows how to create and use custom rules for PLSQL.

You can build the project using maven:

```
$ ./mvnw clean verify
```


## pmd-plsql-custom

This is a sample project, which contains two sample rules:

*   ShortVariable - which is a Java-based rule for detecting short variable names.
*   VariableNaming - which is a XPath-based rule for checking variable names against a regular expression.

Building the project also runs the unit tests for the rules.

The result is a jar file, which contains the rules: `target/pmd-plsql-custom-1.0.0-SNAPSHOT.jar`.

## pmd-plsql-dist

This builds a customized PMD binary, which includes all necessary dependencies for PLSQL only
including the custom rules.

The result is a zip file: `target/pmd-plsql-bin-1.0.0-SNAPSHOT.zip`.