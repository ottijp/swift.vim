" File: swift.vim
" Author: Keith Smiley
" Description: Runtime files for Swift
" Last Modified: June 15, 2014

if exists("b:current_syntax")
  finish
endif

" Comments
" Shebang
syntax match swiftShebang "\v#!.*$"

" Comment contained keywords
syntax keyword swiftTodos contained TODO XXX FIXME NOTE
syntax keyword swiftMarker contained MARK

" Literals
" Strings
syntax region swiftString start=/"/ skip=/\\"/ end=/"/ contains=swiftInterpolatedWrapper
syntax region swiftInterpolatedWrapper start="\v\\\(\s*" end="\v\s*\)" contained containedin=swiftString contains=swiftInterpolatedString
syntax match swiftInterpolatedString "\v\w+(\(\))?" contained containedin=swiftInterpolatedWrapper

" Numbers
syntax match swiftNumber "\v<\d+>"
syntax match swiftNumber "\v<(\d+_+)+\d+(\.\d+(_+\d+)*)?>"
syntax match swiftNumber "\v<\d+\.\d+>"
syntax match swiftNumber "\v<\d*\.?\d+([Ee]-?)?\d+>"
syntax match swiftNumber "\v<0x\x+([Pp]-?)?\x+>"
syntax match swiftNumber "\v<0b[01]+>"
syntax match swiftNumber "\v<0o\o+>"

" BOOLs
syntax keyword swiftBoolean
      \ true
      \ false


" Operators
syntax match swiftOperator "\v\~"
syntax match swiftOperator "\v\s+!"
syntax match swiftOperator "\v\%"
syntax match swiftOperator "\v\^"
syntax match swiftOperator "\v\&"
syntax match swiftOperator "\v\*"
syntax match swiftOperator "\v-"
syntax match swiftOperator "\v\+"
syntax match swiftOperator "\v\="
syntax match swiftOperator "\v\|"
syntax match swiftOperator "\v\/"
syntax match swiftOperator "\v\."
syntax match swiftOperator "\v\<"
syntax match swiftOperator "\v\>"
syntax match swiftOperator "\v\?\?"

" Methods/Functions
syntax match swiftMethod "\(\.\)\@<=\w\+\((\)\@="


" Keywords {{{
syntax keyword swiftKeywords
      \ as
      \ break
      \ case
      \ catch
      \ class
      \ continue
      \ convenience
      \ default
      \ defer
      \ deinit
      \ didSet
      \ do
      \ dynamic
      \ else
      \ extension
      \ fallthrough
      \ final
      \ for
      \ func
      \ get
      \ guard
      \ if
      \ import
      \ in
      \ infix
      \ init
      \ inout
      \ internal
      \ is
      \ lazy
      \ let
      \ mutating
      \ nil
      \ operator
      \ optional
      \ override
      \ postfix
      \ prefix
      \ private
      \ protocol
      \ public
      \ repeat
      \ required
      \ return
      \ self
      \ set
      \ static
      \ subscript
      \ super
      \ switch
      \ throws
      \ try
      \ typealias
      \ unowned
      \ unowned(safe)
      \ unowned(unsafe)
      \ var
      \ weak
      \ where
      \ while
      \ willSet
" }}}

syntax keyword swiftAttributes
      \ @assignment
      \ @autoclosure
      \ @availability
      \ @convention
      \ @exported
      \ @IBAction
      \ @IBDesignable
      \ @IBInspectable
      \ @IBOutlet
      \ @noescape
      \ @nonobjc
      \ @noreturn
      \ @NSApplicationMain
      \ @NSCopying
      \ @NSManaged
      \ @objc
      \ @testable
      \ @UIApplicationMain
      \ @warn_unused_result

syntax keyword swiftStructure
      \ struct
      \ enum

syntax region swiftTypeWrapper start="\v:\s*" end="\v(,\s?\w+\s?\{)|[^\w]" contains=swiftString,swiftBoolean,swiftNumber,swiftType,swiftGenericsWrapper transparent oneline
syntax region swiftGenericsWrapper start="\v\<" end="\v\>" contains=swiftType transparent oneline
syntax region swiftLiteralWrapper start="\v\=\s*" skip="\v[^\[\]]\(\)" end="\v(\[\]|\(\))" contains=swiftType,swiftString transparent oneline
syntax region swiftReturnWrapper start="\v-\>\s*" end="\v(\{|$)" contains=swiftType transparent oneline
syntax match swiftType "\v\u\w*" contained containedin=swiftGenericsWrapper,swiftTypeWrapper,swiftLiteralWrapper,swiftGenericsWrapper

syntax keyword swiftImports import


" 'preprocesor' stuff
syntax keyword swiftPreprocessor
      \ #if
      \ #elseif
      \ #else
      \ #endif


" Comment patterns
syntax match swiftComment "\v\/\/.*$"
      \ contains=swiftTodos,swiftMarker,@Spell oneline
syntax region swiftComment start="/\*" end="\*/"
      \ contains=swiftTodos,swiftMarker,swiftComment,@Spell fold


" Set highlights
highlight default link swiftTodos Todo
highlight default link swiftShebang Comment
highlight default link swiftComment Comment
highlight default link swiftMarker Comment

highlight default link swiftString String
highlight default link swiftInterpolatedWrapper Delimiter
highlight default link swiftNumber Number
highlight default link swiftBoolean Boolean

highlight default link swiftOperator Operator
highlight default link swiftKeywords Keyword
highlight default link swiftAttributes PreProc
highlight default link swiftStructure Structure
highlight default link swiftType Type
highlight default link swiftImports Include
highlight default link swiftPreprocessor PreProc
highlight default link swiftMethod Function


let b:current_syntax = "swift"
