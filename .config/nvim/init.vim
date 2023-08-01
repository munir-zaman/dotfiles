syntax on
"spelling
set spl=en spell 
set encoding=utf-8

filetype plugin on

set relativenumber
set ruler

set cursorline
set cursorcolumn

set smartindent
set smartcase

set shiftwidth=4
set tabstop=4
set expandtab

set splitbelow
set splitright

set termguicolors

call plug#begin()
"Latex
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
"Colorschemes
Plug 'morhetz/gruvbox'
Plug 'pineapplegiant/spaceduck'
"Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Syntax
Plug 'sheerun/vim-polyglot'
call plug#end()

colorscheme spaceduck

" ### COC.NVIM ###
" use enter to accept completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" use <c-space> for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <c-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <expr> <c-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
