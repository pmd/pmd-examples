package com.github.pmd.customruleexample;

import net.sourceforge.pmd.testframework.SimpleAggregatorTst;

public class MyRuleTest extends SimpleAggregatorTst {

    @Override
    protected void setUp() {
        addRule("rulesets/java/myrule.xml", "MyRule");
    }
}
