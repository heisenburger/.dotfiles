# ==================
# Bash configuration
# ==================

export PATH=/usr/local/bin:$PATH

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

# Node: check version
node_version() {
  if which node &> /dev/null; then
    node -v | cut -d' ' -f2
  else
    echo none
  fi
}

# Ruby: check version

# Python: check version

# --------------
# Command prompt
# --------------

export PS1="🌺 \w\[\033[32m\]\$(parse_git_branch) \[\033[035m\]\$(node_version)\[\033[00m\]\n ❥ "

# --------------------
# Environment settings
# --------------------

# Set ssh
eval $(ssh-agent -s) > /dev/null
