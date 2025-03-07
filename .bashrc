# ==================
# Bash configuration
# ==================

export PATH=/usr/local/bin:$HOME/Work/utilities/woff2:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# ---------
# Functions
# ---------

# Git: show branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
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
  echo "Python v$(python_version) || Ruby v$(ruby_version) || Node $(node_version)"
}

# --------------
# Command prompt
# --------------

export PS1="🦋 \w\[\033[32m\]\$(parse_git_branch) \[\033[00m\]\n ❥ "

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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
