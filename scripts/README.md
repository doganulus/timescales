# Test Scripts

Test scripts in this directory use the past MTL monitoring package python-monitors to test generated properties over the small suite. Please follow the procedure below to perform these tests.

1) Install prerequisites

       pip install pyyaml
       pip install antlr4-python3-runtime
       pip install python-intervals 
       pip install python-monitors 

2) Clone timescales

       git clone https://github.com/doganulus/timescales.git
       cd timescales

3) Test past properties (All properties should pass)

        make small
        python scripts/test_past_by_python_monitors.py

4) Test failing-end feature (All properties should fail)

       make small FLAGS=--failing-end
       python scripts/test_past_by_python_monitors.py

5) Test future properties over reversed traces (All properties should pass)

       make small FLAGS=--future
       python scripts/test_future_by_python_monitors.py

