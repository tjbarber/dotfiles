set clipboard^=unnamed

call plug#begin(stdpath('data') . '/plugged')

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/vim-peekaboo'
Plug 'ap/vim-buftabline'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'alvan/vim-closetag'
Plug 'brooth/far.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'roman/golden-ratio' " Auto-expands current split
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'

call plug#end()

set number
let mapleader = ","
set tabstop=2
set shiftwidth=2
set expandtab

" Navigate tabs
nnoremap <C-k> :bnext<CR>
nnoremap <C-j> :bprev<CR>

" SPLITS
set splitbelow
 " open a new vertical split below
set splitright
" open a new horizontal split on the right

set fillchars=vert:│
 " Vertical separator between windows"

" Navigate splits
nnoremap <C-h> <C-w>h 
" Ctrl + h to move to the left split
nnoremap <C-l> <C-w>l 
" Ctrl + l to move to the right one

" Just press <LEADER> + f when on a word to search for it
nnoremap <Leader>f :Ag <C-R><C-W><cr>
" Works for visual mode as well
vnoremap <Leader>f y:Ag <C-R>"<cr>
" Pressing Ctrl+f and type the search pattern
nnoremap <C-F> :Ag<Space>

" Open files on enter in a new tab
let g:fzf_action = {
\ 'enter': 'tab split',
\ 'ctrl-x': 'split',
\ 'ctrl-v': 'vsplit' }
" Limit the window size to 40% screen from the bottom
let g:fzf_layout = { 'down': '~40%' }
" Mapping for most oftenly used command
nnoremap <Leader><Leader> :Files<cr>
" Search a file but only within the files that are changed (Git-wise)
command! Fzfc call fzf#run(fzf#wrap(
\ {'source': 'git ls-files --exclude-standard --others --modified'}))
noremap <Leader>] :Fzfc<cr>

" ===========
" NERDTree
" ===========
let NERDTreeShowHidden=1 " Always show dot (hidden) files
let NERDTreeQuitOnOpen=1 " Close the NERDTree after opening a file
map <Leader>n :NERDTreeFind<CR> " Leader + n to open the NT

" Open files on enter in a new tab
let g:fzf_action = {
\ 'ctrl-x': 'split',
\ 'ctrl-v': 'vsplit' }
" Limit the window size to 40% screen from the bottom
let g:fzf_layout = { 'down': '~40%' }
" Mapping for most oftenly used command
nnoremap <Leader><Leader> :Files<cr>
" Search a file but only within the files that are changed (Git-wise)
command! Fzfc call fzf#run(fzf#wrap(
\ {'source': 'git ls-files --exclude-standard --others --modified'}))
noremap <Leader>] :Fzfc<cr>

tnoremap <Esc> <C-\><C-n>

let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
