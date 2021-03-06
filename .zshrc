# for vim
# stty -ixon

source /Users/omaik/.profile

bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
# Path to your oh-my-zsh installation.
export ZSH=/Users/omaik/.oh-my-zsh

ZSH_THEME="robbyrussell"
export CDPATH=$CDPATH:/Users/omaik/work:/Users/omaik
export FZF_BASE=/usr/local/opt/fzf
plugins=(
  git
  osx
  terminalapp
  zfz
)

source $ZSH/oh-my-zsh.sh

# aliases
alias ctags="`brew --prefix`/bin/ctags"
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
alias v='vim'
alias vi='vim'

# functions

function shadowconsole {
  bastion -t "ssh api01.use1.shadow01.onlgn.net -t 'sudo -i -u deploy bash -c \"cd /srv/onelogin_new/current && bundle exec script/console shadow\"'"

}

function fixtagsonhost {
  bastion -t "rm -rf ~/.ssh/known_hosts"
  bastion -t "ssh $1 -t 'sudo -i -u deploy bash -c \"echo 'prod' > /srv/onelogin_new/current/config/workers_env\"'"
}

function update-rubies-list {
  brew update
  brew upgrade ruby-build
}

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

function startike {
  services=(postgres rabbitmq redis-server traefik haproxy-flow haproxy-swarm-listener \
    "encryption-service -t ike" javascript-mux monorail-admin monorail-portal core-api  )
  ike init
  for service in "${services[@]}"
  do
    ike start `echo $service` &
  done
  wait
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
  docker exec -it $CONTAINER bash -c "bundle exec spec $2"
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

function muxrock {
  MUX_PORT=`ike ls | grep javascript | awk -F ":" '{print $4}' | awk -F'->' '{print $1}'`

  ngrok http $MUX_PORT
}

RPROMPT="%F{green}[%D{%L:%M:%S}]%F{white}"

source /usr/local/opt/autoenv/activate.sh
ssh-add ~/.ssh/id_rsa

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export VAGRANT_HOME="/Volumes/vagrants/vagrant_home"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
