set nocompatible
set number
set relativenumber
set cursorline
highlight CursorLine cterm=NONE ctermbg=236 ctermfg=NONE
highlight Pmenu ctermbg=238 ctermfg=white
highlight PmenuSel ctermbg=blue ctermfg=white
highlight CocFloating ctermbg=238
set hidden
set mouse=a
set noswapfile
set hlsearch
set incsearch
set ignorecase
set smartcase

set wildignore+=*/.conda/*,*/files/*,*.jpg,*.png,*.csv.gz,*.pyc,*/.git/*
call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_lint_on_text_changed = 'always'
let g:ale_sign_column_always = 1
nmap <silent> [w <Plug>(ale_previous_wrap)
nmap <silent> ]w <Plug>(ale_next_wrap)
let mapleader = " "
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap jk <Esc>
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_default_working_path = '/ubda/home/24116736d'
autocmd FileType python nnoremap <F5> :w <bar> !python3 % <CR>
