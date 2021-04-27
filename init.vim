" This is to autoload and configure vim-plug
" from https://github.com/junegunn/vim-plug/issues/739
let plug_install = 0
let autoload_plug_path = stdpath('config') . '/autoload/plug.vim'
if !filereadable(autoload_plug_path)
    silent exe '!curl -fL --create-dirs -o ' . autoload_plug_path .
        \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    execute 'source ' . fnameescape(autoload_plug_path)
    let plug_install = 1
endif
unlet autoload_plug_path

" Start plug calls
call plug#begin('~/.config/nvim/plugins')

" Colorscheme pack
Plug 'flazz/vim-colorschemes'

" COC autocomletion
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" NeoVIM Language Server Protocol Config
Plug 'neovim/nvim-lspconfig'

" Extentions to built-in LSP, for example, providing type inlay hints
Plug 'nvim-lua/lsp_extensions.nvim'

" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'

call plug#end()

if plug_install
    PlugInstall --sync
endif
unlet plug_install
" End of Plug calls


" Setup appearance and theme
set termguicolors
set t_Co=256
set colorcolumn=81
set textwidth=80
colorscheme desertEx

" Give more space for displaying messages.
set cmdheight=4

" Formatting options
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set number


" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" If a new buffer is open, the prior is hidden and not closed
set hidden

" Alternate escape
imap ;; <Esc>

" LSP config
syntax enable
filetype plugin indent on

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure golang lsp
" https://github.com/golang/tools/tree/master/gopls
"
""""""""""""TODO""""""""""""
"

" Configure JS/TS lsp
" https://github.com/theia-ide/typescript-language-server
"
""""""""""""TODO""""""""""""
"

" Configure python lsp
" https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#pyls or pyright
"
""""""""""""TODO""""""""""""
"

" Configure rust lsp
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
" and ensure https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary
" has been completed
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({
    capabilities=capabilities,
    on_attach=on_attach
})

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        update_in_insert = true,
    }
)
EOF

" Code navigation shortcuts
" as found in :help lsp
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" rust-analyzer does not yet support goto declaration
" re-mapped `gd` to definition
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

" Trigger completion with <tab>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)

" have a fixed column for the diagnostics to appear in
set signcolumn=yes

" amount of time (in ms) of no cursor movement to trigger CursorHold
set updatetime=100

" Show diagnostic popup on cursor hover
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }
