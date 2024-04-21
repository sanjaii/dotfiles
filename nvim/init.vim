call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'fatih/vim-go',{ 'do': ':GoUpdateBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'Mofiqul/dracula.nvim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'rust-lang/rust.vim'
Plug 'slim-template/vim-slim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'w0rp/ale'
Plug 'bronson/vim-trailing-whitespace'
Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'nvim-lua/plenary.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
call plug#end()

syntax enable
filetype plugin indent on

colorscheme dracula

set number
set relativenumber
set list
set tabstop=2
set shiftwidth=2
set ai
set clipboard+=unnamedplus

let mapleader = "\<Space>"

" ALE linter
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'ﱥ'
let g:ale_sign_warning = ''
let g:ale_set_highlights = 0
let g:ale_lint_delay = 500

cnoreabbrev Fix ALEFix
let g:ale_fix_on_save = 1
let g:ale_fixers = {
  \ 'reason':     ['refmt'],
  \ 'go':         ['gofmt'],
  \ 'javascript': ['prettier', 'eslint'],
  \ 'rust':       ['rustfmt']
  \ }

imap <C-u> <Esc>ui
imap ,, <Esc>
nmap <leader>so :source $MYVIMRC<CR>
nmap <leader>` :NvimTreeOpen<CR>
nmap <leader>n :bn<CR>
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Empty setup using defaults

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

require("bufferline").setup{
	options = {
		modified_icon = '●',
		offsets = {
			{
      	filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = true
      }
  	}
	}
}
EOF
