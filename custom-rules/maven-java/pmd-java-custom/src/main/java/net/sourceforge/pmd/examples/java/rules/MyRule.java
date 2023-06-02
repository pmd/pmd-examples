package net.sourceforge.pmd.examples.java.rules;

import net.sourceforge.pmd.lang.java.ast.ASTVariableDeclaratorId;
import net.sourceforge.pmd.lang.java.rule.AbstractJavaRule;
import net.sourceforge.pmd.properties.StringProperty;

public class MyRule extends AbstractJavaRule {

    private static final StringProperty BAD_NAME = StringProperty.named("badName")
            .defaultValue("foo")
            .desc("The variable name that should not be used.")
            .uiOrder(1.0f)
            .build();

    public MyRule() {
        definePropertyDescriptor(BAD_NAME);
        addRuleChainVisit(ASTVariableDeclaratorId.class);
    }

    @Override
    public Object visit(ASTVariableDeclaratorId node, Object data) {
        String badName = getProperty(BAD_NAME);
        if (node.hasImageEqualTo(badName)) {
            addViolation(data, node, node.getImage());
        }
        return data;
    }
}
