# .bashrc
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home
alias emacs='/usr/local/bin/emacs -nw'
alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#export MAVEN2_HOME=/usr/local/maven-2.2.1
export MYSQL_HOME=/usr/local/mysql
export PS1="\[\033[1;32m\]\u \w]$\[\033[0m\] "
#export PATH=$PATH:$JAVA_HOME/bin:$MAVEN2_HOME:$MYSQL_HOME/bin
export PATH=$PATH:$MYSQL_HOME/bin
#export CC='ccache gcc'
#export CXX='ccache g++'
export RVM=/Users/sugiyama_yoshinori/.rvm
echo $RVM
source $RVM/scripts/rvm
rvm use 1.9.2
source ~/.nvm/nvm.sh
export SVN_EDITOR=/usr/bin/vi
#nvm use v0.4.12
#nvm use v0.6.5
#nvm use v0.6.17
#nvm use v0.6.13
nvm use v0.8.17
npm_dir=${NVM_PATH}_modules
export NODE_PATH=$npm_dir:$npm_dir/npm/node_modules
#export ZOOKEEPER_INSTALL=/usr/local/Cellar/zookeeper/3.3.3
export ZOOKEEPER_INSTALL=/usr/local/zookeeper-3.4.2
export PATH=$PATH:$ZOOKEEPER_INSTALL/bin:$RVM/bin
export ZOO_LOG_DIR=$ZOOKEEPER_INSTALL/logs
#export ZOO_LOG4J_PROP=
export HISTSIZE=5000

