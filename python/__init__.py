# -*- coding: utf-8 -*-

import glob
import sys
import os.path
import importlib
import re

pathThisFile = os.path.dirname(os.path.abspath(__file__))

def loadModule():
    myself = sys.modules[__name__]
    mod_paths = glob.glob(__name__ + '/**/*.py')
    for py_file in mod_paths:
        mod_name = os.path.splitext(py_file)[0]
        if re.search(".*__init__.*",mod_name) is None:
            mod = importlib.import_module(mod_name.replace('/', '.'))
            for m in mod.__dict__.keys():
                if not m in ['__builtins__', '__doc__', '__file__', '__name__', '__package__']:
                    myself.__dict__[m] = mod.__dict__[m]
loadModule()
