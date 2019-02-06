#!/bin/sh
[[ -e /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash ]] || cp git-completion.bash /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
[[ -e /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh ]] || cp git-prompt.sh /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
cp -f .bash_profile ~/.bash_profile
source ~/.bash_profile


# Comment to line 2 and 3: Part before || checks if this files already exists. If they do the second part won't be executed. If they don't the second part WILL be executed.