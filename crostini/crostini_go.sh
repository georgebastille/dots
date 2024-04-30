#!/bin/bash
echo "Installing golang for Python"
git clone https://github.com/udhos/update-golang
cd update-golang && sudo ./update-golang.sh
cd .. && rm -rf ./update-golang
