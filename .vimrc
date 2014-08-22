set nocompatible
"Bundle plugin installer configuration
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Installed plugins
Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'davidhalter/jedi-vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/powerline'
Plugin 'scrooloose/syntastic'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
call vundle#end()
"Add powerline to path
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"powerline should be visible allways
set laststatus=2
filetype plugin indent on

syntax on
"tab is equal 4 spaces
set tabstop=4
set shiftwidth=4
autocmd FileType python set sts=4
"solarized color scheme settings
set t_Co=256
set background=dark
let g:solarized_termcolors=16
colorscheme solarized

"ctrlp otions
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

"Turn on line numbering
set number

au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
"auto-save when switching buffers
:set autowrite

"Moving swap and backup files to different dir
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//


