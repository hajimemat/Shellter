#!/bin/bash

reflector -p http --country 'Japan' --latest 200 --age 24 --sort rate  --save /etc/pacman.d/mirrorlist
