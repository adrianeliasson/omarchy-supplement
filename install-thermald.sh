#!/bin/bash

yay -S --noconfirm --needed thermald
sudo systemctl enable thermald --now
