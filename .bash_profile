
eval "$(thefuck --alias)"

# For Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/golang

export PATH=$PATH:$GOPATH/bin:~/Library/Android/sdk/platform-tools:~/Library/Android/sdk/tools:/Users/vista/Library/Android/sdk/build-tools/25.0.2:~/mongodb/bin:~/vert.x/bin
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export SPARK_HOME=~/spark

PS1=" \w $ "
#PS1="\[\e[38;5;148m\]\w\e[38;5;141m\] $ \e[m\]"
scpto() {
    scp -r $1 vista@61.108.29.51:/home/vista/$2
}
scpfrom() {
    scp -r vista@61.108.29.51:/home/vista/$1 $2
}

alias sshg="ssh -i ~/Dropbox/vista_aws_j.pem ubuntu@52.193.1.179"
alias sshm="ssh vista@61.108.29.51"
alias ls="ls -alhG"
alias lsn="ls"
alias ...="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias pedit="vi ~/.bash_profile && source ~/.bash_profile"
alias uptimeh=". ~/uptime_h"
alias vi="vim"
alias tmux_conf="vi ~/.tmux.conf"
alias tmux_theme="vi ~/.powertmux/themes/therne.sh"
alias xocolor="python ~/.powertmux/colortrans.py"
alias th_refresh="source ~/.bash_profile"
alias th_cls="clear; th_refresh"

export NODE_REPL_HISTORY_FILE=~/.repl_history
export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

