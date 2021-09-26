#!/usr/bin/bash
#
# Copyright (C) 2021 Kevin Velez
# Licensed under the GPL version 2 only
#
# Control and indicator mic volume script for i3blocks

case $BLOCK_BUTTON in
    1) pactl set-source-mute @DEFAULT_SOURCE@ toggle ;;
esac

function vol() {
        pactl list sources \
        | grep '^[[:space:]]Volumen:'\
        | tail -n 1 \
        | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'
}

v=$(vol)

if [ "$(pacmd list-sources | awk '/muted/' | awk '/yes/ { print $2 }')" == "yes" ]; then
        echo " $v%"
        exit 0
fi;

echo " $v%"
