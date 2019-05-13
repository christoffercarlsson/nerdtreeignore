if exists('g:nerdtreeignore_loaded') || &cp
  finish
endif
let g:nerdtreeignore_loaded = 1

let g:NERDTreeIgnore = nerdtreeignore#list()
