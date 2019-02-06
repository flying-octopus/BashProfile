#!/bin/sh
cp git-completion.bash //Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
cp git-prompt.sh /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
cp .bash_profile ~/.bash_profile
source ~/.bash_profile


# Comment to line 2 and 3 : You need to edit that script to check for existence of this files and if they don't exist then copy them to this directories!!