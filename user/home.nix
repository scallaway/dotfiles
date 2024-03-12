{ config, pkgs, userSettings, ... }:

{
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  programs.home-manager.enable = true;

  imports = [
    ./shell.nix
  ];

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    neovim
    firefox
    alacritty
    alacritty
  ];

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    TERM = userSettings.term;
    BROWSER = userSettings.browser;
  };
}
