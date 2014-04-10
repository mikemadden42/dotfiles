" Disable vi compatibility mode.
set nocompatible

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

" Disable highlighting search matches.
set nohlsearch 

" Enable incremental search.
set incsearch

" Enable 256 colors
set t_Co=256

" Disable modeline
set nomodeline

" Perl programming enhancements
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
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to
" reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" Enable syntax highlighting & color scheme.
syntax on
colorscheme distinguished
