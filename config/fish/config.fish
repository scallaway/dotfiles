# If we're not already in a Zellij instance, boot one up
if set -q ZELLIJ
else
  zellij
end

set fish_greeting

# ~ Useful aliases ~
alias vi="nvim"
alias vim="nvim"
alias xx="exit"
alias bashme="vi ~/dotfiles/config/fish/config.fish"
alias sourceme="source ~/.zshrc"
alias l="eza -lah"
alias ls="l"
alias cat="bat -pp"
alias grep="rg -i"
alias lg="lazygit"
alias z="zellij"
alias r="ranger cd"

# ~ Git aliases ~
alias update="git status"
alias branch="git branch"
alias swap="git checkout"
alias commit="git commit -m"
alias raise="git push -u origin"
alias gdiff="git diff"

# Add local binaries to PATH
export PATH="$HOME/.local/bin:$PATH"

# Add binaries installed with Cargo to PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Add go-related things to PATH
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/go/bin:$PATH"


# Set default editor to neovim
export EDITOR="nvim"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Enable Zoxide
zoxide init fish --cmd j | source

starship init fish | source
