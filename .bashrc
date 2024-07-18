alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias r="ranger"
alias c="clear"
alias e="exit"

alias pSuy="sudo pacman -Suy --needed"
alias pSs="pacman -Ss"
alias pQ="pacman -Q"
alias pR="sudo pacman -R"

alias gts="git status"
alias gtl="git log"
alias gta="git add"
alias gtc="git commit"
alias gtp="git push"

export EDITOR=nvim
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export XDG_BACKEND=wayland
export GDK_BACKEND=wayland
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=gtk3
export GTK_THEME=adw-gtk3-dark
export XCURSOR_SIZE=24
export XCURSOR_THEME=Adwaita

source "$HOME/.asdf/asdf.sh"
export PATH=$PATH:$HOME/Documents/flutter/bin/
export PATH=$PATH:$HOME/Documents/code/bin/
export PATH=$PATH:$HOME/Documents/godot
export PATH=$PATH:$HOME/Documents
