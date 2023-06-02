package net.sourceforge.pmd.examples.maven.simpleproject;

public class Main {

    // UnusedPrivateField
    private String unusedField;

    public static void main(String[] args) {
        System.out.println("Hello World!");

        // EmptyControlStatement
        if (args.length == 0);
    }
}
