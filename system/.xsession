#!/bin/sh

. "${HOME}"/.env

setxkbmap br

exec volumeicon &
exec nm-applet &
exec i3
