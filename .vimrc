set nocompatible              " be iMproved, required
set macmeta
" Allow us to use Ctrl-s and Ctrl-q as keybinds
filetype plugin on            " required
syntax enable

noremap <c-s-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-s-down> ddp

inoremap jk <ESC>
let mapleader = "z"
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
colorscheme darcula
" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim

set wildmenu
set encoding=utf8

call vundle#begin()
" Load all groups, custom dir, and janus core
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
" FOR FILE SEARCH
" SILVER_SEARCH
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
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|git|tmp'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules\|bower_components\|git|tmp)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" To use path where application starts from
let g:ctrlp_working_path_mode = 0
let g:ackprg = 'ag --nogroup --nocolor --column'
"skip inside gitignore
" .vimrc.after is loaded after the plugins have loaded
execute pathogen#infect()
call pathogen#helptags()
autocmd vimenter * NERDTree

"FOR COLORS
Plugin 'flazz/vim-colorschemes'
set guifont=Devicons:h11
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11


" FOR TABS
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" FOR COMMENTS SHORTCUTS
Plugin 'scrooloose/nerdcommenter'

Plugin 'terryma/vim-multiple-cursors'
" >>> KEY_MAP
" roggle tabs
" switch between windows with Cmd-[H,J,K,L]
 map <Leader>h :vertical resize -5<cr>
 nnoremap <Leader>k :resize +5<cr>
 nnoremap <Leader>j :resize -5<cr>
 nnoremap <Leader>l :vertical resize +5<cr>
set <A-a>=^[a
map ^[f :resize -5<cr>

" Search / Replace:
noremap <Leader>r : %s/
noremap <Leader>f : /

" switch between windows with Cmd-[H,J,K,L]
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-w> :q!<CR>

map!               <C-p>     :CtrlP<CR>
map                <C-a>     :NERDTreeFind<CR>

map                <C-N>     :NERDTreeToggle<CR>
" To save, ctrl-s.
silent !stty -ixon "allow ctrl-s
"
" iRestore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon
map <C-s> :w<CR> :echo "Saved"<CR>
map  <C-/>  <Leader>ci
" <<< KEY_MAP
"
"irline#extensions#tabline#enabled = 1 All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
