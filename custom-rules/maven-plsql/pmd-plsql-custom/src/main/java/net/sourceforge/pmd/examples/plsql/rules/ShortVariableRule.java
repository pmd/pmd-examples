/**
 * BSD-style license; for more info see http://pmd.sourceforge.net/license.html
 */

package net.sourceforge.pmd.examples.plsql.rules;

import org.checkerframework.checker.nullness.qual.NonNull;

import net.sourceforge.pmd.lang.plsql.ast.ASTID;
import net.sourceforge.pmd.lang.plsql.ast.ASTVariableOrConstantDeclaratorId;
import net.sourceforge.pmd.lang.plsql.rule.AbstractPLSQLRule;
import net.sourceforge.pmd.lang.rule.RuleTargetSelector;
import net.sourceforge.pmd.properties.NumericConstraints;
import net.sourceforge.pmd.properties.PropertyDescriptor;
import net.sourceforge.pmd.properties.PropertyFactory;

public class ShortVariableRule extends AbstractPLSQLRule {

    private static final PropertyDescriptor<Integer> MINIMUM_LENGTH = PropertyFactory.intProperty("minimumLength")
            .desc("Number of characters that are required as a minimum for a variable name.")
            .defaultValue(3)
            .require(NumericConstraints.inRange(1, 100))
            .build();

    public ShortVariableRule() {
        definePropertyDescriptor(MINIMUM_LENGTH);
    }

    @Override
    protected @NonNull RuleTargetSelector buildTargetSelector() {
        return RuleTargetSelector.forTypes(ASTVariableOrConstantDeclaratorId.class);
    }

    @Override
    public Object visit(ASTVariableOrConstantDeclaratorId node, Object data) {
        Integer min = getProperty(MINIMUM_LENGTH);

        ASTID id = node.firstChild(ASTID.class);
        if (id != null) {
            if (node.getImage().length() < min) {
                asCtx(data).addViolation(node, node.getImage());
            }
        }
        return data;
    }

}
