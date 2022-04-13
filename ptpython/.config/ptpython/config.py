"""
Configuration for ``ptpython``.
"""

__all__ = ["configure"]


def configure(repl):
    """
    Configuration method. This is called during the start-up of ptpython.
    :param repl: `PythonRepl` instance.
    """
    repl.vi_mode = True
    repl.use_code_colorscheme("gruvbox-dark")
    repl.highlight_matching_parenthesis = True
