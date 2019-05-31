setlocal textwidth=80
setlocal wrap
setlocal linebreak
setlocal wrapmargin=2
setlocal visualbell
setlocal spell spelllang=en_us
hi SpellBad cterm=underline
hi clear SpellBad
let python_highlight_all=1
setlocal ruler
setlocal noautoindent
setlocal nocindent
setlocal nosmartindent
setlocal indentexpr=

" set <F5> to compile pdf, <F6> to compile pdf with bib
nnoremap <F5> <ESC>:w!<CR><ESC>:!pdflatex %<CR><ESC>:!open %<.pdf<CR>
nnoremap <F6> <ESC>:w!<CR><ESC>:!bibtex %<<CR><ESC>:!pdflatex %<CR><ESC>:!bibtex %<<CR><ESC>:!pdflatex %<CR><ESC>:!open %<.pdf<CR> 
nnoremap <F7> <ESC>:w!<CR><ESC>:!pandoc % -o %<.html %<CR><ESC>:!open %<.html<CR>
nnoremap ,fig :-1read $HOME/.vim/snippets/figure.tex<CR>>a
nnoremap ,eq:-1read $HOME/.vim/snippets/equation.tex<CR>>a

