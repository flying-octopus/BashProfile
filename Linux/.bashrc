#  ---------------------------------------------------------------------------
#  Bash profile courtesy of https://natelandau.com/my-mac-osx-bash_profile/
#
#  Sections:
#  1.  Environment Configuration
#  2.  Make Terminal Better (remapping defaults and adding functionality)
#  3.  File and Folder Management
#  4.  Searching
#  5.  Process Management
#  6.  Networking
#  7.  Reminders & Notes
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
    source ~/.git-completion.bash					                                                       	# File included in repository enables tab completion for git commands
		
#   Change Prompt
#   ------------------------------------------------------------
    source ~/.git-prompt.sh							                                                       	# You need to import that for (__git_ps1) to work properly, file included in repository
    export GIT_PS1_SHOWDIRTYSTATE=1																            # Required for git
    export PS1="$light_green\u$lighter_yellow\$(__git_ps1)$reset$bluish \W$reset $ "
#   export PS1='\[\e]0;\u@\h: \w\a\]\[\e[32;1m\]\u@\h:\w \[\e[33;1m\]$(__git_ps1 "[%s] ")\[\e[32;1m\]\$ \[\e[0m\]'  # Other version of PS1
    
#   '\u' adds the name of the current user to the prompt
#   '\$(__git_ps1)' adds git-related stuff
#   '\W' adds the name of the current directory
    
#   Set Paths
#   ------------------------------------------------------------
#   export PATH="/directory:$PATH"                                  # Exports a path in front (higher priority)
#   export PATH=/path1:/path2:/path3:/path4                         # Exports all the paths
#   export PATH="$PATH:/directory"                                  # Exports a path in end (lower priority)

#   Source custom commands/programs
#   ------------------------------------------------------------
#   source /directory/to/custom/commands

#   Set Default Editor (change 'nano' to the editor of your choice)
#   ------------------------------------------------------------
    export EDITOR="/usr/local/bin/nano -w"

#   Set Visual Editor (to edit crontab)
#   ------------------------------------------------------------    
    export VISUAL="/usr/local/bin/nano"

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

#   Set the terminal programs language to english
#   ------------------------------------------------------------ 
    export LANG=en


#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------
alias sudo='sudo '                                                                            # Make sudo aplicable for aliases
alias mkdir='mkdir -pv'                     				                                  # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       				                                  # Preferred 'ls' implementation
alias less='less -FSRXc'                    				                                  # Preferred 'less' implementation
alias ~='cd ~/'									                                              # Change directory to home
alias cd..='cd ../'                         				                                  # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           				                                  # Go back 1 directory level
alias .2='cd ../../'                        				                                  # Go back 2 directory levels
alias .3='cd ../../../'                     				                                  # Go back 3 directory levels
alias .4='cd ../../../../'                  	   			                                  # Go back 4 directory levels
alias .5='cd ../../../../../'               				                                  # Go back 5 directory levels
alias .6='cd ../../../../../../'            				                                  # Go back 6 directory levels
alias edit=nano                            				                                      # edit:         Opens any file in sublime editor
alias finder='xdg-open'                 			                                          # finder:       Opens current directory in Linux GUI file manager
alias which='type -all'                     				                                  # which:        Find executables
alias show_path='echo -e ${PATH//:/\\n}'         		                                      # path:         Echo all executable Paths
alias show_options='shopt'                  				                                  # Show_options: display bash options settings
alias cic='set completion-ignore-case On'   				                                  # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        				                                  # mcd:          Makes new Dir and jumps inside
trash(){ x=''; [[ $1 = -s ]] && { x=sudo; shift; }; $x mv "$@" ~/.local/share/Trash/files; }  # trash:        Moves a file to the Ubuntu trash
alias DT='tee ~'    				                                                          # DT:           Pipe content to file in home directory

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

alias myip='dig +short myip.opendns.com @resolver1.opendns.com'                 # myip:         Public facing IP Address
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
#   7. REMINDERS & NOTES
#   ---------------------------------------
