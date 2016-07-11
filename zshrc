# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode git pip python rvm laravel4 composer ubuntu rails)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# export PATH="/usr/lib/node_modules/jsctags/bin/jsctags:$PATH"
alias recents="history | grep"
alias tmux="tmux -2"
export PYTHONSTARTUP=~/.pystartup

# hist search vi-mode
bindkey '^R' history-incremental-pattern-search-backward

PATH=$PATH:~/.local/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# virtualenv and virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# docker
export DEVICES="$(ls /dev/nvidia* | xargs -I{} printf '--device {}:{} ')"
export CUDA_SO="$(ls /usr/lib/x86_64-linux-gnu/libcuda.* | xargs -I{} printf '-v {}:{} ')"
alias drtfgpu="docker run -it $DEVICES $CUDA_SO $DOCKER_EXTRAS -v /home/lotus/Dropbox/MachineLearning:/workspace gcr.io/tensorflow/tensorflow:latest-gpu"

# create github repo and push
function newgithubrepo() {
  curl -u 'p-tricky' https://api.github.com/user/repos -d '{"name":"'$1'"}'
  if [ -n "$2" ] ; then
    git remote add $2 git@github.com:p-tricky/$1.git
  else
    git remote add origin git@github.com:p-tricky/$1.git
  fi
}

function newbitbucketrepo() {
  curl --user p-tricky https://api.bitbucket.org/1.0/repositories/ --data name=$1
  if [ -n "$2" ] ; then
    git remote add $2 git@bitbucket.org:p-tricky/$1.git
  else
    git remote add origin git@bitbucket.org:p-tricky/$1.git
  fi
}

#java stuff
#JAVA_HOME=/usr/local/java/jdk1.8.0_60
#JRE_HOME=$JAVA_HOME/jre
#PATH=$PATH:$JRE_HOME/bin:$JAVA_HOME/bin
#export JAVA_HOME
#export JRE_HOME
#export PATH
