#!/usr/bin/env bash

readonly RED=$(tput setaf 1)
readonly GREEN=$(tput setaf 2)
readonly RESET=$(tput sgr0)

export DEV_HOME="${HOME}/dev"
export GITHUB_ORG="skull0801"

export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

if [ -d "~/.profiles.d" ]; then
  for file in $(find ~/.profiles.d* -type f); do
      source $file
  done
fi

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

alias rl=reload

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

function repo() {
    local repo_name="${1}"
    local repo_path="${DEV_HOME}/${repo_name}"
    if [ ! -d "${repo_path}" ]; then
        echo "${repo_path} does not exists, trying to clone..."
        git clone -- "git@github.com:${skull0801}/${repo_name}.git" "${repo_path}"
    fi
    cd "${repo_path}"
}
