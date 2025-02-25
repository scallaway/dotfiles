if [[ ":$FPATH:" != *":/home/scallaway/.zsh/completions:"* ]]; then export FPATH="/home/scallaway/.zsh/completions:$FPATH"; fi
# Set ZSH completion
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/scallaway/.zshrc'
autoload -Uz compinit
compinit

# ZSH autocompletions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-custom-completions 2> /dev/null

source ~/dev/work/.workrc 2> /dev/null

# Add local binaries to PATH
export PATH="$HOME/.local/bin:$PATH"

# Add binaries installed with Cargo to PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Add go-related things to PATH
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/go/bin:$PATH"

# Setup ZSH history
HISTFILE=~/.zsh_history
SAVEHIST="$((2 ** 31))"
HISTSIZE="$SAVEHIST"
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

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
alias l="eza -lah"
alias ls="l"
alias cat="bat -pp"
alias grep="rg -i"
alias lg="lazygit"
alias z="zellij"

# ~ Git aliases ~
alias update="git status"
alias branch="git branch"
alias swap="git checkout"
alias commit="git commit -m"
alias raise="git push -u origin"
alias gdiff="git diff"
alias cpdiff="git diff | xclip -selection clipboard"

# Set default editor to neovim
export EDITOR="nvim"

# Enable Zoxide
eval "$(zoxide init --cmd j zsh)"

# Be sure to keep this at the bottom
eval "$(starship init zsh)"

# bun completions
[ -s "/home/scallaway/.bun/_bun" ] && source "/home/scallaway/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fnm
FNM_PATH="/home/scallaway/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/scallaway/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# fnm
FNM_PATH="/home/scallaway/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/scallaway/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# Set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. "/home/scallaway/.deno/env" 2> /dev/null

# fnm
FNM_PATH="/home/scallaway/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/scallaway/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
