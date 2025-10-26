# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Download PM.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# History


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

plugins=(git)

# source $ZSH/oh-my-zsh.sh
# Commun
export NVM_DIR="$HOME/.nvm"
export PATH=/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.nvm:$PATH
export PATH=/opt/X11/bin:$PATH
export PATH=/Users/mathias.mrsn/.local/share/bob/nvim-bin:$PATH
export EDITOR=/Users/mathias.mrsn/.local/share/bob/nvim-bin/nvim
export VISUAL=/Users/mathias.mrsn/.local/share/bob/nvim-bin/nvim

alias c="clear"
alias l="ls -alh --color=auto"

# Clang
alias clangf="clang -Wall -Werror -Wextra"
alias clangfs="clang -Wall -Werror -Wextra -g3 -fsanitize=address"
alias clangf++="clang++ -Wall -Werror -Wextra -std=c++98"
alias clangfs++="clang++ -Wall -Werror -Wextra -g3 -fsanitize=address -std=c++98"

# Terraform
alias tf=terraform
alias tfi="terraform init"
alias tfp="terraform plan"
alias tfa="terraform apply"
alias tfaa="terraform apply -auto-approve"
alias tfd="terraform destroy"
alias tfdd="terraform destroy -auto-approve"
alias tfv="terraform validate"
alias tff="terraform fmt"
alias tfv="terraform version"

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Bat
# alias cat="bat"

# Zellij
alias zj="zellij -l compact"
alias zjls="zellij ls"
alias zja="zellij attach -c"
alias zjk="zellij kill-session"
alias zjka="zellij kill-all-sessions"
alias zjda="zellij delete-all-sessions"

# Starship
eval "$(starship init zsh)"

# Neovim
alias vim="nvim"
alias vi="nvim"
alias vimf='nvim `fzf`'

# Exa
# alias ls="exa"
# alias l="exa -alh"
# alias lst="exa -alh --tree"
#
# Zoxide
eval "$(zoxide init zsh)"
alias cd="z"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# History
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function byebyedocker() {
  docker stop $(docker ps -qa) >/dev/null 2>&1
  docker rmi -f $(docker images -qa) >/dev/null 2>&1
  sudo docker rm $(sudo docker volume ls -q) >/dev/null 2>&1
  sudo docker system prune -af >/dev/null 2>&1
  sudo docker volume rm $(sudo docker volume ls -q) >/dev/null 2>&1

  rm -rf /home/mamaurai/data > /dev/null 2>&1
}



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix

