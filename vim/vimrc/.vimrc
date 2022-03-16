call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'stevearc/vim-arduino'

call plug#end()


" indentation
set autoindent
set expandtab
set shiftwidth=4
set smarttab
set tabstop=4

" search
set ignorecase
set incsearch

" colors
syntax enable
colorscheme solarized
set background=dark
set cursorline
set cursorcolumn

" misc
set laststatus=2
set noshowmode
let mapleader=" "

" lightline
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

" numbers
set number
set relativenumber

" nerdtree
"autocmd VimEnter * NERDTree | wincmd p
"autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif


nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
noremap <C-f> :NERDTreeFind<CR>

" arduino-vim
nnoremap <buffer> <leader>aa :ArduinoAttach
nnoremap <buffer> <leader>am <cmd>ArduinoVerify<CR>
nnoremap <buffer> <leader>au <cmd>ArduinoUpload<CR>
nnoremap <buffer> <leader>ad <cmd>ArduinoUploadAndSerial<CR>
nnoremap <buffer> <leader>ab <cmd>ArduinoChooseBoard<CR>
nnoremap <buffer> <leader>ap <cmd>ArduinoChooseProgrammer<CR>
