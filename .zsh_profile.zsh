# echo "its working!"
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# Determine if current working directory is a git repository
git_branch_color() {
  if current_git_status=$(git status 2> /dev/null); then
    parse_git_dirty
  else
    echo ""
  fi
}

# Change branch color if working tree is clean
parse_git_dirty() {
  if current_git_status=$(git status | grep 'Changes to be committed:\|Untracked files:\|modified:|deleted:' 2> /dev/null); then
    echo "%F{red}"
  else
    echo "%F{green}"
  fi
}

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{cyan}%2~ $(git_branch_color)${vcs_info_msg_0_}%f$ '

eval "$(rbenv init -)"

# added by travis gem
[ ! -s /Users/phillipstrom/.travis/travis.sh ] || source /Users/phillipstrom/.travis/travis.sh

# aliases
alias ga="git add"
alias gs="git status"
alias ber="bundle exec rspec"
alias gcb="git checkout -b"
alias gcm="git commit -m"
alias gpo="git push origin"


# nvm configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
