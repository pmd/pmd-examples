import net.sourceforge.pmd.lang.java.ast.ASTVariableId;
import net.sourceforge.pmd.lang.java.rule.AbstractJavaRule;

public class MyRule extends AbstractJavaRule {

    @Override
    public Object visit(ASTVariableId node, Object data) {
        if ("foo".equals(node.getName())) {
            asCtx(data).addViolationWithMessage(node, "Avoid the identifier 'foo'.");
        }
        return super.visit(node, data);
    }
}
