" Vim filetype plugin
" Language: Structured Text
" Maintainer: Georgy Komarov <jubnzv@gmail.com>
" Latest Revision: 5 May 2018

if (exists('b:did_ftplugin'))
  finish
endif
let b:did_ftplugin = 1

setlocal formatoptions-=t
setlocal foldmethod=indent
setlocal commentstring=(\*\ %s\ \*)
