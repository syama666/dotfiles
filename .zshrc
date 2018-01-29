export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export LSCOLORS=gxfxcxdxbxegedabagacad
export TERM=xterm-color
export PATH=/usr/X11/bin:/usr/local/bin:/usr/local/opt:~/.bin:~/.local/bin:$PATH
export EDITOR=vim
export SVN_EDITOR=~/Applications/MacVim.app/Contents/MacOS/Vim
export LESS='-R'
##gvmがだめになるので一旦コメントアウト
#export GREP_OPTIONS='--color=always'
##
export SHELL=/usr/local/bin/zsh

alias mvim='env LANG=ja_JP.UTF-8 ~/Applications/MacVim.app/Contents/MacOS/Vim "$@"'

bindkey -e
stty stop undef

ZSH_FILES=~/.zsh


#Android
ANDROID_HOME=~/android-sdk

# node
if [[ -f `brew --prefix nvm`/nvm.sh ]]; then
    source $(brew --prefix nvm)/nvm.sh
    export NVM_DIR=~/.nvm
    #nvm alias default 0.8
    #nvm use v0.8.3
    #nvm use v0.8.26
    #export NODE_PATH=${NVM_PATH}_modules:/usr/local/lib/jsctags/
    #nvm use v0.11.11
    #nvm use v5.0.0
    #nvm use v4.1.2
    #nvm use v4.6.2
    nvm use v4.8.3
    npm_dir=${NVM_PATH}_modules:$(npm root -g)
    export NODE_PATH=$npm_dir:$npm_dir/npm/bin/node-gyp-bin
fi
# npm install -g optimist async jshint nodeunit mocha should node-inspector node-dev long-stack-traces


# ruby
if [[ -f ~/.rvm/scripts/rvm ]]; then
source ~/.rvm/scripts/rvm
    rvm use 1.9.3
fi


# java
if [[ -f /usr/local/maven2/bin/mvn ]]; then
export MAVEN_HOME=/usr/local/maven2
    export PATH=$MAVEN_HOME/bin:$PATH
fi

# python
if [[ -d ${HOME}/.pyenv ]]; then
    export PATH=${HOME}/.pyenv/shims:${PATH}
    eval "$(pyenv init -)"
    PYTHON_GLOBAL=`pyenv global`
    echo "version:"${PYTHON_GLOBAL}
    export PATH=${HOME}/.pyenv/versions/${PYTHON_GLOBAL}/bin:${PATH}
fi

#go
source ~/_gvm/scripts/gvm
#gvm use go1.4
#gvm use go1.5.3
#gvm use go1.6
#gvm use go1.7
#gvm use go1.8
gvm use go1.9
#export GOPATH=${HOME}/fxxk
export PATH=${GOPATH}/bin:$(go env GOROOT)/bin:$PATH
#direnv for go
#eval "$(direnv hook zsh)"

# Docker glasgow
#export DOCKER_TLS_VERIFY="1"
#export DOCKER_HOST="tcp://192.168.99.100:2376"
#export DOCKER_CERT_PATH="/Users/a12139/.docker/machine/machines/glasgow"
#export DOCKER_MACHINE_NAME="glasgow"
export GLASGOW_DOCKER_HOST="localhost"

# prompt
case ${UID} in
    0)
    PROMPT="%B%{[31m%}%/#%{[m%}%b "
    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
    SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
    *)
    PROMPT="%{[31m%}%/%%%{[m%} "
    PROMPT2="%{[31m%}%_%%%{[m%} "
    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac
RPS1=$'%D'
RPROMPT="%T" # 右側に時間を表示する
setopt transient_rprompt # 右側まで入力がきたら時間を消す
setopt prompt_subst # 便利なプロント


# alias
alias ls='ls -G'
alias ll='ls -ahl'
alias l='ls -al'
alias mv='mv -i'
alias rm='rm -i'
alias less='less -R'
alias tmux='tmux -2'
alias view='vim -R'
alias v='vim -'
alias j='autojump'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# source auto-fu.zsh
if [ -f ~/.zsh/plugins/auto-fu.zsh/auto-fu.zsh ]; then
source ~/.zsh/plugins/auto-fu.zsh/auto-fu.zsh
    function zle-line-init () {
        auto-fu-init
    }
    zle -N zle-line-init
    zstyle ':completion:*' completer _oldlist _complete
    zstyle ':auto-fu:var' postdisplay ''
fi

# 補完
fpath=($ZSH_FILES/plugins/zsh-completions/src $fpath)
autoload -U compinit && compinit

# 補完時に大小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1

# options
setopt bash_auto_list
setopt list_ambiguous
setopt autopushd

# history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward
HISTFILE=~/.zsh_history
HISTSIZE=16384
SAVEHIST=16384
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history

zshaddhistory() {
    local line=${1%%$'\n'}
    local cmd=${line%% *}

    # 以下の条件をすべて満たすものだけをヒストリに追加する
    [[ ${#line} -ge 5
        && ${cmd} != (l|l[sal])
        && ${cmd} != (man)
        && ${cmd} != (say)
        && ${cmd} != (rm) ]]
}
###########1
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b] %R'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'

###########1
# z
_Z_CMD=j
source ~/.zsh/z.sh
precmd() {
    _z --add "$(pwd -P)"

###########1
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
###########1

}
###########1
RPROMPT="%1(v|%F{green}%1v%f|)"
###########1

show_buffer_stack() {
    POSTDISPLAY="
stack: $LBUFFER"
    zle push-line-or-edit
}
zle -N show_buffer_stack

# 設定ファイルのinclude
[ -f ~/.zshrc.include ] && source ~/.zshrc.include

# added by travis gem
[ -f /Users/a12139/.travis/travis.sh ] && source /Users/a12139/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
source '/Users/a12139/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/a12139/google-cloud-sdk/completion.zsh.inc'


