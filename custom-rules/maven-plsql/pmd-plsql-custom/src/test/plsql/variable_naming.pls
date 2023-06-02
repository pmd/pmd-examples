CREATE OR REPLACE
PACKAGE "test_schema"."test_package"
IS

-- good examples

-- constants
pi          CONSTANT NUMBER := 3.1415;
-- package-level variables
current_pi  NUMBER := 3.1415;


-- bad examples
CURRENT_VAL NUMBER := 3;
END;
/
