# Test Scripts

Test scripts in this directory use the past MTL monitoring package python-monitors to test generated properties over the small suite. Please follow the procedure below to perform these tests.

### Install Prerequistes

    pip install pyyaml
    pip install antlr4-python3-runtime
    pip install python-intervals 
    pip install python-monitors 

### Clone Timescales

    git clone https://github.com/doganulus/timescales.git
    cd timescales

### Test Past Properties

    make small
    python scripts/test_past_by_python_monitors.py

All properties should pass.

### Test failing-end feature

    make small FLAGS=--failing-end
    python scripts/test_past_by_python_monitors.py

All properties should fail.

### Test future properties over reversed traces

    make small FLAGS=--future
    python scripts/test_future_by_python_monitors.py

All properties should pass.