set nocompatible 
set noexpandtab
set term=color_xterm
set number
set showmode
set showcmd
set encoding=utf-8

set history=2000
set ruler
set wildmenu
set scrolloff=8

set visualbell
set noerrorbells

set listchars=tab:>.,trail:.,extends:#,nbsp:.
set pastetoggle=<F2>

let mapleader=","
let g:mapleader=","
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

map <leader>bn :bn<cr>
map <leader>bp :bp<cr>

nmap j gj
nmap k gk

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <ESC>:tabnew<CR>

vnoremap <leader>y "+y

colorscheme gruvbox 
set background=dark
"set t_Co=256

set tags=./tags,tags;$HOME

syntax on
filetype plugin on

let g:languagetool_jar='$HOME/languagetool/languagetool-commandline.jar' 
hi LanguageToolGrammarError  guisp=blue gui=undercurl guifg=NONE guibg=NONE ctermfg=white ctermbg=blue term=underline cterm=none
hi LanguageToolSpellingError guisp=red  gui=undercurl guifg=NONE guibg=NONE ctermfg=white ctermbg=red  term=underline cterm=none

