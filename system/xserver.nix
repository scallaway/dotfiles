{ ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.variant = "";
  services.xserver.xkb.layout = "gb";

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
}
