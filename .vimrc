set nocompatible
set noshowmode
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'joshdick/onedark.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-test/vim-test'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'idanarye/vim-merginal'

" FS management
Plugin 'preservim/nerdtree'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

" Code autocomplete
Plugin 'neoclide/coc.nvim'
Plugin 'preservim/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'wellle/targets.vim'
Plugin 'AndrewRadev/splitjoin.vim'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-utils/vim-ruby-fold'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'ngmy/vim-rubocop'

" JS/TS
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'jparise/vim-graphql'

call vundle#end()

filetype plugin on

" show relative numbers only in active window
:set number
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

set splitright
set hlsearch
set autowrite
set autoread
set autoindent
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

let mapleader = ","

" Search for a word under cursor using Ag
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

let NERDTreeShowHidden=1
nnoremap <F2> :NERDTreeToggle<CR>

" Ctrl+P to open files
nnoremap <C-p> :GFiles <CR>
nnoremap <C-f> :Files <CR>

" source .vimrc automatically on save like magic
au BufWritePost .vimrc so $MYVIMRC

" open vimrc in split with leaderev
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Git grep for the word under the cursor
:nnoremap <leader>G :Ggrep <C-r><C-w><cr>
:nnoremap <leader>GB :GBrowse <cr>

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red

function! Check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Enable autocompletion popup
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ Check_back_space() ? "\<TAB>" :
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

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Use K to show documentation in preview window
set updatetime=1000
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

" vim-test
let test#strategy = "vimterminal"
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tT :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

" VCS chortcuts
nmap  <leader>bb :Merginal<CR>
nmap  <leader>gg :Git<CR>

" NERDCommenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable syntax highlighting
syntax on
" Git commit spellcheck, width
autocmd Filetype gitcommit setlocal spell textwidth=72
