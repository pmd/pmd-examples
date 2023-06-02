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

It also contains a custom ruleset, which includes some PMD built-in rules as well as the custom rules.
See `custom-plsql-ruleset.xml`.

The result is a jar file, which contains the rules: `target/pmd-plsql-custom-1.0.0-SNAPSHOT.jar`.

## pmd-plsql-dist

This builds a customized PMD binary, which includes all necessary dependencies for PLSQL only
including the custom rules.

The result is a zip file: `target/pmd-plsql-bin-1.0.0-SNAPSHOT.zip`.

## Using with PMD CLI

### Option A

1.  Install PMD using the created `pmd-plsql-bin-1.0.0-SNAPSHOT.zip` file like a normal PMD binary distribution.
2.  Run PMD: `./run.sh pmd -f text -d src -R custom-plsql-ruleset.xml`

### Option B

1.  Install PMD as usual.
2.  Copy the jar file `pmd-plsql-custom-1.0.0-SNAPSHOT.jar` to the `lib` directory, where you have
    installed PMD.
3.  Run PMD: `./run.sh pmd -f text -d src -R custom-plsql-ruleset.xml`
