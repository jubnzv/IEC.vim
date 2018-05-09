" Vim compiler file
" Language: Structured Text
" Maintainer: Georgy Komarov <jubnzv@gmail.com>
" Latest Revision: 9 May 2018

if exists("current_compiler")
    finish
endif
let current_compiler = "iec2c"

let s:cpo_save = &cpo
set cpo&vim

" Path to iec2c local installation
if exists('g:matiec_path')
    let s:iec2c_exe = g:matiec_path . '/iec2c'
	let s:lib_opt   = '-I ' . g:matiec_path  . '/lib'
else
    let s:iec2c_exe = 'iec2c'
    let s:lib_opt   = ''
endif

let &l:makeprg=s:iec2c_exe . ' ' . s:lib_opt . ' %'

let &cpo = s:cpo_save
unlet s:cpo_save
