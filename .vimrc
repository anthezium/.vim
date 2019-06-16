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

" set up plugin for racket, pie files
if has("autocmd")
  au BufReadPost *.rkt,*.rktl,*.pie set filetype=racket
  au filetype racket set lisp
  au filetype racket set autoindent
endif

" row and col in statusline
set ruler

" edit gpg encrypted files
" Don't save backups of *.gpg files
set backupskip+=*.gpg
" To avoid that parts of the file is saved to .viminfo when yanking or
" deleting, empty the 'viminfo' option.
set viminfo=

augroup encrypted
  au!
  " Disable swap files, and set binary file format before reading the file
  autocmd BufReadPre,FileReadPre *.gpg
    \ setlocal noswapfile bin
  " Decrypt the contents after reading the file, reset binary file format
  " and run any BufReadPost autocmds matching the file name without the .gpg
  " extension
  autocmd BufReadPost,FileReadPost *.gpg
    \ execute "'[,']!gpg --decrypt --default-recipient-self 2>/dev/null" |
    \ setlocal nobin |
    \ execute "doautocmd BufReadPost " . expand("%:r")
  " Set binary file format and encrypt the contents before writing the file
  autocmd BufWritePre,FileWritePre *.gpg
    \ setlocal bin |
    \ '[,']!gpg --encrypt --default-recipient-self
  " After writing the file, do an :undo to revert the encryption in the
  " buffer, and reset binary file format
  autocmd BufWritePost,FileWritePost *.gpg
    \ silent u |
    \ setlocal nobin
augroup END
