set clipboard=unnamedplus
set wildmode=longest,list,full

set encoding=utf-8

set nowrap
set textwidth=0 wrapmargin=0
set number

" I don't like folding so disable it
" TODO think about turning on folding
set nofoldenable    " disable folding

colorscheme peachpuff

" javascript, html, css indentation
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ | set softtabstop=2
    \ | set shiftwidth=2

" PYTHON DEV

" python configuration
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ |  set softtabstop=4
    \ | set shiftwidth=4
    \ | set textwidth=79
    \ | set expandtab
    \ | set autoindent
    \ | set fileformat=unix

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

let mapleader = "\<Space>"
