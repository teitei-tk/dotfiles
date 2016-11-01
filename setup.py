#!/usr/bin/env python
# coding: UTF-8

import sys
import os
import subprocess

EXCLUDE_LIST = [".git", "README.md", "setup.py", ".gitmodules", "Brewlist.txt"]


class Installer(object):
    @property
    def home_dir(self):
        return os.environ['HOME']

    @property
    def script_dir(self):
        return os.path.dirname(os.path.abspath(__file__))

    def run(self):
        print("Start cmd setup")

        self.dotfiles()

        print("All Task is Successfully")

    def dotfiles(self):
        print("Processing dotfiles setup..")

        dotfiles = os.listdir(self.script_dir)
        for dotfile in dotfiles:
            if dotfile in EXCLUDE_LIST:
                continue

            source = "{0}/{1}".format(self.script_dir, dotfile)
            dest = "{0}/{1}".format(self.home_dir, dotfile)

            if os.path.lexists(dest):
                os.rename(dest, "/tmp/{0}".format(dotfile.replace(".", "")))

            if not os.path.exists(dest):
                os.symlink(source, dest)

        print("Finished Successfully")

if __name__ == "__main__":
    Installer().run()
