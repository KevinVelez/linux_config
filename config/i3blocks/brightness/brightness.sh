#!/usr/bin/bash
#
# Copyright (C) 2021 Kevin Velez
# Licensed under the GPL version 2 only
#
# brightness control and indicator script

function set_brightness() {
        brightnessctl | awk '/Current/ {print $4}'
}

b=$(set_brightness)

echo " ${b//[()]}"
