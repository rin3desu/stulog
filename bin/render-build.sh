#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
yarn install

# ↓↓↓ この1行を追加します！ ↓↓↓
yarn add @babel/plugin-proposal-private-methods @babel/plugin-proposal-class-properties @babel/plugin-proposal-private-property-in-object

bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate