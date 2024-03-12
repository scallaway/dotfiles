{
  description = "scallaway personal PC configuration";
  
  outputs = inputs@{ self, nixpkgs, nixpkgs-stable, home-manager, ... }:

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
    };

    pkgs = import nixpkgs {
      system = systemSettings.system;
      config = {
        allowUnfree = true;
      };
    };

    pkgs-stable = import pkgs-stable {
      system = systemSettings.system;
      config = {
        allowUnfree = true;
      };
    };

    lib = nixpkgs.lib;

  in {
    homeConfigurations = {
      user = home-manager.lib.homeManagerConfiguration {
      	inherit pkgs;
	modules = [
	  # Don't currently have work and personal setups as of yet
	  (./. + "/user/home.nix")
	];
	extraSpecialArgs = {
	  inherit pkgs-stable;
	  inherit systemSettings;
	  inherit userSettings;
	};
      };
    };
    nixosConfigurations = {
      system = lib.nixosSystem {
        system = systemSettings.system;
	modules = [
	  (./. + "/user/configuration.nix")
	];
	specialArgs = {
	  inherit pkgs-stable;
	  inherit systemSettings;
	  inherit userSettings;
        };
      };
    };
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-23.11";
  };
}
