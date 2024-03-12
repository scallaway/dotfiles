{ pkgs, ... }:
let
  myAliases = {
    l = "eza --icons -l -T -L=1";
    cat = "bat";
    htop = "btop";
    nixos-rebuild = "systemd-run --no-ask-password --uid=0 --system --scope -p MemoryLimit=16000M -p CPUQuota=60% nixos-rebuild";
    home-manager = "systemd-run --no-ask-password --uid=1000 --user --scope -p MemoryLimit=16000M -p CPUQuota=60% home-manager";
    vi = "nvim";
    vim = "nvim";
    update = "git status";
    xx = "exit";
    grep = "rg -i";
  };

in
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = myAliases;
  };

  programs.starship.enable = true;

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  home.packages = with pkgs; [
    bat
    eza
  ];
}
