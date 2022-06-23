:set number
:set relativenumber

" Line Indentation
:set autoindent
:set smarttab
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set mouse=a
:set completeopt-=preview 

" Key Mapping
:imap jk <Esc>					
:nnoremap <C-s> :w<CR>		
:inoremap <C-s> <Esc>:w<CR>i
:nnoremap <C-w> :q<CR>	

" Plugins
call plug#begin()
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'https://github.com/preservim/nerdtree'
Plug 'http://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary' 
Plug 'https://github.com/ap/vim-css-color' 
Plug 'https://github.com/rafi/awesome-vim-colorschemes' 
Plug 'https://github.com/haishanh/night-owl.vim'
Plug 'https://github.com/neoclide/coc.nvim'
Plug 'https://github.com/ryanoasis/vim-devicons' 
Plug 'https://github.com/tc50cal/vim-terminal' 
Plug 'https://github.com/preservim/tagbar' 
Plug 'https://github.com/terryma/vim-multiple-cursors' 
call plug#end()

" Color Theme
:set termguicolors
syntax enable
colorscheme night-owl
"colorscheme sonokai

" PLUGIN CONFIG
" NERDTree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" Multiple Cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Lightline
let g:lightline = { 'colorscheme': 'nightowl' }

" Tagbar
nmap <F8> :TagbarToggle<CR>

