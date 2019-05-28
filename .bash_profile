#!/usr/bin/env bash

readonly RED=$(tput setaf 1)
readonly GREEN=$(tput setaf 2)
readonly RESET=$(tput sgr0)

export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

for file in $(find ~/.profiles.d* -type f); do
    source $file
done

source ~/.gitaliases

alias watch_a='watch -x bash -c '

export DERIVED_DATA_PATH="$HOME/Library/Developer/Xcode/DerivedData"

function ddata() {
  cd $DERIVED_DATA_PATH
}

function oddata() {
  open $DERIVED_DATA_PATH
}

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
