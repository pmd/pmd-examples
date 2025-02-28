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

## pmd-java-dist

This builds a customized PMD binary, which includes all necessary dependencies for Java only
including the custom rules.

The result is a zip file: `target/pmd-java-bin-1.0.0-SNAPSHOT.zip`.

## Using with PMD CLI

### Option A

1.  Install PMD using the created `pmd-java-bin-1.0.0-SNAPSHOT.zip` file like a normal PMD binary distribution.
2.  Run PMD: `bin/pmd check -f text -d src -R custom-java-ruleset.xml`

### Option B

1.  Install PMD as usual.
2.  Copy the jar file `pmd-java-custom-1.0.0-SNAPSHOT.jar` to the `lib` directory, where you have
    installed PMD.
3.  Run PMD: `bin/pmd check -f text -d src -R custom-java-ruleset.xml`

## Using with the maven-pmd-plugin

1.  Install the sample project into your local maven repo:

        ./mvnw clean install

    Or configure the `distributionManagement` section and run `./mvnw clean deploy`, to deploy into
    your repository.

2.  Modify the plugin section, so that your custom-rule-example is added as an additional dependency for
    the maven-pmd-plugin:

    ```xml
    <properties>
            <pmd.version>7.11.0</pmd.version>
    </properties>
    ...
    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-pmd-plugin</artifactId>
        <version>3.26.0</version>
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
            <targetJdk>11</targetJdk>
            <rulesets>
                <ruleset>custom-java-ruleset.xml</ruleset>
            </rulesets>
        </configuration>
        <dependencies>
            <dependency>
                <groupId>net.sourceforge.pmd.examples</groupId>
                <artifactId>pmd-java-custom</artifactId>
                <version>1.0.0-SNAPSHOT</version>
            </dependency>
            <dependency>
                <groupId>net.sourceforge.pmd</groupId>
                <artifactId>pmd-core</artifactId>
                <version>${pmd.version}</version>
            </dependency>
            <dependency>
                <groupId>net.sourceforge.pmd</groupId>
                <artifactId>pmd-java</artifactId>
                <version>${pmd.version}</version>
            </dependency>
            <dependency>
                <groupId>net.sourceforge.pmd</groupId>
                <artifactId>pmd-javascript</artifactId>
                <version>${pmd.version}</version>
            </dependency>
            <dependency>
                <groupId>net.sourceforge.pmd</groupId>
                <artifactId>pmd-jsp</artifactId>
                <version>${pmd.version}</version>
            </dependency>
        </dependencies>
    </plugin>
    ```

Now the m-pmd-p executes your custom rule.
