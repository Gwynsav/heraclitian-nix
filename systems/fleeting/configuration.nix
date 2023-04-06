# ---------------------------------- #
# -- Ephemeral Root Configuration -- #
# ---------------------------------- #

{ config, pkgs, lib, inputs, impermanence, home-manager, ... }:

{
  networking.hostName = "fleeting";

  imports = [
    # Import other system configuration files.
    ./hardware-configuration.nix

    # Import the shared system configuration.
    ( import ../shared/configuration.nix 
      { inherit config pkgs lib inputs impermanence; } )

    # Import home configuration.
    ( import ./home
      { inherit config pkgs lib home-manager impermanence; } )
  ];

  # Kernel
  # ------
  boot.kernelPackages = pkgs.unstable.linuxPackages;

  # Drivers
  # -------
  services.xserver = {
    videoDrivers = [ "nvidia" ];
    dpi          = 96;
    windowManager.awesome = {
      enable     = true;
      luaModules = lib.attrValues {
        inherit (pkgs.unstable.luaPackages)
          lgi ldbus luadbi-mysql luaposix;
      };
    };
    displayManager.defaultSession = "none+awesome";
  };
  hardware.opengl = {
    enable          = true;
    driSupport      = true;
    driSupport32Bit = true;
  };
}

