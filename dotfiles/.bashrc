# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Rust Tooling
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

export GOBIN=/home/aozerov/go/bin
export GOPATH=/home/aozerov/go
export RA=/home/aozerov/.local/bin
export PATH=$PATH:$GOPATH:$GOBIN:$RA

__main() {
  local major="${BASH_VERSINFO[0]}"
  local minor="${BASH_VERSINFO[1]}"

  if ((major > 4)) || { ((major == 4)) && ((minor >= 1)); }; then
    source <("/home/aozerov/.cargo/bin/starship" init bash --print-full-init)
  else
    source /dev/stdin <<<"$("/home/aozerov/.cargo/bin/starship" init bash --print-full-init)"
  fi
}

__main
unset -f __main


# Alias
alias ls='exa'
alias ll='exa -la'
alias lt='exa -T --git-ignore'
alias vim='nvim'
