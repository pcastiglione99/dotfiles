call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim'
Plug 'preservim/vim-markdown'

"Themes
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'sainnhe/sonokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Rigellute/rigel'
Plug 'rakr/vim-one'
call plug#end()

set number relativenumber
set encoding=UTF-8
set tabstop=4
set shiftwidth=4
syntax on
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
nnoremap <C-t> :NERDTreeToggle<CR>

" Theme
set termguicolors
colorscheme one
" Transparency
highlight Normal guibg=NONE ctermbg=NONE
highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE
highlight clear LineNr
highlight clear SignColumn
highlight clear StatusLine


" Change Color when entering Insert Mode
autocmd InsertEnter * set nocursorline

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * set nocursorline

"" extra settings, uncomment them if necessary :) 
"set cursorline
"set noshowmode
"set nocursorline

" trasparent end
"Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

"VimTex
filetype plugin indent on
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'

"WordProcessor
func! WordProcessor()
  Goyo
  set number relativenumber
  set tw=80
  " movement changes
  "map j gj
  "map k gk
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  " spelling and thesaurus
  setlocal spell spelllang=en_us
  set thesaurus+=/home/test/.vim/thesaurus/mthesaur.txt
  " complete+=s makes autocompletion search the thesaurus
  set complete+=s
endfu
com! WP call WordProcessor()
