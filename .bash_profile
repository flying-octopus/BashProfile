#  ---------------------------------------------------------------------------
#  Bash profile courtesy of https://natelandau.com/my-mac-osx-bash_profile/
#
#  Sections:
#  1.  Environment Configuration
#  1.a Brew Configuration
#  2.  Make Terminal Better (remapping defaults and adding functionality)
#  3.  File and Folder Management
#  4.  Searching
#  5.  Process Management
#  6.  Networking
#  7.  System Operations & Information
#  8.  Reminders & Notes
#
#  ---------------------------------------------------------------------------

#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Colours! Generated using method mentioned in link below.
#   https://misc.flogisoft.com/bash/tip_colors_and_formatting -- This shows how to format colours and style of font!
#   Shell script that visualizes colours is called 256-colors.sh
#   ------------------------------------------------------------
    green="\[\033[0;32m\]"
    blue="\[\033[0;34m\]"
    yellow="\[\033[0;93m\]"
    reset="\[\033[0m\]"
    pink="\[\033[0;95m\]"
    colour="\[\033[0m\]"
    light_green="\[\e[38;5;121m\]"
    bluish="\[\e[1m\[\e[38;5;105m\]"
    light_yellow="\[\e[93m\]"
    lighter_yellow="\[\e[33;1m\]"
    macos_orange="\[\e[38;5;222m\]"
     
#   Enable tab completion for git 
#   ------------------------------------------------------------   
    source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash						# File included in github
		
#   Change Prompt
#   ------------------------------------------------------------
    source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh								# You need to import that for (__git_ps1) to work properly, file included in github
    export GIT_PS1_SHOWDIRTYSTATE=1																# Required for git
    export PS1="$macos_orange\u$light_green\$(__git_ps1)$reset$bluish \W$reset $ "
#   export PS1='\[\e]0;\u@\h: \w\a\]\[\e[32;1m\]\u@\h:\w \[\e[33;1m\]$(__git_ps1 "[%s] ")\[\e[32;1m\]\$ \[\e[0m\]'  # Other version of PS1
    
#   '\u' adds the name of the current user to the prompt
#   '\$(__git_ps1)' adds git-related stuff
#   '\W' adds the name of the current directory
    
#   Set Paths
#   ------------------------------------------------------------
#   export PATH="/usr/local/opt/gettext/bin:$PATH"
#   export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin
#   export PATH="PATH:/directory" 

#   Source custom commands/programs
#   ------------------------------------------------------------
#   source /directory/to/custom/commands

#   Set Default Editor (change 'subl' to the editor of your choice)
#   ------------------------------------------------------------
    export EDITOR="/usr/local/bin/subl -w"

#   Set Visual Editor (to edit crontab)
#   ------------------------------------------------------------    
    export VISUAL="/usr/local/bin/subl"

#   Set default blocksize for ls, df, du
#   from http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
    export BLOCKSIZE=1k

#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#   ------------------------------------------------------------
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad

#   -------------------------------
#   1.a BREW CONFIGURATION
#   -------------------------------

#   Disable the beer emoji in Homebrew
#   from https://evanhahn.com/disable-homebrew-emoji/
#   ------------------------------------------------------------
    export HOMEBREW_NO_EMOJI=1

#   For compilers to find gettext you may need to set:              
#   gettext is keg-only, which means it was not symlinked into /usr/local,
#   because macOS provides the BSD gettext library & some software gets confused if both are in the library path.
#   ------------------------------------------------------------    
    export LDFLAGS="-L/usr/local/opt/gettext/lib"
    export CPPFLAGS="-I/usr/local/opt/gettext/include"


#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------
alias sudo='sudo '                                                          # Make sudo aplicable for aliases
alias mkdir='mkdir -pv'                     				                # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       				                # Preferred 'ls' implementation
alias less='less -FSRXc'                    				                # Preferred 'less' implementation
alias ~='cd ~/'									                            # Change directory to home
alias cd..='cd ../'                         				                # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           				                # Go back 1 directory level
alias .2='cd ../../'                        				                # Go back 2 directory levels
alias .3='cd ../../../'                     				                # Go back 3 directory levels
alias .4='cd ../../../../'                  	   			                # Go back 4 directory levels
alias .5='cd ../../../../../'               				                # Go back 5 directory levels
alias .6='cd ../../../../../../'            				                # Go back 6 directory levels
alias edit=subl                           				                    # edit:         Opens any file in sublime editor
alias finder='open -a Finder ./'                 			                # finder:       Opens current directory in MacOS Finder
alias which='type -all'                     				                # which:        Find executables
alias showPATH='echo -e ${PATH//:/\\n}'         		                    # path:         Echo all executable Paths
alias show_options='shopt'                  				                # Show_options: display bash options settings
alias fix_stty='stty sane'                  				                # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   				                # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        				                # mcd:          Makes new Dir and jumps inside
trash(){ x=''; [[ $1 = -s ]] && { x=sudo; shift; }; $x mv "$@" ~/.Trash; }   # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    				                # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    				                # DT:           Pipe content to file on MacOS Desktop
alias wdi='cd ~/Documents/computer_science/wdi/cwiczenia'                   # wdi:          Change directory to .../wdi/cwiczenia
alias github='cd ~/Documents/computer_science/GitHub'                       # github:       Change directory to .../computer_science/GitHub
alias hide='chflags hidden'							                        # hide          Hides a file (only applies to finder)
alias nohide='chflags nohidden'						                        # nohide        Reveals a hidden file (only applies to finder)

#   -------------------------------
#   3. FILE AND FOLDER MANAGEMENT
#   -------------------------------

zipf () { zip -r "$1".zip "$1" ; }           			   		   					                   # zipf:         To create a ZIP archive of a folder
zipfe () { zip -er "$1".zip "$1" ; } 	    				 		 					               # zipfe 	       To create an ecrypted ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'       			 		 					                   # numFiles:     Count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'         				 		 					               # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         				 							               # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'					 		 					                   # make10mb:     Creates a file of 10mb size (all zeros)
enc () { openssl enc -aes-256-cbc -e -in "$1" -out enc_"$1" ; rm -fr "$1" ; mv enc_"$1" "$1" ; }       # enc: 	       Encrypts a file with password using 256-bit encryption
dec () { openssl enc -aes-256-cbc -d -in "$1" -out dec_"$1" ; rm -fr "$1" ; mv dec_"$1" "$1" ; }       # dec:		   Decrypts a 256-bit encrypted file
preview () { open -a Preview "$1" ; }												                   # preview:      Opens a file with a "Preview.app"

#   cdf:  'Cd's to frontmost window of MacOS Finder
#   ------------------------------------------------------
    cdf () {
        currFolderPath=$( /usr/bin/osascript <<EOT
            tell application "Finder"
                try
            set currFolder to (folder of the front window as alias)
                on error
            set currFolder to (path to desktop folder as alias)
                end try
                POSIX path of currFolder
            end tell
EOT
        )
        echo "Changing directory to \"$currFolderPath\""
        cd "$currFolderPath"
    }

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }


#   ---------------------------
#   4. SEARCHING
#   ---------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
    spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }


#   ---------------------------
#   5. PROCESS MANAGEMENT
#   ---------------------------

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
    findPid () { lsof -t -c "$@" ; }

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
    alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
    alias ttop="top -R -F -s 10 -o rsize"

#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
    my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }


#   ---------------------------
#   6. NETWORKING
#   ---------------------------

alias myip='dig +short myip.opendns.com @resolver1.opendns.com'                 	# myip:         Public facing IP Address
alias netCons='lsof -i'                             							# netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            							# flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             							# lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   							# lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   							# lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              							# ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              							# ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        							# openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  							# showBlocked:  All ipfw rules inc/ blocked IPs

#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }


#   ---------------------------------------
#   7. SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------

    alias mountReadWrite='/sbin/mount -uw /'    # mountReadWrite:   For use when booted into single-user

#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
    alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
    alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
    alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

#   chargingSoundEnable:   Enables the sound while connecting a charger to the computer
#   chargingSoundDisable:  Disables the sound while connecting a charger to the computer
#   -------------------------------------------------------------------
    alias chargingSoundEnable='defaults write com.apple.PowerChime ChimeOnAllHardware -bool true; open /System/Library/CoreServices/PowerChime.app &'
    alias chargingSoundDisable='defaults write com.apple.PowerChime ChimeOnAllHardware -bool false; open /System/Library/CoreServices/PowerChime.app &'

#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
#   -----------------------------------------------------------------------------------
    alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

#   ---------------------------------------
#   8. REMINDERS & NOTES
#   ---------------------------------------
