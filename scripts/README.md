# Test Scripts

Test scripts in this directory use the past MTL monitoring package python-monitors to test generated properties over the small suite. Please follow the procedure below to perform these tests.

i) Install prerequisites

       pip install pyyaml
       pip install antlr4-python3-runtime
       pip install python-intervals 
       pip install python-monitors 

ii) Clone timescales

       git clone https://github.com/doganulus/timescales.git
       cd timescales

1) Test past properties (All properties should pass)

        make small
        python scripts/test_past_by_python_monitors.py

2) Test failing-end feature (All properties should fail)

       make small FLAGS=--failing-end
       python scripts/test_past_by_python_monitors.py

3) Test future properties (All properties should pass)

       make small FLAGS=--future
       python scripts/test_future_by_python_monitors.py

4) Test future properties with --failing-end option (All properties should fail)

       make small FLAGS="--future --failing-end"
       python scripts/test_future_by_python_monitors.py
