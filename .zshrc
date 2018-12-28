

source /Users/omaik/.profile

bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/omaik/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
export CDPATH=$CDPATH:/Users/omaik/work:/Users/omaik
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
plugins=(
  git
  osx
  terminalapp
)

source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


alias admin='RAILS_ENV=development bundle exec puma -p 3001'
alias portal='PORTAL=true RAILS_ENV=development bundle exec puma -p 3000'
alias pumacached='ADMIN=true CACHED=true bundle exec puma -p 3001'
alias coreapi='CORE_API=true RAILS_ENV=development bundle exec puma -p 3002'
alias be='bundle exec'
alias ber='bundle exec rake'
alias bgwk='RAILS_ENV=development bundle exec ruby workers/provisioning_worker.rb'
alias workers='RAILS_ENV=development be ruby workers/workers.rb'
alias dispatcher='RAILS_ENV=development bundle exec ruby workers/dispatcher.rb'
alias dbconsole='psql -h localhost -U postgres --password'
alias bastion='ssh -l omaikovych bastionhostnonprod.onlgn.net -p 23222'
alias rs='bundle exec rspec'
alias cop='bundle exec rubocop'

function shadow {
 ssh admin01-shadow0$1.use1.onlgn.net
}

function comm {
  git commit -m "$(current_branch): $@"
}

function gpp {
  git push origin $(current_branch)
}

function gpf {
  git push origin --force-with-lease $(current_branch)
}

function gam {
 git add -u
}

function ngrok {
 /Users/omaik/Desktop/ngrok http $1
}

function upmysql {
 cd ~/vagrants/mysql-vagrant
 vagrant up
 cd -
}

function contbash {
  docker container exec -it $1 bash
}

function ikebash {
  CONTAINER=`docker ps --filter "name=ol_$1" --filter "status=running" -q`
  docker exec -it $CONTAINER bash
}

function ikespec {
  CONTAINER=`docker ps --filter "name=ol_$1" --filter "status=running" -q`
  docker exec -it $CONTAINER bash -c "source /root/.bash_aliases; bundle exec spec $2"
}

function ikeworker {
  CONTAINER=`docker ps --filter "name=ol_core-api" --filter "status=running" -q -n='1'`
  docker exec -it $CONTAINER bash -c "source /root/.bash_aliases; RAILS_ENV=development bundle exec ruby workers/provisioning_worker.rb"
}

function ikeconsole {
  CONTAINER=`docker ps --filter "name=ol_core-api" --filter "status=running" -q`
  docker exec -it $CONTAINER bash -c "source /root/.bash_aliases; script/console"
}

function ikedb {
  CONTAINER=`docker ps --filter "name=ol_postgres" --filter "status=running" -q`
  docker exec -it $CONTAINER bash -c "source /root/.bash_aliases; psql -U postgres"
}

function rebuild-local {
  ike rebuild $1 -c ~/work/onelogin/docker/infrakit
}

RPROMPT="%F{green}[%D{%L:%M:%S}]%F{white}"

source /usr/local/opt/autoenv/activate.sh
ssh-add ~/.ssh/id_rsa

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
