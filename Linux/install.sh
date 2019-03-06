#!/bin/bash
[[ -e ~/.git-completion.bash ]] || cp git-completion.bash ~/.git-completion.bash
[[ -e ~/.git-prompt.sh ]] || cp git-prompt.sh ~/.git-prompt.sh
cp -f .bashrc ~/.bashrc
source ~/.bashrc


# Comment to line 2 and 3: Part before || checks if this files already exists. If they do the second part won't be executed. If they don't the second part WILL be executed.