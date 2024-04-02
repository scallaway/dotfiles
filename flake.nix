{
  description = "scallaway personal PC configuration";

  inputs = {
    nixpkgs-stable.url = "nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "home-manager/release-23.11";
      inputs.pkgs.follows = "nixpkgs-stable";
    };
  };
 
  outputs = inputs@{ self, nixpkgs-stable, nixpkgs-unstable, home-manager, ... }:
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

      system = systemSettings.system;

      inherit (nixpkgs-stable.legacyPackages."${system}") lib;

      pkgs = import nixpkgs-stable { inherit system; };
      unstable = import nixpkgs-unstable { inherit system; };

      nixpkgsConfig = {
        inherit system;
	config.allowUnfree = true;
      };

      nixpkgs.from = {
        stable = import nixpkgs-stable nixpkgsConfig;
	unstable = import nixpkgs-unstable nixpkgsConfig;
      };

    in {
      nixosConfigurations = {
       system = nixpkgs-stable.lib.nixosSystem {
	  inherit system;
          specialArgs = { inherit systemSettings userSettings; };
          modules = [
            ./system/configuration.nix
            home-manager.nixosModule
	    {
	      home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${userSettings.username} = import ./user/home.nix;

                extraSpecialArgs = {
                  inherit nixpkgs systemSettings userSettings;
                };
              };
            }
          ];
        };
      };
    };
}
