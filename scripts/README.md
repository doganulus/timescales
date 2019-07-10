# Test Scripts

## Install Prerequistes

    pip install pyyaml
    pip install antlr4-python3-runtime
    pip install python-intervals 
    pip install python-monitors 

## Clone Timescales

    git clone https://github.com/doganulus/timescales.git
    cd timescales

## Test Past

    make small
    python scripts/test_past_by_python_monitors.py

All properties should pass.

## Test FailingEnd

    make small FLAGS=--failing-end
    python scripts/test_past_by_python_monitors.py

All properties should fail.

## Test Future

    make small FLAGS=--future
    python scripts/test_future_by_python_monitors.py

All properties should pass.