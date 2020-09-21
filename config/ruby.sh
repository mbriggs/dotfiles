#!/usr/bin/env bash

function setup-gemstash() {
    gem install gemstash
    systemctl enable --user $HOME/dotfiles/gemstash.service
    systemctl --user daemon-reload
    systemctl start --user gemstash.service
    bundle config mirror.https://rubygems.org http://localhost:9292
    bundle config mirror.https://rubygems.org.fallback_timeout true
}

function trb() {
    reflex -s -r '\.rb$' --decoration=none -- ruby test/automated.rb
}

