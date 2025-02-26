#!/bin/bash

echo ===================================================
echo Login as: $(whoami)
git --version

echo gem $(gem --version)
ruby -v
rails -v

bundle -v
rake -V
rspec -v
echo ===================================================