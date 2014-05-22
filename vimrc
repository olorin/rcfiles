syntax on
set number

au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType haskell setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType cabal setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType markdown setlocal tw=72 tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType html setlocal tw=72 tabstop=4 expandtab shiftwidth=4 softtabstop=4

au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.hs set filetype=haskell
au BufRead,BufNewFile *.cabal set filetype=cabal
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.ronn set filetype=markdown
au BufRead,BufNewFile *.html set filetype=html

command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

execute pathogen#infect()
