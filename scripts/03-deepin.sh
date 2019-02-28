#!/usr/bin/env bash

export HOME=/home/$DOCKER_USER 
mkdir -p $HOME/.config
chown -R $DOCKER_USER:$DOCKER_GROUP $HOME/.config/
