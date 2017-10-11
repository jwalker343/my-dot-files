#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.   Definitions
#  2.   Git Integration
#  3.   Environment Configuration
#  4.   Tab Completion
#  5.   Added Functions
#  6.   Aliases
#
#  ---------------------------------------------------------------------------

#   -------------------------------
#   1.  DEFINITIONS
#   -------------------------------


CYAN="\033[0;36m"
GREEN="\033[0;32m"
NORMAL="\033[0m"
PURPLE="\033[0;35m"
RED="\033[1;31m"
RESET="\[\017\]"
WHITE="\033[1;37m"
YELLOW="\033[1;33m"

SMILEY="${GREEN}:)${NORMAL}"
FROWNY="${RED}:(${NORMAL}"
TRUELASTERROR=0
PROMPT_GIT_STATUS="printf \"\$(git-branch-prompt)\""
PROMPT_PREVIOUS_STATUS="if [ \$TRUELASTERROR = 0 ]; then echo \"${SMILEY} \"; else echo \"${FROWNY} \"; fi"
PROMPT_TRUELASTERROR="export TRUELASTERROR=\$?"





#   -------------------------------
#   2.  GIT INTEGRATION
#   -------------------------------


function git-branch-name {
 git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3,4
}


function git-branch-prompt {
 local branch=$(git-branch-name)

 if [ $branch ]; then
   local branch_color="${PURPLE}"     # Default to green
   local ahead_behind=""             # Default to empty ahead/behind numbers

   # Check to see if there are any staged files
   if git status | grep --quiet "Changes to be committed:"; then
     local branch_color="${GREEN}";
   # Check to see if there are any modified files
   elif git status | grep --quiet "Changes not staged for commit:"; then
     local branch_color="${RED}";
   # Check to see if there are any untracked files
   elif git status | grep --quiet "Untracked files:"; then
     local branch_color="${YELLOW}";
   fi

   local branch_rev=$(git rev-parse --abbrev-ref HEAD 2>/dev/null);

   if [ "HEAD" != "${branch_rev}" ]; then
     local remote=$(git config branch.${branch_rev}.remote 2>/dev/null);
     local merge_branch=$(git config branch.${branch_rev}.merge 2>/dev/null| cut -d / -f 3);
     local count=$(git rev-list --left-right --count ${branch_rev}...$remote/$merge_branch 2>/dev/null| tr -s '\t' '|');

     if [ "${count}" -a "0|0" != "${count}" ]; then
       local ahead="${GREEN}$(echo ${count} | cut -d\| -f1)${NORMAL}";
       local behind="${RED}$(echo ${count} | cut -d\| -f2)${NORMAL}";

       local ahead_behind=" ${ahead}|${behind}";
     fi
   fi

   echo "${branch_color}[${branch}${ahead_behind}${branch_color}]${NORMAL} ";
   #printf "${branch_color}[${branch}${ahead_behind}${branch_color}]${NORMAL} ";
 fi
}






#   -------------------------------
#   3.  ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Change Prompt
#   ------------------------------------------------------------
PROMPT_COMMAND="PS1=\"${RESET}${CYAN}\W${NORMAL} \`${PROMPT_TRUELASTERROR}\`\`${PROMPT_GIT_STATUS}\`\`${PROMPT_PREVIOUS_STATUS}\`${NORMAL}\";"

#   Set Paths
#   ------------------------------------------------------------
export PATH=~/bin:vendor/bin:/usr/local/bin:/usr/local/git/bin:$PATH

#   Set Default Editor 
#   ------------------------------------------------------------
export EDITOR=vim

#   Set Default Vagrant Provider
#   ------------------------------------------------------------
export VAGRANT_DEFAULT_PROVIDER="vmware_fusion"

# Grep settings
export GREP_OPTIONS='--color=auto'

# Make the grep highlights show up in red
export GREP_COLORS

# Set kubeconfig directory and file list
export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config:$(ls ~/kube/*.* | paste -s -d: -)

# export secret vars
#HOMEBREW_GITHUB_API_TOKEN
source ~/git/my-dot-files/envvar.secret




#   -------------------------------
#   4.  TAB COMPLETION
#   -------------------------------



# Include git complete & git flow complete
if [ -f ~/.git-completion.bash ]; then
 . ~/.git-completion.bash
 . ~/.git-flow-completion.bash
fi

# Git flow autocomplete (bash-completion)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
fi

# git tab completion (homebrew)
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

#azure Completion
if [ -f /Users/johnny.walker/lib/azure-cli ]; then
    source '/Users/johnny.walker/lib/azure-cli'
fi







#   -------------------------------
#   4.  ADDED FUNCTIONS
#   -------------------------------


#   copy-key: to copy your public SSH key for pasting
#   ------------------------------------------------------------
function copy-key {
 cat ~/.ssh/id_rsa.pub | pbcopy && echo "Key copied to clipboard"
}


#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }



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
    echo "cd to \"$currFolderPath\""
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

#   mcd:  Make a new directory and jump inside it
#   -------------------------------------------------------------------

mcd () { mkdir -p "$1" && cd "$1"; }    


#   cd:  show contents after changing dir
#   -------------------------------------------------------------------
cd () { 
  builtin cd "$@"
  if [ $? == 0 ]; then
    ls
  else
    return 1
  fi
  }				


#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
ii() {
    echo -e "NETWORK INFORMATION"
    echo -e "\n${NORMAL}Current date :${RED} " ; date
    echo -e "\n${NORMAL}Machine stats :${RED} " ; uptime
    echo -e "\n${NORMAL}Current Private IPs :\n${RED} " ; ifconfig | grep -Eo 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
    echo -e "\n${NORMAL}Current Default GWs :\n${RED} " ; netstat -nr | grep -Eo 'default.+[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}.+en.'
    echo -e "\n${NORMAL}Current DNS Servers :\n${RED} " ; cat /etc/resolv.conf | grep -Eo 'nameserver [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
    echo -e "\n${NORMAL}Public facing IP Address :${RED} " ; curl ipinfo.io
    echo
}




#   -------------------------------
#   4.  ALIASES
#   -------------------------------


alias ls="ls -hpG"
alias lsl="ls -alhpG"
alias cls="clear;ls"
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation

alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .2='cd ../../'						# Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias f='open -a Finder ./'                 # Opens current directory in MacOS Finder

alias myip='curl ipinfo.io'                 # Public facing IP Address
alias flushdns='dscacheutil -flushcache'    # Flush out the DNS Cache
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'



# Vagrant
alias vd="vagrant destroy -f"
alias vh="vagrant halt"
alias vp="vagrant provision"
alias vr="vagrant resume"
alias vs="vagrant suspend"
alias vssh="vagrant ssh"
alias vu="vagrant up"
alias vm="ssh vagrant@127.0.0.1 -p 2222"
