let s:PesudoTag = {}

function! tagbar#prototypes#pseudotag#new(name) abort
    let newobj = tagbar#prototypes#basetag#new(a:name)

    let newobj.isPseudoTag = s:PesudoTag.isPseudoTag
    let newobj.strfmt = s:PesudoTag.strfmt

    return newobj
endfunction

" s:isPseudoTag() {{{1
function! s:PesudoTag.isPseudoTag() abort dict
    return 1
endfunction

" s:strfmt() {{{1
function! s:PesudoTag.strfmt() abort dict
    let typeinfo = self.typeinfo

    let suffix = get(self.fields, 'signature', '')
    if has_key(typeinfo.kind2scope, self.fields.kind)
        let suffix .= ' : ' . typeinfo.kind2scope[self.fields.kind]
    endif

    return self._getPrefix() . self.name . '*' . suffix
endfunction


" Modeline {{{1
" vim: ts=8 sw=4 sts=4 et foldenable foldmethod=marker foldcolumn=1
