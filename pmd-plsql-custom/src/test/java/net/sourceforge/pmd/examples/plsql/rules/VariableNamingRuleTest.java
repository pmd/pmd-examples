/**
 * BSD-style license; for more info see http://pmd.sourceforge.net/license.html
 */

package net.sourceforge.pmd.examples.plsql.rules;

import net.sourceforge.pmd.testframework.SimpleAggregatorTst;

/**
 *
 * @see https://pmd.github.io/latest/pmd_userdocs_extending_testing.html
 */
public class VariableNamingRuleTest extends SimpleAggregatorTst {

    @Override
    public void setUp() {
        addRule("net/sourceforge/pmd/examples/plsql/rules/VariableNaming.xml", "VariableNaming");
    }
}
