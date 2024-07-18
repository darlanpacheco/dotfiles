alias ls="exa --icons"
alias cat="bat"
alias grep="rg"

alias t="tmux"
alias v="tmux new-session nvim"
alias f="fastfetch"
alias q="exit"

alias pSuy="sudo pacman -Suy --needed"
alias pSs="pacman -Ss"
alias pQ="pacman -Q"
alias pR="sudo pacman -R"

alias gts="git status"
alias gtl="git log"
alias gta="git add"
alias gtc="git commit"
alias gtp="git push"

alias tls="tmux ls"
alias tns="tmux new-session"
alias tas="tmux attach-session"
alias tks="tmux kill-server"

eval "$(starship init bash)"
source "$HOME/.asdf/asdf.sh"
