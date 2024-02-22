package net.sourceforge.pmd.examples.java.rules;

import org.checkerframework.checker.nullness.qual.NonNull;

import net.sourceforge.pmd.lang.java.ast.ASTVariableId;
import net.sourceforge.pmd.lang.java.rule.AbstractJavaRule;
import net.sourceforge.pmd.lang.rule.RuleTargetSelector;
import net.sourceforge.pmd.properties.PropertyDescriptor;
import net.sourceforge.pmd.properties.PropertyFactory;

public class MyRule extends AbstractJavaRule {

    private static final PropertyDescriptor<String> BAD_NAME = PropertyFactory.stringProperty("badName")
            .defaultValue("foo")
            .desc("The variable name that should not be used.")
            .build();

    public MyRule() {
        definePropertyDescriptor(BAD_NAME);
    }

    @Override
    protected @NonNull RuleTargetSelector buildTargetSelector() {
        return RuleTargetSelector.forTypes(ASTVariableId.class);
    }

    @Override
    public Object visit(ASTVariableId node, Object data) {
        String badName = getProperty(BAD_NAME);
        if (badName.equals(node.getName())) {
            asCtx(data).addViolation(node, node.getName());
        }
        return data;
    }
}
