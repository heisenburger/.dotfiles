# ==================
# Bash configuration
# ==================

export PATH=/usr/local/bin:$HOME/Work/utilities/woff2:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

eval "$(rbenv init -)"

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
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Versions

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

# make some aliases for the colours: (coud use normal escap.seq's too)
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$fg[${(L)color}]%}'
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"


# Check if we are on SSH or not
# set the prompt
PS1=$'\n''${PR_BLUE}%~${PR_NO_COLOR} ${vcs_info_msg_0_} '$'\n''$(pr_user_op) '
PS2=$'%_❥'
RPROMPT=$'%!'

#export PS1=$'🦋 %~ ${vcs_info_msg_0_} \n ❥ '

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

# Git aliases found in .gitconfig_global

# --------
# Say shit
# --------

__version

