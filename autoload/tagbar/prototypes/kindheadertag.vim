let s:KindheaderTag = {}

function! tagbar#prototypes#kindheadertag#new(name) abort
    let newobj = tagbar#prototypes#basetag#new(a:name)

    let newobj.isKindheader = s:KindheaderTag.isKindheader
    let newobj.getPrototype = s:KindheaderTag.getPrototype
    let newobj.isFoldable = s:KindheaderTag.isFoldable
    let newobj.isFolded = s:KindheaderTag.isFolded
    let newobj.openFold = s:KindheaderTag.openFold
    let newobj.closeFold = s:KindheaderTag.closeFold
    let newobj.toggleFold = s:KindheaderTag.toggleFold

    return newobj
endfunction

" s:isKindheader() {{{1
function! s:KindheaderTag.isKindheader() abort dict
    return 1
endfunction

" s:getPrototype() {{{1
function! s:KindheaderTag.getPrototype(short) abort dict
    return self.name . ': ' .
         \ self.numtags . ' ' . (self.numtags > 1 ? 'tags' : 'tag')
endfunction

" s:isFoldable() {{{1
function! s:KindheaderTag.isFoldable() abort dict
    return 1
endfunction

" s:isFolded() {{{1
function! s:KindheaderTag.isFolded() abort dict
    return self.fileinfo.kindfolds[self.short]
endfunction

" s:openFold() {{{1
function! s:KindheaderTag.openFold() abort dict
    let self.fileinfo.kindfolds[self.short] = 0
endfunction

" s:closeFold() {{{1
function! s:KindheaderTag.closeFold() abort dict
    let self.fileinfo.kindfolds[self.short] = 1
    return line('.')
endfunction

" s:toggleFold() {{{1
function! s:KindheaderTag.toggleFold(fileinfo) abort dict
    let a:fileinfo.kindfolds[self.short] = !a:fileinfo.kindfolds[self.short]
endfunction


" Modeline {{{1
" vim: ts=8 sw=4 sts=4 et foldenable foldmethod=marker foldcolumn=1
