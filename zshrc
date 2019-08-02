export ZSH="/home/sagi/.oh-my-zsh"

ZSH_THEME="eastwood"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

export VISUAL=vim
export EDITOR="$VISUAL"

setxkbmap us,il -option grp:alt_shift_toggle

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --glob '!*/{.git,node_modules}/**'"
export FZF_CTRL_T_COMMAND="rg --files --no-ignore-vcs --glob '!*{.git,node_modules}/**'"
export FZF_ALT_C_COMMAND="fd --type d --no-ignore-vcs --exclude node_modules --exclude .git"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/home/sagi/.cargo/bin:$PATH"
