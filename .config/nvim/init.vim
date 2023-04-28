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
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'preservim/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'stevearc/vim-arduino'
call plug#end()

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


set number relativenumber
set nofoldenable
set encoding=UTF-8
syntax on
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" ++++++++++ NERDTree +++++++++++++++++++
inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>
" +++++++++++++++++++++++++++++++++++++++

" +++++++++++ Terminal +++++++++++++++++++++++++++++++++++
noremap <c-t> <Esc>:below 10sp<cr> \| <ESC>:terminal<cr> \| <ESC>:set norelativenumber<cr> \| <ESC>:set nonumber<cr> i
inoremap <c-t> <Esc>:below 10sp<cr> \| <ESC>:terminal<cr> \| <ESC>:set norelativenumber<cr> \| <ESC>:set nonumber<cr> i
tnoremap <c-t> <c-\><c-n> :q!<cr>
" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++


"++++++++ CoC <Tab> completion ++++++++++
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
"++++++++++++++++++++++++++++++++++++++++



"+++++++++++++++++++ Theme +++++++++++++++
" Vim Script
set termguicolors
colorscheme tokyonight-night

" Transparency
"highlight Normal guibg=NONE ctermbg=NONE
"highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE
"highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
"highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE
"highlight clear LineNr
"highlight clear SignColumn
"highlight clear StatusLine

" Change Color when entering Insert Mode
"autocmd InsertEnter * set nocursorline
" Revert Color to default when leaving Insert Mode
"autocmd InsertLeave * set nocursorline
"" extra settings, uncomment them if necessary :) 
"set cursorline
"set noshowmode
"set nocursorline
" trasparent end

let g:airline_theme='simple'

" +++++++++++++++++++++++++++++++++++++++++++++++


" +++++++++ Prettier ++++++++++++++++++
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
" ++++++++++++++++++++++++++++++++++++++


let g:arduino_dir = '/home/pcastiglione99/.config/arduino15'
let g:arduino_home_dir = '/home/pcastiglione99/.config/arduino15'


" ++++++++++ VimTex +++++++++++++++++++++++++
filetype plugin indent on
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
"WordProcessor
func! WordProcessor()
  Goyo
  set number relativenumber
  set tw=80
  " movement changes
  map j gj
  map k gk
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
" +++++++++++++++++++++++++++++++++++++++++++
