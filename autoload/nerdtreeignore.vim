" Copyright (C) 2019 Christoffer Carlsson
"
" This file is part of nerdtreeignore.
" 
" nerdtreeignore is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
" 
" nerdtreeignore is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
" 
" You should have received a copy of the GNU General Public License
" along with nerdtreeignore.  If not, see <https://www.gnu.org/licenses/>.

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
