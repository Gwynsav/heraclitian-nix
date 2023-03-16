# ---------------------------------- #
# -- Ephemeral Root Configuration -- #
# ---------------------------------- #

{ config, pkgs, lib, inputs, overlays, impermanence, home-manager, ... }:

{
  imports = [
    # Import the impermanence module.
    ( import ../shared/configuration.nix 
        { inherit config pkgs lib inputs impermanence; } )

    # Import other system configuration files.
    ./hardware-configuration.nix
    ( import ./home { inherit config pkgs impermanence home-manager; } )
  ];

  networking.hostName = "sedentary";

  # Boot Loader & Kernel
  # --------------------
  boot = {
    kernelPackages = pkgs.unstable.linuxPackages_zen;
    kernelModules  = [];
    loader = {
      grub.useOSProber = true;
      timeout          = null;
    };
  };

  # # Drivers
  # # -------
  # services.xserver = {
  #   videoDrivers = [ "nvidia" ];
  #   dpi          = 96;
  # };
  # hardware.opengl = {
  #   enable          = true;
  #   driSupport      = true;
  #   driSupport32Bit = true;
  # };
  #
  # # Packages
  # # --------
  # environment = {
  #   systemPackages = lib.attrValues {
  #     inherit (pkgs.stable)
  #       piper;
  #
  #     inherit (pkgs.unstable)
  #       openrgb
  #       heroic
  #       steam
  #       protonup-ng;
  #   };
  #   sessionVariables = {
  #     STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
  #       "/nix/persist/home/gw/.steam/root/compatibilitytools.d";
  #   };
  # };
}

