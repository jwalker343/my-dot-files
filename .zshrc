# Load Profiler if needed
#zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =========================================================================== #
#                                   Globals                                   #
# =========================================================================== #
HOMEBREW_PREFIX=""
export LANG=en_US.UTF-8
export BROWSER="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"


# =========================================================================== #
#                                    PATH                                     #
# =========================================================================== #

# Set your Custom Paths that you want at the beginning of the PATH here.
path=(
  "$HOME/.local/bin"
  "$HOME/bin"
  "/usr/local/bin"
  "/opt/homebrew/bin"
  "/usr/bin"
)

# Add in some Linux Specific Paths (WSL)
if [[ $OSTYPE == "linux"* ]]; then
  path+=(
    "/home/linuxbrew/.linuxbrew/bin"
    "/home/linuxbrew/.linuxbrew/sbin"
    "/mnt/c/Program Files/Microsoft VS Code/bin"
    "/mnt/c/Users/johnny.walker/AppData/Local/Programs/Microsoft VS Code/bin"
    "/mnt/c/Windows/System32/WindowsPowerShell/v1.0"
    "/snap/bin"
    "$HOME/.local/bin"
)
fi

# Set any Globals that require a base path
if type brew &>/dev/null; then
  HOMEBREW_PREFIX=$(brew --prefix)
fi

# [MacOS Only] Dynamically add all of the GNU Tools to PATH from homebrew 
if [[ $OSTYPE == "darwin"* ]]; then
  for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnubin; do export PATH=$d:$PATH; done
fi

# Add the default path entries here at the end.
path+=(
  "/bin"
  "/usr/sbin"
  "/sbin"
  "/opt/X11/bin"
  "/Library/Frameworks/Mono.framework/Versions/Current/Commands"
  "/Library/TeX/texbin"
)

# Make sure it is availble to sub processes.
export PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/git/oh-my-zsh"


# =========================================================================== #
#                            Appearance/Behavior                              #
# =========================================================================== #


# Set name of the theme to load
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell" # For Builtin, otherwise Source it.
#source $HOMEBREW_PREFIX/opt/powerlevel10k/share/powerlevel10k.zsh-theme
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode disabled    # Disables Updates

# This will check for updates every 30 days
zstyle ':omz:update' frequency 30


# =========================================================================== #
#                                   Plugins                                   #
# =========================================================================== #


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/

# My Plugins
plugins=(
  kubeconfig
  my-aliases
)

# Built-in/copied in Plugins
plugins+=(
  aws
  brew
  colored-man-pages
  colorize
  copyfile
  copypath
  docker
  docker-compose
  encode64
  extract
  fzf
  git
  git-flow
  helm
  kubectl
  thefuck
  zoxide
  zsh-autosuggestions
  )

source $ZSH/oh-my-zsh.sh

# =========================================================================== #
#                             Additional Sources                              #
# =========================================================================== #


# Pull in Env Var Secrets
source $HOME/git/my-dot-files/envvar.secret


# =========================================================================== #
#                                  User Pref                                  #
# =========================================================================== #


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom Auto Completion
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# =========================================================================== #
#                                   History                                   #
# =========================================================================== #

HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY       # share history across all sessions, live
setopt INC_APPEND_HISTORY  # write each command as it's run, not on shell exit
setopt HIST_IGNORE_ALL_DUPS # drop older duplicate of a repeated command
setopt HIST_IGNORE_SPACE   # don't record commands starting with a space
setopt HIST_REDUCE_BLANKS  # trim superfluous blanks before recording

# =========================================================================== #
#                         Global Environment Variables                        #
# =========================================================================== #

# note: we use .zshenv for machine or profile specific env variables (work/school/personal)
export CLAUDE_CODE_ENABLE_AUTO_MODE=1
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#456666"