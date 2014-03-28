#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Source chruby and auto switch
if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# Shell Stuff
alias l='ls -la'
alias se="vim ~/.zshrc"
alias ss="source ~/.zshrc"
alias vundle="vim +PluginInstall +qall"

# Github
alias gfo='git fetch origin'
alias ptg='git push origin HEAD:refs/for/master'
alias gts="git status"
alias gta="git add"
alias gtaa='git add --all'
alias lg="git lg"
alias commit="git commit"
alias fixup="git commit -m 'fixup'"
alias amend="git commit --amend"
alias diff="git diff"
alias getapp="git clone joey@gerrit:"
alias rb="git rebase -i"
alias rbo="git rebase -i origin/master"
alias rbc="git rebase --continue"
alias rba="git rebase --abort"
alias reset="git reset"
alias reset1="git reset HEAD~1"
alias stash="git stash"
alias sta="git stash apply"
alias stl="git stash list"
alias std="git stash drop"
alias stc="git stash clear"
alias grm="git rm -rf"
alias cout="git checkout"
alias newbranch="git checkout -b"
alias branch="git branch -a"
alias bd="git branch -D"
alias workflow='git log --since="08:30:00" --format="%s%n%b" --author="$(git config --global user.name)" | grep "^[^(Change-id)]"'

# Bundle EXEC!!!
alias bs="bundle show"
alias bc="bundle clean"
alias bl="bundle list"
alias bu="bundle update"
alias be="bundle exec"
alias console="bundle exec rails console"
alias testconsole="RAILS_ENV=test console"
alias guard="bundle exec guard"
alias server="bundle exec rails server"
alias server5="bundle exec rails server -p 50000"
alias rake="bundle exec rake"
alias bi="bundle install --path vendor/bundle"
alias bm="bundle exec rake db:migrate"
alias rspec="bundle exec rspec"
alias routes="bundle exec rake routes"
