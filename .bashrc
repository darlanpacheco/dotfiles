alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias please="sudo"
alias c="clear"
alias e="exit"
alias q="exit"

alias pSuy="sudo pacman -Syu --needed"
alias pSs="pacman -Ss"
alias pQ="pacman -Q"
alias pR="sudo pacman -R"

alias gts="git status"
alias gta="git add"
alias gtc="git commit"
alias gtp="git push"
alias gtl="git log"

vim() {
  cd "$1" && nvim .
}

export EDITOR=nvim
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export XDG_BACKEND=wayland
export GDK_BACKEND=wayland
export QT_QPA_PLATFORM=wayland
export GTK_THEME=adw-gtk3-dark
export QT_QPA_PLATFORMTHEME=gtk3
export PATH=$PATH:$HOME/Documents
export PATH=$PATH:$HOME/.local/npm/bin
