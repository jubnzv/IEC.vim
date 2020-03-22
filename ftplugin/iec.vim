" Vim filetype plugin
" Language: IEC 611131 textual
" Maintainer: Georgy Komarov <jubnzv@gmail.com>
" Latest Revision: 2020-03-21
if (exists('b:did_ftplugin'))
  finish
endif
let b:did_ftplugin = 1

setlocal formatoptions-=t
setlocal foldmethod=indent
setlocal commentstring=(\*\ %s\ \*)