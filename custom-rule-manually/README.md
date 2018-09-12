# Skeleton: Custom PMD rule with javac and jar

## Prepare environment

1.  Create a directory `code` in your home directory:

        $ mkdir ~/code
        $ cd ~/code

    For the following steps, it is assumed, you are in that directory.

2.  Get the binary distribution of PMD from <https://github.com/pmd/pmd/releases>, e.g. pmd-bin-6.0.1.zip:

        $ wget https://github.com/pmd/pmd/releases/download/pmd_releases%2F6.0.1/pmd-bin-6.0.1.zip

3.  Extract the zip file, e.g. `unzip pmd-bin-6.0.1.zip`

        $ unzip pmd-bin-6.0.1.zip

4.  Now, the pmd binaries are installed under `~/code/pmd-bin-6.0.1`.

    This also includes the libraries in `~/code/pmd-bin-6.0.1/lib`.

## Get the code from this example and build it

1.  Clone the sample repo

        $ cd ~/code
        $ git clone https://github.com/pmd/pmd-examples.git pmd-examples
        $ cd pmd-examples/custom-rule-manually

2.  Prepare the output directory for the compilation step

        $ mkdir build

3.  Compile the sources, that are located in `src`, using the PMD libraries

        $ javac -d build -cp '../../pmd-bin-6.0.1/lib/*' src/*.java

4.  Create a jar file

        $ cp src/myrule.xml build/
        $ jar -c -f custom-rule-example.jar -C build .

## Use the custom rule with PMD CLI

1.  Run PMD with the just created jar file on the classpath, e.g. on the folder `testsrc`

        $ CLASSPATH=custom-rule-example.jar ../../pmd-bin-6.0.1/bin/run.sh pmd -f text -d testsrc -R myrule.xml
        Feb. 08, 2018 3:14:02 NACHM. net.sourceforge.pmd.cache.NoopAnalysisCache <init>
        WARNUNG: This analysis could be faster, please consider using Incremental Analysis: https://pmd.github.io/pmd-6.0.1/pmd_userdocs_getting_started.html#incremental-analysis
        /home/andreas/code/pmd-examples/custom-rule-manually/testsrc/Test.java:2:	Avoid the identifier foo.
