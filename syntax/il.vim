" Vim syntax file
" Language: Instruction List
" Maintainer: Georgy Komarov <jubnzv@gmail.com>
" Latest Revision: 23 May 2018

if exists("b:current_syntax")
  finish
endif

" Import common IEC 61131-3 syntax rules
runtime! syntax/iec.vim

" IL syntax is case-insenstitive
syntax case ignore

" Instruction List [see: 3.2] {{{1
" IL Operators [see: table 52]
syn keyword ILOperator LD LDN ST STN S R AND ANDN OR ORN XOR XORN NOT ADD SUB
syn keyword ILOperator MUL DIV MOD GT GE EQ NE LE LT JMP JMPC JMPCN CAL CALC
syn keyword ILOperator CALCN RET RETC RETCN
" }}}1

" Highlighting {{{1
hi link ILOperator              Statement
" }}}1

let b:current_syntax = "il"

" vim: foldmethod=marker sw=2
