#!/usr/bin/env bash

function setup-gemstash() {
    gem install gemstash
    sudo systemctl enable --user $HOME/dotfiles/gemstash.service
    sudo systemctl --user daemon-reload
    sudo systemctl start --user gemstash.service
}

function trb() {
    reflex -s -g '**/*.rb' --decoration=none -- ruby test/automated.rb
}
