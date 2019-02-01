" Check to see if vim plug is installed, if not it installs it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'jnurmine/Zenburn'
Plug 'vim-airline/vim-airline'
call plug#end()

colors zenburn

" Turn on syntax
syntax on

" Show number lines
set number

" Set the number of columns occupied by a tab characer
set tabstop=4

" Indent new line the same amount as the line just typed
set autoindent

" Highlight search results
set hlsearch
