#!/bin/bash

# Configure this to fit your username and email
# This is done by mounting the user .gitconfig file into the container
# Command can be found in the devcontainer.json file almost at the end
# "mounts": [ ...

# This sets the git editor to the VS Code editor
git config --global core.editor "code --wait"

# Source git completions and add them to bashrc
source /usr/share/bash-completion/completions/git
echo "source /usr/share/bash-completion/completions/git" >> ~/.bashrc

cd api && npm ci

# Install azure/oav for validation of openapi and swagger example generation
# https://github.com/Azure/oav
# TODO: if we need to, we should move this out of here and into `api/package.json`
npm install -g oav@3.3.4

# Setup the welcome screen
echo "cat .devcontainer/motd" >> ~/.bashrc
echo "cat .devcontainer/motd" >> ~/.zshrc
