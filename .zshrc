# ==================
# Bash configuration
# ==================

export PATH=/usr/local/bin:$HOME/Work/utilities/woff2:$PATH

# ---------
# Functions
# ---------

# Git: show branch
autoload -Uz vcs_info
zstyle ':vcs_info:git*' formats "(%b) %m%u%c "
precmd() {
    vcs_info
}

# Git: branch tab completion
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# Autocomplete zsh for kitty
kitty + complete setup zsh | source /dev/stdin

# Node: check version
function node_version() {
  if which node &> /dev/null; then
    node -v | cut -d' ' -f2
  else
    echo none
  fi
}

# Ruby: check version
function ruby_version() {
  if which ruby &> /dev/null && ruby -v &> /dev/null; then
    ruby -v | cut -d' ' -f2
  elif which jruby &> /dev/null && jruby -v &> /dev/null; then
    echo "jruby $(jruby -v | cut -d' ' -f2)"
  else
    echo none
  fi
}

# Python: check version
function python_version() {
  if which python &> /dev/null; then
    python --version 2>&1 | cut -d' ' -f2
  else
    echo none
  fi
}

function __version() {
  echo "Python v$(python_version) :: Ruby v$(ruby_version) :: Node $(node_version)"
}


# --------------
# Command prompt
# --------------

# load modules for git branch display
setopt prompt_subst

# make some aliases for the colours: (coud use normal escap.seq's too)
autoload -U colors && colors
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$fg[${(L)color}]%}'
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"

# Set up cute emoticon prompt
pr_user() {
  echo "%(!.${PR_RED}.${PR_WHITE})%(!.[! %n !].%n)${PR_NO_COLOR}"
}

function pr_user_op() {
  local PR_PRIV='%(!.#.>)'
  local PR_ART_IDLE='( ᵕ‿ᵕ%)つ━★ ༓･*˚⁺‧'
  local PR_ART_ERR='ᵒʰ( ⑉・̆⌓・̆⑉%)ɴᴏ_･⌒‧'
  local PR_ART="%(0?.${PR_MAGENTA}${PR_ART_IDLE}.${PR_RED}${PR_ART_ERR})"

  echo "${PR_ART}${PR_PRIV}${PR_NO_COLOR}"
}

# Check if we are on SSH or not
# set the prompt
PS1=$'\n''${PR_BLUE}%~ ${PR_GREEN}${vcs_info_msg_0_} '$'\n''$(pr_user_op)${PR_NO_COLOR} '
PS2=$'%_❥'
RPROMPT=$'%!'


# --------------------
# Environment settings
# --------------------

# Set ssh
eval $(ssh-agent -s) > /dev/null

# -------
# Aliases
# -------

# Bash aliases
alias l="ls -la"       # List in long format, include dotfiles
alias ld="ls -ld */"   # List in long format, only directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Ruby and related aliases
alias be="bundle exec"
alias serve="bundle exec jekyll serve"

# Sublime Test

alias sublime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# Git aliases found in .gitconfig_global

# ---------
# Say stuff
# ---------
__version

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add depot_tools to PATH
export PATH=/Users/sereeena/depot_tools:$PATH


# pnpm
export PNPM_HOME="/Users/sereeena/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
