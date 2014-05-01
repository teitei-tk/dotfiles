#!/usr/bin/env python
# coding: UTF-8

import os
import subprocess

class Setup(object):
    exclude_list = [".git", "README.md", "setup.py", "fabfile.py"]

    def __init__(self):
        self.home_dir = os.environ['HOME']
        self.script_path = os.path.dirname( os.path.abspath(__file__) )

    def setup_for_vim(self):
        pass

    def setup_for_dotfiles(self):
        print "start Dotfiles setup"

        dotfiles = os.listdir('./')
        for dotfile in dotfiles:
            if self.exclude_list in dotfile:
                continue

            source_path = self.script_path + "/" + dotfile
            copy_path = self.home_dir + "/." + dotfile

            if os.path.isfile( copy_path ):
                # backup
                backup_path = self.home_dir + "/_" + dotfile
                os.rename( copy_path, backup_path )

                print "backup %s -> %s" % ( copy_path, backup_path )

            os.symlink( source_path, copy_path )

        print "\nDone"

    def setup_for_shell(self):
        pass


def run():
    pass

if __name__ == "__main__":
    print 'Dotfiles Setup Start...\n'

    sourceDirPath = os.path.dirname( os.path.abspath(__file__) )
    homeDirPath = os.environ['HOME']

    dotfiles = os.listdir('./')
    for dotfile in dotfiles:
        if dotfile == '.git' or dotfile == 'README.md' or dotfile == 'setup.py':
            continue

        sourcePath = sourceDirPath + "/" + dotfile
        copyPath = homeDirPath + "/." + dotfile

        if os.path.isfile( copyPath ):
            # backup
            backupPath = homeDirPath + "/_" + dotfile
            os.rename( copyPath, backupPath )

            print "backup %s -> %s" % ( copyPath, backupPath )

        os.symlink( sourcePath, copyPath )

    print "\nDone"

if __name__ == "__main__":
    run()
