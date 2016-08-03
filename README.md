Dotfiles
========

###To copy:

1.gem install homesick

2.homesick clone joeytall/dotfiles

3.homesick symlink dotfiles

GG

##For NeoVim
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}

ln -s ~/.vim $XDG_CONFIG_HOME/nvim

ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

vimplug

or simply run neovimsetup

##YCM
sudo easy_install gevent==1.1rc1

sudo pip install neovim

###To setup:

1.gem install homesick

2.homesick generate ~/dotfiles

3.put dotfiles under home and push to github

4.then go back to To copy!
