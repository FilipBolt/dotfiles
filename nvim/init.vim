set termguicolors
set guicursor=

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/init.vim
source $HOME/.config/nvim/config/keybindings.vim
source $HOME/.config/nvim/config/vim-notes.vim
source $HOME/.config/nvim/config/youcompleteme.vim
