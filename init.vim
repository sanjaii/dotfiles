call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'fatih/vim-go',{ 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-markdown'
Plug 'vim-ruby/vim-ruby'
Plug 'ekalinin/Dockerfile.vim'
"Plug 'cocopon/iceberg.vim'"
Plug 'rust-lang/rust.vim'
Plug 'morhetz/gruvbox'
Plug 'slim-template/vim-slim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'w0rp/ale'
call plug#end()
colorscheme gruvbox
set number
set relativenumber
set list
set tabstop=2
set shiftwidth=2
set ai

" ale linter
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'ﱥ'
let g:ale_sign_warning = ''

let g:ale_set_highlights = 0
let g:ale_lint_delay = 500

cnoreabbrev Fix ALEFix
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'reason':     ['refmt'],
\   'ruby':       ['rubocop'],
\   'go':         ['gofmt'],
\   'javascript': ['prettier', 'eslint'],
\}
let g:ale_ruby_rubocop_auto_correct_all = 1

let g:airline#extensions#ale#enabled = 1

imap <C-u> <Esc>ui
imap ,, <esc>
let mapleader = "\<Space>"
nmap <leader>so :source $MYVIMRC<cr>
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
