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
alias vv="vim ~/.vimrc"
alias vundle="vim +PluginInstall +qall"
alias sshon="sudo systemsetup -setremotelogin on"
alias sshoff="sudo systemsetup -setremotelogin off"

# Homesick Commands
alias hscd="homesick cd"
alias hslink="homesick symlink dotfiles"

# Git Commands
alias upstream='git branch -u origin/master'
alias gfo='git fetch origin'
#alias ptg='git push origin HEAD:refs/for/master'
#alias ptgmobile='git push origin HEAD:refs/for/mobile-specific-version'
alias pom='git push origin master'
alias gts="git status"
alias gta="git add"
alias gtaa='git add --all'
alias lg="git lg"
alias commit="git commit"
alias ammend="git commit --amend"
alias fixup="git commit -m 'fixup'"
alias amend="git commit --amend"
alias diff="git diff"
alias clone="git clone"
alias getapp="git clone joey@gerrit:"
alias rb="git rebase -i"
alias rb1="git rebase -i HEAD~1"
alias rb2="git rebase -i HEAD~2"
alias rb3="git rebase -i HEAD~3"
alias rb4="git rebase -i HEAD~4"
alias rb5="git rebase -i HEAD~5"
alias rb6="git rebase -i HEAD~6"
alias rb7="git rebase -i HEAD~7"
alias rb8="git rebase -i HEAD~8"
alias rb9="git rebase -i HEAD~9"
alias rbo="git rebase -i origin/master"
alias rbomobile="git rebase -i origin/mobile-specific-version"
alias rbc="git rebase --continue"
alias rba="git rebase --abort"
alias track="git branch -u origin/master"
alias reset="git reset"
alias reset1="git reset HEAD~1"
alias reflog="git reflog"
alias st="git stash"
alias sts="git stash save"
alias sta="git stash apply"
alias stl="git stash list"
alias std="git stash drop"
alias stc="git stash clear"
alias grm="git rm -rf"
alias cout="git checkout"
alias newbranch="git checkout -b"
alias branch="git branch -a"
alias renamebranch="git branch -m"
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
alias guard="COVERAGE=true bundle exec guard"
alias setup="bundle exec rake db:setup"
alias migrate="bundle exec rake db:migrate"
alias rollback="bundle exec rake db:rollback"
alias prepare="bundle exec rake db:test:prepare"
alias server="bundle exec rails server"
alias server5="bundle exec rails server -p 50000"
alias bi="bundle install --path vendor/bundle"
alias bm="bundle exec rake db:migrate"
alias rspec="bundle exec rspec"
alias routes="bundle exec rake routes"

# InterfaceLift Downloader
function downloadwallpaper() {
  interfacelift-downloader 2560x1440 Pictures/background/interfaceLift/2560x1440
  interfacelift-downloader 1920x1080 Pictures/background/interfaceLift/1920x1080
  interfacelift-downloader 1200x1920 Pictures/background/interfaceLift/1200x1920
  interfacelift-downloader 1280x800 Pictures/background/interfaceLift/1280x800
}


# Open file in Chrome
alias chrome="open -a 'Google Chrome'"

# CoffeeScript from coffee/ to js/
alias coffeewatch="coffee -o js/ -cw coffee/*.coffee"

# Directory Shortcut, only works in Tero
alias azzier="cd /Volumes/WebWork/Development/"
alias samplexml="cd /Volumes/Telerik/UI\ for\ ASP.NET\ AJAX\ Q1\ 2014/Live\ Demos/App_Data"
