set nocompatible
set noshowmode
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'joshdick/onedark.vim'
Plugin 'vim-airline/vim-airline'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" FS management
Plugin 'preservim/nerdtree'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'

" Code autocomplete
Plugin 'neoclide/coc.nvim'
Plugin 'preservim/nerdcommenter'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-utils/vim-ruby-fold'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'

" JS/TS
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-graphql'

call vundle#end()

filetype plugin on

set relativenumber
set splitright
set hlsearch
set autowrite
set autoread
set tabstop=2 shiftwidth=2 expandtab

" Use new regexp engine based on https://jameschambers.co.uk/vim-typescript-slow
set re=0

setlocal foldmethod=syntax



let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 16
set background=dark
colorscheme onedark

" git gutter side column color
" highlight! link SignColumn LineNr
highlight SignColumn guibg=#ff0000 ctermbg=3

" Autoclose braces/brackets
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


let mapleader = ","

let NERDTreeShowHidden=1
nnoremap <F2> :NERDTreeToggle<CR>

" source .vimrc automatically on save like magic
au BufWritePost .vimrc so $MYVIMRC

" open vimrc in split with leaderev
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Git grep for the word under the cursor
:nnoremap <leader>G :Ggrep <C-r><C-w><cr>
:nnoremap <leader>GB :GBrowse <cr>

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red

let g:airline#extensions#tabline#enabled = 1

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Enable autocompletion popup
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" coc extensions are installed in ~/.config/coc/extensions
let g:coc_global_extensions = ['coc-solargraph']
let g:coc_global_extensions = ['coc-tsserver']
let g:coc_global_extensions = ['coc-html']
let g:coc_global_extensions = ['coc-json']
let g:coc_global_extensions = ['coc-go']
let g:coc_global_extensions = ['coc-markdownlint']
let g:coc_global_extensions = ['coc-sh']


" NERDCommenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable syntax highlighting
syntax on
" Git commit spellcheck, width
autocmd Filetype gitcommit setlocal spell textwidth=72
