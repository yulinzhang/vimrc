setlocal textwidth=0 
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

nnoremap <F5> <ESC>:w!<CR><ESC>:!python %<CR>
