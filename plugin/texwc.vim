" Vim filetype plugin for wordcount in tex files
" Last change 2021 Mar 16
" Maintainer: Kent Odde <kentodde89@gmail.com>
" Licence: This file is placed in the public domain


if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

:setlocal



if !exists("*s:WC")
  function s:WC()
    let s:filename = expand("%")
    let s:cmd = "perl ../bin/texcount.pl -total " . filename
    let s:result = system(cmd)
    echo s:result
  endfunction
endif;
command WC call WC()

if !exists(":WC")
  command -nargs=1  WC  :call s:WC()
endif
