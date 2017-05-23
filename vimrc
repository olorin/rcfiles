syntax on
set number

au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType haskell setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType cabal setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType markdown setlocal tw=72 tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType html setlocal tw=72 tabstop=4 expandtab shiftwidth=4 softtabstop=4

command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
