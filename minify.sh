#!/bin/bash

if ! which uglifyjs > /dev/null; then
  
  echo "uglifyjs not found in PATH, install with:"
  echo "sudo npm install uglify-js -g"
  echo "or"
  echo "npm install uglify-js"
  exit
fi

uglifyjs canvas-helper.js -o canvas-helper.min.js -c -m