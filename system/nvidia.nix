{ config, lib, pkgs, ... }:
{
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Modesetting is required
    modesetting.enable = true;

    # Nvidia power management - can cause sleep/suspend to fail
    powerManagement.enable = false;

    # Experimental and only works on modern Nvidia GPUs
    powerManagement.finegrained = false;

    # Use the open source kernel module - alpha and currently buggy (as of 12-03-24)
    open = false;

    # Enable Nvidia settings menu
    nvidiaSettings = true;

    # Optionally select driver version for specific GPU
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      # Grab the relevant Bus ID values from "lshw -c display"
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
