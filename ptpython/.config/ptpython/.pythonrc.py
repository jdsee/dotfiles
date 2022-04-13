import os
import sys
from importlib import import_module

sys.path.append(os.path.expanduser("~/.config/ptpython/config.py"))

config = import_module("config")


try:
    from ptpython.repl import embed
except ImportError:
    print("ptpython is not available: falling back to standard prompt")
else:
    sys.exit(embed(globals(), locals(), configure=config.configure))
