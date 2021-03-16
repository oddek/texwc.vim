" Vim filetype plugin for wordcount in tex files
" Last change 2021 Mar 16
" Maintainer: Kent Odde <kentodde89@gmail.com>
" Licence: LaTeX Project Public License

if exists("b:loaded_texwc")
  finish
endif
let b:loaded_texwc = 1

let s:path = resolve(expand('<sfile>:p:h:h'))

if !exists("*s:WC")
  function s:WC()
    let s:filename = expand("%")
    let s:cmd = "perl " . s:path . "/bin/texcount.pl -total " . s:filename
    let s:result = system(s:cmd)
    echo s:result
  endfunction
endif

if !exists(":WC")
  command WC call s:WC()
endif
