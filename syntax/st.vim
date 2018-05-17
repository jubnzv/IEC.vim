" Vim syntax file
" Language: Structured Text
" Maintainer: Georgy Komarov <jubnzv@gmail.com>
" Latest Revision: 17 May 2018

if exists("b:current_syntax")
  finish
endif

" IEC syntax is case-insenstitive
syntax case ignore

" POU declaration
syn keyword POUKeywords FUNCTION FUNCTION_BLOCK PROGRAM
syn keyword POUKeywords END_FUNCTION END_FUNCTION_BLOCK END_PROGRAM
syn keyword POUKeywords EN ENO F_EDGE R_EDGE

" Type declaration keywords
syn keyword TypeKeywords TYPE STRUCT
syn keyword TypeKeywords END_TYPE END_STRUCT
syn keyword TypeKeywords ARRAY OF T D TIME_OF_DAY DATE_AND_TIME

" Configuration
syn keyword IECConf         CONFIGURATION RESOURCE VAR_ACCESS VAR_CONFIG VAR_GLOBAL
syn keyword IECConf         END_CONFIGURATION END_RESOURCE END_VAR
syn keyword IECConf         WITH READ_ONLY READ_WRITE
syn keyword IECConfTask     TASK
syn keyword IECConfTaskOpt  INTERVAL PRIORITY SINGLE
syn keyword IECConf         ON nextgroup=IECConfTargetName skipwhite
syn match IECConfTargetName '\i\+' contained

" Variable declaration keywords
syn keyword VariableKeywords VAR VAR_INPUT VAR_OUTPUT VAR_IN_OUT VAR_TEMP VAR_EXTERNAL
syn keyword VariableKeywords END_VAR
syn keyword VariableKeywords AT CONSTANT RETAIN NON_RETAIN

" Duration literals [see: 2.2.3.1 (semantics), B.1.2.3.1(rules)]
syn region  IECDuration start="#\(\-\)\=[0-9]\{1,2}\(\-[0-9]\{1,2}\)\{-\}[mshd(ms)]" end="[ ,]"he=e-1 contains=IECTypeDate

" Expressions clusters
syntax cluster IECExpressions contains=@IECPOUItems,@IECTypeItems,@IECVarItems
syntax cluster IECPOUItems contains=IECPOUKeyword
syntax cluster IECTypeItems contains=IECTypeKeyword
syntax cluster IECVarItems contains=IECVarKeyword

" Configuration regions [see 2.7.1]
syntax region IECOptConfifuration start="\<CONFIGURATION\>" end="\<END_CONFIGURATION\>" fold
syntax region IECOptResource start="\<RESOURCE\>" end="\<END_RESOURCE\>" fold

" 'Common element' regions [see 3.1]
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

" Structured Text specific definitions
syn keyword STBoolean TRUE FALSE
syn keyword STOperator NOT MOD AND XOR OR
syn keyword STConditional IF ELSIF ELSE CASE END_IF END_CASE THEN OF TO
syn keyword STLoop FOR WHILE REPEAT END_FOR END_WHILE END_REPEAT BY DO DO UNTIL
syn keyword STFunction EXIT RETURN

" Comments
syn region STComment start="(\*" end="\*)"

hi link IECPOUKeyword           Function
hi link IECTypeKeyword          Type
hi link IECVarKeyword           Keyword
hi link IECConf                 Special
hi link IECConfTask             Function
hi link IECConfTaskOpt          Keyword
hi link IECConfTargetName       Identifier
hi link IECTypeBool             Type
hi link IECTypeInteger          Type
hi link IECTypeReal             Type
hi link IECTypeDate             Type
hi link IECDuration             String
hi link STBoolean               Boolean
hi link STOperator              Operator
hi link STConditional           Conditional
hi link STLoop                  Repeat
hi link STFunction              Function
hi link STComment               Comment

let b:current_syntax = "st"
