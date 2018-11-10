# Java Custom Rules

Sample project which shows how to create and use custom rules for Java.

You can build the project using maven:

```
$ ./mvnw clean verify
```


## pmd-java-custom

This is a sample project, which contains two sample rules:

*   MyRule - which is a Java-based rule for detecting variables with a specific name.
*   VariableNaming - which is a XPath-based rule for checking variable names against a regular expression.

Building the project also runs the unit tests for the rules.

It also contains a custom ruleset, which includes some PMD built-in rules as well as the custom rules.
See `custom-java-ruleset.xml`.

The result is a jar file, which contains the rules: `target/pmd-java-custom-1.0.0-SNAPSHOT.jar`.

## pmd-plsql-dist

This builds a customized PMD binary, which includes all necessary dependencies for Java only
including the custom rules.

The result is a zip file: `target/pmd-java-bin-1.0.0-SNAPSHOT.zip`.