set nocompatible                            "be Improved
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'nanotech/jellybeans.vim'
Bundle 'bling/vim-airline'
Bundle 'kchmck/vim-coffee-script'
Bundle 'csexton/trailertrash.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'juvenn/mustache.vim'
Bundle 'yaymukund/vim-rabl'
Bundle 'int3/vim-extradite'
Bundle 'sjl/splice.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-pathogen'
Bundle 'bitc/vim-bad-whitespace'
Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattn/emmet-vim'
Bundle 'pangloss/vim-javascript'
Bundle 'tomtom/tcomment_vim'
Bundle 'jshint/jshint'
Bundle 'Shutnik/jshint2.vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'elzr/vim-json'
Bundle 'digitaltoad/vim-jade'
Bundle 'gioele/vim-autoswap'
Bundle 'gavinbeatty/dragvisuals.vim'
Bundle 'rking/ag.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'juneedahamed/svnj.vim'
Bundle 'majutsushi/tagbar'

set nocp
set nu
set ts=2                            "tab stop 2
set shiftwidth=2                    "tab shift width 2
set expandtab
set autoindent
set smartindent                     "use smart indenting
set bs=2                            "allow backspace in insert mode
syntax enable                       "enable syntax highlighting
set wmh=0                           "set min window height
set ruler                           "use the ruler thigy
set showmatch                       "blink matching parentheses
set ignorecase                      "do case insensitive searching
set hls                             "use highlight search
set exrc                            "enable per-directory .vimrc files
set secure                          "disable unsafe commands in local .vimrc files
set t_Co=256                        "256 color support
set laststatus=2
set encoding=utf-8
set clipboard+=unnamed

set runtimepath^=~/.vim/bundle/ctrlp.vim

set backupdir=~/.vim/backup
set dir=~/.vim/swap
set undodir=~/.vim/undo
set cursorcolumn
set mouse=a

set wildmode=longest,list
set wildmenu

filetype plugin indent on

"from Jared"
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = '' " Stop messing with the path
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|coverage\|vendor/bundle\|result\|build\|img'

let mapleader = ' '
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_fugitive_prefix = ' '
let g:airline_readonly_symbol = ''
let g:airline_linecolumn_prefix = ''
let g:airline_theme='jellybeans'
let NERDTreeShowHidden=1

colorscheme jellybeans
highlight clear SignColumn

autocmd BufNewFile,BufRead *.mobile.erb let b:eruby_subtype='html'
autocmd BufNewFile,BufRead *.mobile.erb set filetype=eruby
autocmd BufNewFile,BufRead .pryrc set filetype=ruby
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Gemfile.lock set filetype=ruby
autocmd BufNewFile,BufRead *.aspx set filetype=javascript
autocmd BufNewFile,BufRead *.ascx set filetype=javascript
" autocmd BufNewFile,BufRead *.html set filetype=javascript
autocmd BufNewFile,BufRead *.asmx set filetype=aspnet

"This maps ctrl+h and ctrl+l to moving between :vsplit windows
map <silent> <C-J> <C-W>j
map <silent> <C-K> <C-W>k
map <silent> <C-H> <C-W>h
map <silent> <C-L> <C-W>l
map <silent> <S-H> <C-W>H
map <silent> <S-L> <C-W>L
map <silent> <C-M> <C-W>_
map <silent> <C-=> <C-W>=
map <silent> <+> <C-W><S-=>
map <silent> <C-N> :silent noh<CR>
map <silent> <C-T> :NERDTree <CR>
map <silent> gb :Gblame<CR>
map <silent> gc :Gcommit<CR>
map <silent> gC :Gcommit -a<CR>
map <silent> gl :gitv<CR>
map <silent> gs :Gstatus<CR>

nmap <leader>p :!mkdir -p %:p:h<cr>

"Expression mappings.
cabbr <expr> %% expand('%:p:h')

map <F1> :NERDTreeToggle<CR>
map <F2> :TagbarToggle<CR>
map <F3> :SVNBlame<CR>
map <F4> :SVNLog<CR>

"Paste mode"
nmap <F5> :set paste!<CR>

"Find javascript"
nmap <F6> /javascript"><CR>mzV/script><CR>=`z<CR>
map <F7> gg=G''
map <F8> :EraseBadWhitespace <CR>


"No arrow keys. :(
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"ctrl p stuff from Jared"
nmap <leader><leader> :CtrlP<cr>
nmap <leader>fa :CtrlP app/assets<cr>
nmap <leader>fc :CtrlP app/controllers<cr>
nmap <leader>fm :CtrlP app/models<cr>
nmap <leader>ft :CtrlPTag<cr>
nmap <leader>fv :CtrlP app/views<cr>

"tidy stuff from DK"
nmap =t :%! tidy -config ~/.tidyrc<CR>

"EasyMotion Fixup"
map <Leader> <Plug>(easymotion-prefix)

"Comment Code"
map <C-K>c <c-_><c-_>

"jshint"
let g:syntastic_javascript_checkers = ['jshint']

execute pathogen#infect()

"font size for macvim"
if has("gui_running")
  if has("gui_macvim")
    set guifont=Menlo\ Regular:h16
  endif
endif

"gist"
let g:gist_clip_command = 'pbcopy'
let g:gist_post_private = 1

"drag visual"
vmap <expr> ˙ DVB_Drag('left')
vmap <expr> ¬ DVB_Drag('right')
vmap <expr> ∆ DVB_Drag('down')
vmap <expr> ˚ DVB_Drag('up')

vmap <expr> <C-H> DVB_Drag('left')
vmap <expr> <C-L> DVB_Drag('right')
vmap <expr> <C-J> DVB_Drag('down')
vmap <expr> <C-K> DVB_Drag('up')
