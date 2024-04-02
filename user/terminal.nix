{ config, nixpkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    package = nixpkgs.from.unstable.alacritty;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
	# normal = { family = "Commit Mono Nerd Font"; };
	# bold = { family = "Commit Mono Nerd Font"; };
	# bold_italic = { family = "Commit Mono Nerd Font"; };
	# italic = { family = "Commit Mono Nerd Font"; };
	normal = { family = "FiraCode Nerd Font"; };
	bold = { family = "FiraCode Nerd Font"; };
	bold_italic = { family = "FiraCode Nerd Font"; };
	italic = { family = "FiraCode Nerd Font"; };
      };
    };
  };
}
