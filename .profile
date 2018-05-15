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
eval $(thefuck --alias)

CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
NORMAL="\[\033[0m\]"
PURPLE="\[\033[0;35m\]"
RED="\[\033[1;31m\]"
RESET="\[\017\]"
WHITE="\[\033[1;37m\]"
YELLOW="\[\033[1;33m\]"




SMILEY="${GREEN}:)${NORMAL}"
FROWNY="${RED}:(${NORMAL}"





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
__prompt_command() {
    local EXIT="$?"             # This needs to be first


    export PROMPTSMILE="${SMILEY}"
    if [ $EXIT = 0 ]; then 
      export PROMPTSMILE="${SMILEY} " 
    else 
      export PROMPTSMILE="${FROWNY} " 
    fi



    PS1="${RESET}${CYAN}\W${NORMAL} $(git-branch-prompt)${PROMPTSMILE}${NORMAL}"
}

#PROMPT_COMMAND="PS1=\"${RESET}${CYAN}\W${NORMAL} \`${PROMPT_GIT_STATUS}\`\`${PROMPT_PREVIOUS_STATUS}\`${NORMAL}\";"
PROMPT_COMMAND=__prompt_command


#   Set Paths
#   ------------------------------------------------------------
export GOPATH=$HOME/go
export PATH=~/bin:vendor/bin:/usr/local/bin:/usr/local/git/bin:$PATH:/usr/local/go/bin:$GOPATH/bin

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

# Enable Shell Options
shopt -s cdspell

#   source sysadmin-docker-tools repo
#   ------------------------------------------------------------
for file in ~/git/sysadmin-docker-tools/* ; do
  if [ ! "$file" == "readme.md" ] && [ ! -d "$file" ] ; then
    . "$file"
  fi
done



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
if [ -f ~/lib/azure-cli/az.completion ]; then
    source ~/lib/azure-cli/az.completion
fi

#kubectl completion
if [ -x "$(command -v kubectl)" ]; then
    source <(kubectl completion bash)
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
showa () { /usr/bin/grep --color=always -i -a1 $@ ~/.profile | grep -v '^\s*$' | less -FSRXc ; }



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
    ls -hpG
  else
    return 1
  fi
  }				


#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
ii() {

    LNORMAL="\033[0m"
    LRED="\033[1;31m"


    echo -e "NETWORK INFORMATION"
    echo -e "\n${LNORMAL}Current date :${LRED} " ; date
    echo -e "\n${LNORMAL}Machine stats :${LRED} " ; uptime
    echo -e "\n${LNORMAL}Current Private IPs :${LRED} " ; ifconfig | grep -Eo 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
    echo -e "\n${LNORMAL}Current Default GWs :${LRED} " ; netstat -nr | grep -Eo 'default.+[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}.+en.'
    echo -e "\n${LNORMAL}Current DNS Servers :${LRED} " ; cat /etc/resolv.conf | grep -Eo 'nameserver [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
    echo -e "\n${LNORMAL}Public facing IP Address :${LRED} " ; curl ipinfo.io
    echo -e "\n${LNORMAL}Speedtest.net ATLANTA, GA :${LRED} " ; speedtest-cli --share --server 10035
    echo
}


#   z:   maintain a working list of directories you actually use with z
#   -------------------------------------------------------------------
source /usr/local/Cellar/z/1.9/etc/profile.d/z.sh


#   aa:  do the thing
#   -------------------------------------------------------------------
function kns {
  echo "Setting kubectl default namespace to $1"
  kubectl config set-context $(kubectl config current-context) --namespace=$1
}


#   check: Check a host and port 
#   ------------------------------------------------------------
function check() {
  if [ $# -eq 0 ] 
  then
    echo "No arguments supplied"
  fi

  nc -vz $1 $2
}

#   -------------------------------
#   4.  ALIASES
#   -------------------------------

alias hr="hr \~ && hr = && hr \~"

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
alias flushdns='sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache;echo "Flushed the DNS"'    # Flush out the DNS Cache
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias code='/Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/Resources/app/bin/code'


# Vagrant
alias vd="vagrant destroy -f"
alias vh="vagrant halt"
alias vp="vagrant provision"
alias vr="vagrant resume"
alias vs="vagrant suspend"
alias vssh="vagrant ssh"
alias vu="vagrant up"
alias vm="ssh vagrant@127.0.0.1 -p 2222"


# Kubectl & Kubernetes
alias k="kubectl"
alias kpods="kubectl get pods"
alias ksvc="kubectl get services"
alias kdep="kubectl get deployments"
alias kci="kubectl cluster-info; kubectl get nodes; kubectl get namespaces"
alias kwho="kubectl config current-context"


#Get current default namespace
#k config get-contexts | grep "*" | awk '{print $5}'
