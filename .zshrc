# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
zmodload zsh/zprof
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
#
# Ensure no duplicates in PATH
export PATH=$HOME/bin:/usr/local/bin:/home/yairziv/.local/bin:$PATH
export PATH=$(echo "$PATH" | awk -v RS=: -v ORS=: '!n[$0]++' | sed 's/:$//')

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export VISUAL=nvim
export ZOXIDE_CMD_OVERRIDE=cd

# THEME
ZSH_THEME="re5et"

# PLUGINS
plugins=(battery colorize colored-man-pages docker docker-compose git kubectl web-search yarn zoxide)

source $ZSH/oh-my-zsh.sh
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg='#5c9789',underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg='#5c9789',underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg='#77bfb4'

# CUSTOM SOURCES
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.functions ]] && source ~/.functions
[[ -f ~/.customization ]] && source ~/.customization
[[ -f ~/.profile ]] && source ~/.profile

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Key bindings
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/y.ziv/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
