# citrine-python-compute
DICE wrapper for Python compute units

## Components

### exec.sh

This is a thin wrapper that is called by the ruby wrapper and simply selects which language parser to select, `yaww.py` in this case.

### yaww.py

This is a python-specific wrapper that unpacks the arguments from the arguments file (first argument), adds the list of files (second argument), and calls the python conversion script using keywords arguments.  For example, `pif-dft` would be called in `yaww.py` as something like:
```python
from dfttopif import directory_to_pif
directory_to_pif(**args)
```

### convert.py

This is a dummy stand-in for whatever the real converter logic is.  It is not part of any real converter stacks; it is just an example.
