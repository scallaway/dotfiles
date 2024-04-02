{ config, pkgs, userSettings, ... }:
{
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  imports = [
    ./shell.nix
    ./terminal.nix
    ./appearance.nix
  ];

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # Nix dev
    nil # Nix language server
    nix-info
    nixpkgs-fmt
    nixci
    nix-health

    neovim
    firefox
  ];

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    TERM = userSettings.term;
    BROWSER = userSettings.browser;
  };

  programs.home-manager.enable = true;
}
