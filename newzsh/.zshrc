#!/bin/zsh
autoload -U colors && colors
coloreddir=
dir=%(5~|%-1~/../%3~|%4~)
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}$dir%{$fg[red]%}]%{$reset_color%}$%b "
HISTFILE="$ZDOTDIR/.histfile"
HISTSIZE=1000
SAVEHIST=1000

zstyle :compinstall filename '/home/rajik/.zshrc'

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)	

bindkey -v

export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

source "$HOME/.config/zsh/.aliasrc"
source "$HOME/.config/zsh/.pluginrc"
