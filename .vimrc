" Use the system clipboard
set clipboard+=unnamed
" Switch syntax highlighting on
syntax on
" Don't worry about trying to support old school Vi features
set nocompatible
" Disable Mouse (this is something that only recently affected me within NeoVim)
" Seemed using the mouse to select some text would make NeoVim jump into VISUAL mode?
set mouse=
" No backup files
" set nobackup
" No write backup
" set nowritebackup
" No swap file
" set noswapfile
" Command history
set history=100
" Always show cursor
" set ruler
" Show incomplete commands
" set showcmd
" Incremental searching (search as you type)
" set incsearch
" Highlight search matches
" set hlsearch
" Ignore case in search
set smartcase
" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase
" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
set hidden
set autoindent
" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu
" Redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw
" Highlight the current line
" set cursorline!
" Ensure Vim doesn't beep at you every time you make a mistype
set visualbell
" Better splits (new windows appear below and to the right)
set splitbelow
set splitright
" Autoload files that have changed outside of vim
set autoread
" Turn on line numbers
set number
" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·
" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100
" Always show status bar
set laststatus=2
" Set the status line to something useful
set statusline=%f\ %m\ %=L:%l/%L\ C:%c\ (%p%%)
" Turn word wrap off
set nowrap
" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start
" Convert tabs to spaces
set expandtab
" Set tab size in spaces (this is for manual indenting)
set tabstop=2
" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=2
set encoding=utf-8
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
" Highlight a matching [{()}] when cursor is placed on start/end character
au BufRead,BufNewFile *.rabl setfiletype ruby
set showmatch
set relativenumber
" for command mode
nnoremap <S-Tab> <<
" " for insert mode
inoremap <S-Tab> <C-d>
" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l
    
filetype plugin on            " required
syntax enable
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
noremap <c-s-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-s-down> ddp
inoremap kj <Esc>`^
inoremap lkj <Esc>`^:w!<CR>
inoremap ;lkj <esc>:wq!<cr>
imap jj <Esc>
noremap <C-d> <esc>:wq!<cr>               " save and exit
nnoremap <C-d> :wq!<cr>
nnoremap <C-q> :qa!<cr>               " quit discarding changes
let mapleader = "z"
colorscheme darcula
"colorscheme darcula
" set the runtime path to include Vundle and initialize
" tabular
" map <Leader>x :Tab /from<bar>:= <CR>
noremap <Leader>x :Tab /= \<bar>=>\<bar>:=\<bar>from<cr>
"map <Leader>xx :Tab /\|\zs \| Tab /from\zs<CR>
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" Load all groups, custom dir, and janus core
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
"""""""" FILE SEARCH / SILVER SEARCH """""""
Plugin 'dyng/ctrlsf.vim'
"""""""" FILE SEARCH / SILVER SEARCH """""""

""""""""""""""" REACT JSX """"""""""""""""""
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'maxmellon/vim-jsx-pretty'
let g:jsx_ext_required = 0
""""""""""""""" REACT JSX """"""""""""""""""

"""""""""""""""" SNIPPETS """"""""""""""""""
 " https://github.com/SirVer/ultisnips
Plugin 'SirVer/ultisnips'
 " Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger="<Leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
"""""""""""""""" SNIPPETS """"""""""""""""""

let g:ackprg = 'ag --nogroup --nocolor --column'

" The Silver Searcher
 if executable('ag')
   " Use ag over grep
   set grepprg=ag\ --nogroup\ --nocolor
          " Use ag in CtrlP for listing files. Lightning fast and respects
"       .gitignore
   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
   let g:ctrlp_use_caching = 0
 endif
 " bind K to grep word under cursor
 nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR> 
  
Plugin 'kien/ctrlp.vim'
let g:ctrlp_user_command = [ '.git', 'cd %s && git ls-files . -co --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules|bower_components|build|public|git|tmp)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" To use path where application starts from
let g:ctrlp_working_path_mode = 0
let g:ctrlp_reuse_window  = 'startify'
let g:ackprg = 'ag --nogroup --nocolor --column'
"skip inside gitignore
" .vimrc.after is loaded after the plugins have loaded
execute pathogen#infect()
call pathogen#helptags()
autocmd vimenter * NERDTree
" remove all empry spaces after save
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.jsx :%s/\s\+$//e
"FOR COLORS
Plugin 'flazz/vim-colorschemes'
set guifont=Devicons:h11
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

" FOR TABS
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
"nnoremap tl  :tablast<CR>
"nnoremap tt  :tabedit<Space>
"nnoremap tn  :tabnext<Space>
"nnoremap tm  :tabm<Space>
"nnoremap td  :tabclose<CR>

" FOR COMMENTS SHORTCUTS
Plugin 'scrooloose/nerdcommenter'

Plugin 'terryma/vim-multiple-cursors'
" >>> KEY_MAP
" roggle tabs
" switch between windows with Cmd-[H,J,K,L]
map <Leader>h :vertical resize -50<cr>
nnoremap <Leader>k :resize +50<cr>
nnoremap <Leader>j :resize -50<cr>
nnoremap <Leader>l :vertical resize +50<cr>
map ^[f :resize -50<cr> 
" Search / Replace:
noremap <Leader>r : %s/
noremap <Leader>f : /

map <Leader>/  <Leader>c<space>  

" switch between windows with Cmd-[H,J,K,L]
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-w> :q!<CR>

map!               <C-p>     :CtrlP<CR>
map                <c-s>     :NERDTreeFind<cr>
map                <C-s>s     :NERDTreeToggle<CR>
" To save, ctrl-s.
silent !stty -ixon "allow ctrl-s
"
" iRestore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon
"
"irline#extensions#tabline#enabled = 1 All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
