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

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" Path to iec2c local installation
if exists('g:matiec_path')
    let s:iec2c_exe = g:matiec_path . '/iec2c'
	let s:i_opt = '-I ' . g:matiec_path  . '/lib'
else
    let s:iec2c_exe = 'iec2c'
    let s:i_opt = ''
endif

" Collect generated C files in separate dir
if exists('g:matiec_mkbuilddir')
    let s:mkdir_hook = 'mkdir -pv ' . expand('%:r') . '_build; '
    let s:t_opt = '-T ' . expand('%:r') . '_build'
else
    let s:mkdir_hook = ''
    let s:t_opt = ''
endif

let &l:makeprg=s:mkdir_hook . s:iec2c_exe . ' ' . s:i_opt . ' ' . s:t_opt . ' %'

let &cpo = s:cpo_save
unlet s:cpo_save
