set nocompatible
set noexpandtab
set term=color_xterm
set number
set showmode
set showcmd
set encoding=utf-8
syntax on
filetype plugin on

" set mouse=a
" set wrap
" set linebreak
" set wrapmargin=2
" set ruler
" set spell spelllang=en_us
" set undofile
" set autochdir
" set visualbell
" set autoread
" hi SpellBad cterm=underline
" hi clear SpellBad
" let python_highlight_all=1

" autocmd FileType python 
"\ setlocal textwidth=79 ts=4 tabstop=4 shiftwidth=4 expandtab tags=~/mytags

" autocmd FileType tex setlocal textwidth=80

" set <F5> to compile pdf, <F6> to compile pdf with bib
" autocmd FileType tex map <F5> <ESC>:w!<CR><ESC>:!pdflatex %<CR><ESC>:!open %<.pdf<CR>
" autocmd FileType tex map <F6> <ESC>:w!<CR><ESC>:!bibtex %<<CR><ESC>:!pdflatex %<CR><ESC>:!bibtex %<<CR><ESC>:!pdflatex %<CR><ESC>:!open %<.pdf<CR> 

" set <F5> to run python
" autocmd FileType python map <F5> <ESC>:w!<CR><ESC>:!python %<CR>

"call plug#begin('~/.vim/plugged')
""Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'SirVer/utilsnips'
"Plug 'honza/vim-snippets'
"call plug#end()

"map <C-o> :NERDTreeToggle<CR>
