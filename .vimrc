"
"
" Configure vundle.
"
"

" We also want to turn off the default filetype controls for now because the
" way that vim caches filetype rules at runtime interferes with the way that
" vundle alters the runtime environment. We will change this back later.
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Configure Plugins.
Bundle 'bfontaine/brewfile.vim'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'ekalinin/dockerfile.vim'
Bundle 'elzr/vim-json'
Bundle 'fatih/vim-go'
Bundle 'flazz/vim-colorschemes'
Bundle 'keith/swift.vim'
Bundle 'pearofducks/ansible-vim'
Bundle 'rodjek/vim-puppet'
Bundle 'rust-lang/rust.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'

" Now we can turn our filetype functionality back on.
filetype plugin indent on

" vim-airline setup
set laststatus=2

"
"
" Add any additional vim settings that we need.
"
"

" Use 4-space tabs & expand tabs to spaces.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Show line numbers.
set number

" Disable line wrap.
set nowrap

" Enable status line for each window.
set ruler

" Enable highlighting search matches.
set hlsearch

" Enable incremental search.
set incsearch

" Enable 256 colors
set t_Co=256

" Disable modeline
set nomodeline

" Perl programming enhancements
" http://www.perlmonks.org/?node_id=540167
let perl_extended_vars=1
let perl_fold=1
let perl_fold_blocks = 1
let perl_include_pod=1
au FileType perl setlocal expandtab foldmethod=syntax shiftwidth=4 softtabstop=4 tabstop=4 autoindent cursorline
au BufNewFile *.pl s-^-#!/usr/bin/env perl\r\ruse 5.010;\ruse autodie;\ruse strict;\ruse warnings;\r\r-

" Python programming enhancements
" http://www.aleksa.org/2013/03/python-friendly-vimrc.html
let python_highlight_builtins=1
au FileType python setlocal expandtab foldmethod=indent shiftwidth=4 softtabstop=4 tabstop=4 autoindent cursorline
au BufNewFile *.py s-^-#!/usr/bin/env python\r\r\import os\rimport sys\r\rdef hello():\r    print 'Hello %s on %s.' % (os.getlogin(), sys.platform)\r\rif __name__ == '__main__':\r    hello()-

" Go programming enhancements
" let g:go_version_warning = 0

" Jenkins enhancements
au BufNewFile,BufRead Jenkinsfile setf groovy

" Enable syntax highlighting & color scheme.
syntax on
set background=dark
colorscheme distinguished
" let g:solarized_termcolors=256
" colorscheme solarized
