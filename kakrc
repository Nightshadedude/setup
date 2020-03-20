source "%val{config}/plugins/plug.kak/rc/plug.kak"
plug "alexherbo2/kakoune-dracula-theme" theme

hook global InsertChar ; %{ try %{
  exec -draft hH <a-k>;;<ret> d
  exec <esc>
}}

colorscheme kakoune-dracula-theme

set global tabstop 4                                                        
set global indentwidth 4
set global expandtab
