export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

source ~/.keys
source ~/.nurc
source ~/.gitaliases

alias watch_a='watch -x bash -c '

function reload() {
  exec $SHELL -l
}

function home() {
  cd $HOME
}

function tre() {
    tree -aC -I '.git' --dirsfirst "${@}"
}

function ds () {
    echo -e "\nRunning Containers\n"
    docker ps
    echo -e "\nStopped Containers\n"
    docker ps -f "status=exited"
    echo -e "\nImages\n"
    docker images
    echo -e "\nNetworks\n"
    docker network ls
    echo -e "\nVolumes\n"
    docker volume ls
}

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
