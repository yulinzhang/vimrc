setlocal textwidth=79
setlocal wrapmargin=0
setlocal ts=4 
setlocal tabstop=4 
setlocal shiftwidth=4 
setlocal expandtab 
setlocal autoindent
setlocal smarttab
setlocal cursorline
setlocal showmatch
setlocal clipboard=unnamed
setlocal fileformat=unix
setlocal path+=**

set foldmethod=indent
set foldlevel=99

nnoremap <F5> <ESC>:w!<CR><ESC>:!python %<CR>
nnoremap <F6> <ESC>:w!<CR><ESC>:!python -m pdb %<CR>
nnoremap ,pclass:-1read $HOME/.vim/snippets/pclass.py<CR>>a

map <Leader>p :call InsertLine()<CR>
function! InsertLine()
  let trace = expand("import pdb; pdb.set_trace()")
  execute "normal o".trace
endfunction
