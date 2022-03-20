# =========================================================================== #
#                                General Aliases                              #
# =========================================================================== #

# Defaults
alias grep="grep --color=auto"              # Grep with colors always
alias cat='ccat'                            # Colorized Cat
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation

# Watch
alias watch="watch "                        # Fix issue with watch alias computation
alias watch1="watch -n 1 "                  # Watch in 1s counters
alias watch3="watch -n 3 "                  # Watch in 3s counters
alias watch5="watch -n 5 "                  # Watch in 5s counters

# cd fixes
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .2='cd ../../'						            # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels

# List Directory aliases (ls)
alias ls='colorls --sd'                     # Colorized, Sort Dirs on top
alias lsl='colorls -1 -A --sd'              # Colorized, list view, show most, Sort Dirs on top
alias lsal='colorls -a -l'                  # Colorized, Detail View, Show All, Alphabetized
alias lst='colorls -A --tree=2'             # Colorized, Tree View, 2 deep, show most

# General
alias please="fuck"			                    # Make fuck more pleasant
alias hr="hr \~ && hr = && hr \~"           # Horizontal Rule
alias cls="clear;echo 'Directory:';ls"      # Clear Screen and show directory
alias myip='curl ipinfo.io | jq'            # Public facing IP Address

# Kubectl & Kubernetes
alias kci="kubectl cluster-info; kubectl get nodes; kubectl get namespaces"
alias kwho="kubectl config current-context"
alias kex="kubectl exec -i -t"
alias kns="kubens"
alias kctx="kubectx"

# MacOS Specific
if [[ $OSTYPE == "darwin"* ]]; then
  alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
  alias f='open -a Finder ./'
fi


# =========================================================================== #
#                            Additional Functions                             #
# =========================================================================== #


#   showa: to remind yourself of an alias (given some part of it)
#   -------------------------------------------------------------------
showa () { alias | grep $@ }

#   mcd: Make a new directory and jump inside it
#   -------------------------------------------------------------------
mcd () { mkdir -p "$1" && cd "$1"; }    


#   flushdns: Flushes DNS on the current system
#   -------------------------------------------------------------------
flushdns () {

  if [[ $OSTYPE == "linux"* ]]; then
    sudo killall -HUP mDNSResponder
    sudo killall mDNSResponderHelper
    sudo dscacheutil -flushcache
  elif [[ $OSTYPE == "darwin"* ]]; then
    sudo systemd-resolve --flush-caches
  fi

  echo "Flushed the DNS Cache!"
}