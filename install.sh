#!/bin/bash


export PATH=$PATH:/root/app
cd /root/app
chmod 777 -R ./

source ~/.bashrc

which dfx
dfx --version

echo 'exit the terminal and relogin to apply changes'