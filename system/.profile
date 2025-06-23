#!/bin/sh

. ${HOME}/.env

setxkbmap br

exec pa-applet &
exec nm-applet &
