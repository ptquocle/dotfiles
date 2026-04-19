set nocompatible
set number
set relativenumber
set cursorline
highlight CursorLine cterm=NONE ctermbg=236 ctermfg=NONE
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
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jiangmiao/auto-pairs'
  Plug 'joshdick/onedark.vim'
call plug#end()


inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

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
if has('persistent_undo')
	set undodir=~/.vim/undodir
	set undofile
endif

let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_default_working_path = '/ubda/home/24116736d'
autocmd FileType python nnoremap <F5> :w <bar> !python3 % <CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERTree.isTabTree() | quit | endif
syntax on
colorscheme onedark
