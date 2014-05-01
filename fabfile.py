# coding: UTF-8
try:
    import fabfile
except:
    print "try 'pip install fabric'"
    import sys
    sys.exit()

from setup import Installer

install = Installer()
def setup_for_dotfiles():
    """
    setup dotfiles
    """
    install.setup_for_dotfiles()

def setup_for_vim():
    """
    setup vim packages
    """
    install.setup_for_vim()

def setup_for_shell():
    """
    setup shell
    """
    install.setup_for_shell()

def setup_for_all():
    """
    setup all packages
    """
    install.setup_for_dotfiles()
    install.setup_for_shell()
    install.setup_for_vim()
