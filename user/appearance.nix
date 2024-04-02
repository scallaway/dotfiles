{ pkgs, ... }:
{
  # Install fonts for the system
  fonts.fontconfig.enable = true;
  home.packages = [
    (pkgs.nerdfonts.override { 
      fonts = [ 
        #"CommitMono" "CascadiaMono" 
        "FiraCode"
      ];
    })
  ];
}
