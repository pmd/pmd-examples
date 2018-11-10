CREATE OR REPLACE
PACKAGE "test_schema"."test_package"
IS

-- good examples

-- constants
max_file_count  CONSTANT NUMBER := 42;
-- package-level variables
current_pi  NUMBER := 3.1415;


-- bad examples
i NUMBER := 3;
END;
/
