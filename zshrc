# variables
PATH=$PATH:$HOME/bin     #set the path
TERMINAL=st
export EDITOR=vim
BROWSER='qutebrowser'

# command history
HISTFILE=~/.cache/zsh/history
HISTSIZE=999999999999999999
SAVEHIST=$HISTSIZE
setopt sharehistory
setopt extendedhistory
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY


# plugins
if [[ ! -a ~/.zplug ]]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
source ~/.zplug/init.zsh
zplug "woefe/vi-mode.zsh"
zplug "zsh-users/zsh-syntax-highlighting"
zplug load

# set up vi mode and keybindings
bindkey -v
VI_MODE_KEEP_CURSOR=1
VI_INSERT_MODE_INDICATOR='I'
VI_NORMAL_MODE_INDICATOR='N'

bindkey -r '^['
bindkey '\e' vi-cmd-mode

# prompts
PS1=$'%{\e[0;100;94m%} %2~ %{\e[0;90m%}%{\e[0m%} '
RPS1=$'%{\e[0;38;5;238m%}%{%}%{\e[48;5;238;93m%} $(vi_mode_status) %{\e[48;5;235;94m%} %! %{\e[91;1m%}%(?..%? )%{\e[0m%}'
#

# aliases
alias clr='clear'
alias la='ls -Al'
alias ll='ls -Al | less'
alias gc='git clone'
alias jec='mutt -F ~/.config/jecMail.conf'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias :q='exit'
alias ls='ls --color=auto'

# colors
LS_COLORS="di=1;31:*.c=93:ex=33;4;1:*.py=93:*.h=93:*.java=93:fi=35:bd=107;94;1"

# completeions (with compinstall) -- some of the comments are reqiered by compinstall
# The following lines were added by compinstall

zstyle ':completion:*' auto-description '      |  %d'
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort size reverse
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-/ ]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=3
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle :compinstall filename '/home/shloimy/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# coding stuff
# java
CLASSPATH=''
for d in ~/code/java/lib/*.jar; do
    CLASSPATH+=$d
    CLASSPATH+=:
done
CLASSPATH+=.
export CLASSPATH


# other settings
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS

# syntax highlighting (needs to be at the end of the file)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
# main
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]='fg=12'
ZSH_HIGHLIGHT_STYLES[path]='fg=5'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=5,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='none'
ZSH_HIGHLIGHT_STYLES[command]='fg=12'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=11'
ZSH_HIGHLIGHT_STYLES[globbing]='bold,fg=5'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=6'
ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=11'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=15'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=15'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=2'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=2'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=2'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=2'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=11'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=11'
ZSH_HIGHLIGHT_STYLES[assign]='fg=3'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=13'
ZSH_HIGHLIGHT_STYLES[comment]='fg=7'
ZSH_HIGHLIGHT_STYLES[default]='none'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=13'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=3'
# brakcets
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='underline'
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=3'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=4'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=14'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=11'
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=9'
# pattern
typeset -A ZSH_HIGHLIGHT_PATTERNS
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=1,bg=0')
