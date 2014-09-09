#!/usr/bin/env python
# coding: UTF-8
import os
import subprocess

EXCLUDE_LIST = [".git", "README.md", "setup.py", "fabfile.py"]

class DotFilesInstaller(object):
    def __init__(self):
        self.home_dir = os.environ['HOME']
        self.script_path = os.path.dirname( os.path.abspath(__file__) )
    
    @classmethod
    def do(self):
        instance = DotFilesInstaller()

        instance.setup_for_dotfiles()
        instance.setup_for_shell()
        instance.setup_for_vim()

    def setup_for_vim(self):
        print "start vim setting\n"

        process_list = [
            "mkdir -p %s/.vim/bundle" % ( self.home_dir ),
            "mkdir -p %s/.vim/vimundo" % ( self.home_dir ),
            "git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim",
            "vim +NeoBundleInstall +q"
            ]
        [subprocess.call(cmd, shell=True) for cmd in process_list]

        print "\nDone"

    def setup_for_dotfiles(self):
        print "start Dotfiles setup"

        dotfiles = os.listdir('./')
        for dotfile in dotfiles:
            if dotfile in EXCLUDE_LIST:
                continue

            source_path = self.script_path + "/" + dotfile
            copy_path = self.home_dir + "/." + dotfile

            if os.path.isfile( copy_path ):
                # backup
                backup_path = self.home_dir + "/_" + dotfile
                os.rename( copy_path, backup_path )

                print "backup %s -> %s" % ( copy_path, backup_path )

            if not os.path.exists(copy_path):
                os.symlink( source_path, copy_path )

        print "\nDone"

    def setup_for_shell(self):
        process_list = [
            "sudo yum install -y wget zsh vim",
            "wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash --no-check-certificate",
            "wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh --no-check-certificate",
            "mv %s/git-completion.bash %s/.git-completion.bash && rm %s/git-completion.bash" % ( self.script_path, self.home_dir, self.script_path ),
            "mv %s/git-prompt.sh %s/.git-prompt.sh && rm %s/git-prompt.sh" % ( self.script_path, self.home_dir, self.script_path ),
            "git clone https://github.com/riywo/anyenv.git ~/.anyenv",
            "sudo chsh -s /bin/zsh"
            ]
        [subprocess.call(cmd, shell=True) for cmd in process_list]

if __name__ == "__main__":
    DotFilesInstaller.do()
