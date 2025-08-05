# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_aliases

PS1='[%n@%m %c]$ '

export FZF_DEFAULT_OPTS="--color='bg+:#3a3a3a' --preview='cat {}'"
if [ -f /usr/share/fzf/key-bindings.zsh ]; then
  source /usr/share/fzf/key-bindings.zsh
fi

. "$HOME/.cargo/env"
