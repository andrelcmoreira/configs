#!/bin/sh

config=$(printf "tmux\ni3\nqutebrowser\nranger\nnvim" | fzf)

case $config in
  tmux) "$EDITOR" ~/.tmux.confg ;;
  i3) "$EDITOR" ~/.config/i3/config ;;
  qutebrowser) "$EDITOR" ~/.config/qutebrowser/config.py ;;
  ranger) "$EDITOR" ~/.config/ranger/rc.conf ;;
  nvim) "$EDITOR" ~/.config/nvim/init.vim ;;
esac
