# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/go/bin

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
# Path to your oh-my-zsh installation.
export ZSH=/home/filip/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="frisk"

# good ones = ( frisk 

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gitfast wd common-aliases web-search command-not-found, vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR=/usr/bin/vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias gs='git status .'
source /home/filip/Dev/pracmln/pracmln/env.sh

# takelab serveri
# https://git.takelab.fer.hr/sysadmin/guides/wiki/Servers
# alias durda="ssh 161.53.65.37"
# alias ljudmila="ssh 161.53.65.64"
# alias snjezana="ssh 161.53.65.66"
# alias suncica="ssh 161.53.65.67"

alias sych="/home/filip/Tools/continuos_rsync/sync.sh"
alias z_refresh="source ~/.zshrc"
alias tmuxconf="vim ~/.tmux.conf"
alias vimrc="vim ~/.vimrc"
alias nvimrc="nvim ~/.config/nvim/init.vim"
alias zagreb='curl wttr.in/zagreb'
alias sisak='curl wttr.in/sisak'
alias fzfprev="fzf --preview 'cat {}'"

export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias lt="ls -trlha"

DISABLE_AUTO_TITLE="true"
precmd () { print -Pn "\e]0;$TITLE\a" }
title() { export TITLE="$*" }

# Better searching in command mode
# from https://stratus3d.com/blog/2017/10/26/better-vi-mode-in-zshell/
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
}

# define right prompt, regardless of whether the theme defined it
RPS1='$(vi_mode_prompt_info)'
RPS2=$RPS1

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

. /home/filip/torch/install/bin/torch-activate


. /home/filip/torch/install/bin/torch-activate


# setting up fast-p 
# https://github.com/bellecp/fast-p
#
export PATH=$PATH:~/go/bin/

function fastp() {
    local open
    if [ "$(uname)" = "Darwin" ]; then
        open=open       # on OSX, "open" opens a pdf in preview
    else
        open=xdg-open   # this will open pdf file withthe default PDF viewer on KDE, xfce, LXDE and perhaps on other desktops.
    fi
    ag -U -g ".pdf$" \
    | fast-p \
    | fzf --read0 --reverse -e -d $'\t'  \
        --preview-window down:80% --preview '
            v=$(echo {q} | tr " " "|"); 
            echo -e {1}"\n"{2} | grep -E "^|$v" -i --color=always;
        ' \
    | cut -z -f 1 -d $'\t' | tr -d '\n' | xargs -r --null $open > /dev/null 2> /dev/null
}

# opam configuration
test -r /home/filip/opam-coq.8.8.1/opam-init/init.zsh && . /home/filip/opam-coq.8.8.1/opam-init/init.zsh > /dev/null 2> /dev/null || true

alias vim_plugins="vim ~/.config/nvim/config/plugins.vim"

# copy paste from terminal and pipe
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
