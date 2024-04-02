{
  description = "scallaway personal PC configuration";
  
  outputs = inputs@{ self, nixpkgs, unstable, home-manager, ... }:

  let
    # System Settings #
    systemSettings = {
      system = "x86_64-linux"; # system architecture
      hostname = "svarog";
      timezone = "Europe/London";
      locale = "en_GB.UTF-8";
    };

    # User Settings #
    userSettings = rec {
      username = "scallaway";
      name = "Scott Callaway";
      email = "scott@scottcallaway.co.uk";
      editor = "nvim";
      browser = "firefox";
      term = "alacritty";
      font = "Commit Mono Nerd Font";
    };

    lib = nixpkgs.lib;

  in {
    nixosConfigurations = {
      system = lib.nixosSystem {
        system = systemSettings.system;
	modules = [
	  (./. + "/system/configuration.nix")
	  home-manager.nixosModules.home-manager {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.${userSettings.username} = import ./user/home.nix;

	    home-manager.extraSpecialArgs = {
	      inherit userSettings unstable;
	    };
	  }
	];
	specialArgs = {
	  inherit unstable systemSettings userSettings;
        };
      };
    };
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "home-manager/release-23.11";
      inputs.pkgs.follows = "nixpkgs";
    };
  };
}
