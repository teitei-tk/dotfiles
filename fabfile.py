# coding: UTF-8

from setup import Installer

install = Installer()
def setup_for_dotfiles():
    install.setup_for_dotfiles()

def setup_for_vim():
    install.setup_for_vim()

def setup_for_shell():
    install.setup_for_shell()

def setup_for_all():
    install.setup_for_dotfiles()
    install.setup_for_shell()
    install.setup_for_vim()
