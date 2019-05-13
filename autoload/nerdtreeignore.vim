" Get the default list of expressions.
function! nerdtreeignore#default()
  return get(g:, 'NERDTreeIgnore', []) + ['\.nerdtreeignore$[[file]]']
endfunction

" Get the global list of expressions.
function! nerdtreeignore#global()
  return nerdtreeignore#default() + nerdtreeignore#read('~')
endfunction

" Get the complete list of expressions.
function! nerdtreeignore#list()
  return uniq(nerdtreeignore#global() + nerdtreeignore#local())
endfunction

" Get the local list of expressions.
function! nerdtreeignore#local()
  return nerdtreeignore#read(getcwd())
endfunction

" Read the ignore file from the given directory.
function! nerdtreeignore#read(dir)
  let path = expand(printf('%s/.nerdtreeignore', a:dir))
  return filereadable(path) ? readfile(path) : []
endfunction
