" Vim syntax file
" Language: IEC 61131-3 Textual languages
" Maintainer: Georgy Komarov <jubnzv@gmail.com>
" Latest Revision: 2020-05-10
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

" {{{ Data types identifiers
" Elementary data types
syn keyword IECTypeInteger SINT INT DINT LINE USINT UINT UDINT ULINT
syn keyword IECTypeReal REAL LREAL
syn keyword IECTypeDate TIME DATE TIME_OF_DAY TOD DATE_AND_TIME DT
syn keyword IECTypeDate LTIME LDATE LTIME_OF_DAY LTOD LDATE_AND_TIME LDT
syn keyword IECTypeString BOOL BYTE WORD DWORD LWORD
syn keyword IECTypeString STRING WSTRING CHAR WCHAR
" Generic data types
syn keyword IECTypeGeneric ANY ANY_DERIVED ANY_ELEMENTARY ANY_MAGNITUDE
syn keyword IECTypeGeneric ANY_NUM ANY_REAL ANY_INT ANY_BIT ANY_STRING ANY_DATE
" Derived (user-specified) data types
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

" {{{ Duration literals
syn region  IECDuration start="#\(\-\)\=[0-9]\{1,2}\(\-[0-9]\{1,2}\)\{-\}[mshd(ms)]" end="[ ,]"he=e-1 contains=IECTypeDate
" }}}

" {{{ Expressions clusters
syntax cluster IECExpressions contains=@IECPOUItems,@IECTypeItems,@IECVarItems
syntax cluster IECPOUItems contains=IECPOUKeyword
syntax cluster IECTypeItems contains=IECTypeInteger,IECTypeReal,IECTypeDate,IECTypeString,IECTypeGeneric,IECTypeDerived
syntax cluster IECVarItems contains=IECVarKeyword
" }}}

" {{{ Configuration regions
syntax region IECOptConfifuration start="\<CONFIGURATION\>" end="\<END_CONFIGURATION\>" fold
syntax region IECOptResource start="\<RESOURCE\>" end="\<END_RESOURCE\>" fold
" }}}

" {{{ 'Common element' regions
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

" {{{ Instruction List
" IL Operators
syn keyword ILOperator LD LDN ST STN S R AND ANDN OR ORN XOR XORN NOT ADD SUB
syn keyword ILOperator MUL DIV MOD GT GE EQ NE LE LT JMP JMPC JMPCN CAL CALC
syn keyword ILOperator CALCN RET RETC RETCN
" }}}

" {{{ Structured Text expressions
" ST operators
syn keyword STOperator NOT MOD AND XOR OR
" ST statements
syn keyword STConditional IF ELSIF ELSE END_IF CASE END_CASE THEN TO
syn keyword STRepeat FOR WHILE REPEAT END_FOR END_WHILE END_REPEAT BY DO DO UNTIL
syn keyword STStatement EXIT CONTINUE RETURN
syn keyword STStatement OVERLAP REF_TO
" }}}

" {{{ Comments
syn region IECComment start="(\*" end="\*)"
" }}}

" {{{ Highlighting
hi def link IECPOUKeyword           Function
hi def link IECVarKeyword           Keyword
hi def link IECConf                 Special
hi def link IECConfTask             Function
hi def link IECConfTaskOpt          Keyword
hi def link IECConfTargetName       Identifier
" Data types identifiers
hi def link IECTypeInteger          Type
hi def link IECTypeReal             Type
hi def link IECTypeDate             Type
hi def link IECTypeString           Type
hi def link IECTypeGeneric          Struct
hi def link IECTypeDerived          Type
" Data types literals
hi def link IECDuration             String
hi def link IECBoolean              Boolean
" ST
hi def link STOperator              Statement
hi def link STConditional           Conditional
hi def link STRepeat                Repeat
hi def link STStatement             Statement
" SFC
hi def link SFCElement              Statement
" IL
hi def link ILOperator              Statement
" Comments
hi def link IECComment              Comment
" }}}

let b:current_syntax = "iec"

" vim: foldmethod=marker sw=2
