" Vim syntax file
" Language: IEC 61131-3 Textual
" Maintainer: Georgy Komarov <jubnzv@gmail.com>
" Latest Revision: 2020-03-22
"
" This file describes syntax rules for textual IEC 61131-3 languages.
"
" REFERENCES:
"   [1] http://www.plcopen.org/pages/tc1_standards/iec61131-3/
"

if exists("b:current_syntax")
  finish
endif

" IEC syntax is case-insenstitive
syntax case ignore

"  {{{ POU declaration
syn keyword IECPOUKeyword FUNCTION FUNCTION_BLOCK PROGRAM
syn keyword IECPOUKeyword END_FUNCTION END_FUNCTION_BLOCK END_PROGRAM
syn keyword IECPOUKeyword EN ENO F_EDGE R_EDGE
" }}}

" {{{ Data types identifiers [see: 2.3]
" Elementary data types [see: 2.3.1; table 10]
syn keyword IECTypeInteger SINT INT DINT LINE USINT UINT UDINT ULINT
syn keyword IECTypeReal REAL LREAL
syn keyword IECTypeDate TIME DATE TIME_OF_DAY TOD DATE_AND_TIME DT
syn keyword IECTypeDate LTIME LDATE LTIME_OF_DAY LTOD LDATE_AND_TIME LDT
syn keyword IECTypeString BOOL BYTE WORD DWORD LWORD
syn keyword IECTypeString STRING WSTRING CHAR WCHAR
" Generic data types [see: 2.3.2, table 11]
syn keyword IECTypeGeneric ANY ANY_DERIVED ANY_ELEMENTARY ANY_MAGNITUDE
syn keyword IECTypeGeneric ANY_NUM ANY_REAL ANY_INT ANY_BIT ANY_STRING ANY_DATE
" Derived (user-specified) data types [see: 2.3.3, table 12]
syn keyword IECTypeDerived TYPE STRUCT
syn keyword IECTypeDerived END_TYPE END_STRUCT
syn keyword IECTypeDerived ARRAY OF
" }}}

" {{{ Data types literals
syn keyword IECBoolean TRUE FALSE
" }}}

" {{{ Configuration
syn keyword IECConf CONFIGURATION RESOURCE
syn keyword IECConf END_CONFIGURATION END_RESOURCE
syn keyword IECConf WITH READ_ONLY READ_WRITE
syn keyword IECConfTask TASK
syn keyword IECConfTaskOpt INTERVAL PRIORITY SINGLE
syn keyword IECConf ON nextgroup=IECConfTargetName skipwhite
syn match IECConfTargetName '\i\+' contained
" }}}

" {{{ Variable declaration
syn keyword IECVarKeyword VAR VAR_INPUT VAR_OUTPUT VAR_IN_OUT VAR_TEMP VAR_EXTERNAL VAR_ACCESS VAR_CONFIG VAR_GLOBAL
syn keyword IECVarKeyword END_VAR
syn keyword IECVarKeyword AT CONSTANT RETAIN NON_RETAIN
" }}}

" {{{ Duration literals [see: 2.2.3.1 (semantics), B.1.2.3.1(rules)]
syn region  IECDuration start="#\(\-\)\=[0-9]\{1,2}\(\-[0-9]\{1,2}\)\{-\}[mshd(ms)]" end="[ ,]"he=e-1 contains=IECTypeDate
" }}}

" {{{ Expressions clusters
syntax cluster IECExpressions contains=@IECPOUItems,@IECTypeItems,@IECVarItems
syntax cluster IECPOUItems contains=IECPOUKeyword
syntax cluster IECTypeItems contains=IECTypeInteger,IECTypeReal,IECTypeDate,IECTypeString,IECTypeGeneric,IECTypeDerived
syntax cluster IECVarItems contains=IECVarKeyword
" }}}

" {{{ Configuration regions [see 2.7.1]
syntax region IECOptConfifuration start="\<CONFIGURATION\>" end="\<END_CONFIGURATION\>" fold
syntax region IECOptResource start="\<RESOURCE\>" end="\<END_RESOURCE\>" fold
" }}}

" {{{ 'Common element' regions [see 3.1]
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
" }}}

" {{{ SFC
syn keyword SFCElement STEP INITIAL_STEP END_STEP
syn keyword SFCElement TRANSITION END_TRANSITION
syn keyword SFCElement ACTION END_ACTION
" }}}

" {{{ Instruction List [see: 3.2]
" IL Operators [see: table 52]
syn keyword ILOperator LD LDN ST STN S R AND ANDN OR ORN XOR XORN NOT ADD SUB
syn keyword ILOperator MUL DIV MOD GT GE EQ NE LE LT JMP JMPC JMPCN CAL CALC
syn keyword ILOperator CALCN RET RETC RETCN
" }}}

" {{{ Structured Text expressions [see: 3.3]
" ST operators [see: table 55]
syn keyword STOperator NOT MOD AND XOR OR
" ST statements [see: 3.3.2, table 56]
syn keyword STConditional IF ELSIF ELSE END_IF CASE END_CASE THEN TO
syn keyword STRepeat FOR WHILE REPEAT END_FOR END_WHILE END_REPEAT BY DO DO UNTIL
syn keyword STStatement EXIT CONTINUE RETURN
" }}}

" {{{ Comments
syn region IECComment start="(\*" end="\*)"
" }}}

" {{{ Highlighting
hi link IECPOUKeyword           Function
hi link IECVarKeyword           Keyword
hi link IECConf                 Special
hi link IECConfTask             Function
hi link IECConfTaskOpt          Keyword
hi link IECConfTargetName       Identifier
" Data types identifiers
hi link IECTypeInteger          Type
hi link IECTypeReal             Type
hi link IECTypeDate             Type
hi link IECTypeString           Type
hi link IECTypeGeneric          Struct
hi link IECTypeDerived          Type
" Data types literals
hi link IECDuration             String
hi link IECBoolean              Boolean
" ST
hi link STOperator              Statement
hi link STConditional           Conditional
hi link STRepeat                Repeat
hi link STStatement             Statement
" SFC
hi link SFCElement              Statement
" IL
hi link ILOperator              Statement
" Comments
hi link IECComment              Comment
" }}}

let b:current_syntax = "iec"

" vim: foldmethod=marker sw=2
