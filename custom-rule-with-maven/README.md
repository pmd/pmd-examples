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

1.  Install the sample project into your local maven repo:

        mvn clean install

2.  Modify the plugin section, so that your custom-rule-example is added as an additional dependency for
    the maven-pmd-plugin:

    ```xml
    ...
    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-pmd-plugin</artifactId>
        <version>3.9.0</version>
        <executions>
            <execution>
                <phase>verify</phase>
                <goals>
                    <goal>pmd</goal>
                    <goal>cpd</goal>
                </goals>
            </execution>
        </executions>
        <configuration>
            <minimumTokens>100</minimumTokens>
            <targetJdk>1.9</targetJdk>
            <rulesets>
                <ruleset>rulesets/java/myrule.xml</ruleset>
            </rulesets>
        </configuration>
        <dependencies>
            <dependency>
                <groupId>com.github.pmd</groupId>
                <artifactId>custom-rule-example</artifactId>
                <version>1.0.0-SNAPSHOT</version>
            </dependency>
        </dependencies>
    </plugin>
    ```

Now the m-pmd-p executes your custom rule.
