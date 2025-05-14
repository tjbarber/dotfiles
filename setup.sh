#!/usr/bin/env bash

# turns the platform into 'linux' or 'darwin'
platform=$(uname | tr '[:upper:]' '[:lower:]')

# This is where secret ENV vars go
touch secrets.sh

if [ $platform == "linux" ]; then
  chmod +x ./linux/setup.sh
  ./linux/setup.sh
fi

if [ $platform == "darwin" ]; then
  chmod +x ./darwin/setup.sh
  ./darwin/setup.sh
fi
