# pkg manager aliases
alias pkg-install="sudo xbps-install -Sv"
alias pkg-remove="sudo xbps-remove -Rv"
alias pkg-upgrade="sudo xbps-install -Suyv"
alias pkg-update="sudo xbps-install -Sv"
alias pkg-search="xbps-query -Rs"
alias pkg-list="xbps-query -l"
alias pkg-show="xbps-query -RS"
alias pkg-count="pkg-list | wc -l"
alias pkg-clean="sudo xbps-remove -O"

# git aliases
alias gs="git status"
alias gc="git commit"
alias gl="git log"
alias ga="git add"
alias gr="git rebase -i"
alias gm="git merge"
alias gb="git branch"
alias gf="git fetch --all"
alias gca="git commit --amend"
alias gpl="git pull origin"
alias gps="git push origin"
alias gch="git checkout"
alias gcp="git cherry-pick"
alias gcl="git clone"
alias gdf="git diff"

# others
alias v="vim"
alias nv="nvim"
alias xcp="xclip -selection clipboard"
alias cp="cp -v"
alias mv="mv -v"
alias dd="dd status=progress"
