" Vim syntax file
" Language: IEC 61131-3 Textual
" Maintainer: Georgy Komarov <jubnzv@gmail.com>
" Latest Revision: 23 May 2018
"
" This file describes syntax rules for both textual IEC 61131-3 languages:
" Structured Text and Instruction List.
"

if exists("b:current_syntax")
  finish
endif

" IEC syntax is case-insenstitive
syntax case ignore

" POU declaration {{{1
syn keyword IECPOUKeyword FUNCTION FUNCTION_BLOCK PROGRAM
syn keyword IECPOUKeyword END_FUNCTION END_FUNCTION_BLOCK END_PROGRAM
syn keyword IECPOUKeyword EN ENO F_EDGE R_EDGE

" Data types identifiers [see: 2.3] {{{1
" Elementary data types [see: 2.3.1; table 10] {{{2
syn keyword IECTypeInteger BOOL SINT INT DINT LINE USINT UINT UDINT ULINT
syn keyword IECTypeReal REAL LREAL
syn keyword IECTypeDate TIME DATE TIME_OF_DAY TOD DATE_AND_TIME DT
syn keyword IECTypeString STRING BYTE WORD DWORD LWORD WSTRING
" Generic data types [see: 2.3.2, table 11] {{{2
syn keyword IECTypeGeneric ANY ANY_DERIVED ANY_ELEMENTARY ANY_MAGNITUDE
syn keyword IECTypeGeneric ANY_NUM ANY_REAL ANY_INT ANY_BIT ANY_STRING ANY_DATE
" Derived (user-specified) data types [see: 2.3.3, table 12] {{{2
syn keyword IECTypeDerived TYPE STRUCT
syn keyword IECTypeDerived END_TYPE END_STRUCT
syn keyword IECTypeDerived ARRAY OF

" Data types literals {{{1
syn keyword IECBoolean TRUE FALSE

" Configuration {{{1
syn keyword IECConf CONFIGURATION RESOURCE VAR_ACCESS VAR_CONFIG VAR_GLOBAL
syn keyword IECConf END_CONFIGURATION END_RESOURCE END_VAR
syn keyword IECConf WITH READ_ONLY READ_WRITE
syn keyword IECConfTask TASK
syn keyword IECConfTaskOpt INTERVAL PRIORITY SINGLE
syn keyword IECConf ON nextgroup=IECConfTargetName skipwhite
syn match IECConfTargetName '\i\+' contained

" Variable declaration {{{1
syn keyword IECVarKeyword VAR VAR_INPUT VAR_OUTPUT VAR_IN_OUT VAR_TEMP VAR_EXTERNAL
syn keyword IECVarKeyword END_VAR
syn keyword IECVarKeyword AT CONSTANT RETAIN NON_RETAIN

" Duration literals [see: 2.2.3.1 (semantics), B.1.2.3.1(rules)] {{{1
syn region  IECDuration start="#\(\-\)\=[0-9]\{1,2}\(\-[0-9]\{1,2}\)\{-\}[mshd(ms)]" end="[ ,]"he=e-1 contains=IECTypeDate

" Expressions clusters {{{1
syntax cluster IECExpressions contains=@IECPOUItems,@IECTypeItems,@IECVarItems
syntax cluster IECPOUItems contains=IECPOUKeyword
syntax cluster IECTypeItems contains=IECTypeInteger,IECTypeReal,IECTypeDate,IECTypeString,IECTypeGeneric,IECTypeDerived
syntax cluster IECVarItems contains=IECVarKeyword

" Configuration regions [see 2.7.1] {{{1
syntax region IECOptConfifuration start="\<CONFIGURATION\>" end="\<END_CONFIGURATION\>" fold
syntax region IECOptResource start="\<RESOURCE\>" end="\<END_RESOURCE\>" fold

" 'Common element' regions [see 3.1] {{{1
syntax region IECElementType start="\<TYPE\>" end="\<END_TYPE\>" contains=@IECExpressions fold
syntax region IECElementVar start="\<VAR\>" end="\<END_VAR\>" contains=@IECExpressions fold
syntax region IECElementVarIn start="\<VAR_INPUT\>" end="\<END_VAR\>" contains=@IECExpressions fold
syntax region IECElementVarOut start="\<VAR_OUTPUT\>" end="\<END_VAR\>" contains=@IECExpressions fold
syntax region IECElementVarInOut start="\<VAR_IN_OUT\>" end="\<END_VAR\>" contains=@IECExpressions fold
syntax region IECElementVarExternal start="\<VAR_EXTERNAL\>" end="\<END_VAR\>" contains=@IECExpressions fold
syntax region IECElementVarTemp start="\<VAR_TEMP\>" end="\<END_VAR\>" contains=@IECExpressions fold
syntax region IECElementVarAccess start="\<VAR_ACCESS\>" end="\<END_VAR\>" contains=@IECExpressions fold
syntax region IECElementVarGlobal start="\<VAR_GLOBAL\>" end="\<END_VAR\>" contains=@IECExpressions fold
syntax region IECElementFunction start="\<FUNCTION\>" end="\<END_FUNCTION\>" contains=@IECExpressions fold
syntax region IECElementFunctionBlock start="\<FUNCTION_BLOCK\>" end="\<END_FUNCTION_BLOCK\>" contains=@IECExpressions fold
syntax region IECElementProgram start="\<PROGRAM\>" end="\<END_PROGRAM\>" contains=@IECExpressions fold
syntax region IECElementStep start="\<STEP\>" end="\<END_STEP\>" contains=@IECExpressions fold
syntax region IECElementTransition start="\<TRANSITION\>" end="\<END_TRANSITION\>" contains=@IECExpressions fold
syntax region IECElementAction start="\<Action\>" end="\<END_ACTION\>" contains=@IECExpressions fold

" Comments {{{1
syn region IECComment start="(\*" end="\*)"

" Highlighting  {{{1
hi link IECPOUKeyword           Function
hi link IECVarKeyword           Keyword
hi link IECConf                 Special
hi link IECConfTask             Function
hi link IECConfTaskOpt          Keyword
hi link IECConfTargetName       Identifier
" Data types identifiers {{{2
hi link IECTypeInteger          Type
hi link IECTypeReal             Type
hi link IECTypeDate             Type
hi link IECTypeString           Type
hi link IECTypeGeneric          Struct
hi link IECTypeDerived          Type
" Data types literals {{{2
hi link IECDuration             String
hi link IECBoolean              Boolean
" Comments {{{2
hi link IECComment              Comment

" {{{1
let b:current_syntax = "iec"

" vim: foldmethod=marker sw=2
