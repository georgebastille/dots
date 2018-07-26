#!/bin/bash
ssh-add -D
mv ~/.toolkit/toolkit_ssh_key_rhanes ~/.ssh/id_rsa
ssh-add -K ~/.ssh/id_rsa
ssh-add -K ~/.ssh/bbgithub/id_rsa
