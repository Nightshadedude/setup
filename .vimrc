" This is to autoload and configure vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
'
call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
" Plug 'valloric/youcompleteme'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" theme
color dracula
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

set hidden


let g:racer_cmd = "/home/user/.cargo/bin/racer"
let g:racer_experimental_completer = 1

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END
