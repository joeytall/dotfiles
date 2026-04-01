
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

ZSH_THEME="powerlevel10k/powerlevel10k"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export CLICOLOR=1

# Add zsh-autocomplete + syntax
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add Amazon settings
source $HOME/.amazonrc

export PATH="${HOME}/bin":${PATH}
export PATH=$PATH:~/Library/Python/2.7/bin
export TERM="xterm-256color"

#set history size
export HISTSIZE=10000
#save history after logout
export SAVEHIST=10000
#history file
export HISTFILE=~/.zsh_history
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
#add timestamp for each entry
setopt EXTENDED_HISTORY

alias hg='history 0 | fzf -e'

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
alias gpu="git pull --rebase"
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
alias hd="cd ~/projects/plumwood-demo"

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

# Mac
alias debounce="cd ~/projects/debounce-mac-master && ./debounce"

# Ubuntu
alias agi="sudo apt-get install"
alias agup="sudo apt-get update && apt-get upgrade"
alias agrm="sudo apt-get remove"

alias python="/Users/lijoey/.pyenv/versions/3.7.13/bin/python"

# InterfaceLift Downloader
alias dw="downloadwallpaper"
function downloadwallpaper() {
  interfacelift-downloader 5120x1440 ~/Pictures/wallpaper/interfaceLift/5120x1440
  interfacelift-downloader 3840x2160 ~/Pictures/wallpaper/interfaceLift/3840x2160
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
bindkey '^ ' autosuggest-accept

# JSON resume
alias updateresume="resume export resume.html --theme elegant && wkhtmltopdf resume.html resume.pdf"
alias postresume="resume publish --theme elegant"

#Fun fun Fun
alias weather="curl 'wttr.in/vancouver?m'"

alias tmux="TERM=screen-256color-bce tmux"
alias sysinfo="landscape-sysinfo"

alias mackeyrepeat="defaults write -g InitialKeyRepeat -int 15 && defaults write -g KeyRepeat -int 1"

alias killdock="defaults write com.apple.dock appswitcher-all-displays -bool true && killall Dock"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="/usr/local/opt/node@10/bin:$PATH"

export PATH="/usr/local/opt/curl-openssl/bin:$PATH"
export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

export PATH=$HOME/.toolbox/bin:$PATH
set -o emacs
setopt autocd
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"

zstyle ':completion:*' menu select

export HISTTIMEFORMAT="%F %T "


# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"

# Added by AIM CLI
export PATH="/Users/lijoey/.aim/mcp-servers:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

