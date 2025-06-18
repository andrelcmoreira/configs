#!/bin/sh

. ${HOME}/.env

setxkbmap br

exec nm-applet &
