#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

source ~/.zplug/init.zsh

zplug "wbinglee/zsh-wakatime"
zplug "sorin-ionescu/prezto", from:prezto

# syntax
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "ascii-soup/zsh-url-highlighter"

# tools
zplug "marzocchi/zsh-notify"

# prompt
prompt paradox
# PROMPT='%n:%c $ '

# 補完
autoload -U compinit
compinit

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVESIZE=6000000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history    # share command history date

# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# other
source ~/.zsh/*.zsh

# alias
alias diff="colordiff"
alias lgh='cd $(ghq root)/$(ghq list | peco)'
alias rgh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

if ! zplug check; then
  zplug install
  fi
zplug load --verbose

# adb
export PATH=/Users/nshiba/Library/Android/sdk/platform-tools:$PATH

# rbenv
eval "$(rbenv init -)"
