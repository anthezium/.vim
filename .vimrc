set nocompatible               " be iMproved
" Vundle setup
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let g:vundle_default_git_proto = 'ssh'

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/Vundle.vim'

" bundles
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'kazuoteramoto/vimtorrent'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" I want this, turn it back on after Vundle setup
filetype plugin indent on

""2-space tabs
set shiftwidth=2
set tabstop=2
set expandtab

""open new vertical split window on the right
set splitright

syntax on

" use syntax highlighting colors that show up on a dark background
set background=dark

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" use alt+pgup to move the current tab left, alt+pgdown to move it right
nnoremap <silent> <A-PageUp> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-PageDown> :execute 'silent! tabmove ' . tabpagenr()<CR>

" jump to search results as you type
set incsearch

" map tab to escape in insert mode
imap <tab> <esc>

" no syntax highlighting in latex code environments
au filetype tex syntax region texZone start='\\begin{code}' end='\\end{code}'
