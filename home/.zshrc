
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export EDITOR=vim

# Customize to your needs...
# Shell Commands
alias vi='nvim'
alias vim='nvim'
alias l='ls -la'
alias h='ls -lh'
alias b='cd -'
alias desk='cd ~/Desktop'
alias proj='cd ~/Projects'
alias cdir='cd ~/Projects/fsa_chroot_env/'
alias trunk='cd ~/Projects/fsa_chroot_env/fsa/workingTrunk'
alias map='cd ~/Projects/fsa_chroot_env/fsa/mapTrunk'
alias os='cd ~/Projects/fsa_chroot_env/fsa/FortiOS'
alias style='cd ~/Projects/fsa_chroot_env/fsa/styleTrunk'
alias main='cd ~/Projects/fsa_chroot_env/fsa/mainTrunk'
alias sandbox='cd ~/Projects/fsa_chroot_env/fsa/workingTrunk/web/sandbox'
alias sus='cd ~/Projects/fsa_chroot_env/Storage/suspicious'
alias fsadb='cd ~/Projects/fsa_chroot_env/drive0/private/db'
alias pvt='cd ~/Projects/fsa_chroot_env/drive0/private'
alias se="vim ~/.zshrc"
alias ss="source ~/.zshrc"
alias hh="hostname joeytall-OptiPlex-3020"
alias vv="vim ~/.vimrc"
alias vp="vim patch.diff"
# alias vundle="vim +PluginInstall +qall"
alias vimplug="nvim +PlugInstall +qall"
alias sshon="sudo systemsetup -setremotelogin on"
alias sshoff="sudo systemsetup -setremotelogin off"
alias ff="find . -name"

# Fortinet Shortcuts
alias rr="svn revert web/sandbox/apps/hacluster/forms.py web/sandbox/apps/hacluster/hacluster.py web/sandbox/apps/hacluster/views.py web/sandbox/apps/widgets/utils/sysres.py web/sandbox/apps/widgets/utils/sysinfo.py web/sandbox/utils/system/status.py"
alias ssh90="ssh admin@172.16.92.90"
alias ssh96="ssh joey@172.16.69.96"
alias ssh213="ssh admin@172.16.69.213"
alias ssh34="ssh admin@172.16.69.34"
alias ssh100="ssh fortinet@10.100.33.3"
alias sshupdate34="echo 'rm -rf web/* && wget http://172.16.68.232/static/web.tar -P web && tar -xvf web/web.tar && rm web/web.tar && killall httpd' | xclip"
alias dd="copydata && copydata | xclip"
alias copydata="echo 'cd /drive0/private && tar zcvf /web/static/private.tgz db-install hc log statistics/jobdata statistics/rptstat && cd /Storage && tar zcvf /web/static/s.tgz suspicious/$(date +20%y%m%d) &&  cd /web/static'"
alias ud="updatedata && updatedata | xclip"
alias ud100="updatedata100 && updatedata100 | xclip"
alias uds="updatedatassh && updatedatassh | xclip"
alias updatedata='echo "pvt && wget 172.16.69.96/static/private.tgz && tar zxvf private.tgz && /bin/rm private.tgz && cd db && /bin/rm FortiSandboxGUI.db FortiSandboxDevice.db && cp ../db-install/FortiSandboxGUI.db . && cp ../db-install/FortiSandboxDevice.db . && cdir && cd Storage/ && wget 172.16.69.96/static/s.tgz && tar zxvf s.tgz && /bin/rm s.tgz && cdir"'
alias updatedata100='echo "pvt && wget 10.100.33.3/static/private.tgz && tar zxvf private.tgz && /bin/rm private.tgz && cd db && /bin/rm FortiSandboxGUI.db FortiSandboxDevice.db && cp ../db-install/FortiSandboxGUI.db . && cp ../db-install/FortiSandboxDevice.db . && cdir && cd Storage/ && wget 10.100.33.3/static/s.tgz && tar zxvf s.tgz && /bin/rm s.tgz && cdir"'
alias updatedatassh='echo "cd /drive0/private && wget http://172.16.69.96/static/private.tgz && tar zxvf private.tgz && rm private.tgz && cd /Storage/ && wget http://172.16.69.96/static/s.tgz && tar zxvf s.tgz && rm s.tgz && cd /"'
function updatedataIP() {
echo "pvt && wget $1/static/private.tgz && tar zxvf private.tgz && /bin/rm private.tgz && cd db && /bin/rm FortiSandboxGUI.db FortiSandboxDevice.db && cp ../db-install/FortiSandboxGUI.db . && cp ../db-install/FortiSandboxDevice.db . && cdir && cd Storage/ && wget $1/static/s.tgz && tar zxvf s.tgz && /bin/rm s.tgz && cdir"
}
alias tarWeb="main && /bin/rm web/static/web.tar && tar -cvf web/static/web.tar web"
alias update34="tarWeb && python /etc/cronjobs/updateWeb.py"
alias updateweb="tarWeb && python /etc/cronjobs/updateWeb.py $1"
alias upgrade34='/usr/sbin/chroot ~/Projects/fsa_chroot_env ./cron1.sh && python /etc/cronjobs/upgradeFW.py && /usr/sbin/chroot ~/Projects/fsa_chroot_env ./cron2.sh'
alias upgrade37='/usr/sbin/chroot ~/Projects/fsa_chroot_env ./cron1.sh && python /etc/cronjobs/upgrade37.py && /usr/sbin/chroot ~/Projects/fsa_chroot_env ./cron2.sh'
alias ccc='echo "cd /fsa/workingTrunk && make clean && make && ./mkdevelop.sh" | xclip'
alias sss='echo "/usr/webserver/httpd -k restart -f /usr/webserver/httpd.conf" | xclip'
alias cdf='codiff && vp'
function findjob() {
  echo "cd \`sandbox-jobs-move -p -j$1\`" | xclip
}

function burnimg() {
  echo "./Configure -mFSA_3500D -ti -a2 -i2 -p0 -dy -ky -ly && make clean && make all && ./genpcimg.sh" | xclip
}

# Django Python
alias console='echo "cd /fsa/workingTrunk/web/sandbox && python manage.py shell" | xclip'

# Homesick Commands
alias hscd="cd ~/.homesick/repos/dotfiles"
alias hslink="homesick symlink dotfiles"

# SVN commands
alias sdf="svn diff --summarize"
alias sup="svn update"
alias sg="svn log -l 10| perl -l40pe 's/^-+/\n/'"
alias sgl="svn log -l $1 | perl -l40pe 's/^-+/\n/'"

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
alias bi="brew install"

# Bundle EXEC!!!
# alias bs="bundle show"
# alias bc="bundle clean"
# alias bl="bundle list"
# alias bu="bundle update"
# alias be="bundle exec"
# alias console="bundle exec rails console"
# alias testconsole="RAILS_ENV=test console"
# alias guard="COVERAGE=true bundle exec guard"
# alias setup="bundle exec rake db:setup"
# alias migrate="bundle exec rake db:migrate"
# alias rollback="bundle exec rake db:rollback"
# alias migratestatus="bundle exec rake db:migrate:status"
# alias prepare="bundle exec rake db:test:prepare"
# alias server="bundle exec rails server"
# alias server5="bundle exec rails server -p 50000"
# alias generate="bundle exec rails generate"
# alias bi="bundle install --path vendor/bundle"
# alias bm="bundle exec rake db:migrate"
# alias rspec="bundle exec rspec"
# alias routes="bundle exec rake routes"

# Node JS
alias ni="npm install"
alias ns="npm start"
alias nu="npm update"

# Ubuntu
alias agi="sudo apt-get install"
alias agup="sudo apt-get update"

# InterfaceLift Downloader
function downloadwallpaper() {
  interfacelift-downloader 2560x1440 Pictures/background/interfaceLift/2560x1440
  interfacelift-downloader 1920x1080 Pictures/background/interfaceLift/1920x1080
  interfacelift-downloader 1920x1200 Pictures/background/interfaceLift/1920x1200
  interfacelift-downloader 1200x1920 Pictures/background/interfaceLift/1200x1920
  interfacelift-downloader 1280x800 Pictures/background/interfaceLift/1280x800
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
