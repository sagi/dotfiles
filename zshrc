export ZSH="/home/sagi/.oh-my-zsh"

ZSH_THEME="eastwood"

plugins=( git)

source $ZSH/oh-my-zsh.sh

export VISUAL=vim
export EDITOR="$VISUAL"

setxkbmap us,il -option grp:alt_shift_toggle

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias fd=fdfind

#export FZF_DEFAULT_COMMAND="rg -i --files --hidden --glob '!*/{.git,node_modules}/**'"
export FZF_DEFAULT_COMMAND="fdfind --type f --hidden --follow --exclude .git --exclude node_modules"
export FZF_CTRL_T_COMMAND="rg -i --files --hidden --no-ignore-vcs --glob '!*{.git,node_modules}/**'"
export FZF_ALT_C_COMMAND="fdfind -i --type d --no-ignore-vcs --exclude node_modules --exclude .git"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/home/sagi/.cargo/bin:$PATH"

alias center="XDG_CURRENT_DESKTOP=GNOME gnome-control-center"

# Disable the terminal being stuck by Ctrl-S or ctrl-Q
stty -ixon

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
#export PATH="/usr/lib/go-1.13/bin/:$PATH"
#export PATH="/home/sagi/anaconda3/bin:$PATH"
#export PATH="/home/sagi/gits/btcd:$PATH"
#export PATH="/home/sagi/gits/lnd:$PATH"

export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Dracula gnome-terminal dircolors
eval `dircolors /home/sagi/.dir_colors/dircolors`

alias darkchrome="google-chrome-stable --enable-features=WebUIDarkMode --force-dark-mode"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/sagi/miniconda3/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sagi/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sagi/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sagi/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sagi/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sagi/google-cloud-sdk/path.zsh.inc' ]; then . '/home/sagi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/sagi/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/sagi/google-cloud-sdk/completion.zsh.inc'; fi
