"FAST-Python declares its FAST dependency with the repository github://moosetechnology/FAST:v3/src. Since the spec above already loaded baseline 'FAST' from this checkout, Metacello reuses that local registration: the Python tests run against the branch under test and not against the released FAST."

Metacello new
    baseline: 'FASTPython';
    repository: 'github://moosetechnology/FAST-Python:main/src';
    loads: #( 'default' 'Tests' );
    load