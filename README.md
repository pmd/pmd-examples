# Apex-only Distribution

Sample project which shows how to create a binary distribution stripped down to one language module (Apex).

You can build the project using maven:

```
$ ./mvnw clean verify
```

This results in a zip file: `target/pmd-apex-bin-6.23.0.zip`. It can be installed [like any pmd distribution](https://pmd.github.io/latest/pmd_userdocs_installation.html#installation) but only contains the Apex module (and no designer).
