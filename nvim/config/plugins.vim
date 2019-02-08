set nocompatible
filetype off                  " required

call plug#begin('~/.local/share/nvim/plugged')

" Note taking for research papers, requires 2 plugins
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

" Autocomplete stuff
Plug 'Valloric/YouCompleteMe'

" Fuzzy find
Plug 'junegunn/fzf'

" NERD tree lazy load
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" 
" Surround vim (for braces, brackets, tags..)
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
  
" Switch easily between tmux and vim
Plug 'christoomey/vim-tmux-navigator'
" 
" bottom info bar 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
filetype plugin indent on    " required

syntax enable
