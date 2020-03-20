hook global InsertChar ; %{ try %{
  exec -draft hH <a-k>;;<ret> d
  exec <esc>
}}

colorscheme gruvbox

set global tabstop 4                                                        
set global indentwidth 4
set global expandtab
