" This is to autoload and configure vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'valloric/youcompleteme'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-rls',  {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-rust-analyzer',  {'do': 'yarn install --frozen-lockfile'}
call plug#end()

color dracula
