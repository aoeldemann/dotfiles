" load pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" configure indenting
set expandtab softtabstop=2 shiftwidth=2
filetype plugin indent on
autocmd FileType python set expandtab softtabstop=4 shiftwidth=4
autocmd FileType go set noexpandtab tabstop=4 shiftwidth=4
autocmd FileType make set noexpandtab

" enable syntax highlighting
syntax on

" display line numbers
set number

" enable cursor line
set cursorline

" set zsh as shell
set shell=/bin/zsh

" highlight invisible characters (tabs and trailing whitespaces). golang uses
" tabs (formatter adds them automatically). showing all these would be annoying
" -> deactivate for goland
autocmd BufEnter * if index(['go'], &ft) < 0 | SpaceHi

" remove trailing whitespaces when files are saved
autocmd BufWritePre * %s/\s\+$//e

" show print margin
set colorcolumn=80

" highlight lines exceeding 80 char print margin
" autocmd BufWinEnter * call matchadd('ErrorMsg', '\%>80v.\+', -1)

" set color scheme and enable transparent background
let g:SnazzyTransparent = 1
colorscheme snazzy

" do not delete indents
inoremap <CR> <CR>x<BS>

" indentLine: set color and character
let g:indentLine_color_term = 223
let g:indentLine_char = '┆'

" NERDTree: open if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTree: exit if NERDTree is last open window
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree")
  \ && b:NERDTree.isTabTree()) | q | endif

" NERDTree: toggle shortcut
let mapleader = "."
map <Leader>. :NERDTreeToggle<CR>

" enable backspacing in insert mode
set backspace+=indent,eol,start

" change json filetype to javascript for better syntax highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript

" enable syntax highlighting for Vagrantfile
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

" setup clang-format
function! ClangFormatOnSave()
  if has('python3')
    py3f ~/repos/dotfiles/clang-format.py
  else
    pyf ~/repos/dotfiles/clang-format.py
  endif
endfunction
autocmd BufWritePre *.h,*.c,*.cpp call ClangFormatOnSave()

" disable tex conceal feature
let g:tex_conceal = ""

" enable spell checking for markdown and tex files
autocmd FileType markdown,tex set spell

" configure text width for markdown and tex files
autocmd FileType markdown,tex set textwidth=80

" reduce updatetime to 100 ms to show gitgutter indicators faster
set updatetime=100

" disable markdown folding
let g:vim_markdown_folding_disabled = 1

" markdown preview shortcut
map <F12> :!markdown %<CR>

" NERD Commenter: whitespace after delimiter
let g:NERDSpaceDelims = 1

" Ignore vim-go version warning
let g:go_version_warning = 0
