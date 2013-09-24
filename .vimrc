set nocompatible               " be iMproved
" Vundle setup
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

let g:vundle_default_git_proto = 'ssh'

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" bundles
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'

" I want this, turn it back on after Vundle setup
filetype plugin indent on

""2-space tabs
set shiftwidth=2
set tabstop=2
set expandtab

syntax on

" use syntax highlighting colors that show up on a dark background
set background=dark

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
