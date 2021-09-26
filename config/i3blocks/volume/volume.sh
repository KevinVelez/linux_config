#!/usr/bin/bash
#
# Copyright (C) 2021 Kevin Velez
# Licensed under the GPL version 2 only
#
# Control and indicator volume script for i3blocks

case $BLOCK_BUTTON in
    1) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
esac

function vol() {
        pactl list sinks \
        | grep '^[[:space:]]Volumen:'\
        | head -n $(( $SINK + 1 )) \
        | tail -n 1 \
        | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'
}

v=$(vol)
if [ "$(pacmd list-sinks | awk '/muted/ { print $2 }')" == "yes" ]; then
        echo " $v%"
        exit 0
fi;

if [ "$v" -gt "50" ]  ; then echo " $v%";
else echo " $v%";
fi;
