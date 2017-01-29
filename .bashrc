ulimit -n 65536 65536
set -o history
HISTFILE=$HOME/.bash_history
export PATH="$PATH:/usr/local/bin
export PATH="$PATH:$HOME/.nvm"
export PATH=~/.cabal/bin:$PATH
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export NVM_DIR=$HOME/.nvm"
export PATH=$PATH:~/.vimpkg/bin
# NVM
if [ -s ~/.nvm/nvm.sh ]; then
	NVM_DIR=~/.nvm
	source ~/.nvm/nvm.sh
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH=$HOME/.rvm/gems/ruby-2.3.0@health24/bin:$HOME/.rvm/gems/ruby-2.3.0@global/bin:$HOME/.rvm/rubies/ruby-2.3.0/bin:$HOME/.nvm/versions/node/v5.0.0/bin:/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin:$HOME/.rvm/bin:$HOME/.vimpkg/bin
