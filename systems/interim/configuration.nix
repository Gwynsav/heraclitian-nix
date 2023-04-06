# ---------------------------------- #
# -- Ephemeral Root Configuration -- #
# ---------------------------------- #

{ config, pkgs, lib, inputs, impermanence, home-manager, ... }:

{
  networking.hostName = "interim";

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

  # Boot Loader & Kernel
  # --------------------
  boot = {
    kernelPackages = pkgs.unstable.linuxPackages_latest;
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
    # windowManager.xmonad = {
    #   enable                 = true;
    #   enableContribAndExtras = true;
    # };
    # windowManager.openbox.enable = true;
    windowManager.awesome = {
      enable     = true;
      luaModules = lib.attrValues {
        inherit (pkgs.unstable.luaPackages)
          lgi ldbus luadbi-mysql luaposix;
      };
    };
  };
  hardware = {
    opengl = {
      enable          = true;
      driSupport      = true;
      driSupport32Bit = true;
    };
    steam-hardware.enable = true;
  };
 
  # Gayming
  # -------
  programs.steam.enable = true;
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
      "\$HOME/.local/share/Steam/root/compatibilitytools.d";
  };
}

