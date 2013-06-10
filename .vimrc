set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

""2-space tabs
set shiftwidth=2
set tabstop=2
set expandtab

""SWANK for clojure
""let g:slimv_swank_clojure = '! xterm -e lein swank &'

""vimclojure
syntax on
filetype plugin indent on
""let vimclojure#WantNailgun = 1
""let vimclojure#NailgunClient = 
