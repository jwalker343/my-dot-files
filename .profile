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
BLUE="\[\033[1;34m\]"

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
  fi
}


function gitsquash {

  local squashcount=${1:-4}
  local gitbranch=$(git-branch-name)
  LNORMAL="\033[0m"
  LRED="\033[1;31m"
  LCYAN="\033[0;36m"
  
  # Alert the user if they are not in a git repo
  if [ -z $gitbranch ]; then
    echo -e "$LRED You are not in a git repository."
    return
  fi

  # Provide guidance to the user
  echo -e "$LCYAN ----------------------------------------------------------------------"
  echo -e "$LCYAN Once your squash is complete push with the following:\n" 
  echo -e "$LRED    git push origin +$gitbranch \n"
  echo -e "$LCYAN ----------------------------------------------------------------------"

  git rebase -i origin/$gitbranch~$squashcount $gitbranch

}




#   -------------------------------
#   3.  ENVIRONMENT CONFIGURATION
#   -------------------------------

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

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
    
    PS1="$(__kube_ps1)${RESET}${CYAN}\W${NORMAL} $(git-branch-prompt)${PROMPTSMILE}${NORMAL}"
}

# This lets us enable and disable kube_ps1
KPS1_DISABLE_PATH="${HOME}/.kube/kube-ps1/disabled"

__kube_ps1() {
  if [[ ! -f "${KPS1_DISABLE_PATH}" ]]; then
    KPS1_IMG=$'\xE2\x8E\x88 '
    KPS1_CTX="$(k config current-context | cut -c1-12 2>/dev/null)..."
    KPS1_NS="$(k config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)"

    echo "${WHITE}[${BLUE}${KPS1_IMG}${CYAN}${KPS1_CTX}${WHITE} | ${PURPLE}${KPS1_NS}${WHITE} ]\n"
  fi 
}

# Set the Command Prompt and Title to contain the current working directory.
PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007" '
PROMPT_COMMAND="${PROMPT_TITLE}; __prompt_command"


#   Set Paths
#   ------------------------------------------------------------
export GOPATH=$HOME/go
export PATH=~/bin:vendor/bin:/usr/local/bin:/usr/local/git/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/gnu-tar/libexec/gnubin:/usr/local/opt/gnu-which/libexec/gnubin:/usr/local/opt/grep/libexec/gnubin:/usr/local/opt/make/libexec/gnubin:/usr/local/opt/php@7.2/sbin:/usr/local/opt/php@7.2/bin:~/.krew/bin:$PATH:/usr/local/go/bin:/usr/local/sbin:/usr/local/texlive/2019basic/bin/x86_64-darwin:$GOPATH/bin

#   Set Default Editor 
#   ------------------------------------------------------------
export EDITOR=vim

#   Set Default Vagrant Provider
#   ------------------------------------------------------------
export VAGRANT_DEFAULT_PROVIDER="vmware_fusion"

# Make the grep highlights show up in red
export GREP_COLORS

# Set kubeconfig directory and file list
export KUBECONFIG=$(ls ~/kube/*.* | paste -s -d: -)

# export secret vars
#HOMEBREW_GITHUB_API_TOKEN
source ~/git/my-dot-files/envvar.secret

# Enable Shell Options
shopt -s cdspell

#   source sysadmin-docker-tools repo
#   ------------------------------------------------------------
if [ -d "~/git/sysadmin-docker-tools" ]; then
  for file in ~/git/sysadmin-docker-tools/* ; do
    if [ ! "$file" == "readme.md" ] && [ ! -d "$file" ] ; then
      . "$file"
    fi
  done
fi


#   -------------------------------
#   4.  TAB COMPLETION
#   -------------------------------

# azure Completion
if [ -f ~/lib/azure-cli/az.completion ]; then
    source ~/lib/azure-cli/az.completion
fi

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# gcloud Completion
if [ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc ]; then
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
fi


#   -------------------------------
#   4.  ADDED FUNCTIONS
#   -------------------------------


#   copy-key: to copy your public SSH key for pasting
#   -------------------------------------------------------------------
function copy-key {
  cat ~/.ssh/id_rsa.pub | pbcopy && echo "Key copied to clipboard"
}


#   showa: to remind yourself of an alias (given some part of it)
#   -------------------------------------------------------------------
showa () { /usr/bin/grep --color=always -i -a1 $@ ~/.profile | grep -v '^\s*$' | less -FSRXc ; }



#   cdf:  'Cd's to frontmost window of MacOS Finder
#   -------------------------------------------------------------------
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
#   -------------------------------------------------------------------
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
    ls -hp --color
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


#   kdashboard: Proxy Dashboard to localhost and provide URL
#   -------------------------------------------------------------------
function kdashboard {
  echo "Starting Kubectl Proxy"
  kubectl proxy &
  echo "Opening Dashboard, URL:"
  echo "http://localhost:8001/api/v1/namespaces/kube-system/services/kubernetes-dashboard:/proxy"
  sleep 1
  open "http://localhost:8001/api/v1/namespaces/kube-system/services/kubernetes-dashboard:/proxy"
  fg
}


#   check: Check a host and port 
#   -------------------------------------------------------------------
function check() {
  if [ $# -eq 0 ] 
  then
    echo "No arguments supplied"
  fi

  nc -vz $1 $2
}

#   route: manage routes
#   -------------------------------------------------------------------
function route() {
  if [ $# -eq 0 ] 
  then
    echo "No arguments supplied"
    return 0
  fi

  if [ $1 == "print" ]
  then
    netstat -nrf inet
  fi

  if [ $1 == "add" ] && [ $# -eq 3 ]
  then
    echo "route -n add -net $2 $3"
    command sudo route -n add -net $2 $3
  fi
}



#   kcopy: Copy busybox into kubernetes pod
#          source: https://github.com/shawnxlw/kubernetes-tools
#   -------------------------------------------------------------------
BUSY_BOX_URL="https://busybox.net/downloads/binaries/1.27.1-i686/busybox"
BUSY_BOX_SHA="b51b9328eb4e60748912e1c1867954a5cf7e9d5294781cae59ce225ed110523c"
BUSY_BOX_PATH="/tmp/${BUSY_BOX_SHA}"

function kcopy() {
  # parse arguments
  while [ "$1" != "" ]; do
    case $1 in
      -n | --namespace ) shift
        copy_tools $1
        ;;
      * ) copy_tools $1
    esac
    shift
  done
}

function copy_tools() {
  # check/download busybox
  get_busybox
  # checkout shasum
  echo "${BUSY_BOX_SHA}  ${BUSY_BOX_PATH}/busybox" | shasum -ca 256 - > /dev/null

  pod=$1
  PS3="Please select a container:"
  # exit if pod not found
  if ! kubectl get pod $pod > /dev/null; then exit 1; fi

  containers=($(kubectl get pod $pod -o jsonpath='{.spec.containers[*].name}'))

  # if there is only one container, get a shell
  if [[ ${#containers[@]} -eq 1 ]] ; then
    selected_container=$containers
  else
    # if there are more than one container, prompt select
    select container in "${containers[@]}"
    do
      selected_container=$container
      break
    done
  fi

  echo -e "\nCopying tools to container $selected_container...\n"
  kubectl cp $BUSY_BOX_PATH/busybox $namespace/$pod:/tmp -c $selected_container
  # setup busybox
  kubectl exec $pod -c $selected_container -ti -- sh -c "chmod 755 /tmp/busybox && /tmp/busybox --install /usr/bin"

  echo -e "\nGetting you a shell in $selected_container...\n"
  # if bash doesn't work, try sh
  kubectl exec $pod -c $selected_container -ti bash 2>/dev/null || kubectl exec $pod -c $selected_container -ti sh
  exit 0
}

# if the busybox directory doesn't exist, download busybox
function get_busybox() {
  if [[ ! -d $BUSY_BOX_PATH ]]; then
    echo "No busybox present, downloading..."
    mkdir $BUSY_BOX_PATH && cd $BUSY_BOX_PATH
    curl -sSo busybox $BUSY_BOX_URL
  fi
}

#   kubeon:  Turns on kubernetes header in terminal window
#   -------------------------------------------------------------------
function kubeon() {
  rm -f -- "${KPS1_DISABLE_PATH}"
}

#   kubeoff:  Turns off kubernetes header in terminal window
#   -------------------------------------------------------------------
function kubeoff() {
  mkdir -p -- "$(dirname "${KPS1_DISABLE_PATH}")"
  touch -- "${KPS1_DISABLE_PATH}"
}

#   stamp:  Gets the current timestamp and puts it in the clipboard
#   -------------------------------------------------------------------
function stamp() {
  timestamp=$(date +%Y%m%d-%H%M%S) 
  printf $timestamp | pbcopy
  echo "$timestamp copied to clipboard"
}

#   -------------------------------
#   6.  ALIASES
#   -------------------------------
alias please="fuck"			                    # Make fuck more pleasant
alias grep="grep --color=auto"              # Grep with colors always

alias watch="watch "                        # Fix issue with watch alias computation
alias watch1="watch -n 1 "                  # Watch in 1s counters
alias watch3="watch -n 3 "                  # Watch in 3s counters
alias watch5="watch -n 5 "                  # Watch in 5s counters


alias hr="hr \~ && hr = && hr \~"           # Horizontal Rule

alias ls="ls -hp --color"                   # Show units, directories and colors.
alias lsl="ls -alhp --color"                # List view with the above.
alias cls="clear;ls"
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation

alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .2='cd ../../'						            # Go back 2 directory levels
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
alias kgp="kubectl get pods"
alias kgpall="kubectl get pods --all-namespaces"
alias kgs="kubectl get services"
alias kgd="kubectl get deployments"
alias kgn="kubectl get nodes"
alias kdp="kubectl describe pod"
alias kci="kubectl cluster-info; kubectl get nodes; kubectl get namespaces"
alias kwho="kubectl config current-context"
alias kaf="kubectl apply -f"
alias kex="kubectl exec -i -t"
alias kns="kubens"
alias kctx="kubectx"

#Get current default namespace
#k config get-contexts | grep "*" | awk '{print $5}'
