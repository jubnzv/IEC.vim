" Vim syntax file
" Language: Structured Text
" Maintainer: Georgy Komarov <jubnzv@gmail.com>
" Latest Revision: 23 March 2018

if exists("b:current_syntax")
  finish
endif

" POU declaration
syn keyword POUKeywords FUNCTION FUNCTION_BLOCK PROGRAM
syn keyword POUKeywords END_FUNCTION END_FUNCTION_BLOCK END_PROGRAM
syn keyword POUKeywords EN ENO F_EDGE R_EDGE

" Type declaration keywords
syn keyword TypeKeywords TYPE STRUCT
syn keyword TypeKeywords END_TYPE END_STRUCT
syn keyword TypeKeywords ARRAY OF T D TIME_OF_DAY DATE_AND_TIME

" Configuration declaration keywords
syn keyword ConfigurationKeywords CONFIGURATION RESOURCE VAR_ACCESS VAR_CONFIG VAR_GLOBAL
syn keyword ConfigurationKeywords END_CONFIGURATION END_RESOURCE END_VAR
syn keyword ConfigurationKeywords ON WITH READ_ONLY READ_WRITE TASK

" Variable declaration keywords
syn keyword VariableKeywords VAR VAR_INPUT VAR_OUTPUT VAR_IN_OUT VAR_TEMP VAR_EXTERNAL
syn keyword VariableKeywords END_VAR
syn keyword VariableKeywords AT CONSTANT RETAIN NON_RETAIN

" IEC data types
syn keyword IECTypeBool BOOL
syn keyword IECTypeInteger SINT INT DINT LINT USINT UINT UDINT ULINT BYTE WORD DWORD LWORD
syn keyword IECTypeReal REAL LREAL
syn keyword IECTypeDate TIME DATE DT TOD

" Structured Text definitions
syn keyword STBoolean TRUE FALSE
syn keyword STOperator NOT MOD AND XOR OR
syn keyword STConditional IF ELSIF ELSE CASE END_IF END_CASE THEN OF TO
syn keyword STLoop FOR WHILE REPEAT END_FOR END_WHILE END_REPEAT BY DO DO UNTIL
syn keyword STFunction EXIT RETURN

" Comments
syn region STComment start="(\*" end="\*)"

" Highlighting
hi link POUKeywords             Function
hi link TypeKeywords            Type
hi link ConfigurationKeywords   Special
hi link VariableKeywords        Keyword
hi link IECTypeBool             Type
hi link IECTypeInteger          Type
hi link IECTypeReal             Type
hi link IECTypeDate             Type
hi link STBoolean               Boolean
hi link STOperator              Operator
hi link STConditional           Conditional
hi link STLoop                  Repeat
hi link STFunction              Function
hi link STComment               Comment

let b:current_syntax = "st"

set commentstring=\(\*\ %s\ \*\)

" Enable automatic comment insertion
setlocal fo+=cro
