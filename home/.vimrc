if empty(glob("~/.vim/autoload/plug.vim"))
   execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
  endif
endfunction

function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction

function! Installjshint(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g jshint
  endif
endfunction

let g:python_host_prog='/usr/bin/python'

call plug#begin('~/.vim/plugged')

Plug 'nanotech/jellybeans.vim'
Plug 'bling/vim-airline'
Plug 'kchmck/vim-coffee-script'
Plug 'csexton/trailertrash.vim'
Plug 'scrooloose/nerdtree'
Plug 'juvenn/mustache.vim'
Plug 'yaymukund/vim-rabl'
Plug 'int3/vim-extradite'
Plug 'sjl/splice.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-pathogen'
Plug 'tpope/vim-sleuth'
Plug 'bitc/vim-bad-whitespace'
Plug 'kien/ctrlp.vim'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'scrooloose/syntastic', { 'do': function('Installjshint') }
Plug 'mattn/emmet-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'jshint/jshint'
Plug 'Shutnik/jshint2.vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'elzr/vim-json'
Plug 'digitaltoad/vim-jade'
Plug 'moll/vim-node'
Plug 'gioele/vim-autoswap'
Plug 'gavinbeatty/dragvisuals.vim'
Plug 'rking/ag.vim'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'juneedahamed/svnj.vim'
Plug 'majutsushi/tagbar'
Plug 'ternjs/tern_for_vim', { 'do': function('BuildTern') }

call plug#end()

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
set wrap

set runtimepath^=~/.vim/bundle/ctrlp.vim

set backupdir=~/.vim/backup
set dir=~/.vim/swap
set undodir=~/.vim/undo
set cursorcolumn
set mouse=a

set wildmode=longest,list
set wildmenu

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
" let g:airline_fugitive_prefix = ' '
" let g:airline_readonly_symbol = ''
" let g:airline_linecolumn_prefix = ''
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
map <F6> /Index: <CR> zz
map <F7> gg=G''
map <F8> :EraseBadWhitespace <CR>
map <F11> :Ag <C-R><C-W> <C-R>=@% <CR><CR>
map <F12> :Ag <C-R><C-W><CR>

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
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>fa :CtrlP app/assets<cr>
nmap <leader>fc :CtrlP app/controllers<cr>
nmap <leader>fm :CtrlP app/models<cr>
nmap <leader>ft :CtrlPTag<cr>
nmap <leader>fv :CtrlP app/views<cr>

"tidy stuff from DK"
nmap =t :%! tidy -config ~/.tidyrc<CR>

"Comment Code"
map <C-K>c <c-_><c-_>

"jshint"
let g:syntastic_javascript_checkers = ['']
" let g:syntastic_javascript_checkers = ['jshint']

"Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" execute pathogen#infect()

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

"vim tricks"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"relative number
set number
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
autocmd BufLeave,FocusLost * :set norelativenumber
autocmd BufEnter,FocusGained * :set relativenumber

"DelimitMate
imap <C-c> <CR><Esc>O

"YCM
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
