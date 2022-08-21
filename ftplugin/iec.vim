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

" Define comments string
setlocal comments=s1:(*,mb:*,ex:*),://
setlocal commentstring=(*%s*)

" Enable automatic comment insertion
setlocal formatoptions+=cro

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= "|setl fo< fdm< com< cms< ts< sts< sw<"
else
  let b:undo_ftplugin = "setl fo< fdm< com< cms< ts< sts< sw<"
endif
