#!/usr/bin/env python
# coding: UTF-8

import os

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
