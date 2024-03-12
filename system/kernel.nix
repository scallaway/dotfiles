{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages;
  boot.consoleLogLevel = 0;
}
