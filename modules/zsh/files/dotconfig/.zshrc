scratch# Oh-My-Zsh
ZSH=~/.config/zsh/oh-my-zsh

ZSH_THEME="oh-my-zsh"    #kardan agnoster af-magic bira clean candy gentoo terminalparty
ZSH_THEME="oh-my-zsh"
PROMPT='
%B%{$fg_bold[grey]%}╭─● %{$fg[black]%}%m %{$fg_bold[grey]%}●─────┤ %{$fg[white]%}%4~ %{$fg_bold[grey]%}├─────● %{$fg[yellow]%}'%D{"%a %b %d, %I:%M"}%b$'
%B%{$fg_bold[grey]%}╰─%{$fg[red]%}■ %{$reset_color%}'
RPROMPT=$'%b%{$fg[black]%}%B$(git_prompt_info) %{$reset_color%}%{$fg_bold[white]%}${${KEYMAP/vicmd/--NORMAL--}/(main|viins)/--INSERT--}%{$reset_color%}'

# Lines configured by zsh-newuser-install
STFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

export QT_X11_NO_MITSHM=1
# Default Programs
#export NMON=cmknt
export EDITOR="vim"
export PAGER="less"
export BROWSER="dwb"
export MOVPLAY="vlc"
export PICVIEW="feh"
export SNDPLAY="mplayer"
export TERMINAL="lxterminal"

# File Extensions
for ext in html org php com net no;    do alias -s $ext=$BROWSER; done
for ext in txt tex py PKGBUID;        do alias -s $ext=$EDITOR; done
for ext in png jpg gif;            do alias -s $ext=$PICVIEW; done
for ext in mpg wmv avi mkv;        do alias -s $ext=$MOVPLAY; done
for ext in wav mp3 ogg;            do alias -s $ext=$SNDPLAY; done

########################################################
######################## ALIASES ####################### 
########################################################

## Directories
alias space='ncdu'
alias space-color='cdu'
alias ll='ls -l'
alias la='ls -ltra'
alias l='ls'
alias C='clear'
alias se='sudo vim'
alias e='vim'
alias home='cd ~'
alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
alias .....='cd .....'
alias k='exit'
alias te='trash-empty'
alias tl='trash-list'
alias del='trash-put'
alias tr='trash-rm'

## X Resources Stuff
alias eX='vim ~/.Xresources'
alias XTR='xrdb -merge ~/.Xresources'

alias lock=/home/user/.local/bin/lock
alias O2Stick=/home/user/.local/bin/O2stick


###########################################################
########################### ZSH ###########################
###########################################################

# enable vim mode on commmand line
bindkey -v
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "e[3~" delete-char
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# no delay entering normal mode
# https://coderwall.com/p/h63etq
# https://github.com/pda/dotzsh/blob/master/keyboard.zsh#L10
# 10ms for key sequences
KEYTIMEOUT=1

# show vim status
# http://zshwiki.org/home/examples/zlewidgets
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# add missing vim hotkeys
# fixes backspace deletion issues
# http://zshwiki.org/home/zle/vi-mode
#bindkey -a u undo
#bindkey -a '^R' redo
#bindkey '^?' backward-delete-char
#bindkey '^H' backward-delete-char

# history search in vim mode
# http://zshwiki.org./home/zle/bindkeys#why_isn_t_control-r_working_anymore
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward


##########################################################
########################## MODS ########################## 
##########################################################



plugins=(git archlinux vi-mode themes zsh-completions color-command)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

clear
