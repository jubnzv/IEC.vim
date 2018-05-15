" Vim syntax file
" Language: Instruction List
" Maintainer: Georgy Komarov <jubnzv@gmail.com>
" Latest Revision: 15 May 2018

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

" Duration literals
syn region  IECDuration start="#\(\-\)\=[0-9]\{1,2}\(\-[0-9]\{1,2}\)\{-\}[mshd(ms)]" end="[ ,]"he=e-1 contains=IECTypeDate

" Instruction List definitions
syn keyword ILBoolean TRUE FALSE
syn keyword ILOperators LD LDN ST STN S R AND ANDN OR ORN XOR XORN NOT ADD SUB
syn keyword ILOperators MUL DIV MOD GT GE EQ NE LE LT JMP JMPC JMPCN CAL CALC
syn keyword ILOperators CALCN RET RETC RETCN

" Comments
syn region ILComment start="(\*" end="\*)"

" Highlighting
hi link POUKeywords             Function
hi link TypeKeywords            Type
hi link ConfigurationKeywords   Special
hi link VariableKeywords        Keyword
hi link IECTypeBool             Type
hi link IECTypeInteger          Type
hi link IECTypeReal             Type
hi link IECTypeDate             Type
hi link ILBoolean               Boolean
hi link ILOperators             Operator
hi link ILComment               Comment
hi link IECDuration             String

let b:current_syntax = "il"
