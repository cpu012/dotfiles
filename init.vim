call plug#begin()
"Plug '907th/vim-auto-save'
Plug 'stevearc/dressing.nvim'
Plug 'itchyny/lightline.vim'
Plug 'tommcdo/vim-lion'
Plug 'dracula/vim'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'maxboisvert/vim-simple-complete'
call plug#end()
	  
set noshowmode
set noswapfile
set number
set autoindent
set incsearch is
set hlsearch is
set cursorline
set cursorcolumn
set ignorecase
set scrolloff=15
set expandtab
set shiftround
set shiftwidth=2
set smarttab
set tabstop=2
set ruler
set relativenumber
set title
set laststatus=2
set wildmenu
colorscheme dracula

" autosave

"let g:auto_save = 1
"let g:auto_save_silent = 1
"augroup ft_python
"  au!
"  au FileType python let b:auto_save = 0
"augroup END

" lightline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
inoremap <expr> <tab> coc#pum#visible() ? coc#pum#insert() : "\<tab>"
