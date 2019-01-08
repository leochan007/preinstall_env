#!/bin/bash

sudo add-apt-repository ppa:inkscape.dev/stable

sudo add-apt-repository ppa:neon/ppa \
 && sudo apt-get update

sudo apt-get install project-neon-base \
   project-neon-calligra \
   project-neon-calligra-dbg

sudo apt-get install gimp
