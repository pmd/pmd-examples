# Java Custom Rules without maven

Just with `javac` and `jar`.

## Prepare environment

1.  Create a directory `code` in your home directory:

        $ mkdir ~/code
        $ cd ~/code

    For the following steps, it is assumed, you are in that directory.

2.  Get the binary distribution of PMD from <https://github.com/pmd/pmd/releases>, e.g. pmd-dist-7.0.0-rc3-bin.zip:

        $ wget https://github.com/pmd/pmd/releases/download/pmd_releases%2F7.0.0-rc3/pmd-dist-7.0.0-rc3-bin.zip

3.  Extract the zip file, e.g. `unzip pmd-dist-7.0.0-rc3-bin.zip`

        $ unzip pmd-dist-7.0.0-rc3-bin.zip

4.  Now, the pmd binaries are installed under `~/code/pmd-bin-7.0.0-rc3`.

    This also includes the libraries in `~/code/pmd-bin-7.0.0-rc3/lib`.

## Get the code from this example and build it

1.  Clone the sample repo

        $ cd ~/code
        $ git clone https://github.com/pmd/pmd-examples.git pmd-examples
        $ cd pmd-examples/custom-rules/plain-java

2.  Prepare the output directory for the compilation step

        $ mkdir build

3.  Compile the sources, that are located in `src`, using the PMD libraries

        $ javac -d build -cp '../../../pmd-bin-7.0.0-rc3/lib/*' src/*.java

4.  Create a jar file

        $ cp src/myrule.xml build/
        $ jar -c -f custom-rule-example.jar -C build .

## Use the custom rule with PMD CLI

1.  Run PMD with the just created jar file on the classpath, e.g. on the folder `testsrc`

        $ CLASSPATH=custom-rule-example.jar ../../pmd-bin-7.0.0-rc3/bin/pmd check --no-cache -f text -d testsrc -R myrule.xml
        /home/andreas/code/pmd-examples/testsrc/Test.java:2:	Avoid the identifier foo.
