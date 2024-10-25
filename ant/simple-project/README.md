# simple-project

Demonstrates the usage of PMD with Apache Ant.

Run with

    ant -Dpmd.home=path-to-pmd-bin-directory clean pmd

This should find the following violations in Main.java:

      [pmd] .../src/net/sourceforge/pmd/examples/ant/simpleproject/Main.java:6:    UnusedPrivateField:     Avoid unused private fields such as 'unusedField'.
      [pmd] .../src/net/sourceforge/pmd/examples/ant/simpleproject/Main.java:12:   EmptyControlStatement:  Empty if statement
      [pmd] .../src/net/sourceforge/pmd/examples/ant/simpleproject/Main.java:12:   ControlStatementBraces: This statement should have braces

## References

*   <https://docs.pmd-code.org/latest/pmd_userdocs_tools_ant.html>
*   <https://ant.apache.org/manual/index.html>
