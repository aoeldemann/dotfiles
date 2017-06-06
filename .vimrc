" configure indenting
set expandtab softtabstop=2 shiftwidth=2 autoindent
filetype plugin indent on

" enable syntax highlighting
syntax on

" display line numbers
set number

" enable cursor line
set cursorline

" show trailing whitespaces and hard tabs
set list listchars=tab:»·,trail:·

" remove trailing whitespaces when files are saved
autocmd BufWritePre * %s/\s\+$//e

" show print margin
set colorcolumn=80

" highlight lines exceeding 80 char print margin
au BufWinEnter * call matchadd('ErrorMsg', '\%>80v.\+', -1)

" set color scheme
colorscheme lucario

" enable auto-completion
set omnifunc=syntaxcomplete#Complete

" do not delete indents
inoremap <CR> <CR>x<BS>

" python indents with 4 whitespaces
au FileType python set expandtab softtabstop=4 shiftwidth=4 autoindent

