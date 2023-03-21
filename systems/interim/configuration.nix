# ---------------------------------- #
# -- Ephemeral Root Configuration -- #
# ---------------------------------- #

{ config, pkgs, lib, inputs, impermanence, home-manager, ... }:

{
  imports = [
    # Import other system configuration files.
    ./hardware-configuration.nix

    # Import the shared system configuration.
    ( import ../shared/configuration.nix 
        { inherit config pkgs lib inputs impermanence; } )

    # Import home configuration.
    ( import ./home { inherit config pkgs lib home-manager impermanence; } )
  ];

  networking.hostName = "interim";

  # Boot Loader & Kernel
  # --------------------
  boot = {
    kernelPackages = pkgs.unstable.linuxPackages;
    kernelModules  = [ "i2c-piix4" "i2c-dev" ];
    loader = {
      grub.useOSProber = true;
      timeout          = null;
    };
  };

  # Drivers
  # -------
  services.xserver = {
    videoDrivers = [ "nvidia" ];
    dpi          = 96;
  };
  hardware.opengl = {
    enable          = true;
    driSupport      = true;
    driSupport32Bit = true;
  };
 
  # Packages
  # --------
  environment = {
    systemPackages = lib.attrValues {
      inherit (pkgs.stable)
        piper;
 
      inherit (pkgs.unstable)
        openrgb
        heroic
        steam
        protonup-ng;
    };
    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
        "/nix/persist/home/gw/.local/share/Steam/root/compatibilitytools.d";
    };
  };
}

