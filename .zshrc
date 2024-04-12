# Set ZSH completion
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/scallaway/.zshrc'
autoload -Uz compinit
compinit

# ZSH autocompletions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Setup ZSH history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=100000
setopt SHARE_HISTORY

# Use extended pattern matching
setopt autocd extendedglob nomatch

# Use Vim bindings
bindkey -v

# ~ Useful aliases ~
alias vi="nvim"
alias vim="nvim"
alias xx="exit"
alias bashme="vi ~/.zshrc"
alias sourceme="source ~/.zshrc"
alias l="exa -lah"
alias ls="l"
alias cat="bat -pp"
alias grep="rg -i"
alias lg="lazygit"

# ~ Git aliases ~
alias update="git status"
alias branch="git branch"
alias swap="git checkout"
alias commit="git commit -m"
alias raise="git push -u origin"
alias gdiff="git diff"

# Set default editor to neovim
export EDITOR="nvim"

# Be sure to keep this at the bottom
eval "$(starship init zsh)"

# bun completions
[ -s "/home/scallaway/.bun/_bun" ] && source "/home/scallaway/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
