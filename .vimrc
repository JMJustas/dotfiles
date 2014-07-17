set nocompatible
"Bundle plugin installer configuration
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Installed plugins
Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'davidhalter/jedi-vim'
Plugin 'Lokaltog/powerline'
Plugin 'scrooloose/syntastic'
call vundle#end()
filetype plugin indent on

syntax on
"tab is equal 4 spaces
set tabstop=4
set shiftwidth=4
"solarized color scheme settings
set t_Co=16
set background=dark
let g:solarized_termcolors=16
colorscheme solarized

"Turn on line numbering
set number

au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags





