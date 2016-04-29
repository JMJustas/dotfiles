set nocompatible
"Bundle plugin installer configuration
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Installed plugins
Plugin 'VundleVim/Vundle.Vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/MatchTagAlways'
" autocompletion
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
" markdown
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/taglist.vim'
Plugin 'plasticboy/vim-markdown'
" javascript
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'marijnh/tern_for_vim'

Plugin 'editorconfig/editorconfig-vim'
Plugin 'yegappan/greplace'


call vundle#end()
"Add powerline to path
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"powerline should be visible allways
set laststatus=2
filetype plugin indent on

syntax on
set hlsearch
set splitright
"tab is equal 4 spaces
set tabstop=4
set shiftwidth=4
autocmd FileType python set sts=4
"solarized color scheme settings
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

"editorconfig plugin options
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
"ctrlp otions
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
if exists("g:ctrl_user_command")
	unlet g:ctrlp_user_command
endif
set wildignore+=*/node_modules/*
set wildignore+=*/build/*
set wildignore+=*/logs/*
" JAVASCRIPT
 autocmd FileType javascript let b:syntastic_checkers = ['eslint'] 


"Turn on line numbering
set number
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"auto-save when switching buffers
set autowrite

"Moving swap and backup files to different dir
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 

imap <C-c> <CR><Esc>O
map <F2> :NERDTreeToggle<CR>
map <F9> :w<CR>:!python  %<CR>
map bp Oimport pdb; pdb.set_trace()<ESC>
