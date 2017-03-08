#!/usr/bin/env python

from sys import argv
import json

def unpack_arguments(argv_in):
    param_file = argv[1]
    files = argv[2:]
 
    with open(param_file, "r") as f:
        kwargs = json.load(f)
    kwargs['files'] = files
    return kwargs

args = unpack_arguments(argv)

from sparks_pif_converters.XRD import raw_to_pif
from pypif import pif
for fname in args['files']:
    pifs = raw_to_pif(fname)
    with open("output.json", "w") as f:
        pif.dump(pifs, f)

out_files = ["output.json"]

with open("output_files.json", "w") as f:
    json.dump(out_files, f)
