" load pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" configure indenting
set expandtab softtabstop=2 shiftwidth=2
filetype plugin indent on
au FileType python set expandtab softtabstop=4 shiftwidth=4
au FileType go set noexpandtab tabstop=4 shiftwidth=4
au FileType make set noexpandtab

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

" do not delete indents
inoremap <CR> <CR>x<BS>

" indentLine: set color and character
let g:indentLine_color_term = 223
let g:indentLine_char = '┆'

" NERDTree: open if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTree: exit if NERDTree is last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
  \ && b:NERDTree.isTabTree()) | q | endif

" NERDTree: toggle shortcut
let mapleader = "."
map <Leader>. :NERDTreeToggle<CR>

" enable backspacing in insert mode
set backspace+=indent,eol,start
