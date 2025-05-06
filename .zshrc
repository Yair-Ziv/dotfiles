# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
#
# Ensure no duplicates in PATH
export PATH=$HOME/bin:/usr/local/bin:/home/yairziv/.local/bin:$PATH
export PATH=$(echo "$PATH" | awk -v RS=: -v ORS=: '!n[$0]++' | sed 's/:$//')
#export PATH="/opt/homebrew/opt/arm-none-eabi-gcc@8/bin:$PATH"
#export LDFLAGS="-L/opt/homebrew/opt/arm-none-eabi-gcc@8/lib"
#export PATH="/opt/homebrew/opt/arm-none-eabi-binutils/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim

# THEME
ZSH_THEME="re5et"

# PLUGINS
plugins=(battery colorize colored-man-pages docker docker-compose git kubectl web-search yarn zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg='#5c9789',underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg='#5c9789',underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg='#77bfb4'

# CUSTOM SOURCES
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.functions ]] && source ~/.functions
[[ -f ~/.venvs ]] && source ~/.venvs

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Key bindings
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF Config
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export LC_TIME=en_US.UTF-8
