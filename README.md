# classic_objy_mt
Multi-threaded test for Classic Objectivity/DB C++ APIs

This test will create 2 threads and create two types of objects in own container in each thread. The variable *THREAD_COUNT* in src/main.cpp control the number of threads created.

# Build the test
1. Make sure you have Objectivity/DB installed and configured.
2. Run recreatefd.bat from the data direcotry to create an empty federation to be configured.
3. In the IDE run build to create the schema and generate files needed for access with Objectivity/DB APIs.
    * although there are dependencies setup for the DDL files, for some reason they are not working, so you might get errors if you just run the build. The best is to compile each file in the following order.
        * object.ddl
        * DbfObject.ddl
        * DbfNameObject.ddl
        * DbfEditableObject.ddl
        * DbsSite.ddl

# Run the test
You can runt he test from the main project directory using either *debug/mt_test.exe* or *release/mt_test.exe*. It assumes that the FD boot file is data/testfd.boot, otherwise you need to edit src/main.cpp to point to the correct file path.

