ZSH_THEME="dracula"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Add zsh-autocomplete
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Add Amazon settings
source $HOME/.amazonrc

export PATH="${HOME}/bin":${PATH}
export PATH=$PATH:~/Library/Python/2.7/bin
export TERM="xterm-256color"

export EDITOR=nvim
export SVN_EDITOR=nvim

# Shell Commands
alias l='ls -lah'
alias h='ls -lh'
alias b='cd -'
alias desk='cd ~/Desktop'
alias proj='cd ~/Projects'
alias coca='cd ~/Projects/coca'
alias vim='nvim'
alias se="vim ~/.zshrc"
alias aa="vim ~/.amazonrc"
alias ss="source ~/.zshrc"
alias vv="vim ~/.vimrc"
alias vimplug="vim +PlugInstall +qall"
alias sshon="sudo systemsetup -setremotelogin on"
alias sshoff="sudo systemsetup -setremotelogin off"
alias kk="rm -rf /root/.ssh/known_hosts"
alias rr="rm -rf *.pyc"

# Homesick Commands
alias hscd="cd ~/.homesick/repos/dotfiles"
alias hslink="homesick symlink dotfiles"

# SVN commands
alias sdf="svn diff --summarize"
alias sup="svn update"
alias scom="svn commit -m $1"
alias si="svn info"
alias sg="svn log --limit 3"
alias sgl="svn log --limit $1"
alias sgr="svn log -v -r $1"
alias conflict="svn status | grep -P '^(?=.{0,6}C)'"
alias newadd="svn status | grep -P '^(?=.{0,6}A)'"
alias remove_dot_edited_files="find . -name '*.edited' -type f -delete"

# Git Commands
alias upstream='git branch -u origin/master'
alias gfo='git fetch origin'
alias ptg='git push origin HEAD:refs/for/master'
alias pom='git push origin master'
alias gts="git status"
alias gta="git add"
alias gtaa='git add --all'
alias lg="git lg"
alias commit="git commit"
alias com="git commit -m"
alias fixup="git commit -m 'fixup'"
alias amend="git commit --amend"
alias diff="git diff"
alias rb="git rebase -i"
alias gpu="git pull"
alias gcl="git clone"
alias gcp="git cherry-pick"
alias gcpc="git cherry-pick --continue"

function rbh(){
  eval "git rebase -i HEAD~$1"
}

alias rbo="git rebase -i origin/master"
alias rbc="git rebase --continue"
alias rba="git rebase --abort"

alias track="git branch -u origin/master"
alias reset="git reset"
alias reset1="git reset HEAD~1"
alias reflog="git reflog"
alias st="git stash --include-untracked"
alias sts="git stash save"
alias stp="git stash pop"
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

# Brew
alias bi="brew install"
alias bu="brew update && brew upgrade"

# Node JS
alias ni="npm install"
alias nis="npm install --save-dev"
alias nig="npm install -g"
alias np="npm prune"
alias ns="npm start"
alias nu="npm update"

# Ubuntu
alias agi="sudo apt-get install"
alias agup="sudo apt-get update && apt-get upgrade"
alias agrm="sudo apt-get remove"

# InterfaceLift Downloader
alias dw="downloadwallpaper"
function downloadwallpaper() {
  interfacelift-downloader 3440x1440 ~/Pictures/background/interfaceLift/3440x1440
  interfacelift-downloader 2560x1440 ~/Pictures/background/interfaceLift/2560x1440
}

function neovimsetup(){
  mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
  ln -s ~/.vim $XDG_CONFIG_HOME/nvim
  ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
  vimplug
}

alias downloadwebsite="wget -r -p -U chrome"

# Open file in Chrome
alias chrome="open -a 'Google Chrome'"

# CoffeeScript from coffee/ to js/
alias coffeewatch="coffee -o js/ -cw coffee/*.coffee"

# Directory Shortcut, only works in Tero
alias azzier="cd /Volumes/t119/Development/"
alias samplexml="cd /Volumes/Telerik/UI\ for\ ASP.NET\ AJAX\ Q1\ 2014/Live\ Demos/App_Data"

# Fancy Ctrl Z
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# JSON resume
alias updateresume="resume export resume.html --theme elegant && wkhtmltopdf resume.html resume.pdf"
alias postresume="resume publish --theme elegant"

#Fun fun Fun
alias weather="curl wttr.in/vancouver"

alias tmux="TERM=screen-256color-bce tmux"
alias sysinfo="landscape-sysinfo"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="/usr/local/opt/node@10/bin:$PATH"
