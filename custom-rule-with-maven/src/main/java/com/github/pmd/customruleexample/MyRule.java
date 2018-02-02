package com.github.pmd.customruleexample;

import net.sourceforge.pmd.lang.java.ast.ASTVariableDeclaratorId;
import net.sourceforge.pmd.lang.java.rule.AbstractJavaRule;

public class MyRule extends AbstractJavaRule {

    @Override
    public Object visit(ASTVariableDeclaratorId node, Object data) {
        if (node.hasImageEqualTo("foo")) {
            addViolationWithMessage(data, node, "Avoid the identifier 'foo'.");
        }
        return super.visit(node, data);
    }
}
