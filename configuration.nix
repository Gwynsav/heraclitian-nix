# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use EFI grub 2 as boot loader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable     = true;
      version    = 2;
      efiSupport = true;
      device     = "nodev";
    };
  };

  # Define users.
  users = {
    mutableUsers = false;
    users = {
      root = {
        initialPassword = "safefrfr";
      };
      gw = {
        initialPassword = "gwaaaaaa";
        isNormalUser    = true;
        extraGroups     = [ "wheel" ]; # Enable ‘sudo’ for the user.
        packages        = [ ];
      };
    };
  };

  # Filesystem and persisted system files.
  fileSystems."/" = {
    device  = "none";
    fsType  = "tmpfs";
    options = [ "defaults" "size=2G" "mode=755" ];
  };
  environment.etc."machine-id".source =
    "/nix/persist/etc/machine-id";

  # Networking.
  networking = {
    hostName              = "heraclitus"; # Define your hostname.
    networkmanager.enable = true;         # Easiest to use and most distros use this by default.
    # Firewall.
    firewall.enable       = true;
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
  };

  # Localization and Time.
  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  # List packages installed in system profile. To search, run:
  environment.systemPackages = lib.attrValues {
    inherit (pkgs)
      git
      wget
      vim;
  };

  # Enable the X11 windowing system.
  # services.xserver = {
  #   enable = true;
  #   layout = "us";
  #   xkbOptions = {
  #     "caps:super" # map caps to super.
  #   };
  #   Enable touchpad support.
  #   libinput.enable = true;
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # NixOS Settings
  # --------------
  nix = {
    settings = {
      # Enable flakes.
      experimental-features = [ "nix-command" "flakes" ];
      # Cleanup
      auto-optimise-store   = true;
    };
    gc = {
      automatic = true;
      options   = "--delete-older-than 5d";
    };
    optimise.automatic = true;
  };
  system = {
    # Incompatible with flakes.
    copySystemConfiguration = false;
    # OS release at time of installation.
    stateVersion = "22.11";
  };
}

