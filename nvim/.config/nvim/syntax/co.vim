" Vim syntax file
" Language:    colang
" Maintainer:  Your Name <your.email@example.com>
" URL:         http://your.language.url
" Version:     1.0
runtime! syntax/python.vim

if exists("b:current_syntax")
    finish
endif

" Keywords
syn keyword colangKeyword user bot agent
highlight default link colangKeyword Keyword

" Strings
syn region colangString start=/"/ end=/"/ contains=colangEscape
highlight default link colangString String

" Escapes in strings
syn match colangEscape "\\\\." contained
highlight default link colangEscape SpecialChar

let b:current_syntax = "colang"
