#####################################
## ==> BASIC
#####################################
alias cls="clear"
alias cl="clear"
alias q="exit"
alias reload="exec fish"

#####################################
## ==> NAVIGATION
#####################################
alias c="cd"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias h="cd ~"
alias prev="cd -"

#####################################
## ==> EDITOR
#####################################
alias n="nvim"
alias m="micro"

#####################################
## ==> FILE & VIEW
#####################################
alias py="python"
alias gpp="g++"
# modern ls (lsd)
alias ls="lsd"
alias l="lsd -lah"
alias la="lsd -a"
alias ll="lsd -lah"
alias lt="lsd --tree"

# file viewer
alias b="bat"

# safer file operations
alias mk="mkdir -pv"

#####################################
## ==> SEARCH & FIND
#####################################
alias rg="rg --smart-case"
alias rgi="rg -i"

alias fd="fd --hidden --follow"
alias fda="fd -a"

alias ff="fd | fzf"

#####################################
## ==> SYSTEM
#####################################
alias df="df -h"
#alias du="du -h"
alias free="free -h"
alias ip="ip -c"
alias ports="ss -tulnp"
alias psg="ps aux | grep -i"

alias pw="loginctl poweroff"
alias rbt="loginctl reboot"

#####################################
## ==> NETWORK / SSH
#####################################
alias ssh="kitty +kitten ssh"
alias pi="ping google.com"

#####################################
## ==> DEV TOOLS
#####################################
alias fast="fastfetch"
alias neo="neofetch"
alias serve="python -m http.server"

#####################################
## ==> PACMAN (ARCH)
#####################################
alias p="pacman"
alias ps="pacman -Ss"
alias qi="pacman -Qi"
alias qs="pacman -Qs"

#alias in="sudo pacman -S"
#alias up="sudo pacman -Syu"
alias rm-pkg="sudo pacman -Rns"
alias cleanpkg="sudo pacman -Sc"

#####################################
## ==> GIT
#####################################
alias g="git"
alias gs="git status"
alias ga="git add ."
alias gA="git add -A"
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias gb="git branch"
alias gco="git checkout"
alias gcl="git clone"

# advanced git
alias glog="git log --oneline --graph --decorate"
alias gundo="git reset --soft HEAD~1"
alias gclean="git clean -fd"


#####################################
## ==> QUICK ACCESS
#####################################
alias envs="env | sort"

alias cf="cd ~/.config/fish/config.fish"
alias cfa="nvim ~/.config/fish/conf.d/alias.fish"

#####################################
## ==> TYPO GUARD
#####################################
alias sl="ls"
alias cim="nvim"
alias chmox="chmod"
alias grpe="grep"
