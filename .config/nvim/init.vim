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
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'preservim/vim-markdown'
Plug 'sainnhe/sonokai'
call plug#end()

set number relativenumber
set encoding=UTF-8
set tabstop=4
set shiftwidth=4
syntax on
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
nnoremap <C-t> :NERDTreeToggle<CR>

"Material Theme
set termguicolors
let g:sonokai_terminal_italics = 1
let g:sonokai_theme_style = 'espresso'
colorscheme sonokai
hi Normal guibg=NONE ctermbg=NONE

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
