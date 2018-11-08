/**
 * BSD-style license; for more info see http://pmd.sourceforge.net/license.html
 */

package net.sourceforge.pmd.examples.plsql.rules;

import net.sourceforge.pmd.lang.plsql.ast.ASTID;
import net.sourceforge.pmd.lang.plsql.ast.ASTVariableOrConstantDeclaratorId;
import net.sourceforge.pmd.lang.plsql.rule.AbstractPLSQLRule;
import net.sourceforge.pmd.properties.IntegerProperty;

public class ShortVariableRule extends AbstractPLSQLRule {

    private static final IntegerProperty MINIMUM_LENGTH = IntegerProperty.named("minimumLength")
            .desc("Number of characters that are required as a minimum for a variable name.")
            .defaultValue(3)
            .range(1, 100)
            .uiOrder(1.0f)
            .build();

    public ShortVariableRule() {
        definePropertyDescriptor(MINIMUM_LENGTH);
        addRuleChainVisit(ASTVariableOrConstantDeclaratorId.class);
    }

    @Override
    public Object visit(ASTVariableOrConstantDeclaratorId node, Object data) {
        Integer min = getProperty(MINIMUM_LENGTH);

        ASTID id = node.getFirstChildOfType(ASTID.class);
        if (id != null) {
            if (node.getImage().length() < min) {
                addViolation(data, node, node.getImage());
            }
        }
        return data;
    }

}
