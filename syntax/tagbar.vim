" File:        tagbar.vim
" Description: Tagbar syntax settings
" Author:      Jan Larres <jan@majutsushi.net>
" Licence:     Vim licence
" Website:     http://majutsushi.github.com/tagbar/
" Version:     2.7

scriptencoding utf-8

if exists("b:current_syntax")
    finish
endif

let s:ics = escape(join(g:tagbar_iconchars, ''), ']^\-')

let s:pattern = '\v(^[' . s:ics . '] ?)\zs[^-+: ]+[^:]+$'
execute "syntax match TagbarKind '" . s:pattern . "'"

let s:pattern = '\v(\S@<![' . s:ics . '][-+# ]?)\zs[^*(]+(*?(\([^)]\+\))? :)@='
execute "syntax match TagbarScope '" . s:pattern . "'"
unlet s:pattern

syntax match TagbarHelp      '^".*' contains=TagbarHelpKey,TagbarHelpTitle
syntax match TagbarHelpKey   '" \zs.*\ze:' contained
syntax match TagbarHelpTitle '" \zs-\+ \w\+ -\+' contained

syntax match TagbarNestedKind '^\s\+\[[^]]\+\]$'
syntax match TagbarType       ' : \zs.*'
syntax match TagbarSignature  '(.*)'
syntax match TagbarPseudoID   '\*\ze :'

highlight default link TagbarHelp       Comment
highlight default link TagbarHelpKey    Identifier
highlight default link TagbarHelpTitle  PreProc
highlight default link TagbarKind       Identifier
highlight default link TagbarNestedKind TagbarKind
highlight default link TagbarScope      Title
highlight default link TagbarType       Type
highlight default link TagbarSignature  SpecialKey
highlight default link TagbarPseudoID   NonText
highlight default link TagbarHighlight  Search

let b:current_syntax = "tagbar"

" vim: ts=8 sw=4 sts=4 et foldenable foldmethod=marker foldcolumn=1
