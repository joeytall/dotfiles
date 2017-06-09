set termguicolors
set clipboard+=unnamedplus

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

function! Installeslint(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g eslint
  endif
endfunction

set clipboard=unnamedplus
call plug#begin('~/.vim/plugged')

source ~/.vim_python_rc

Plug 'joeytall/python-syntax'
Plug 'joeytall/onedark.vim'
Plug 'burnettk/vim-angular'
Plug 'StanAngeloff/php.vim'
Plug 'sjl/gundo.vim'
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
Plug 'sheerun/vim-polyglot'
Plug 'bitc/vim-bad-whitespace'
Plug 'kien/ctrlp.vim'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'vim-syntastic/syntastic', { 'do': function('Installeslint') }
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'elzr/vim-json'
Plug 'digitaltoad/vim-pug'
Plug 'moll/vim-node'
Plug 'gioele/vim-autoswap'
Plug 'gavinbeatty/dragvisuals.vim'
Plug 'rking/ag.vim'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'juneedahamed/svnj.vim'
Plug 'ternjs/tern_for_vim', { 'do': function('BuildTern') }
Plug 'vim-scripts/dbext.vim'
Plug 'sjl/gundo.vim'
Plug 'python-mode/python-mode'
Plug 'othree/html5.vim'

call plug#end()

"neovim"
set hidden
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=10       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.

set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

"vim
set nu
set ts=2                            "tab stop 2
set autoindent
set smartindent                     "use smart indenting
set bs=2                            "allow backspace in insert mode
syntax enable                       "enable syntax highlighting
syntax on                       "enable syntax highlighting
set wmh=0                           "set min window height
set hls                             "use highlight search
set exrc                            "enable per-directory .vimrc files
set secure                          "disable unsafe commands in local .vimrc files
set laststatus=2
set encoding=utf-8
set wrap

set runtimepath^=~/.vim/bundle/ctrlp.vim

set backupdir=~/.vim/backup
set dir=~/.vim/swap
set undodir=~/.vim/undo
set cursorcolumn
set mouse=a

set undofile
set history=100
set undolevels=100

set wildmode=longest,list
set wildmenu

"from Jared"
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = '' " Stop messing with the path
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|coverage\|vendor/bundle\|build\|img\|**/*.pyc\|**/*.edited\|**/*.diff\|**/*.deb'

let mapleader = ' '
let g:airline_theme='onedark'
let g:airline_section_y=''
let g:airline_section_z='%3p%%'

let NERDTreeShowHidden=1

let python_highlight_all = 1

colorscheme onedark
highlight clear SignColumn
highlight CursorColumn guibg=#404040

autocmd BufNewFile,BufRead *.mobile.erb let b:eruby_subtype='html'
autocmd BufNewFile,BufRead *.mobile.erb set filetype=eruby
autocmd BufNewFile,BufRead .pryrc set filetype=ruby
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Gemfile.lock set filetype=ruby
autocmd BufNewFile,BufRead *.aspx set filetype=javascript
autocmd BufNewFile,BufRead *.ascx set filetype=javascript
autocmd BufNewFile,BufRead *.asmx set filetype=aspnet

"db.ext
let g:dbext_default_profile_sqlite = 'type=SQLITE:dbname=/home/joeytall/Projects/fsa_chroot_env/drive0/private/db/FortiSandboxGUI.db'
let g:dbext_default_profile = 'sqlite'

"This maps ctrl+h and ctrl+l to moving between :vsplit windows
map <silent> <bs> <C-W>h
map <silent> <C-J> <C-W>j
map <silent> <C-K> <C-W>k
map <silent> <C-H> <C-W>h
map <silent> <C-L> <C-W>l
map <silent> <S-H> <C-W>H
map <silent> <S-L> <C-W>L
map <silent> <S-K> <C-W>K
map <leader>K <C-W>K
map <leader>J <C-W>J
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

map <F1> :EraseBadWhitespace <CR>
map <F2> :TagbarToggle<CR>
map <F3> :SVNBlame<CR>
map <F4> :SVNLog<CR>
map <F5> :GundoToggle<CR>

"Find javascript"
map <F6> /Index: <CR> zz
map <F7> :GundoToggle <CR>
map <F8> :NERDTreeToggle<CR>
map <F10> :lclose<CR>
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
" map <C-K>c <c-_><c-_>

"eslint"
" let g:syntastic_javascript_checkers = ['']
" let g:syntastic_javascript_checkers = ['eslint']

"Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_w = 0
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

"vim tricks"
nnoremap <Leader>e :e<CR>
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

let g:pymode_folding = 0
let g:pymode_breakpoint_bind = '<leader>g'
let g:pymode_lint_unmodified = 1
let g:pymode_lint_ignore = "W0401"
let g:pymode_lint_checkers = ['pyflakes',]
let g:pymode_lint_cwindow = 0
let g:pymode_lint_todo_symbol = 'W'
let g:pymode_lint_comment_symbol = 'C'
let g:pymode_lint_visual_symbol = 'R'
let g:pymode_lint_error_symbol = 'E'
let g:pymode_lint_info_symbol = 'I'
let g:pymode_lint_pyflakes_symbol = 'F'
let g:pymode_rope= 0
let g:pymode_rope_completion = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_options_colorcolumn = 0

"Eliminate delays on ESC
set timeoutlen=1000 ttimeoutlen=0

"crontab
autocmd FileType crontab setlocal nobackup nowritebackup
