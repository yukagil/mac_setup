export LANG=ja_JP.UTF-8
export PATH=$HOME/.nodebrew/current/bin:$PATH


alias ll='ls -lG'
alias la='ls -laG'
alias ...='cd ../..'
alias ....='cd ../../..'
alias gs='git status'
alias gd='git diff'
alias gc='git checkout'
alias gcp='git checkout `git branch | peco | sed -e "s/\* //g" | awk "{print \$1}"`'
alias ssh=~/bin/ssh-host-color.sh


autoload -Uz colors; colors
autoload -U compinit; compinit
autoload -U promptinit; promptinit

# npm install --global pure-prompt
prompt pure


zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


setopt print_eight_bit
setopt share_history
setopt histignorealldups
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct


HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


chpwd() { ls -G }

peco-select-history() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N peco-select-history
bindkey '^r' peco-select-history
