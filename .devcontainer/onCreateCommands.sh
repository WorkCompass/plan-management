#!/bin/bash

# Script for setting up devcontainer for development

echo ===================================================
bundle install
bundle exec rails db:create
bundle exec rails db:migrate
echo ===================================================