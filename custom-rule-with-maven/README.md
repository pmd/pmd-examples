# Skeleton: Custom PMD rule with maven

Starting template for a custom rule, that is written in Java.
It simply finds variables with the name "foo".

## Building

The sample project uses maven. Just run:

    mvn clean verify

This creates a jar file containing the rule as `target/custom-rule-example-1.0.0-SNAPSHOT.jar`

## Using with PMD CLI

1.  Install PMD as usual.
2.  Copy the jar file `custom-rule-example-1.0.0-SNAPSHOT.jar` to the `lib` directory, where you have
    installed PMD.
3.  Run PMD: `./run.sh pmd -f text -d src -R rulesets/java/myrule.xml`

## Using with the maven-pmd-plugin
